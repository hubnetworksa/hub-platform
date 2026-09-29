INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'trevoyan-guesthouse-tamboerskloof', 'The Trevoyan Guesthouse',
  (SELECT id FROM suburbs WHERE slug = 'tamboerskloof'),
  '12 Gilmour Hill Road, Tamboerskloof, Cape Town, 8001', '021 424 4407', 'https://www.trevoyan.co.za/', NULL,
  'The Trevoyan Guesthouse is a boutique guesthouse in an 1894 Victorian-style building on Gilmour Hill Road in Tamboerskloof.',
  NULL, NULL,
  '["https://www.trevoyan.co.za/contact/", "https://www.odunion.com/business-directory/profile/21/the-trevoyan-guesthouse"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'trevoyan-guesthouse-tamboerskloof'),
  (SELECT id FROM categories WHERE slug = 'accommodation'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'dr-uwe-esdar-tamboerskloof', 'Dr Uwe Esdar',
  (SELECT id FROM suburbs WHERE slug = 'tamboerskloof'),
  '1 Milner Road, Tamboerskloof, Cape Town, 8001', '021 424 1992', 'https://www.capedentist.co.za/', 'esdar@capedentist.co.za',
  'Dr Uwe Esdar is a dental practice on Milner Road in Tamboerskloof, offering family, aesthetic and holistic dentistry, teeth whitening and cleaning, and other general dental services.',
  NULL, NULL,
  '["https://www.capedentist.co.za/contact-us/", "https://www.yep.co.za/biz/store/iyp/6342527_3"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'dr-uwe-esdar-tamboerskloof'),
  (SELECT id FROM categories WHERE slug = 'dentists'),
  1
);
