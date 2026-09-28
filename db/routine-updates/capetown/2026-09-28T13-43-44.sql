INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'thembokwezi-square-mandalay', 'Thembokwezi Square',
  (SELECT id FROM suburbs WHERE slug = 'mandalay'),
  'Swartklip Road, Mandalay, Khayelitsha, Cape Town',
  NULL, NULL,
  '["https://www.annenberg.co.za/news/thembokwezi-square/", "https://swish.co.za/developments/view/thembokwezi-square-khayelitsha", "https://za.africabz.com/western-cape/thembokwezi-square-127136"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'khaya-b-and-b-mandalay-mandalay', 'Khaya B&B Mandalay',
  (SELECT id FROM suburbs WHERE slug = 'mandalay'),
  '12 Hermes Way, Mandalay, Cape Town, 7785', '074 110 0033', NULL, NULL,
  'Khaya B&B Mandalay is a bed and breakfast in Mandalay, Khayelitsha, offering air-conditioned rooms with private bathrooms and free on-site parking.',
  NULL, NULL,
  '["https://www.booking.com/hotel/za/khaya-b-amp-b-mandalay.html", "https://www.a-hotel.com/south-africa/93724-cape-town/7412783-1-khaya-bb-mandalay/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'khaya-b-and-b-mandalay-mandalay'),
  (SELECT id FROM categories WHERE slug = 'accommodation'),
  1
);
