-- Superbia suburb checkpoint

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'gasoline-alley-superbia', 'Gasoline Alley',
  (SELECT id FROM suburbs WHERE slug = 'superbia'),
  '204 Tagore St, Superbia, Polokwane, 0699', '015 110 0630', NULL, 'servadv1@gasalley.co.za',
  'Gasoline Alley is a one-stop vehicle repair and service centre on Tagore Street in Superbia, offering tyre repairs, general servicing and pre-loved used cars for all makes and brands.',
  NULL, NULL,
  '["https://www.brabys.com/za/limpopo/polokwane/superbia/tyre-repairs-materials-equipment/gasoline-alley", "https://www.facebook.com/gasolinealleyplk/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'gasoline-alley-superbia'),
  (SELECT id FROM categories WHERE slug = 'automotive-repairs'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'marnes-enterprises-superbia', 'Marnes Enterprises',
  (SELECT id FROM suburbs WHERE slug = 'superbia'),
  '44 Agaat Street, Superbia, Polokwane, 0699', '084 099 4299', 'www.marnesenterprises.co.za', NULL,
  'Marnes Enterprises is a steelwork and fabrication business on Agaat Street in Superbia, specialising in CNC plasma cutting, bending and cutting of mild steel, aluminium and stainless steel, welding, light fabrications, generator frames and transformer tanks.',
  NULL, NULL,
  '["https://www.hotfrog.co.za/company/1099851491606528/marnes-enterprises/polokwane/tanks", "https://www.facebook.com/MarnesEnterprises/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'marnes-enterprises-superbia'),
  (SELECT id FROM categories WHERE slug = 'industrial-suppliers-manufacturing'),
  1
);
