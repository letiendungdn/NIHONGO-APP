'use client';

import { useEffect, useState } from 'react';
import {
  GOAL_MINUTES,
  minnaListeningPresets,
  n5Podcasts,
} from '../data/dailyListening';
import {
  loadListeningStats,
  useMinnaListeningPlayer,
  usePodcastTimer,
} from '../hooks/useDailyListeningSession';
import { useListeningPlaylistQuery } from '../hooks/queries';
import type { ListeningPlaylistItem } from '../types/api';
import './DailyListeningView.css';

export default function DailyListeningView() {
  const [tab, setTab] = useState<'minna' | 'podcast'>('minna');
  const [presetId, setPresetId] = useState(minnaListeningPresets[2].id);
  const [showMeaning, setShowMeaning] = useState(true);
  const [stats, setStats] = useState(loadListeningStats);

  const preset =
    minnaListeningPresets.find((p) => p.id === presetId) ?? minnaListeningPresets[2];

  const { data: playlistData, isLoading: loading } = useListeningPlaylistQuery(
    preset.lessonFrom,
    preset.lessonTo,
  );
  const playlist: ListeningPlaylistItem[] = playlistData?.items ?? [];

  const minna = useMinnaListeningPlayer(playlist);
  const podcast = usePodcastTimer();

  const refreshStats = () => setStats(loadListeningStats());

  useEffect(() => {
    if (minna.goalReached || podcast.goalReached) {
      refreshStats();
    }
  }, [minna.goalReached, podcast.goalReached]);

  const current = playlist[minna.currentIndex];
  const activeElapsed = tab === 'minna' ? minna.elapsed : podcast.elapsed;
  const activeProgress = tab === 'minna' ? minna.progressPct : podcast.progressPct;
  const activeGoalReached = tab === 'minna' ? minna.goalReached : podcast.goalReached;

  return (
    <div className="container daily-listening-view">
      <header className="dl-header">
        <h2 className="view-title">Nghe mỗi ngày · N5</h2>
        <p className="dl-subtitle">
          Mục tiêu {GOAL_MINUTES} phút/ngày — audio Minna trong app hoặc podcast N5 bên ngoài.
        </p>
      </header>

      <section className="dl-stats glass-panel">
        <div className="dl-stat">
          <strong>Hôm nay</strong>
          <span>{stats.minutesToday}/{GOAL_MINUTES} phút</span>
        </div>
        <div className="dl-stat">
          <strong>Streak</strong>
          <span>{stats.streak} ngày 🔥</span>
        </div>
        <div className="dl-progress-ring" style={{ '--pct': activeProgress } as React.CSSProperties}>
          <span>{minna.formatTime(activeElapsed)}</span>
          <small>/ {GOAL_MINUTES}:00</small>
        </div>
      </section>

      {activeGoalReached && (
        <div className="dl-celebration glass-panel">
          🎉 Đủ {GOAL_MINUTES} phút hôm nay! Tiếp tục nghe hoặc quay lại mai nhé.
        </div>
      )}

      <div className="dl-tabs">
        <button
          type="button"
          className={`dl-tab ${tab === 'minna' ? 'active' : ''}`}
          onClick={() => setTab('minna')}
        >
          🎧 Audio Minna
        </button>
        <button
          type="button"
          className={`dl-tab ${tab === 'podcast' ? 'active' : ''}`}
          onClick={() => setTab('podcast')}
        >
          📻 Podcast N5
        </button>
      </div>

      {tab === 'minna' ? (
        <div className="dl-minna">
          <div className="dl-controls glass-panel">
            <label>
              Chọn phạm vi:
              <select
                value={presetId}
                onChange={(e) => setPresetId(e.target.value)}
                disabled={minna.isRunning}
                className="select-input"
              >
                {minnaListeningPresets.map((p) => (
                  <option key={p.id} value={p.id}>
                    {p.label}
                  </option>
                ))}
              </select>
            </label>
            <label className="dl-checkbox">
              <input
                type="checkbox"
                checked={showMeaning}
                onChange={(e) => setShowMeaning(e.target.checked)}
              />
              Hiện nghĩa tiếng Việt khi nghe
            </label>
          </div>

          {loading ? (
            <div className="empty-state glass-panel">
              <p>Đang tạo playlist...</p>
            </div>
          ) : !playlist.length ? (
            <div className="empty-state glass-panel">
              <p>Chưa có dữ liệu audio. Hãy seed Minna trước.</p>
            </div>
          ) : (
            <>
              <div className="dl-now-playing glass-panel">
                <span className="dl-now-label">
                  {current?.type === 'sentence' ? 'Câu mẫu' : 'Từ vựng'} · Bài{' '}
                  {current?.lessonNumber}
                </span>
                <p className="dl-now-jp japanese-text">{current?.display}</p>
                {showMeaning && (
                  <p className="dl-now-meaning">{current?.meaning}</p>
                )}
                <p className="dl-queue-meta">
                  Playlist {playlist.length} mục · đang phát #{minna.currentIndex + 1}
                </p>
              </div>

              <div className="dl-player-actions">
                {!minna.isRunning && !minna.isPaused && (
                  <button type="button" className="btn btn-primary" onClick={minna.startSession}>
                    ▶️ Bắt đầu nghe
                  </button>
                )}
                {minna.isRunning && (
                  <button type="button" className="btn btn-outline" onClick={minna.pauseSession}>
                    ⏸ Tạm dừng
                  </button>
                )}
                {minna.isPaused && (
                  <button type="button" className="btn btn-primary" onClick={minna.resumeSession}>
                    ▶️ Tiếp tục
                  </button>
                )}
                {(minna.isRunning || minna.isPaused) && (
                  <button type="button" className="btn btn-outline" onClick={minna.stopSession}>
                    ⏹ Dừng hẳn
                  </button>
                )}
              </div>
            </>
          )}
        </div>
      ) : (
        <div className="dl-podcast">
          <p className="dl-podcast-intro glass-panel">
            Mở podcast bên dưới (tab mới), bật bộ đếm {GOAL_MINUTES} phút và nghe. App ghi nhận
            thời gian khi đủ mục tiêu.
          </p>

          <div className="dl-player-actions">
            {!podcast.isRunning && (
              <button type="button" className="btn btn-primary" onClick={podcast.start}>
                ▶️ Bắt đầu đếm {GOAL_MINUTES} phút
              </button>
            )}
            {podcast.isRunning && (
              <button type="button" className="btn btn-outline" onClick={podcast.pause}>
                ⏸ Tạm dừng đếm
              </button>
            )}
            {!podcast.isRunning && podcast.elapsed > 0 && (
              <button type="button" className="btn btn-primary" onClick={podcast.start}>
                ▶️ Tiếp tục
              </button>
            )}
            <button type="button" className="btn btn-outline" onClick={podcast.reset}>
              ↺ Reset
            </button>
            <button
              type="button"
              className="btn btn-outline"
              onClick={() => {
                podcast.complete();
                refreshStats();
              }}
            >
              ✓ Đánh dấu xong
            </button>
          </div>

          <div className="dl-podcast-list">
            {n5Podcasts.map((pod) => (
              <article key={pod.id} className="dl-podcast-card glass-panel">
                <div className="dl-podcast-head">
                  <h3>{pod.title}</h3>
                  <span className="dl-podcast-level">{pod.level}</span>
                </div>
                <p>{pod.desc}</p>
                <a
                  href={pod.url}
                  target="_blank"
                  rel="noreferrer"
                  className="btn btn-primary dl-podcast-link"
                >
                  Mở podcast ↗
                </a>
              </article>
            ))}
          </div>
        </div>
      )}
    </div>
  );
}
