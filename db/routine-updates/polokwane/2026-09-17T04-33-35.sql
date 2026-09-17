INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'indwe-risk-services-polokwane-central', 'Indwe Risk Services',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  '17 Schoeman Street, Polokwane Central, 0700', '015 299 4510', 'https://www.indwe.co.za/', NULL,
  'Indwe Risk Services is a short-term insurance brokerage with a branch office in Polokwane Central, serving personal, business and commercial insurance clients.',
  NULL, NULL,
  '["https://www.indwe.co.za/contact.php", "https://www.brabys.com/business/5972026/south-africa/limpopo/polokwane/schoeman-st/risk-management-services/indwe-risk-services"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'indwe-risk-services-polokwane-central'),
  (SELECT id FROM categories WHERE slug = 'insurance'),
  1
);

INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'standard-bank-square-polokwane-central', 'Standard Bank Square',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  '49 Hans van Rensburg Street, Polokwane Central, 0700', NULL, NULL,
  '["https://www.facebook.com/Standardbanksquare/", "https://southafrica.tortoisepath.com/place/standard-bank-square-polokwane/"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'lighthouse-mica-hardware-polokwane-central', 'Lighthouse Mica Hardware',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  (SELECT id FROM shopping_centers WHERE slug = 'lighthouse-mall-polokwane-central'),
  '16 Jorissen St, Polokwane Central, 0699', '015 295 9901', 'https://www.mica.co.za', NULL,
  'Lighthouse Mica Hardware is a Mica-branded hardware and DIY retailer inside Lighthouse Mall, Polokwane Central.',
  NULL, NULL,
  '["https://www.brabys.com/za/limpopo/polokwane/hardware-retailers/lighthouse-mica", "https://vymaps.com/ZA/Lighthouse-Mica-206994/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'lighthouse-mica-hardware-polokwane-central'),
  (SELECT id FROM categories WHERE slug = 'hardware-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin, hours)
VALUES (
  'beauty-of-the-bride-polokwane-central', 'Beauty of the Bride',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  (SELECT id FROM shopping_centers WHERE slug = 'standard-bank-square-polokwane-central'),
  'Shop 13, Standard Bank Square, Cnr Hans van Rensburg & Thabo Mbeki Street, Polokwane Central, 0700', '015 230 0029', 'https://beautyofthebride.co.za/', NULL,
  'Beauty of the Bride hires and sells wedding dresses from a boutique in Standard Bank Square, Polokwane Central.',
  NULL, NULL,
  '["https://beautyofthebride.co.za/contact-us/", "https://www.weddingdirectory.co.za/wedding-guide-wedding-suppliers/beauty-bride-bridal-dresses-in-limpopo-368.html"]',
  'published', 'agent_research', 'Mon-Fri 09:00-17:00, Sat 09:00-15:00'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'beauty-of-the-bride-polokwane-central'),
  (SELECT id FROM categories WHERE slug = 'wedding-services'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'yellow-lemon-tree-polokwane-central', 'Yellow Lemon Tree',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  (SELECT id FROM shopping_centers WHERE slug = 'standard-bank-square-polokwane-central'),
  'Shop 14, Standard Bank Square, 49 Hans van Rensburg Street, Polokwane Central, 0700', '015 291 2523', 'https://www.yellowlemontree.co.za/', NULL,
  'Yellow Lemon Tree is a furniture and interior decor showroom in Standard Bank Square, Polokwane Central -- a second, separately-numbered location from the existing Yellow Lemon Tree workshop in Ladanna.',
  NULL, NULL,
  '["https://www.yellowlemontree.co.za/contact/", "https://www.cylex.net.za/company/yellow-lemon-tree-furniture---decor-shop-23738592.html", "https://za.polomap.com/polokwane/9325"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'yellow-lemon-tree-polokwane-central'),
  (SELECT id FROM categories WHERE slug = 'furniture-homeware'),
  1
);
