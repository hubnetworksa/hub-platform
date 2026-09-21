INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'amanee-beauty-salon-three-anchor-bay', 'Amanee Beauty Salon',
  (SELECT id FROM suburbs WHERE slug = 'three-anchor-bay'),
  '46B Main Road, Three Anchor Bay, Cape Town', '074 035 5453', NULL, NULL,
  'Amanee Beauty Salon is a beauty and nail salon in Three Anchor Bay, offering acrylic nails, eyelash extensions, threading, microblading and waxing.',
  NULL, NULL,
  '["https://www.fresha.com/a/amanee-beauty-salon-cape-town-three-anchor-bay-48-baywest-46b-main-road-cae1xjue", "https://www.facebook.com/amaneebeauty/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'amanee-beauty-salon-three-anchor-bay'),
  (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'paris-cape-town-three-anchor-bay', 'Paris Cape Town',
  (SELECT id FROM suburbs WHERE slug = 'three-anchor-bay'),
  '267 Main Road, Three Anchor Bay, Cape Town', '076 138 2335', NULL, NULL,
  'Paris Cape Town is a French boulangerie and patisserie in Three Anchor Bay serving croissants, freshly baked bread and pastries.',
  NULL, NULL,
  '["https://www.capetownetc.com/cape-town/restaurants/paris-cape-town-new-kids-on-the-block-serving-up-old-school-pastry-perfection/", "https://www.facebook.com/ParisCapeTown/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'paris-cape-town-three-anchor-bay'),
  (SELECT id FROM categories WHERE slug = 'bakeries'),
  1
);
