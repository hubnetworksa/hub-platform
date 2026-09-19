-- Populate Bookkeeping Services (was empty). Only 2 of 3 candidates
-- cleared the bar -- a third (FSI Consultancy) was discarded: its
-- researcher could only fetch one source (Facebook) directly, with the
-- second (vymaps.com) coming through search-engine indexing rather than
-- an actual page fetch, too weak to count as genuinely verified. The
-- Polokwane bookkeeping market is otherwise dominated by unregistered
-- home-based operators with no public address, or full accounting/audit
-- practices better suited to the existing Accountants category.

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-tax-shop-polokwane-west-bendor', 'The Tax Shop Polokwane West',
  (SELECT id FROM suburbs WHERE slug = 'bendor'),
  '19 Tangelo Street, Bendor, Polokwane, 0699', '072 777 1187', 'https://taxshoppolokwane.co.za', NULL,
  'The Tax Shop Polokwane West is a franchise branch offering monthly bookkeeping (transaction recording, bank reconciliation, accounts receivable/payable), payroll processing, VAT return preparation and financial reporting for small businesses.',
  NULL, NULL,
  '["https://taxshoppolokwane.co.za/contact-us/", "https://www.sayellow.com/view/south-africa/the-tax-shop-mokopane-in-mokopane", "https://www.facebook.com/plkwest/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'the-tax-shop-polokwane-west-bendor'), (SELECT id FROM categories WHERE slug = 'bookkeeping-services'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'tax-saviour-polokwane-central', 'Tax Saviour (Pty) Ltd',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  'The Office Park, Unit 202, 89 Hans Van Rensburg Street, Polokwane Central, 0699', '015 250 0200', 'https://taxsaviour.co.za', NULL,
  'Tax Saviour is a small bookkeeping and tax practice providing accounting support, personal and business tax return preparation, and SARS compliance for individuals, close corporations, companies and NGOs.',
  NULL, NULL,
  '["https://taxsaviour.co.za/contact-us/", "https://www.findmy.co.za/services/business/the-tax-saviour-south-africa/4449", "https://www.goafricaonline.com/za/1224005-the-tax-saviour-south-africa"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'tax-saviour-polokwane-central'), (SELECT id FROM categories WHERE slug = 'bookkeeping-services'), 1);
