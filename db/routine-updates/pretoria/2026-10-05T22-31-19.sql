-- thin-pages pretoria batch-01: checkpoint 6 (Eldoglen Estate, Restaurants & Takeaways)
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'rocomamas-eldo-square-eldoglen-estate', 'RocoMamas Eldo Square',
  (SELECT id FROM suburbs WHERE slug = 'eldoglen-estate'),
  (SELECT id FROM shopping_centers WHERE slug = 'eldo-square-shopping-centre-eldoglen-estate'),
  'Shop 6-8, Eldo Square Shopping Centre, Volga Street, Eldo Glen, Centurion, 0157', '0860 888 772', 'https://rocomamas.com/za/', NULL,
  'RocoMamas Eldo Square is a Halaal-certified branch of the RocoMamas smash burger chain, trading from Shop 6 to 8 in Eldo Square Shopping Centre on Volga Street in Eldo Glen, Centurion. It is one of more than 100 RocoMamas restaurants across South Africa.

The menu centres on smash burgers, ribs and chicken wings, alongside sides such as loaded fries, served in a casual, music-themed dine-in setting alongside takeaway and delivery options. As a Halaal branch, its food preparation follows Halaal certification standards, distinguishing it from some of the chain''s other outlets.

RocoMamas restaurants are each decorated with their own local character while keeping the same core smash-burger menu across branches nationally. The Eldo Square branch sits within Eldoglen Estate''s main shopping centre, alongside other food outlets and is available for dine-in, takeaway and delivery through third-party delivery platforms.',
  NULL,
  NULL, NULL,
  '["https://rocomamas.com/za/restaurants/gauteng/rocomamas-eldo-square", "https://www.ubereats.com/za/store/rocomamas-eldo-square-halaal/mC4owpG9XYuVULq8kcNjdg"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'rocomamas-eldo-square-eldoglen-estate'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
