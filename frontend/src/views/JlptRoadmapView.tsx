'use client';

import { useEffect, useMemo, useState } from 'react';
import Link from 'next/link';
import { examScheduleNote, jlptLevels, studyTips } from '../data/jlptRoadmap';
import './JlptRoadmapView.css';

const STORAGE_KEY = 'nihongo-jlpt-progress';

type ProgressRecord = Record<string, boolean>;

function loadProgress(): ProgressRecord {
  try {
    return JSON.parse(localStorage.getItem(STORAGE_KEY) || '{}');
  } catch {
    return {};
  }
}

function saveProgress(progress: ProgressRecord): void {
  localStorage.setItem(STORAGE_KEY, JSON.stringify(progress));
}

export default function JlptRoadmapView() {
  const [activeId, setActiveId] = useState('n5');
  const [progress, setProgress] = useState(loadProgress);

  const level = jlptLevels.find((l) => l.id === activeId) ?? jlptLevels[0];

  const allTaskIds = useMemo(
    () => level.phases.flatMap((p) => p.tasks.map((t) => t.id)),
    [level],
  );

  const doneCount = allTaskIds.filter((id) => progress[id]).length;
  const progressPct = allTaskIds.length
    ? Math.round((doneCount / allTaskIds.length) * 100)
    : 0;

  useEffect(() => {
    saveProgress(progress);
  }, [progress]);

  const toggleTask = (taskId: string) => {
    setProgress((prev) => ({ ...prev, [taskId]: !prev[taskId] }));
  };

  return (
    <div className="container jlpt-roadmap">
      <header className="jlpt-header">
        <h2 className="view-title">Lộ trình luyện thi JLPT</h2>
        <p className="jlpt-subtitle">
          Lộ trình gắn với tài liệu có sẵn trong app: Minna no Nihongo, Kanji Look and Learn,
          Quiz và bài luyện bổ trợ.
        </p>

        <div className="jlpt-level-tabs">
          {jlptLevels.map((lv) => (
            <button
              key={lv.id}
              type="button"
              className={`jlpt-level-tab ${activeId === lv.id ? 'active' : ''}`}
              style={{ '--level-color': lv.color } as React.CSSProperties}
              onClick={() => setActiveId(lv.id)}
            >
              <span className="jlpt-level-label">{lv.label}</span>
              <span className="jlpt-level-badge">{lv.badge}</span>
            </button>
          ))}
        </div>
      </header>

      <section className="jlpt-overview glass-panel">
        <div className="jlpt-overview-top">
          <div>
            <h3>{level.label} — {level.badge}</h3>
            <p>{level.summary}</p>
          </div>
          <div className="jlpt-progress-ring" style={{ '--pct': progressPct, '--color': level.color } as React.CSSProperties}>
            <span>{progressPct}%</span>
            <small>hoàn thành</small>
          </div>
        </div>

        <div className="jlpt-stats">
          <div><strong>Thời gian</strong><span>{level.duration}</span></div>
          <div><strong>Từ vựng</strong><span>{level.vocabTarget}</span></div>
          <div><strong>Kanji</strong><span>{level.kanjiTarget}</span></div>
          <div><strong>Điểm đạt</strong><span>{level.passScore}</span></div>
        </div>

        <div className="jlpt-exam-grid">
          {level.examSections.map((sec) => (
            <div key={sec.name} className="jlpt-exam-card">
              <span className="jlpt-exam-name">{sec.name}</span>
              <span>{sec.points} điểm · {sec.time}</span>
            </div>
          ))}
        </div>
      </section>

      <section className="jlpt-section">
        <h3>📚 Tài liệu trong app</h3>
        <div className="jlpt-materials">
          {level.materials.map((mat) => (
            <article key={mat.title} className="jlpt-material-card glass-panel">
              <h4>{mat.title}</h4>
              <p>{mat.desc}</p>
              <span className="jlpt-scope">{mat.scope}</span>
              <div className="jlpt-material-links">
                {mat.inApp && (
                  <Link href={mat.inApp.to} className="btn btn-sm btn-primary">
                    {mat.inApp.label}
                  </Link>
                )}
                {'external' in mat && mat.external && (
                  <a
                    href={mat.external.url}
                    target="_blank"
                    rel="noreferrer"
                    className="btn btn-sm btn-outline"
                  >
                    {mat.external.label} ↗
                  </a>
                )}
              </div>
            </article>
          ))}
        </div>
      </section>

      <section className="jlpt-section">
        <h3>🗓️ Lộ trình theo giai đoạn</h3>
        <div className="jlpt-timeline">
          {level.phases.map((phase, index) => (
            <article key={phase.id} className="jlpt-phase glass-panel">
              <div className="jlpt-phase-marker" style={{ background: level.color } as React.CSSProperties}>
                {index + 1}
              </div>
              <div className="jlpt-phase-body">
                <h4>{phase.title}</h4>
                <p className="jlpt-phase-sub">{phase.subtitle}</p>
                <ul className="jlpt-task-list">
                  {phase.tasks.map((task) => (
                    <li key={task.id} className={progress[task.id] ? 'done' : ''}>
                      <label className="jlpt-task-label">
                        <input
                          type="checkbox"
                          checked={!!progress[task.id]}
                          onChange={() => toggleTask(task.id)}
                        />
                        <span>{task.text}</span>
                      </label>
                      <div className="jlpt-task-actions">
                        {task.inApp && (
                          <Link href={task.inApp.to} className="jlpt-task-link">
                            {task.inApp.label}
                          </Link>
                        )}
                        {'external' in task && task.external && (
                          <a
                            href={task.external.url}
                            target="_blank"
                            rel="noreferrer"
                            className="jlpt-task-link external"
                          >
                            {task.external.label} ↗
                          </a>
                        )}
                      </div>
                    </li>
                  ))}
                </ul>
              </div>
            </article>
          ))}
        </div>
      </section>

      <section className="jlpt-section jlpt-tips glass-panel">
        <h3>💡 Mẹo luyện thi</h3>
        <ul>
          {studyTips.map((tip) => (
            <li key={tip}>{tip}</li>
          ))}
        </ul>
        <p className="jlpt-schedule-note">{examScheduleNote}</p>
        <a
          href="https://jlpt.jp/e/index.html"
          target="_blank"
          rel="noreferrer"
          className="btn btn-outline jlpt-official-link"
        >
          Trang JLPT chính thức ↗
        </a>
      </section>
    </div>
  );
}
