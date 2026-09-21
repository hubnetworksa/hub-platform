-- The existing idx_rate_limits index is (action, ip_hash, created_at), which
-- only helps queries that filter on action+ip_hash first. The periodic
-- housekeeping DELETE in functions/_lib/messages.ts's rateLimited() filters
-- solely on created_at, so it couldn't use that index and fell back to a
-- full table scan on ~5% of every rate-limited request — the table only
-- grows between cleanups, so each scan got more expensive than the last.
-- This gives that DELETE its own usable index.
CREATE INDEX idx_rate_limits_created_at ON rate_limits(created_at);
