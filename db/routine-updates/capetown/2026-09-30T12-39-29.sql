-- Job 4: description enrichment sweep (full backlog of 7 businesses)

UPDATE businesses
SET description = 'Barksole is a one-stop key cutting, shoe repair, luggage repair, dry cleaning and engraving service centre in Howard Centre, Pinelands.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-17:00, Sat 09:00-14:00'
WHERE slug = 'barksole-howard-centre-pinelands' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Clicks Central Square Pinelands is a branch of the Clicks pharmacy and health, beauty and baby-care retail chain, located in Central Square, Pinelands.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Tue 08:00-19:00, Wed 09:00-19:00, Thu-Fri 08:00-19:00, Sat 08:00-18:00, Sun 09:00-17:00'
WHERE slug = 'clicks-central-square-pinelands' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Hair Ambitions is a Goldwell-affiliated hair salon in Plattekloof Village offering colour, highlights, cutting, styling, Brazilian blow-dries, hair extensions and a nail bar, stocking KMS and Joico products.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 09:00-16:00, Sun 09:00-13:00',
    source_urls = '["http://plattekloofvillage.azurewebsites.net/shop/hair-ambitions/", "https://heyhairsalons.co.za/0685710/Hair_Ambitions", "https://www.bizreview.co.za/profile/hair-ambitions"]'
WHERE slug = 'hair-ambitions-plattekloof-village-plattekloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mr Fish is a casual fish-and-chips restaurant in Central Square, Pinelands, serving grilled and fried fish such as yellowfin, kabeljou and hake alongside calamari, fish cakes and snoek.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 09:30-20:30, Sun Closed'
WHERE slug = 'mr-fish-central-square-pinelands' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Petshop Science in Plattekloof Shopping Centre is a pet store stocking food, toys, accessories and care essentials for dogs, cats, birds and small animals, part of the science-focused Petshop Science chain.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://za.africabz.com/western-cape/petshop-science-plattekloof-639468", "https://www.medpages.info/sf/index.php?page=listing&servicecode=870&suburbcode=5468", "https://www.shopriteholdings.co.za/group/brands/petshop-science.html"]'
WHERE slug = 'petshop-science-plattekloof-shopping-centre-plattekloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Village Vetshop has operated in Plattekloof Village since 2005, offering veterinary retail products such as tick and flea treatments, de-wormers, shampoos and supplements, vet-approved diets including Hills and Royal Canin, pet beds, toys and accessories, with in-house vets available for advice.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 08:30-16:00, Sun 09:00-13:00',
    source_urls = '["http://plattekloofvillage.azurewebsites.net/shop/village-vetshop/", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=289686", "https://www.plattekloofvillageshoppingcentre.co.za/shop/the-village-vetshop/"]'
WHERE slug = 'the-village-vetshop-plattekloof-village-plattekloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tony''s Liquors is a bottle store in the La Piazza Complex, Richwood, Milnerton.',
    description_enriched_at = datetime('now')
WHERE slug = 'tonys-liquors-la-piazza-richwood' AND description_enriched_at IS NULL;
