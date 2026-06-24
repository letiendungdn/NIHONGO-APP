import * as fs from 'fs';
import * as path from 'path';
import { parse as parseYaml } from 'yaml';

const DATA_DIR = path.join(__dirname, '..', 'data');
const YAML_PATH = path.join(DATA_DIR, 'minna-no-ds.yaml');
const OUTPUT_PATH = path.join(DATA_DIR, 'minna-bundle.json');

const JP_MEMOS_BASE =
  'https://raw.githubusercontent.com/flying-yogurt/JP-Memos/master/grammar_notes';
const RYU2GAKU_BASE =
  'https://raw.githubusercontent.com/ryu2gaku/minna-no-nihongo/minna-no-nihongo/初級';
const NIHONGOAZ_BASE = 'https://nihongoaz.com/minna-no-nihongo-lesson';
const TAILIEU_VI_BASE =
  'https://tailieutiengnhat.net/tu-vung-minna-no-nihongo-bai';
const TAILIEU_GRAMMAR_BASE =
  'https://tailieutiengnhat.net/ngu-phap-minna-no-nihongo-bai';

type VocabItem = {
  kanji: string | null;
  kana: string;
  romaji: string;
  meaning: string;
};

type GrammarItem = {
  pattern: string;
  meaning: string;
  explanation: string;
  examples: { jp: string; romaji: string; vi: string }[];
};

type ExerciseItem = {
  type: 'multiple_choice' | 'fill_in_blank';
  question: string;
  options: string[] | null;
  answer: string;
};

type Bundle = {
  vocab: Record<number, VocabItem[]>;
  grammar: Record<number, GrammarItem[]>;
  exercises: Record<number, ExerciseItem[]>;
};

async function fetchText(url: string): Promise<string | null> {
  try {
    const res = await fetch(url);
    if (!res.ok) return null;
    const text = await res.text();
    return text.length > 50 ? text : null;
  } catch {
    return null;
  }
}

function normalizeKanji(value: unknown): string | null {
  if (value == null || value === '~' || value === '') return null;
  return String(value);
}

function normalizeKanaKey(kana: string): string {
  return kana
    .replace(/[〜～~]/g, '～')
    .replace(/\s+/g, '')
    .trim();
}

