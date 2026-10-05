INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'cash-converters-gift-acres-lynnwood-ridge', 'Cash Converters Gift Acres',
  (SELECT id FROM suburbs WHERE slug = 'lynnwood-ridge'),
  'Gift Acres Shopping Centre, Lynnwood Rd, Lynnwood Ridge, Pretoria, 0081', '087 820 1714', NULL, 'giftacres.online@cashconverters.co.za',
  'Cash Converters Gift Acres is a second-hand retail store trading from the Gift Acres Shopping Centre on Lynnwood Road in Lynnwood Ridge, Pretoria, as part of the national Cash Converters franchise network. The branch buys and resells used goods across a wide range of categories, including furniture, homeware, garden tools, home gym equipment, solar power equipment and cell phone accessories, alongside gold deals and short-term pawn loans for customers needing quick cash.

Shoppers can browse the store''s stock in person or through the branch''s own online product listings, with in-store pickup and both credit and debit card payments available. The premises are wheelchair accessible, with an accessible entrance and parking bay, making it a convenient stop for residents of Lynnwood Ridge and nearby suburbs looking for affordably priced secondhand furniture, electronics, tools and household items, or a place to sell or pawn goods of their own.',
  NULL,
  NULL, NULL,
  '["https://pretoria.co.za/place/cash-converters-gift-acres","https://www.cashconverters.co.za/shop/store/cash-converters-gift-acres","https://za.africabz.com/gauteng/cash-converters-gift-acres-118517"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'cash-converters-gift-acres-lynnwood-ridge'),
  (SELECT id FROM categories WHERE slug = 'furniture-homeware'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'circa-lynnwood-aparthotel-lynnwood-ridge', 'Circa Lynnwood Aparthotel',
  (SELECT id FROM suburbs WHERE slug = 'lynnwood-ridge'),
  '14 Camellia Ave, Lynnwood Ridge, Pretoria, 0181', '082 616 4422', 'https://www.circaaparthotel.co.za/', NULL,
  'Circa Lynnwood Aparthotel is a serviced-apartment property on Camellia Avenue in Lynnwood Ridge, Pretoria, operated under the Totalstay aparthotel brand. It offers self-catering style accommodation combined with hotel-style services, aimed at both business travellers and leisure guests looking for a short or extended stay in Pretoria East.

Guests have access to a 24-hour front desk and secure on-site parking, along with a gym, and check-in is from 14:00 with photo identification required on arrival. The property does not permit pets, smoking, or private events or parties, keeping it suited to business travellers and families seeking a quiet stay. Its Lynnwood Ridge location places it within a short drive of nearby business parks, academic institutions, shopping centres and the Faerie Glen Nature Reserve.',
  NULL,
  NULL, NULL,
  '["https://www.circaaparthotel.co.za/","https://pretoria.co.za/place/circa-lynnwood-aparthotel","https://za.africabz.com/gauteng/circa-lynnwood-aparthotel-628583","https://www.booking.com/hotel/za/circa-aparthotel-by-totalstay.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'circa-lynnwood-aparthotel-lynnwood-ridge'),
  (SELECT id FROM categories WHERE slug = 'hotels'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'tc-s-on-lynnwood-guesthouse-lynnwood-ridge', 'TC''s on Lynnwood Guesthouse',
  (SELECT id FROM suburbs WHERE slug = 'lynnwood-ridge'),
  '254 Lizjohn Street, Lynnwood Ridge, Pretoria', '082 481 7155', 'https://tcsguesthouse.co.za/', 'info@tcsguesthouse.co.za',
  'TC''s on Lynnwood Guesthouse is a bed-and-breakfast style guesthouse on Lizjohn Street in Lynnwood Ridge, Pretoria East, situated opposite a Sasol filling station. Established in 2006, the guesthouse has operated from the same property for close to two decades, offering seventeen bedrooms split between standard and deluxe single and double rooms.

The guesthouse offers a mix of standard and deluxe rooms to suit different budgets, aiming to provide comfortable accommodation for weary travellers, holidaymakers and business guests visiting Pretoria East. Its Lynnwood Ridge location keeps it within easy reach of the surrounding business and retail areas of the suburb, and guests can book directly with the property or through major South African accommodation booking platforms.',
  NULL,
  NULL, NULL,
  '["https://tcsguesthouse.co.za/","https://tcsguesthouse.co.za/contact/","https://za.africabz.com/gauteng/tcs-on-lynnwood-guesthouse-46542","https://pretoria.co.za/place/tcs-on-lynnwood-guesthouse"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'tc-s-on-lynnwood-guesthouse-lynnwood-ridge'),
  (SELECT id FROM categories WHERE slug = 'hotels'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'lotus-guest-house-pretoria-east-lynnwood-ridge', 'Lotus Guest House Pretoria East',
  (SELECT id FROM suburbs WHERE slug = 'lynnwood-ridge'),
  '72 Cedar St, Lynnwood Ridge, Pretoria, 0040', '072 340 2058', NULL, NULL,
  'Lotus Guest House Pretoria East is a self-catering guesthouse at 72 Cedar Street in Lynnwood Ridge, Pretoria East. The property offers cosy rooms, each with a fully equipped kitchen and free Wi-Fi, set within tranquil garden surroundings away from the main road, giving guests a home-like atmosphere rather than a standard hotel room.

The guesthouse is aimed at both business and leisure travellers, combining easy access to Pretoria''s city centre with a peaceful, garden-based retreat from the busier parts of the city. Guests can prepare their own meals in their room''s kitchen rather than relying on an on-site restaurant, making it a practical option for longer stays or visitors who prefer self-catering flexibility while based in Lynnwood Ridge.',
  NULL,
  NULL, NULL,
  '["https://pretoria.co.za/place/lotus-guest-house-pretoria-east","https://www.africabizinfo.com/ZA/lotus-guest-house-pretoria-east-072-340-2058"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'lotus-guest-house-pretoria-east-lynnwood-ridge'),
  (SELECT id FROM categories WHERE slug = 'hotels'),
  1
);

