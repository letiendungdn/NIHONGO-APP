'use client';

import { useState } from 'react';
import { playAudio } from '../utils/speech';
import PlayAllButton from '../components/PlayAllButton';
import { usePlayAll } from '../hooks/usePlayAll';
import { counterCategories } from '../data/japaneseCounters';
import './CountersView.css';

interface CounterItem {
  n: number | string;
  kana: string;
  romaji: string;
  vi: string;
  kanji?: string;
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
        {(category.items as CounterItem[]).map((item) => (
          <button
            key={`${category.id}-${item.n}-${item.kana}`}
            type="button"
            className="counter-card glass-panel"
            onClick={() => playAudio(item.kana)}
          >
            <span className="counter-num">{item.n}</span>
            {item.kanji && (
              <span className="counter-kanji japanese-text">{item.kanji}</span>
            )}
            <span className="counter-kana japanese-text">{item.kana}</span>
            <span className="counter-romaji">{item.romaji}</span>
            <span className="counter-vi">{item.vi}</span>
            <span className="counter-audio" aria-hidden>
              🔊
            </span>
          </button>
        ))}
      </div>
    </div>
  );
}
