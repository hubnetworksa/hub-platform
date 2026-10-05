INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'baker-boys-lynnwood-manor', 'Baker Boys',
  (SELECT id FROM suburbs WHERE slug = 'lynnwood-manor'),
  'Lynburn Centre, 69 Lynburn Road, First Floor, Shop 3, Lynnwood Manor, Pretoria East, 0081', '082 413 9631', 'https://www.bakerboys.co.za/', NULL,
  'Baker Boys is a specialist in luxury handcrafted wedding and celebration cakes, known for timeless elegance, a modern style and detailed sugar art built on an original Italian taste. With more than a decade of experience and a number of local and international awards, the studio offers consultations, cake tastings, delivery, cake stand rental, custom toppers and wedding favours, alongside a range of wedding cake packages from semi-naked and classic floral designs to modern textured and orchid-themed creations. Couples can also order a tasting box to sample flavours before choosing a design, and an online store carries celebration cakes, confectionery and everyday bakes.

Operating from Lynburn Centre in Lynnwood Manor, Pretoria East, the business is not a retail bakery and works by appointment only, open Monday to Friday with Saturday consultations by appointment. It regularly serves weddings and events across Pretoria, Johannesburg, Muldersdrift and Hartbeespoort Dam, with cakes also delivered to Limpopo, Mpumalanga, the Eastern Cape and abroad, making it a fit for couples planning a detailed, bespoke wedding cake well beyond the immediate suburb.',
  'Mon-Fri 08:00-16:00, Sat By appointment, Sun Closed',
  NULL, NULL,
  '["https://www.bakerboys.co.za/pages/contact-us", "https://timetoparty.co.za/party-ideas/directory/listing/listing-baker-boys-3155/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'baker-boys-lynnwood-manor'),
  (SELECT id FROM categories WHERE slug = 'wedding-services'),
  1
);
