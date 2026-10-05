-- thin-pages pretoria batch 03: checkpoint 3 (Rooihuiskraal North / Beauty & Hair Salons)
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'd-ntle-beauty-centurion-rooihuiskraal-north', 'D''ntle Beauty Centurion',
  (SELECT id FROM suburbs WHERE slug = 'rooihuiskraal-north'),
  '490 Theuns van Niekerk Street, Centurion, 0157', '068 317 8904', 'https://www.dntlebeauty.co.za', 'info@dntlebeauty.com',
  'D''ntle Beauty Centurion is a nail and beauty salon on Theuns van Niekerk Street in Rooihuiskraal North, part of a small South African salon group with a second branch in Randburg. The Centurion salon specialises in gel and hybrid hard-gel or polygel nail treatments, soak-offs, nail art, waxing and tinting, and also offers hairstyling add-ons such as braiding-based styles.

Bookings run through an online booking platform with a team of several nail technicians, and the salon has built a large base of client reviews over its ten years in the beauty industry. It serves clients across Rooihuiskraal North and the surrounding Centurion suburbs looking for a dedicated nail and beauty specialist rather than a general hair salon offering nails as a side service.',
  NULL, NULL,
  '["https://www.dntlebeauty.co.za/about-5", "https://www.fresha.com/a/dntle-beauty-centurion-centurion-490-theuns-van-niekerk-street-okhi4wj0", "https://www.facebook.com/dntlebeautycenturion/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'd-ntle-beauty-centurion-rooihuiskraal-north'),
  (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'),
  1
);
