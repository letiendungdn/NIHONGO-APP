interface KanaCell {
  kana: string;
  romaji: string;
}

interface KanaSection {
  id: string;
  title: string;
  subtitle?: string;
  columns?: number;
  rows: KanaCell[][];
}

/** Ô trống trong lưới 5 cột (giống bảng NHK) */
const _ = { kana: '', romaji: '' };

/**
 * Bảng kana theo giáo trình NHK Easy Japanese (textbook_kana_all.pdf):
 * 清音 · 濁音 · 半濁音 · 拗音
 */
export const HIRAGANA_SECTIONS: KanaSection[] = [
  {
    id: 'gojuon',
    title: '清音',
    subtitle: 'Seion',
    rows: [
      [
        { kana: 'あ', romaji: 'a' },
        { kana: 'い', romaji: 'i' },
        { kana: 'う', romaji: 'u' },
        { kana: 'え', romaji: 'e' },
        { kana: 'お', romaji: 'o' },
      ],
      [
        { kana: 'か', romaji: 'ka' },
        { kana: 'き', romaji: 'ki' },
        { kana: 'く', romaji: 'ku' },
        { kana: 'け', romaji: 'ke' },
        { kana: 'こ', romaji: 'ko' },
      ],
      [
        { kana: 'さ', romaji: 'sa' },
        { kana: 'し', romaji: 'shi' },
        { kana: 'す', romaji: 'su' },
        { kana: 'せ', romaji: 'se' },
        { kana: 'そ', romaji: 'so' },
      ],
      [
        { kana: 'た', romaji: 'ta' },
        { kana: 'ち', romaji: 'chi' },
        { kana: 'つ', romaji: 'tsu' },
        { kana: 'て', romaji: 'te' },
        { kana: 'と', romaji: 'to' },
      ],
      [
        { kana: 'な', romaji: 'na' },
        { kana: 'に', romaji: 'ni' },
        { kana: 'ぬ', romaji: 'nu' },
        { kana: 'ね', romaji: 'ne' },
        { kana: 'の', romaji: 'no' },
      ],
      [
        { kana: 'は', romaji: 'ha' },
        { kana: 'ひ', romaji: 'hi' },
        { kana: 'ふ', romaji: 'fu' },
        { kana: 'へ', romaji: 'he' },
        { kana: 'ほ', romaji: 'ho' },
      ],
      [
        { kana: 'ま', romaji: 'ma' },
        { kana: 'み', romaji: 'mi' },
        { kana: 'む', romaji: 'mu' },
        { kana: 'め', romaji: 'me' },
        { kana: 'も', romaji: 'mo' },
      ],
      [
        { kana: 'や', romaji: 'ya' },
        _,
        { kana: 'ゆ', romaji: 'yu' },
        _,
        { kana: 'よ', romaji: 'yo' },
      ],
      [
        { kana: 'ら', romaji: 'ra' },
        { kana: 'り', romaji: 'ri' },
        { kana: 'る', romaji: 'ru' },
        { kana: 'れ', romaji: 're' },
        { kana: 'ろ', romaji: 'ro' },
      ],
      [
        { kana: 'わ', romaji: 'wa' },
        _,
        _,
        _,
        { kana: 'を', romaji: 'wo' },
      ],
      [{ kana: 'ん', romaji: 'n' }, _, _, _, _],
    ],
  },
  {
    id: 'dakuon',
    title: '濁音',
    subtitle: 'Dakuon',
    rows: [
      [
        { kana: 'が', romaji: 'ga' },
        { kana: 'ぎ', romaji: 'gi' },
        { kana: 'ぐ', romaji: 'gu' },
        { kana: 'げ', romaji: 'ge' },
        { kana: 'ご', romaji: 'go' },
      ],
      [
        { kana: 'ざ', romaji: 'za' },
        { kana: 'じ', romaji: 'ji' },
        { kana: 'ず', romaji: 'zu' },
        { kana: 'ぜ', romaji: 'ze' },
        { kana: 'ぞ', romaji: 'zo' },
      ],
      [
        { kana: 'だ', romaji: 'da' },
        { kana: 'ぢ', romaji: 'ji' },
        { kana: 'づ', romaji: 'zu' },
        { kana: 'で', romaji: 'de' },
        { kana: 'ど', romaji: 'do' },
      ],
      [
        { kana: 'ば', romaji: 'ba' },
        { kana: 'び', romaji: 'bi' },
        { kana: 'ぶ', romaji: 'bu' },
        { kana: 'べ', romaji: 'be' },
        { kana: 'ぼ', romaji: 'bo' },
      ],
    ],
  },
  {
    id: 'handakuon',
    title: '半濁音',
    subtitle: 'Handakuon',
    rows: [
      [
        { kana: 'ぱ', romaji: 'pa' },
        { kana: 'ぴ', romaji: 'pi' },
        { kana: 'ぷ', romaji: 'pu' },
        { kana: 'ぺ', romaji: 'pe' },
        { kana: 'ぽ', romaji: 'po' },
      ],
    ],
  },
  {
    id: 'yoon',
    title: '拗音',
    subtitle: 'Yōon',
    columns: 3,
    rows: [
      [
        { kana: 'きゃ', romaji: 'kya' },
        { kana: 'きゅ', romaji: 'kyu' },
        { kana: 'きょ', romaji: 'kyo' },
      ],
      [
        { kana: 'しゃ', romaji: 'sha' },
        { kana: 'しゅ', romaji: 'shu' },
        { kana: 'しょ', romaji: 'sho' },
      ],
      [
        { kana: 'ちゃ', romaji: 'cha' },
        { kana: 'ちゅ', romaji: 'chu' },
        { kana: 'ちょ', romaji: 'cho' },
      ],
      [
        { kana: 'にゃ', romaji: 'nya' },
        { kana: 'にゅ', romaji: 'nyu' },
        { kana: 'にょ', romaji: 'nyo' },
      ],
      [
        { kana: 'ひゃ', romaji: 'hya' },
        { kana: 'ひゅ', romaji: 'hyu' },
        { kana: 'ひょ', romaji: 'hyo' },
      ],
      [
        { kana: 'みゃ', romaji: 'mya' },
        { kana: 'みゅ', romaji: 'myu' },
        { kana: 'みょ', romaji: 'myo' },
      ],
      [
        { kana: 'りゃ', romaji: 'rya' },
        { kana: 'りゅ', romaji: 'ryu' },
        { kana: 'りょ', romaji: 'ryo' },
      ],
      [
        { kana: 'ぎゃ', romaji: 'gya' },
        { kana: 'ぎゅ', romaji: 'gyu' },
        { kana: 'ぎょ', romaji: 'gyo' },
      ],
      [
        { kana: 'じゃ', romaji: 'ja' },
        { kana: 'じゅ', romaji: 'ju' },
        { kana: 'じょ', romaji: 'jo' },
      ],
      [
        { kana: 'びゃ', romaji: 'bya' },
        { kana: 'びゅ', romaji: 'byu' },
        { kana: 'びょ', romaji: 'byo' },
      ],
      [
        { kana: 'ぴゃ', romaji: 'pya' },
        { kana: 'ぴゅ', romaji: 'pyu' },
        { kana: 'ぴょ', romaji: 'pyo' },
      ],
    ],
  },
];

