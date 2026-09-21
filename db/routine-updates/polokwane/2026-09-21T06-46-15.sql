-- Pro Plumb (Flora Park, Polokwane). Name, phone and suburb are confirmed
-- across 3 independent sources (own site, polokwane.info directory,
-- AiYellow); the specific street address (48 Kigelia Street) appears on
-- only one of them (AiYellow) so it's left unconfirmed -- address left
-- NULL rather than publishing a single-sourced street address, per owner
-- decision. Note: a differently-named, differently-numbered business
-- ("The Pro Plumber Polokwane (Pty) Ltd", 015 000 8604, 51 Biccard St)
-- exists in Polokwane too -- confirmed distinct, not the same business.

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pro-plumb-flora-park', 'Pro Plumb',
  (SELECT id FROM suburbs WHERE slug = 'flora-park'),
  NULL, '082 055 2226', 'https://www.polokwaneplumber.co.za/', 'cobus.strydom@yahoo.com',
  'Pro Plumb is a PIRB-registered plumbing business serving Polokwane, offering burst geyser repairs, blocked drain clearing, leaking pipe repairs, solar water heating and septic/French drain work for residential and commercial clients, with 24-hour emergency callouts.',
  NULL, NULL,
  '["https://www.polokwaneplumber.co.za/", "https://www.polokwane.info/directory/companies/clientCategoryListing?objId=515", "https://www.aiyellow.com/proplumb/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'pro-plumb-flora-park'), (SELECT id FROM categories WHERE slug = 'plumbers'), 1);
