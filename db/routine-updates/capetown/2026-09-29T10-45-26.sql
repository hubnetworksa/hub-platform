INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'catherine-chambers-physiotherapy-pilates-vredehoek', 'Catherine Chambers Physiotherapy & Pilates',
  (SELECT id FROM suburbs WHERE slug = 'vredehoek'),
  '29 Derry Street, Vredehoek, Cape Town, 8001', '021 461 2159', 'https://healthjunction.co.za/', 'info@healthjunction.co.za',
  'Catherine Chambers Physiotherapy & Pilates is a physiotherapy and Pilates practice on Derry Street in Vredehoek, offering physiotherapy, Pilates and massage treatments.',
  NULL, NULL,
  '["https://www.facebook.com/catherinechambersphysio/", "https://za.africabz.com/western-cape/catherine-chambers-physio-pilates-27390"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'catherine-chambers-physiotherapy-pilates-vredehoek'),
  (SELECT id FROM categories WHERE slug = 'physiotherapists'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'citivet-gardens-vredehoek', 'Citivet Gardens',
  (SELECT id FROM suburbs WHERE slug = 'vredehoek'),
  '7 Aandbloem Street, Vredehoek, Cape Town, 8001', '021 465 4244', 'https://citivetgardens.co.za/', 'info@cityvetgardens.co.za',
  'Citivet Gardens is a veterinary clinic on Aandbloem Street in Vredehoek, part of the Citivet group of practices, offering general veterinary care.',
  NULL, NULL,
  '["https://www.brabys.com/za/western-cape/cape-town/vredehoek/veterinary-clinics-hospitals/city-vet-gardens", "https://za.africabz.com/western-cape/citi-vet-gardens-265479"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'citivet-gardens-vredehoek'),
  (SELECT id FROM categories WHERE slug = 'vets-animal-care'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-flower-supply-co-vredehoek', 'The Flower Supply Co',
  (SELECT id FROM suburbs WHERE slug = 'vredehoek'),
  '114 Upper Mill Street, Vredehoek, Cape Town, 8001', '071 673 9847', 'https://www.theflowersupplyco.co.za/', NULL,
  'The Flower Supply Co is a flower shop, pantry and cafe on Upper Mill Street in Vredehoek, selling flowers, coffee, croissants and a range of nuts and dried goods.',
  NULL, NULL,
  '["https://www.theflowersupplyco.co.za/", "https://www.facebook.com/theFlowerSupplyCo/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-flower-supply-co-vredehoek'),
  (SELECT id FROM categories WHERE slug = 'florists'),
  1
);
