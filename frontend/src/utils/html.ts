export function stripHtml(text: string): string {
  if (!text) return '';
  return text
    .replace(/<br\s*\/?>/gi, ' ')
    .replace(/<[^>]+>/g, '')
    .replace(/&#8211;/g, '–')
    .replace(/&#8217;/g, "'")
    .replace(/&nbsp;/g, ' ')
    .replace(/\s+/g, ' ')
    .trim();
}

export function speechTextFromHtml(html: string): string {
  return stripHtml(html).replace(/…/g, '');
}
