-- Follow-up to tourism-attractions-2026-09-01.sql: Burgers Park and Church
-- Square have no dedicated phone number of their own, so per the user's
-- explicit choice these are listed using the City of Tshwane's general
-- switchboard (012 358 9999), with the description making clear that's a
-- municipal line, not a direct number for the site.

INSERT INTO businesses
  (slug, name, suburb_id, address, phone, description, source_urls, status, origin)
VALUES (
  'burgers-park-pretoria-central', 'Burgers Park',
  (SELECT id FROM suburbs WHERE slug = 'pretoria-central'),
  'Thabo Sehume Street & Jacob Maré Street, Pretoria Central, 0001', '012 358 9999',
  'Pretoria''s oldest park, completed in 1892 and declared a national monument, with formal Victorian-style gardens near the city centre. It is owned and maintained by the City of Tshwane; the number listed is the municipal call centre, not a direct line for the park.',
  '["https://en.wikipedia.org/wiki/Burgers_Park", "https://www.tshwane.gov.za/?page_id=4879"]',
  'published', 'seed_import'
);
INSERT INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'burgers-park-pretoria-central'),
  (SELECT id FROM categories WHERE slug = 'museums-heritage-sites'),
  1
);

INSERT INTO businesses
  (slug, name, suburb_id, address, phone, description, source_urls, status, origin)
VALUES (
  'church-square-pretoria-central', 'Church Square',
  (SELECT id FROM suburbs WHERE slug = 'pretoria-central'),
  'Church Square, Pretoria Central, 0002', '012 358 9999',
  'Pretoria''s historic centre, home to the country''s first House of Parliament and a bronze statue of Paul Kruger, surrounded by 19th- and 20th-century buildings including the Palace of Justice. The number listed is the City of Tshwane municipal call centre, not a direct line for the square.',
  '["https://www.visittshwane.co.za/gallery/gallery-church-square/", "https://showme.co.za/pretoria/tourism/pretoria-church-square/"]',
  'published', 'seed_import'
);
INSERT INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'church-square-pretoria-central'),
  (SELECT id FROM categories WHERE slug = 'museums-heritage-sites'),
  1
);
