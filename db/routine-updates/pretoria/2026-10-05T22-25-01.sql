-- thin-pages pretoria batch-01: checkpoint 4 (Montana, Restaurants & Takeaways)
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'burger-box-roadhouse-montana-montana', 'Burger Box Roadhouse Montana',
  (SELECT id FROM suburbs WHERE slug = 'montana'),
  'Montana Corner Shopping Centre, Cnr Dr Swanepoel Road & Sefako Makgatho Drive, Montana, Pretoria, 0150', '012 006 5885', 'https://burgerbox.co.za/', 'montana@burgerbox.co.za',
  'Burger Box Roadhouse Montana is a drive-thru branch of the Burger Box Roadhouse & Diner chain, trading from Montana Corner Shopping Centre at the corner of Dr Swanepoel Road and Sefako Makgatho Drive in Montana, Pretoria. It is one of five Burger Box branches nationally, alongside outlets in Benoni, Centurion, Krugersdorp and Sinoville.

The restaurant serves a roadhouse-style menu built around burgers and diner food, available for dine-in, takeaway and call-and-collect ordering by phone, in addition to its drive-thru lane. This drive-thru format distinguishes the Montana branch from some of the chain''s sit-down-only locations.

Burger Box trades Monday to Thursday and on Sunday from 9am to 9pm, and on Friday and Saturday from 9am to 10pm. The chain markets itself under the tagline ''Good Food and a Smile... That''s Roadhouse Style'', describing a diner-style approach to burgers and roadhouse meals across its branches.',
  'Mon-Thu 09:00-21:00, Fri-Sat 09:00-22:00, Sun 09:00-21:00',
  NULL, NULL,
  '["https://burgerbox.co.za/burger-box-branches/", "https://www.facebook.com/p/Burger-Box-Roadhouse-Montana-61568353074920/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'burger-box-roadhouse-montana-montana'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'mike-s-kitchen-montana-montana', 'Mike''s Kitchen Montana',
  (SELECT id FROM suburbs WHERE slug = 'montana'),
  'Shop 17, Lifestyle Centre Building, Veronica Road, Montana, Pretoria', '012 523 0260', 'https://mikeskitchen.co.za/', 'montana@mikeskitchen.co.za',
  'Mike''s Kitchen Montana is a branch of the Mike''s Kitchen family restaurant chain, trading from Shop 17 in the Lifestyle Centre Building on Veronica Road in Montana, Pretoria. The chain was founded in 1972 in Greenside, Johannesburg, and has since grown into a nationwide franchise built around family dining.

The Montana branch offers dine-in, takeaway and in-store collection, with a menu that includes items such as a classic burger with lettuce, tomato, onion and gherkins, a smoked salmon and avocado salad, and a 300g chimichurri rump served with marrow bone. The brand positions itself around bringing people together over a meal, with a broad menu intended to suit different tastes within the same family group.

As a member of the Mike''s Kitchen franchise network, the Montana branch is affiliated with both the Franchise Association of South Africa (FASA) and the Restaurant Association of South Africa (RASA).',
  NULL,
  NULL, NULL,
  '["https://mikeskitchen.co.za/", "https://www.facebook.com/MikesKitchenMontana/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mike-s-kitchen-montana-montana'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
