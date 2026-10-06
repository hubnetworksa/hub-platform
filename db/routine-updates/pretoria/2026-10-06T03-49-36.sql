-- thin-pages pretoria batch 11, checkpoint 3: Cornwall Hill Estate (1 business)
-- (group5 of parallel verification: software-development (partial))
-- Restaurants & Takeaways: the only crawled candidate, Cornish Kettle Tea Garden &
-- Playpark (corner Nellmapius/Cornwood Rd), shares its exact phone number (012 667
-- 2883) with the existing published business "whisk-wine-bar-cornwall-hill-estate"
-- at the same corner -- almost certainly the same venue after a rebrand to Whisk
-- Wine Bar. Excluded per the duplicate rule, not republished; combo stays short.
-- Glen Lauriston had no verified candidates clear the bar this checkpoint.

-- Software Development, Cornwall Hill Estate (partial: 1/2)
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'cirrus-bridge-cornwall-hill-estate', 'Cirrus Bridge',
  (SELECT id FROM suburbs WHERE slug = 'cornwall-hill-estate'),
  '494 Pencarrow Road, Cornwall Hill Estate, Pretoria, 0157', '072 325 9580', 'https://cirrusbridge.com', 'sales@cirrusbridge.com',
  'Cirrus Bridge is a software development company based at 494 Pencarrow Road in Cornwall Hill Estate, Pretoria. The company builds mobile apps, web apps, e-commerce platforms and the underlying systems a business runs on, working with clients to turn their ideas into software products.

Cirrus Bridge''s work includes AI-enabled business systems and workflow automation, with past projects including a sentiment-analysis dashboard for tracking team morale and a mine-safety platform that monitors hazard signals in real time. The company partners with clients across Cornwall Hill Estate and the wider Pretoria area looking to build custom software, mobile apps or AI-driven business tools.',
  NULL,
  NULL, NULL,
  '["https://www.facebook.com/p/cirrus-bridge-61577606765120/", "https://www.findglocal.com/ZA/Pretoria/694552580414200/Cirrus-Bridge", "https://cirrusbridge.com/contact-us"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'cirrus-bridge-cornwall-hill-estate'),
  (SELECT id FROM categories WHERE slug = 'software-development'),
  1
);
