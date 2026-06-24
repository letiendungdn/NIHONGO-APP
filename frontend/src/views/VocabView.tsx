'use client';

import { useState, useEffect } from 'react';
import { playAudio } from '../utils/speech';
import LessonSelector from '../components/LessonSelector';
import PlayAllButton from '../components/PlayAllButton';
import { usePlayAll } from '../hooks/usePlayAll';
import { useVocabulariesQuery } from '../hooks/queries';
import StrokeOrder from '../components/StrokeOrder';
import { getStrokeText } from '../utils/japanese';
import './VocabView.css';

export default function VocabView() {
  const [currentLesson, setCurrentLesson] = useState(1);
  const [currentIndex, setCurrentIndex] = useState(0);
  const [isFlipped, setIsFlipped] = useState(false);
  const { data: lessonVocab = [], isLoading: loading } = useVocabulariesQuery(currentLesson);
  const { isPlayingAll, startPlayAll, stopPlayAll } = usePlayAll();

  useEffect(() => {
    stopPlayAll();
    setCurrentIndex(0);
    setIsFlipped(false);
  }, [currentLesson, stopPlayAll]);

  const currentVocab = lessonVocab[currentIndex];

  const handleNext = () => {
    if (!lessonVocab.length) return;
    setIsFlipped(false);
    setTimeout(() => {
      setCurrentIndex((prev) => (prev + 1) % lessonVocab.length);
    }, 150);
  };

  const handlePrev = () => {
    if (!lessonVocab.length) return;
    setIsFlipped(false);
    setTimeout(() => {
      setCurrentIndex((prev) => (prev - 1 + lessonVocab.length) % lessonVocab.length);
    }, 150);
  };

  const handlePronounce = (e: React.MouseEvent) => {
    e.stopPropagation();
    if (currentVocab) playAudio(currentVocab.kana);
  };

  const handlePlayAll = () => {
    startPlayAll(
      lessonVocab.map((v) => v.kana),
      {
        onItemIndex: (index) => {
          setIsFlipped(false);
          setCurrentIndex(index);
        },
      },
    );
  };

  return (
    <div className="container vocab-view">
      <div className="vocab-header">
        <h2 className="view-title">Minna no Nihongo Vocabulary</h2>

        <LessonSelector
          id="lesson-select"
          value={currentLesson}
          onChange={setCurrentLesson}
        />

        {lessonVocab.length > 0 && (
          <p className="vocab-subtitle">
            Từ {currentIndex + 1} / {lessonVocab.length}
          </p>
        )}
      </div>

      {loading ? (
        <div className="empty-state">
          <p>Đang tải dữ liệu...</p>
        </div>
      ) : lessonVocab.length > 0 && currentVocab ? (
        <div className="vocab-main-layout">
          <div className="flashcard-container">
            <div
              className={`flashcard ${isFlipped ? 'flipped' : ''}`}
              onClick={() => setIsFlipped(!isFlipped)}
            >
              <div className="flashcard-face flashcard-front">
                <button className="btn-audio" onClick={handlePronounce} title="Nghe phát âm">
                  🔊
                </button>
                <span className="vocab-kanji japanese-text">
                  {currentVocab.kanji || currentVocab.kana}
                </span>
              </div>

              <div className="flashcard-face flashcard-back">
                <button className="btn-audio" onClick={handlePronounce} title="Nghe phát âm">
                  🔊
                </button>
                <span className="vocab-kana japanese-text">{currentVocab.kana}</span>
                <span className="vocab-romaji">{currentVocab.romaji}</span>
                <div className="divider"></div>
                <span className="vocab-meaning">{currentVocab.meaning}</span>
              </div>
            </div>

            <div className="vocab-controls">
              <PlayAllButton
                isPlaying={isPlayingAll}
                onPlay={handlePlayAll}
                onStop={stopPlayAll}
              />
              <button className="btn btn-nav" onClick={handlePrev}>
                ⬅️ Trước
              </button>
              <button className="btn btn-nav" onClick={handleNext}>
                Sau ➡️
              </button>
            </div>
          </div>

          <div className="stroke-order-sidepanel glass-panel">
            <h3>Cách viết chữ:</h3>
            <p className="stroke-kanji">
              {getStrokeText(currentVocab.kanji || currentVocab.kana) ||
                currentVocab.kana}
            </p>
            <div className="stroke-drawing-box">
              <StrokeOrder text={currentVocab.kanji || currentVocab.kana} />
            </div>
          </div>
        </div>
      ) : (
        <div className="empty-state">
          <p>
            Dữ liệu từ vựng cho Bài {currentLesson} chưa có sẵn. Hãy chọn bài khác
            nhé!
          </p>
        </div>
      )}
    </div>
  );
}
