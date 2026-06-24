/** Chỉ giữ kana và kanji — bỏ ~, romaji, dấu câu (tránh HanziWriter hiện ký tự lỗi) */
export function getStrokeText(text: string): string {
  if (!text) return '';
  return [...text]
    .filter((char) => {
      const code = char.charCodeAt(0);
      return (
        (code >= 0x3040 && code <= 0x309f) ||
        (code >= 0x30a0 && code <= 0x30ff) ||
        (code >= 0x4e00 && code <= 0x9fff)
      );
    })
    .join('');
}
