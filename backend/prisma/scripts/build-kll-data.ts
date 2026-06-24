import * as fs from 'fs';
import * as path from 'path';

const DATA_DIR = path.join(__dirname, '..', 'data');
const OUTPUT_PATH = path.join(DATA_DIR, 'kll-bundle.json');
const VNJP_API =
  'https://www.vnjpclub.com/wp-json/wp/v2/posts?slug=kanji-look-and-learn-bai';
const LESSON_COUNT = 32;

type KanjiVocabItem = {
  word: string;
  reading: string;
  meaningVi: string;
};

type KanjiEntryItem = {
  character: string;
  hanViet: string | null;
  onyomi: string | null;
  kunyomi: string | null;
  meaningVi: string;
  mnemonicJp: string | null;
  mnemonicVi: string | null;
  imageUrl: string | null;
  sortOrder: number;
  vocabularies: KanjiVocabItem[];
};

type KanjiLessonItem = {
  lessonNumber: number;
  title: string;
  jlptLevel: string;
  entries: KanjiEntryItem[];
};

type KllBundle = {
  lessons: KanjiLessonItem[];
};

function stripHtml(html: string): string {
  return html
    .replace(/<br\s*\/?>/gi, '\n')
    .replace(/<[^>]+>/g, '')
    .replace(/&#8211;/g, '–')
    .replace(/&#8217;/g, "'")
    .replace(/&nbsp;/g, ' ')
    .replace(/\s+/g, ' ')
    .trim();
}

function rubyToPlain(html: string): string {
  return html
    .replace(/<rp>[^<]*<\/rp>/g, '')
    .replace(/<rt>([^<]*)<\/rt>/g, '（$1）')
    .replace(/<\/?ruby>/g, '')
    .replace(/<[^>]+>/g, '')
    .replace(/\s+/g, ' ')
    .trim();
}

function jlptForLesson(lessonNumber: number): string {
  if (lessonNumber <= 10) return 'N5';
  if (lessonNumber <= 20) return 'N4';
  return 'N3';
}

function parseReadings(metaHtml: string): {
  onyomi: string | null;
  kunyomi: string | null;
} {
  const readings: string[] = [];
  const jpBlocks =
    metaHtml.match(/<div class="ka-jp"[^>]*>([\s\S]*?)<\/div>/g) || [];
  for (const block of jpBlocks) {
    const text = stripHtml(block);
    if (text) readings.push(text);
  }

  const onParts: string[] = [];
  const kunParts: string[] = [];
  for (const reading of readings) {
    if (reading.includes('-')) {
      kunParts.push(reading);
    } else {
      onParts.push(
        ...reading
          .split(/[,、]/)
          .map((s) => s.trim())
          .filter(Boolean),
      );
    }
  }

  return {
    onyomi: onParts.length ? onParts.join(', ') : null,
    kunyomi: kunParts.length ? kunParts.join(', ') : null,
  };
}

function parseVocab(cardHtml: string): KanjiVocabItem[] {
  const items: KanjiVocabItem[] = [];
  const regex =
    /<ruby>([^<]*)[\s\S]*?<rt>([^<]*)<\/rt>[\s\S]*?<\/ruby>\s*:\s*([^<\n]+)/g;
  let match: RegExpExecArray | null;
  while ((match = regex.exec(cardHtml)) !== null) {
    const word = match[1].trim();
    const reading = match[2].trim();
    const meaningVi = match[3].trim();
    if (!word || !reading) continue;
    items.push({ word, reading, meaningVi });
  }
  return items;
}

function parseCard(cardHtml: string, sortOrder: number): KanjiEntryItem | null {
  const character = cardHtml
    .match(/class="ka-kanji"[^>]*>([^<]+)</)?.[1]
    ?.trim();
  if (!character) return null;

  const hanViet =
    cardHtml.match(/class="ka-hv"[^>]*>([^<]+)</)?.[1]?.trim() || null;
  const meaningVi =
    cardHtml.match(/class="ka-mean"[^>]*>([^<]+)</)?.[1]?.trim() || '';
  const metaBlock =
    cardHtml.match(/class="ka-meta"[\s\S]*?<\/div>\s*<\/div>/)?.[0] || '';
  const { onyomi, kunyomi } = parseReadings(metaBlock);

  const mnemonicJpRaw =
    cardHtml.match(/class="ka-jp-title"[^>]*>([\s\S]*?)<\/div>/)?.[1] || '';
  const mnemonicJp = rubyToPlain(mnemonicJpRaw) || null;
  const mnemonicVi =
    cardHtml.match(/class="ka-vn"[^>]*>([^<]+)</)?.[1]?.trim() || null;

  const imageUrl =
    cardHtml.match(
      /data-src="(https:\/\/www\.vnjpclub\.com\/images\/[^"]+)"/,
    )?.[1] ||
    cardHtml.match(
      /src="(https:\/\/www\.vnjpclub\.com\/images\/[^"]+)"/,
    )?.[1] ||
    null;

  return {
    character,
    hanViet,
    onyomi,
    kunyomi,
    meaningVi,
    mnemonicJp,
    mnemonicVi,
    imageUrl,
    sortOrder,
    vocabularies: parseVocab(cardHtml),
  };
}

function parseLessonHtml(html: string, lessonNumber: number): KanjiLessonItem {
  const cards = html.split('<div class="ka-card"').slice(1);
  const entries: KanjiEntryItem[] = [];

  cards.forEach((cardHtml, index) => {
    const entry = parseCard(cardHtml, index + 1);
    if (entry) entries.push(entry);
  });

  return {
    lessonNumber,
    title: `Bài ${lessonNumber}`,
    jlptLevel: jlptForLesson(lessonNumber),
    entries,
  };
}

async function fetchLessonHtml(lessonNumber: number): Promise<string | null> {
  try {
    const res = await fetch(`${VNJP_API}-${lessonNumber}`);
    if (!res.ok) return null;
    const posts = (await res.json()) as { content?: { rendered?: string } }[];
    const html = posts[0]?.content?.rendered;
    return html && html.includes('ka-card') ? html : null;
  } catch {
    return null;
  }
}

async function main() {
  const lessons: KanjiLessonItem[] = [];

  for (let lessonNumber = 1; lessonNumber <= LESSON_COUNT; lessonNumber++) {
    process.stdout.write(`Fetching KLL bài ${lessonNumber}... `);
    const html = await fetchLessonHtml(lessonNumber);
    if (!html) {
      console.log('FAILED');
      continue;
    }

    const lesson = parseLessonHtml(html, lessonNumber);
    lessons.push(lesson);
    console.log(`${lesson.entries.length} kanji`);
    await new Promise((r) => setTimeout(r, 200));
  }

  const bundle: KllBundle = { lessons };
  fs.mkdirSync(DATA_DIR, { recursive: true });
  fs.writeFileSync(OUTPUT_PATH, JSON.stringify(bundle, null, 2), 'utf8');

  const totalKanji = lessons.reduce((sum, l) => sum + l.entries.length, 0);
  const totalVocab = lessons.reduce(
    (sum, l) => sum + l.entries.reduce((s, e) => s + e.vocabularies.length, 0),
    0,
  );

  console.log(`\nSaved ${OUTPUT_PATH}`);
  console.log(
    `${lessons.length} bài | ${totalKanji} kanji | ${totalVocab} từ vựng`,
  );
}

main().catch((err) => {
  console.error(err);
  process.exit(1);
});