export const KATAKANA_SECTIONS: KanaSection[] = [
  {
    id: 'gojuon',
    title: '清音',
    subtitle: 'Seion',
    rows: [
      [
        { kana: 'ア', romaji: 'a' },
        { kana: 'イ', romaji: 'i' },
        { kana: 'ウ', romaji: 'u' },
        { kana: 'エ', romaji: 'e' },
        { kana: 'オ', romaji: 'o' },
      ],
      [
        { kana: 'カ', romaji: 'ka' },
        { kana: 'キ', romaji: 'ki' },
        { kana: 'ク', romaji: 'ku' },
        { kana: 'ケ', romaji: 'ke' },
        { kana: 'コ', romaji: 'ko' },
      ],
      [
        { kana: 'サ', romaji: 'sa' },
        { kana: 'シ', romaji: 'shi' },
        { kana: 'ス', romaji: 'su' },
        { kana: 'セ', romaji: 'se' },
        { kana: 'ソ', romaji: 'so' },
      ],
      [
        { kana: 'タ', romaji: 'ta' },
        { kana: 'チ', romaji: 'chi' },
        { kana: 'ツ', romaji: 'tsu' },
        { kana: 'テ', romaji: 'te' },
        { kana: 'ト', romaji: 'to' },
      ],
      [
        { kana: 'ナ', romaji: 'na' },
        { kana: 'ニ', romaji: 'ni' },
        { kana: 'ヌ', romaji: 'nu' },
        { kana: 'ネ', romaji: 'ne' },
        { kana: 'ノ', romaji: 'no' },
      ],
      [
        { kana: 'ハ', romaji: 'ha' },
        { kana: 'ヒ', romaji: 'hi' },
        { kana: 'フ', romaji: 'fu' },
        { kana: 'ヘ', romaji: 'he' },
        { kana: 'ホ', romaji: 'ho' },
      ],
      [
        { kana: 'マ', romaji: 'ma' },
        { kana: 'ミ', romaji: 'mi' },
        { kana: 'ム', romaji: 'mu' },
        { kana: 'メ', romaji: 'me' },
        { kana: 'モ', romaji: 'mo' },
      ],
      [
        { kana: 'ヤ', romaji: 'ya' },
        _,
        { kana: 'ユ', romaji: 'yu' },
        _,
        { kana: 'ヨ', romaji: 'yo' },
      ],
      [
        { kana: 'ラ', romaji: 'ra' },
        { kana: 'リ', romaji: 'ri' },
        { kana: 'ル', romaji: 'ru' },
        { kana: 'レ', romaji: 're' },
        { kana: 'ロ', romaji: 'ro' },
      ],
      [
        { kana: 'ワ', romaji: 'wa' },
        _,
        _,
        _,
        { kana: 'ヲ', romaji: 'wo' },
      ],
      [{ kana: 'ン', romaji: 'n' }, _, _, _, _],
    ],
  },
  {
    id: 'dakuon',
    title: '濁音',
    subtitle: 'Dakuon',
    rows: [
      [
        { kana: 'ガ', romaji: 'ga' },
        { kana: 'ギ', romaji: 'gi' },
        { kana: 'グ', romaji: 'gu' },
        { kana: 'ゲ', romaji: 'ge' },
        { kana: 'ゴ', romaji: 'go' },
      ],
      [
        { kana: 'ザ', romaji: 'za' },
        { kana: 'ジ', romaji: 'ji' },
        { kana: 'ズ', romaji: 'zu' },
        { kana: 'ゼ', romaji: 'ze' },
        { kana: 'ゾ', romaji: 'zo' },
      ],
      [
        { kana: 'ダ', romaji: 'da' },
        { kana: 'ヂ', romaji: 'ji' },
        { kana: 'ヅ', romaji: 'zu' },
        { kana: 'デ', romaji: 'de' },
        { kana: 'ド', romaji: 'do' },
      ],
      [
        { kana: 'バ', romaji: 'ba' },
        { kana: 'ビ', romaji: 'bi' },
        { kana: 'ブ', romaji: 'bu' },
        { kana: 'ベ', romaji: 'be' },
        { kana: 'ボ', romaji: 'bo' },
      ],
    ],
  },
  {
    id: 'handakuon',
    title: '半濁音',
    subtitle: 'Handakuon',
    rows: [
      [
        { kana: 'パ', romaji: 'pa' },
        { kana: 'ピ', romaji: 'pi' },
        { kana: 'プ', romaji: 'pu' },
        { kana: 'ペ', romaji: 'pe' },
        { kana: 'ポ', romaji: 'po' },
      ],
    ],
  },
  {
    id: 'yoon',
    title: '拗音',
    subtitle: 'Yōon',
    columns: 3,
    rows: [
      [
        { kana: 'キャ', romaji: 'kya' },
        { kana: 'キュ', romaji: 'kyu' },
        { kana: 'キョ', romaji: 'kyo' },
      ],
      [
        { kana: 'シャ', romaji: 'sha' },
        { kana: 'シュ', romaji: 'shu' },
        { kana: 'ショ', romaji: 'sho' },
      ],
      [
        { kana: 'チャ', romaji: 'cha' },
        { kana: 'チュ', romaji: 'chu' },
        { kana: 'チョ', romaji: 'cho' },
      ],
      [
        { kana: 'ニャ', romaji: 'nya' },
        { kana: 'ニュ', romaji: 'nyu' },
        { kana: 'ニョ', romaji: 'nyo' },
      ],
      [
        { kana: 'ヒャ', romaji: 'hya' },
        { kana: 'ヒュ', romaji: 'hyu' },
        { kana: 'ヒョ', romaji: 'hyo' },
      ],
      [
        { kana: 'ミャ', romaji: 'mya' },
        { kana: 'ミュ', romaji: 'myu' },
        { kana: 'ミョ', romaji: 'myo' },
      ],
      [
        { kana: 'リャ', romaji: 'rya' },
        { kana: 'リュ', romaji: 'ryu' },
        { kana: 'リョ', romaji: 'ryo' },
      ],
      [
        { kana: 'ギャ', romaji: 'gya' },
        { kana: 'ギュ', romaji: 'gyu' },
        { kana: 'ギョ', romaji: 'gyo' },
      ],
      [
        { kana: 'ジャ', romaji: 'ja' },
        { kana: 'ジュ', romaji: 'ju' },
        { kana: 'ジョ', romaji: 'jo' },
      ],
      [
        { kana: 'ビャ', romaji: 'bya' },
        { kana: 'ビュ', romaji: 'byu' },
        { kana: 'ビョ', romaji: 'byo' },
      ],
      [
        { kana: 'ピャ', romaji: 'pya' },
        { kana: 'ピュ', romaji: 'pyu' },
        { kana: 'ピョ', romaji: 'pyo' },
      ],
    ],
  },
];

/** Gộp các section thành mảng phẳng (tương thích code cũ) */
export function flattenKanaSections(sections: KanaSection[]): KanaCell[] {
  return sections.flatMap((section) => section.rows.flat());
}

/** @deprecated Dùng HIRAGANA_SECTIONS — giữ để PronunciationView không vỡ */
export const HIRAGANA = flattenKanaSections(HIRAGANA_SECTIONS);

/** @deprecated Dùng KATAKANA_SECTIONS */
export const KATAKANA = flattenKanaSections(KATAKANA_SECTIONS);

export interface KanaChartItem {
  speakText: string;
  display: string;
  romaji: string;
  hint: string;
}

export function kanaChartToItems(chart: KanaCell[]): KanaChartItem[] {
  return chart
    .filter((item) => item.kana)
    .map((item) => ({
      speakText: item.kana,
      display: item.kana,
      romaji: item.romaji,
      hint: `Romaji: ${item.romaji}`,
    }));
}
