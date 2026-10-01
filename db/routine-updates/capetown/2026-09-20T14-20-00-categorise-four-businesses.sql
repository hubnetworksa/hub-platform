-- Four published businesses had no category, so they appeared in no browse or
-- category page. Cape Town's category list lacked the four that fit them (all
-- four already exist, with these exact names, in Polokwane), so add those, then
-- give each business its category. Safe to run more than once.
INSERT INTO categories (slug, name) SELECT 'agricultural-farming-supplies', 'Agricultural & Farming Supplies' WHERE NOT EXISTS (SELECT 1 FROM categories WHERE slug = 'agricultural-farming-supplies');
INSERT INTO categories (slug, name) SELECT 'fencing-security-installations', 'Fencing & Security Installations' WHERE NOT EXISTS (SELECT 1 FROM categories WHERE slug = 'fencing-security-installations');
INSERT INTO categories (slug, name) SELECT 'panel-beaters-spray-painters', 'Panel Beaters & Spray Painters' WHERE NOT EXISTS (SELECT 1 FROM categories WHERE slug = 'panel-beaters-spray-painters');
INSERT INTO categories (slug, name) SELECT 'party-event-hire', 'Party & Event Hire' WHERE NOT EXISTS (SELECT 1 FROM categories WHERE slug = 'party-event-hire');

INSERT INTO business_categories (business_id, category_id, is_primary) SELECT b.id, c.id, 1 FROM businesses b, categories c WHERE b.slug = 'nicol-coachworks-diep-river' AND c.slug = 'panel-beaters-spray-painters' AND NOT EXISTS (SELECT 1 FROM business_categories x WHERE x.business_id = b.id);
INSERT INTO business_categories (business_id, category_id, is_primary) SELECT b.id, c.id, 1 FROM businesses b, categories c WHERE b.slug = 'craigmore-poultry-farm-kraaifontein' AND c.slug = 'agricultural-farming-supplies' AND NOT EXISTS (SELECT 1 FROM business_categories x WHERE x.business_id = b.id);
INSERT INTO business_categories (business_id, category_id, is_primary) SELECT b.id, c.id, 1 FROM businesses b, categories c WHERE b.slug = 'advanced-electric-fencing-kraaifontein' AND c.slug = 'fencing-security-installations' AND NOT EXISTS (SELECT 1 FROM business_categories x WHERE x.business_id = b.id);
INSERT INTO business_categories (business_id, category_id, is_primary) SELECT b.id, c.id, 1 FROM businesses b, categories c WHERE b.slug = 'photo-booth-world-boston' AND c.slug = 'party-event-hire' AND NOT EXISTS (SELECT 1 FROM business_categories x WHERE x.business_id = b.id);