function stripHtml(html: string): string {
  return html
    .replace(/<br\s*\/?>/gi, ' ')
    .replace(/<[^>]+>/g, '')
    .replace(/&#8211;/g, '–')
    .replace(/&#8217;/g, "'")
    .replace(/&#8220;|&#8221;/g, '"')
    .replace(/&nbsp;/g, ' ')
    .replace(/&hellip;/g, '...')
    .replace(/\s+/g, ' ')
    .trim();
}

function htmlToLines(html: string): string[] {
  return stripHtml(html.replace(/<br\s*\/?>/gi, '\n'))
    .split('\n')
    .map((line) => line.trim())
    .filter(Boolean);
}

function isJapaneseLine(text: string): boolean {
  const jpChars = (text.match(/[\u3040-\u30ff\u4e00-\u9faf]/g) || []).length;
  const viChars = (
    text.match(
      /[àáạảãâầấậẩẫăằắặẳẵèéẹẻẽêềếệểễìíịỉĩòóọỏõôồốộổỗơờớợởỡùúụủũưừứựửữỳýỵỷỹđ]/gi,
    ) || []
  ).length;
  return jpChars >= 2 && jpChars > viChars;
}

function splitJpViLine(line: string): { jp: string; vi: string } {
  const match = line.match(
    /^(.+?[。]?)\s+([A-ZÀÁẠẢÃÂẦẤẬẨẪĂẰẮẶẲẴÈÉẸẺẼÊỀẾỆỂỄÌÍỊỈĨÒÓỌỎÕÔỒỐỘỔỖƠỜỚỢỞỠÙÚỤỦŨƯỪỨỰỬỮỲÝỴỶỸĐ].*)$/u,
  );
  if (match) {
    return { jp: match[1].trim(), vi: match[2].trim() };
  }
  return { jp: line, vi: '' };
}

function parseTailieuExampleParagraphs(
  paragraphs: string[],
): GrammarItem['examples'] {
  const examples: GrammarItem['examples'] = [];
  let inExamples = false;

  for (const para of paragraphs) {
    if (/ví dụ/i.test(para)) {
      inExamples = true;
    }

    const plain = stripHtml(para);
    const isExamplePara =
      inExamples ||
      /^\d+\.\s*[\u3040-\u30ff\u4e00-\u9faf]/.test(plain) ||
      (/^…/.test(plain) && isJapaneseLine(plain));

    if (!isExamplePara) continue;

    const lines = htmlToLines(para);
    for (let i = 0; i < lines.length; i++) {
      const line = lines[i].replace(/^ví dụ:\s*/i, '').trim();
      if (!line) continue;

      if (!isJapaneseLine(line)) continue;

      const { jp, vi: inlineVi } = splitJpViLine(
        line
          .replace(/^\d+\.\s*/, '')
          .replace(/^…+/, '…')
          .trim(),
      );

      let vi = inlineVi;
      if (!vi && i + 1 < lines.length && !isJapaneseLine(lines[i + 1])) {
        vi = lines[i + 1].replace(/^…+/, '…').trim();
        i += 1;
      }

      if (jp) examples.push({ jp, romaji: '', vi });
    }
  }

  return examples;
}

function parseTailieuGrammar(html: string): GrammarItem[] {
  const start = html.indexOf('<div class="entry">');
  if (start === -1) return [];

  const end = html.indexOf('<!-- AI CONTENT END', start);
  const body = end > start ? html.slice(start, end) : html.slice(start);

  const items: GrammarItem[] = [];
  const sections = body.split(/<h3[^>]*>/i).slice(1);

  for (const section of sections) {
    const headerEnd = section.indexOf('</h3>');
    if (headerEnd === -1) continue;

    const pattern = stripHtml(section.slice(0, headerEnd))
      .replace(/^\d+\.\s*/, '')
      .trim();
    if (!pattern || /xem thêm/i.test(pattern)) continue;

    const content = section.slice(headerEnd + 5);
    const h4Blocks = [...content.matchAll(/<h4[^>]*>([\s\S]*?)<\/h4>/gi)].map(
      (m) => stripHtml(m[1]),
    );

    const paragraphs = [...content.matchAll(/<p[^>]*>([\s\S]*?)<\/p>/gi)].map(
      (m) => m[1],
    );

    let meaning = '';
    const explanationParts: string[] = [];

    for (const h4 of h4Blocks) {
      if (h4) explanationParts.push(h4);
    }

    for (const para of paragraphs) {
      const plain = stripHtml(para);
      if (!plain) continue;

      if (/ví dụ/i.test(para)) continue;

      const meaningMatch = para.match(
        /<strong>\s*Ý nghĩa:\s*<\/strong>\s*([^<]+)/i,
      );
      if (meaningMatch) {
        meaning = stripHtml(meaningMatch[1]);
        continue;
      }

      if (
        /<strong>\s*(Cách dùng|Chú ý)/i.test(para) ||
        /^[–-]/.test(plain) ||
        /^chú ý/i.test(plain)
      ) {
        explanationParts.push(plain);
      }
    }

    const examples = parseTailieuExampleParagraphs(paragraphs);

    items.push({
      pattern,
      meaning: meaning || explanationParts[0]?.slice(0, 160) || pattern,
      explanation: explanationParts.join('\n\n'),
      examples,
    });
  }

  return items;
}

function parseTailieuVietnamese(html: string): Map<string, string> {
  const map = new Map<string, string>();
  const rows = html.match(/<tr>[\s\S]*?<\/tr>/gi) || [];

  for (const row of rows.slice(1)) {
    const cells = [...row.matchAll(/<td[^>]*>([\s\S]*?)<\/td>/gi)].map((m) =>
      stripHtml(m[1]),
    );
    if (cells.length < 4) continue;

    const kana = normalizeKanaKey(cells[0]);
    const meaning = cells[3];
    if (kana && meaning) {
      map.set(kana, meaning);
    }
  }

  return map;
}

async function fetchVietnameseVocabMap(
  lesson: number,
): Promise<Map<string, string>> {
  const html = await fetchText(`${TAILIEU_VI_BASE}-${lesson}.html`);
  if (!html) return new Map();
  return parseTailieuVietnamese(html);
}

function lookupVietnameseMeaning(
  kana: string,
  romaji: string,
  viMap: Map<string, string>,
  fallbackEn: string,
): string {
  const keys = [
    normalizeKanaKey(kana),
    normalizeKanaKey(kana.replace(/～/g, '')),
    `～${normalizeKanaKey(kana).replace(/^～/, '')}`,
  ];

  for (const key of keys) {
    if (key && viMap.has(key)) return viMap.get(key)!;
  }

  const romajiKey = romaji.toLowerCase().replace(/\s+/g, '');
  for (const [mapKana, meaning] of viMap.entries()) {
    if (mapKana.includes('～') && romajiKey.includes('~')) {
      const suffix = mapKana.replace(/^～/, '');
      if (normalizeKanaKey(kana).endsWith(suffix)) return meaning;
    }
  }

  return fallbackEn;
}

async function parseVocabFromYaml(): Promise<Record<number, VocabItem[]>> {
  const raw = parseYaml(fs.readFileSync(YAML_PATH, 'utf8')) as Record<
    string,
    unknown
  >;
  const result: Record<number, VocabItem[]> = {};

  for (let i = 1; i <= 50; i++) {
    const key = `lesson-${String(i).padStart(2, '0')}`;
    const items = (raw[key] as Array<Record<string, unknown>>) || [];
    const viMap = await fetchVietnameseVocabMap(i);
    let viMatched = 0;

    result[i] = items.map((item) => {
      const meaningObj = item.meaning as Record<string, string> | undefined;
      const en = meaningObj?.en || '';
      const fr = meaningObj?.fr || '';
      const kana = String(item.kana || '');
      const romaji = String(item.romaji || '').replace(/[āēīōū]/g, (m) => {
        const map: Record<string, string> = {
          ā: 'a',
          ē: 'e',
          ī: 'i',
          ō: 'o',
          ū: 'u',
        };
        return map[m] || m;
      });
      const vi = lookupVietnameseMeaning(kana, romaji, viMap, en || fr);
      if (vi !== (en || fr)) viMatched++;

      return {
        kanji: normalizeKanji(item.kanji),
        kana,
        romaji,
        meaning: vi,
      };
    });

    process.stdout.write(
      `  Bài ${i}: ${viMatched}/${items.length} từ có nghĩa tiếng Việt\n`,
    );
  }

  return result;
}

function parseJpMemosGrammar(md: string): GrammarItem[] {
  const items: GrammarItem[] = [];
  const sections = md.split(/^#### /m).slice(1);

  for (const section of sections) {
    const lines = section.split('\n');
    const header = lines[0]?.trim();
    if (!header || header.startsWith('[')) continue;

    const patternMatch = header.match(/\d+\.\d+\s+(.+)/);
    const pattern = patternMatch ? patternMatch[1].trim() : header;

    const body = lines.slice(1).join('\n');
    const paragraphs = body
      .split(/\n\n+/)
      .map((p) => p.trim())
      .filter((p) => p && !p.startsWith('###'));

    const explanationParts: string[] = [];
    const examples: GrammarItem['examples'] = [];

    for (const para of paragraphs) {
      const quoteLines = para
        .split('\n')
        .filter((l) => l.startsWith('>'))
        .map((l) => l.replace(/^>\s?/, '').trim());

      if (quoteLines.length >= 2) {
        examples.push({
          jp: quoteLines[0],
          romaji: '',
          vi: quoteLines.slice(1).join(' '),
        });
      } else if (
        quoteLines.length === 1 &&
        /[\u3040-\u30ff\u4e00-\u9faf]/.test(quoteLines[0])
      ) {
        examples.push({ jp: quoteLines[0], romaji: '', vi: '' });
      } else if (!para.startsWith('>') && !para.startsWith('**[')) {
        explanationParts.push(para.replace(/\*\*/g, ''));
      }
    }

    items.push({
      pattern,
      meaning: explanationParts[0]?.slice(0, 120) || pattern,
      explanation: explanationParts.join('\n\n'),
      examples,
    });
  }

  return items;
}

function parseRyu2gakuKaisetsu(md: string): GrammarItem[] {
  const items: GrammarItem[] = [];

  const listMatch = md.match(/## 文型一覧\s+([\s\S]*?)(?=\n## )/);
  if (listMatch) {
    const bullets = listMatch[1].match(/^- (.+)$/gm) || [];
    for (const bullet of bullets) {
      const pattern = bullet.replace(/^- /, '').trim();
      items.push({
        pattern,
        meaning: pattern,
        explanation: '',
        examples: [],
      });
    }
  }

  const sectionRegex =
    /## (❶|❷|❸|❹|❺|❻|❼|❽|❾|❿)\s+(.+?)\n([\s\S]*?)(?=\n## |$)/g;
  let match: RegExpExecArray | null;

  while ((match = sectionRegex.exec(md)) !== null) {
    const pattern = match[2].trim();
    const body = match[3];
    const explanationLines = (body.match(/^✦\s*(.+)$/gm) || []).map((l) =>
      l.replace(/^✦\s*/, '').trim(),
    );
    const exampleLines = body
      .split('\n')
      .map((l) => l.trim())
      .filter(
        (l) =>
          l &&
          /[\u3040-\u30ff\u4e00-\u9faf]/.test(l) &&
          !l.startsWith('✦') &&
          !l.startsWith('✧'),
      );

    const examples = exampleLines.slice(0, 4).map((jp) => ({
      jp,
      romaji: '',
      vi: '',
    }));

    const existing = items.find((g) => g.pattern === pattern);
    if (existing) {
      existing.explanation = explanationLines.join('\n');
      existing.examples = examples;
      existing.meaning = explanationLines[0] || pattern;
    } else {
      items.push({
        pattern,
        meaning: explanationLines[0] || pattern,
        explanation: explanationLines.join('\n'),
        examples,
      });
    }
  }

  return items;
}

function parseNihongoAzGrammar(html: string): GrammarItem[] {
  const endIdx = html.indexOf('<!-- AI CONTENT END');
  const startMarkers = [
    '<div class="entry">',
    '<div class="post-inner">',
    '<article',
  ];
  let startIdx = -1;
  for (const marker of startMarkers) {
    const idx = html.indexOf(marker);
    if (idx !== -1 && (startIdx === -1 || idx < startIdx)) startIdx = idx;
  }
  const slice =
    endIdx > startIdx && startIdx !== -1 ? html.slice(startIdx, endIdx) : html;

  const items: GrammarItem[] = [];
  const sections = slice.split(/<h4>/i).slice(1);

  for (const section of sections) {
    const headerEnd = section.indexOf('</h4>');
    if (headerEnd === -1) continue;

    const header = stripHtml(section.slice(0, headerEnd));
    if (/recent posts|jlpt|kanji|vocabulary|grammar$/i.test(header)) continue;

    const pattern = header.replace(/^\d+\.?\s*/, '').trim();
    const body = section.slice(headerEnd + 5);
    const paragraphs = [...body.matchAll(/<p>([\s\S]*?)<\/p>/gi)]
      .map((m) => stripHtml(m[1]))
      .filter((p) => p && p !== '.');

    const explanation: string[] = [];
    const examples: GrammarItem['examples'] = [];

    for (const p of paragraphs) {
      if (/[\u3040-\u30ff\u4e00-\u9faf]/.test(p)) {
        const parts = p.split(/\s{2,}|\t/);
        if (
          parts.length >= 2 &&
          !/[\u3040-\u30ff\u4e00-\u9faf]/.test(parts[1])
        ) {
          examples.push({
            jp: parts[0],
            romaji: '',
            vi: parts.slice(1).join(' '),
          });
        } else {
          const inline = p.match(/^(.+?[。]?)\s+([A-Za-z].+)$/);
          if (inline) {
            examples.push({ jp: inline[1], romaji: '', vi: inline[2] });
          } else {
            examples.push({ jp: p, romaji: '', vi: '' });
          }
        }
      } else if (p.length > 15 && !p.startsWith('[Note')) {
        explanation.push(p);
      }
    }

    items.push({
      pattern,
      meaning: explanation[0]?.slice(0, 200) || pattern,
      explanation: explanation.join('\n\n'),
      examples,
    });
  }

  return items;
}

function parseRyu2gakuBunkei(md: string): GrammarItem[] {
  const items: GrammarItem[] = [];
  const bunkeiMatch = md.match(/## 文型\s+([\s\S]*?)(?=\n## |$)/);
  if (!bunkeiMatch) return items;

  const lines = bunkeiMatch[1]
    .split('\n')
    .map((l) => l.trim())
    .filter((l) => l && /[\u3040-\u30ff\u4e00-\u9faf]/.test(l));

  lines.forEach((line, idx) => {
    const jp = line.replace(/^[❶❷❸❹❺❻❼❽❾❿]\s*/, '').trim();
    items.push({
      pattern: `Mẫu câu ${idx + 1}`,
      meaning: jp,
      explanation: '',
      examples: [{ jp, romaji: '', vi: '' }],
    });
  });

  return items;
}

async function fetchGrammarForLesson(lesson: number): Promise<GrammarItem[]> {
  const tailieu = await fetchText(`${TAILIEU_GRAMMAR_BASE}-${lesson}.html`);
  if (tailieu) {
    const parsed = parseTailieuGrammar(tailieu);
    if (parsed.length > 0) return parsed;
  }

  const num = String(lesson).padStart(2, '0');

  if (lesson <= 8) {
    const jpMemos = await fetchText(
      `${JP_MEMOS_BASE}/Lesson_${num}_Grammar.md`,
    );
    if (jpMemos) {
      const parsed = parseJpMemosGrammar(jpMemos);
      if (parsed.length > 0) return parsed;
    }
  }

  if (lesson <= 10) {
    const folder = `L${lesson}`;
    const kaisetsu = await fetchText(`${RYU2GAKU_BASE}/${folder}/解説.md`);
    if (kaisetsu) {
      const parsed = parseRyu2gakuKaisetsu(kaisetsu);
      if (parsed.length > 0) return parsed;
    }
  }

  const nihongoAz = await fetchText(`${NIHONGOAZ_BASE}-${lesson}-grammar.html`);
  if (nihongoAz) {
    const parsed = parseNihongoAzGrammar(nihongoAz);
    if (parsed.length > 0) return parsed;
  }

  const bunkei = await fetchText(`${RYU2GAKU_BASE}/L${lesson}/文型.md`);
  if (bunkei) return parseRyu2gakuBunkei(bunkei);

  return [];
}

function shuffle<T>(arr: T[]): T[] {
  const copy = [...arr];
  for (let i = copy.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [copy[i], copy[j]] = [copy[j], copy[i]];
  }
  return copy;
}

function generateExercises(lesson: number, vocab: VocabItem[]): ExerciseItem[] {
  if (vocab.length === 0) return [];

  const exercises: ExerciseItem[] = [];
  const quizWords = vocab.slice(0, Math.min(vocab.length, 15));

  for (const word of quizWords) {
    const display = word.kanji || word.kana;
    const distractors = shuffle(
      vocab.filter((v) => v.meaning !== word.meaning),
    ).slice(0, 3);

    if (distractors.length < 3) continue;

    exercises.push({
      type: 'multiple_choice',
      question: `「${display}」 (${word.kana}) nghĩa là gì?`,
      options: shuffle([word.meaning, ...distractors.map((d) => d.meaning)]),
      answer: word.meaning,
    });
  }

  const fillWords = shuffle(vocab).slice(0, Math.min(5, vocab.length));
  for (const word of fillWords) {
    exercises.push({
      type: 'fill_in_blank',
      question: `Điền hiragana cho: "${word.meaning}"`,
      options: null,
      answer: word.kana,
    });
  }

  return exercises.slice(0, 20);
}

async function main() {
  if (!fs.existsSync(YAML_PATH)) {
    throw new Error(`Missing ${YAML_PATH}. Download MinnaNoDS yaml first.`);
  }

  console.log('Parsing vocabulary from MinnaNoDS + nghĩa tiếng Việt...');
  const vocab = await parseVocabFromYaml();
  const vocabCount = Object.values(vocab).reduce((s, v) => s + v.length, 0);
  console.log(`  → ${vocabCount} words across 50 lessons`);

  console.log('Fetching grammar for 50 lessons...');
  const grammar: Record<number, GrammarItem[]> = {};
  for (let i = 1; i <= 50; i++) {
    grammar[i] = await fetchGrammarForLesson(i);
    process.stdout.write(`  Bài ${i}: ${grammar[i].length} mẫu ngữ pháp\n`);
  }

  console.log('Generating exercises...');
  const exercises: Record<number, ExerciseItem[]> = {};
  for (let i = 1; i <= 50; i++) {
    exercises[i] = generateExercises(i, vocab[i] || []);
  }

  const bundle: Bundle = { vocab, grammar, exercises };
  fs.writeFileSync(OUTPUT_PATH, JSON.stringify(bundle, null, 2), 'utf8');
  console.log(`\nSaved → ${OUTPUT_PATH}`);
}

main().catch((err) => {
  console.error(err);
  process.exit(1);
});
