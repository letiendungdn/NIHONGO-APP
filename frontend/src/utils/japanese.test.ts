import { describe, it, expect } from 'vitest';
import { getStrokeText } from './japanese';

describe('getStrokeText', () => {
  it('giữ lại hiragana', () => {
    expect(getStrokeText('たべる')).toBe('たべる');
  });

  it('giữ lại katakana', () => {
    expect(getStrokeText('テレビ')).toBe('テレビ');
  });

  it('giữ lại kanji', () => {
    expect(getStrokeText('食べる')).toBe('食べる');
  });

  it('bỏ romaji và dấu câu', () => {
    expect(getStrokeText('taberu')).toBe('');
    expect(getStrokeText('～、。')).toBe('');
  });

  it('xử lý chuỗi rỗng', () => {
    expect(getStrokeText('')).toBe('');
  });

  it('xử lý mixed text', () => {
    expect(getStrokeText('食べる (taberu)')).toBe('食べる');
  });
});
