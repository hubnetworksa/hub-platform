-- Records when the reporter was emailed that their report was fixed, so a
-- resolved report only ever sends one notification. See
-- functions/api/admin/resolve-report.ts.
ALTER TABLE reports ADD COLUMN resolved_notified_at TEXT;
