INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'azimuth-surveys-amberfield-glen', 'Azimuth Surveys',
  (SELECT id FROM suburbs WHERE slug = 'amberfield-glen'),
  '31A Peregrine Street, Amberfield Glen, Centurion, 0149', '0832910927', 'https://www.azimuthsurveys.co.za/', NULL,
  'Azimuth Surveys is a land surveying firm offering topographical, aerial and engineering survey services. Its topographical surveys are produced for design and volume calculation purposes, giving clients the ground data needed before a construction or engineering project begins. The firm also carries out detailed aerial surveys for construction and engineering applications, and it provides engineering surveys and setting-out work covering projects that range from small sites through to mega-scale developments, placing it within the engineering and surveying services field.

Azimuth Surveys operates from 31A Peregrine Street in Amberfield Glen, Centurion, within the greater Pretoria area. As one of the dedicated surveying practices based in Amberfield Glen, it supports local construction, civil engineering and property development work that depends on accurate ground and site measurement before building, earthworks or subdivision can proceed, and its topographical and aerial survey work feeds directly into the design and planning stages of those projects.',
  NULL,
  NULL, NULL,
  '["https://www.azimuthsurveys.co.za/contact-us","https://www.azimuthsurveys.co.za/services","https://www.cybo.com/ZA-biz/azimuth-surveys"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'azimuth-surveys-amberfield-glen'),
  (SELECT id FROM categories WHERE slug = 'engineering-surveying'),
  1
);

