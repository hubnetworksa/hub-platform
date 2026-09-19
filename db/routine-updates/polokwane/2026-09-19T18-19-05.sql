-- Theo Goosen Estate Agents & Auctioneers (Bendor, Polokwane).
-- Verified: name, street address and phone corroborated by the official
-- site plus 2 independent third-party domains (citizen.co.za,
-- property24.com). Suburb "Bendor" comes from citizen.co.za only (not
-- contradicted elsewhere). No verified email found -- left NULL.

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'theo-goosen-estate-agents-auctioneers-bendor', 'Theo Goosen Estate Agents & Auctioneers',
  (SELECT id FROM suburbs WHERE slug = 'bendor'),
  '109 General Maritz Street, Bendor, Polokwane, 0699', '015 295 9014', 'https://www.theogoosen.co.za/', NULL,
  'Theo Goosen Estate Agents & Auctioneers is a Polokwane-based estate agency handling residential, commercial and farm property sales and auctions, with agents covering Polokwane, Marble Hall, Haenertsburg, Modimolle and Tzaneen.',
  NULL, NULL,
  '["https://www.theogoosen.co.za/", "https://www.citizen.co.za/review-online/theo-goosen-estate-agents-auctioneers/", "https://www.property24.com/estate-agents/theo-goosen-estate-agents-and-auctioneers/25702"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'theo-goosen-estate-agents-auctioneers-bendor'), (SELECT id FROM categories WHERE slug = 'estate-agents'), 1);
