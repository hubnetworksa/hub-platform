-- JAC Motors Polokwane — user asked to add it (2026-09-26). A JAC-brand
-- dealership/workshop, same pattern as the other franchise dealers already
-- on car-dealerships (BMW Polokwane, FAW Polokwane, Hyundai Polokwane, etc).
--
-- 2 independent sources, name + address + phone all agreeing:
--   1. jacpolokwane.co.za (the dealership's own official site, via
--      WebSearch snippet fallback — direct fetch is blocked by this
--      sandbox's egress proxy, per ROUTINE.polokwane.md): "JAC Polokwane...
--      7A Grobler Street, Polokwane... +27 15 010 1104...
--      manager1@jaclimpopo.co.za".
--   2. An official "JAC Motors Polokwane Workshop — Now Open" marketing
--      flyer the owner photographed and supplied directly: same name,
--      "015 010 1104", "7A Grobler Street, Polokwane Central, 0700",
--      dp@jacpolokwane.co.za, www.jacpolokwane.co.za.
-- (A third, unrelated hit for "10 Grobler St" during research turned out
-- to be Pietersburg Motor Centre, an already-listed, different dealer at
-- that address -- not a real conflict with this one.)
--
-- No verified lat/lng found -- left NULL, consistent with other entries
-- added this way.

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'jac-motors-polokwane-central', 'JAC Motors Polokwane',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  '7A Grobler Street, Polokwane Central, 0700', '015 010 1104', 'https://jacpolokwane.co.za/', 'dp@jacpolokwane.co.za',
  'JAC Motors Polokwane is an authorised JAC dealership and workshop on Grobler Street in Polokwane Central, selling JAC bakkies, SUVs and commercial trucks alongside vehicle servicing, genuine parts, diagnostics and maintenance plans.',
  NULL, NULL,
  '["https://jacpolokwane.co.za/", "owner-submitted: JAC Motors Polokwane Workshop marketing flyer"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'jac-motors-polokwane-central'),
        (SELECT id FROM categories WHERE slug = 'car-dealerships'), 1);
