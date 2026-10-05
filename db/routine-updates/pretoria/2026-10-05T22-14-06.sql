-- thin-pages pretoria batch-01: checkpoint 2 (Muckleneuk, Accommodation combo)
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'muckleneuk-guest-house-muckleneuk', 'Muckleneuk Guest House',
  (SELECT id FROM suburbs WHERE slug = 'muckleneuk'),
  '228 Cilliers Street, Muckleneuk, Pretoria', '012 341 8059', 'https://www.muckleneukguesthouse.co.za/', 'info@muckleneukguesthouse.co.za',
  'Muckleneuk Guest House is a four-star bed and breakfast in the leafy Pretoria suburb of Muckleneuk, close to the city''s central business district. The property is positioned for easy access to OR Tambo International Airport via the R21 and to Centurion, Midrand and the N1 corridor, and is within walking distance of UNISA and near the University of Pretoria.

Accommodation consists of eight luxury double bedrooms, four of which are self-catering units, plus a family room and three bedrooms in the main house with their own balconies. All rooms are en-suite and fitted with a television and DSTV decoder, air-conditioning, heating, tea and coffee facilities, and wireless internet access at no extra charge. Home-cooked dinners can be arranged on request after a day of work or sightseeing.

The guest house sits near several of Pretoria''s hospitals, including the Zuid-Afrikaans, Jacaranda and Little Company of Mary, as well as the South African Bureau of Standards, South African National Parks and the Department of Trade and Industry. It is also a convenient base for visiting the Union Buildings, Freedom Park, Church Square, the Voortrekker Monument, the Pretoria Zoo and Loftus Versfeld Stadium.',
  NULL,
  NULL, NULL,
  '["https://www.sa-venues.com/visit/muckleneuk/", "https://www.facebook.com/pretoriaguesthouse/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'muckleneuk-guest-house-muckleneuk'),
  (SELECT id FROM categories WHERE slug = 'accommodation'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'waterhouse-guest-lodge-muckleneuk', 'Waterhouse Guest Lodge',
  (SELECT id FROM suburbs WHERE slug = 'muckleneuk'),
  '236 & 230 Bourke Street, Muckleneuk, Pretoria, 0002', '072 608 2594', 'https://waterhousegl.co.za/muckleneuk/', 'info@waterhousegl.co.za',
  'Waterhouse Guest Lodge in Muckleneuk is one of three guest lodges in the Waterhouse Group, alongside sister properties in Waterkloof and Waterkloof Ridge. The Muckleneuk property has 14 en-suite guest rooms and sits directly opposite the Zuid-Afrikaans Hospital, within walking distance of UNISA and the University of Pretoria''s Groenkloof campus.

Each room has free Wi-Fi, a flat-screen television with a hotel DSTV package, a bathroom with a shower or bath, a kitchenette with a fridge, microwave, sink and basic cutlery, and a private patio with a coffee and tea tray. Beds are double, king or twin-single configuration, and two family rooms sleep four with a double bed plus two singles. Rooms are serviced daily with fresh linen and towels, breakfast is available on request, and off-street parking sits behind an electric gate.

The property is close to Netcare Jacaranda Hospital, Groenkloof Life Hospital, Mediclinic Heart Hospital and Mediclinic Muelmed, as well as the South African Bureau of Standards, several Pretoria high schools and Menlyn and Brooklyn shopping malls. It is also within walking distance of the Portuguese, Egyptian, Belgian and Finnish embassies, and close to Loftus Versfeld Stadium and the Tshwane Events Centre.',
  NULL,
  NULL, NULL,
  '["https://waterhousegl.co.za/muckleneuk/", "https://www.places.co.za/accommodation/waterhouse-guest-lodge.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'waterhouse-guest-lodge-muckleneuk'),
  (SELECT id FROM categories WHERE slug = 'accommodation'),
  1
);
