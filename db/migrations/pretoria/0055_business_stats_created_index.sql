-- The admin Analytics page filters business_stats by date ("last 30 days")
-- with no other condition, which without this index scans the whole table
-- twice per page load. business_stats grows with every page view, phone
-- click and search appearance, so that scan was a steadily growing share of
-- the account's daily D1 read allowance.
CREATE INDEX IF NOT EXISTS idx_business_stats_created ON business_stats(created_at, event);
