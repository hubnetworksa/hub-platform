-- One AI-written morning briefing per day (South African date), shared by
-- every admin. `content` is the briefing as JSON; `facts` is exactly what the
-- model was given, kept so any number in the briefing can be checked.
CREATE TABLE daily_briefings (
  day TEXT PRIMARY KEY,
  content TEXT NOT NULL,
  facts TEXT NOT NULL,
  ai INTEGER NOT NULL DEFAULT 1,
  model TEXT,
  input_tokens INTEGER,
  output_tokens INTEGER,
  regenerations INTEGER NOT NULL DEFAULT 0,
  created_at TEXT NOT NULL DEFAULT (datetime('now'))
);
