-- Thin-page fill, Pretoria batch 5, checkpoint 5: The Orchards
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'orchards-hyper-liquor-the-orchards', 'Orchards Hyper Liquor',
  (SELECT id FROM suburbs WHERE slug = 'the-orchards'),
  'Orchards Shopping Centre, Garden Road, The Orchards, Pretoria', '012 549 0728', NULL, NULL,
  'Orchards Hyper Liquor is a liquor store based at the Orchards Shopping Centre on Garden Road in The Orchards, Pretoria. The store sells a range of premium spirits, fine wines and craft beers, with staff offering guidance on choosing a drink for different occasions.

The store is open seven days a week with consistent weekday and weekend hours, and accepts credit card payments alongside cash, with a wheelchair-accessible entrance and parking. It gives residents of The Orchards a specialty liquor option within the suburb rather than having to travel to a supermarket bottle store elsewhere in Pretoria. Its Orchards Shopping Centre address and phone number are recorded consistently on both a local business listing site and an independent South African business directory.',
  'Mon-Sun 08:30-19:00', NULL, NULL,
  '["https://pretoria.co.za/place/orchards-hyper-liquor", "https://www.cybo.com/ZA-biz/orchards-hyper-liquor"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'orchards-hyper-liquor-the-orchards'),
  (SELECT id FROM categories WHERE slug = 'liquor-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'orchards-liquor-market-blue-bottle-liquors-the-orchards', 'Orchards Liquor Market (Blue Bottle Liquors)',
  (SELECT id FROM suburbs WHERE slug = 'the-orchards'),
  'Shop 7, Orchards Plaza, Dorfling Street, The Orchards, Pretoria, 0201', '012 549 4669', NULL, NULL,
  'Orchards Liquor Market, trading as Blue Bottle Liquors, is a liquor store based at Shop 7 in Orchards Plaza on Dorfling Street in The Orchards, Pretoria. The store offers a wide selection of beers, wines and premium spirits, with staff helping customers choose a drink for any occasion.

The shop has built up a large base of customer reviews for a neighbourhood liquor store, and accepts credit card payments for a quick checkout, with a wheelchair-accessible entrance and parking. Its Orchards Plaza, Dorfling Street address and phone number are recorded consistently across more than one independent South African business directory, which list the store under slightly different trading-name variations at the same Shop 7 address.',
  NULL, NULL, NULL,
  '["https://pretoria.co.za/place/orchards-liquor-market-blue-bottle-liquors", "https://za.africabz.com/gauteng/orchards-liquor-market-203440"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'orchards-liquor-market-blue-bottle-liquors-the-orchards'),
  (SELECT id FROM categories WHERE slug = 'liquor-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'torenia-marketing-the-orchards', 'Torenia Marketing',
  (SELECT id FROM suburbs WHERE slug = 'the-orchards'),
  'Dorfling Street, The Orchards, Pretoria, 0182', '072 269 5180', NULL, NULL,
  'Torenia Marketing is a marketing and advertising agency based on Dorfling Street in The Orchards, Pretoria. The agency offers branding, digital marketing and strategic planning, building tailored campaigns intended to help its clients'' businesses grow rather than selling a single standard package to every client.

The agency works by appointment from its Dorfling Street office, taking a client-focused approach to each campaign and describing its own approach as innovative and results-driven. Its Dorfling Street, The Orchards address and phone number are recorded consistently on both a local business listing site and more than one independent South African business directory, which also list its social media presence under the same business name.',
  'Mon-Fri 09:00-17:00', NULL, NULL,
  '["https://pretoria.co.za/place/torenia-marketing", "https://www.cybo.com/ZA-biz/torenia-marketing"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'torenia-marketing-the-orchards'),
  (SELECT id FROM categories WHERE slug = 'marketing-advertising'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'thaluyami-consulting-the-orchards', 'Thaluyami Consulting',
  (SELECT id FROM suburbs WHERE slug = 'the-orchards'),
  '32 Karee Avenue, The Orchards, Pretoria, 0182', '060 683 4950', 'https://thaluyamiconsulting.co.za', NULL,
  'Thaluyami Consulting is an accounting firm based at 32 Karee Avenue in The Orchards, Pretoria. The firm is registered with the South African Institute of Professional Accountants and offers financial statements, personal and business tax, auditing, monthly accounts, payroll, bookkeeping, business plans, independent reviews and company registration services.

Operating from its office in The Orchards, the firm serves individuals and small businesses across the surrounding area who need accounting and tax support without having to use a firm based elsewhere in Pretoria. Its 32 Karee Avenue address and phone number are recorded consistently on an accountant-listing directory and an independent South African business directory, alongside its own website.',
  NULL, NULL, NULL,
  '["https://nsono.findanaccountant.co.za/", "https://www.africabizinfo.com/ZA/thaluyami-consulting-060-683-4950"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'thaluyami-consulting-the-orchards'),
  (SELECT id FROM categories WHERE slug = 'accountants'),
  1
);
