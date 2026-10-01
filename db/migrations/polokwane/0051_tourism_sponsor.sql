-- A new exclusive sponsorship product — "Things to do sponsor" — reusing
-- the existing generalized subscriptions machinery (product_type/
-- product_target, same as category/suburb/banner/centre/guide sponsors):
-- a real monthly recurring PayFast subscription via subscribe/start.ts,
-- not a once-off payment like an event feature. A single citywide slot,
-- so product_target stays NULL — same shape as homepage_banner.
INSERT INTO site_settings (key, value) VALUES ('price_sponsor_tourism_cents', '85000');
