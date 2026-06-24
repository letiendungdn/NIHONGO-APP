'use client';

import { useState } from 'react';
import { playAudio } from '../utils/speech';
import PlayAllButton from '../components/PlayAllButton';
import StrokeOrder from '../components/StrokeOrder';
import { usePlayAll } from '../hooks/usePlayAll';
import { counterCategories } from '../data/japaneseCounters';
import { getStrokeText } from '../utils/japanese';
import './CountersView.css';

interface CounterItem {
  n: number | string;
  kana: string;
  romaji: string;
  vi: string;
  kanji?: string;
}

function strokeSize(text: string): { width: number; height: number } {
  const len = [...getStrokeText(text)].length;
  if (len <= 1) return { width: 64, height: 64 };
  if (len === 2) return { width: 48, height: 48 };
  return { width: 36, height: 36 };
}

function getWritableText(item: CounterItem): string | null {
  const kanjiText = item.kanji ? getStrokeText(item.kanji) : '';
  if (kanjiText) return kanjiText;
  const kanaText = getStrokeText(item.kana);
  return kanaText || null;
}

export default function CountersView() {
  const [activeId, setActiveId] = useState(counterCategories[0].id);
  const { isPlayingAll, startPlayAll, stopPlayAll } = usePlayAll();

  const category = counterCategories.find((c) => c.id === activeId) ?? counterCategories[0];

  const handlePlayAll = () => {
    startPlayAll(category.items.map((item) => item.kana));
  };

  return (
    <div className="container counters-view">
      <div className="counters-header">
        <h2 className="view-title">Đếm số & thứ tự</h2>
        <p className="counters-subtitle">
          Tiếng Nhật dùng nhiều cách đếm khác nhau tùy loại sự vật. Chọn chủ đề bên dưới để học.
        </p>

        <div className="tab-buttons counters-tabs">
          {counterCategories.map((cat) => (
            <button
              key={cat.id}
              type="button"
              className={`btn tab-btn ${activeId === cat.id ? 'active' : ''}`}
              onClick={() => {
                stopPlayAll();
                setActiveId(cat.id);
              }}
            >
              {cat.label}
            </button>
          ))}
        </div>

        <p className="counters-hint glass-panel">{category.hint}</p>

        <PlayAllButton
          isPlaying={isPlayingAll}
          onPlay={handlePlayAll}
          onStop={stopPlayAll}
          label="Phát tất cả"
        />
      </div>

      <div className="counters-grid">
        {(category.items as CounterItem[]).map((item) => {
          const writableText = getWritableText(item);
          const strokeDims = writableText ? strokeSize(writableText) : null;

          return (
            <div
              key={`${category.id}-${item.n}-${item.kana}`}
              className="counter-card glass-panel"
              role="button"
              tabIndex={0}
              onClick={() => playAudio(item.kana)}
              onKeyDown={(e) => {
                if (e.key === 'Enter' || e.key === ' ') {
                  e.preventDefault();
                  playAudio(item.kana);
                }
              }}
            >
              <span className="counter-num">{item.n}</span>
              {writableText && strokeDims ? (
                <div
                  className="counter-stroke"
                  onClick={(e) => e.stopPropagation()}
                  onKeyDown={(e) => e.stopPropagation()}
                >
                  <StrokeOrder
                    text={writableText}
                    width={strokeDims.width}
                    height={strokeDims.height}
                    compact
                  />
                </div>
              ) : (
                item.kanji && (
                  <span className="counter-kanji japanese-text">{item.kanji}</span>
                )
              )}
              <span className="counter-kana japanese-text">{item.kana}</span>
              <span className="counter-romaji">{item.romaji}</span>
              <span className="counter-vi">{item.vi}</span>
              <span className="counter-audio" aria-hidden>
                🔊
              </span>
            </div>
          );
        })}
      </div>
    </div>
  );
}
