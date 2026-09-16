UPDATE businesses
SET description = 'Adega Portuguese Restaurant is an award-winning Portuguese eatery in Hampton Court, Bendor, known for prawns, seafood pasta and steaks, with facilities for both indoor and outdoor functions.',
    description_enriched_at = datetime('now')
WHERE slug = 'adega-portuguese-restaurant-bendor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Boss Recruitment is a recruitment and staffing agency in IT Park, Bendor, established in 1995, offering contract placements, employment screening and HR outsourcing to small and medium enterprises, corporates and government clients.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://bossrecruitment.co.za/contact-us/", "https://za.polomap.com/polokwane/13030", "https://bossrecruitment.co.za/"]'
WHERE slug = 'boss-recruitment-bendor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Cash Crusaders Polokwane Game City is a second-hand goods store inside the Game Centre in Polokwane Central, buying, selling and pawning used electronics, tools and other goods.',
    description_enriched_at = datetime('now')
WHERE slug = 'cash-crusaders-game-centre-polokwane-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Clicks Game Centre Polokwane is a pharmacy and health, beauty and personal-care retailer located inside the Game Centre in Polokwane Central.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-18:00, Sat 08:00-17:00, Sun 09:00-14:00',
    source_urls = '["https://clicks.co.za/store/Game-Centre-Polokwane/1637", "https://www.hotfrog.co.za/company/df41ea78d84f252f6ad3d8b514537610/clicks-pharmacy-game-centre-polokwane/polokwane/personal-care-supplies", "https://my-catalogue.co.za/stores/polokwane/clicks/game-centre-mark-street-and-hospitaal-street"]'
WHERE slug = 'clicks-game-centre-polokwane-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Coco Affair is a coffee shop at Standard Bank Square on Schoeman Street, Polokwane Central, serving breakfasts, light meals, high tea and cakes, with facilities for outside catering, takeaways and functions.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-18:00, Sat 09:00-14:00, Sun Closed',
    source_urls = '["https://www.yep.co.za/biz/store/coco-affair/132968", "https://za.near-place.com/food-nearby-coco-affair-standard-bank-square-49c-schoeman-street-polokwane-central-polokwane", "https://cocoaffair.co.za/"]'
WHERE slug = 'coco-affair-polokwane-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'DZB Chartered Accountants is an auditing and accounting firm in Platinum Park, Bendor Park, preparing financial statements for sole proprietors, partnerships, trusts and companies, and offering bookkeeping, VAT and administration services, as a member of the South African Institute of Chartered Accountants.',
    description_enriched_at = datetime('now')
WHERE slug = 'dzb-chartered-accountants-bendor-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mama Testimony African Restaurant & Grocery is a Nigerian and West African restaurant and grocery on Schoeman Street, Polokwane Central, serving dishes such as jollof rice and fried rice, with delivery available via Uber Eats.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Wed 08:30-17:30, Thu 08:30-18:30, Fri 08:30-17:30, Sat 09:00-15:00',
    source_urls = '["https://www.facebook.com/people/Mama-Testimony-African-Restaurant-Grocery/100076670251686/", "https://www.mrd.com/delivery/restaurant/mama-testimony-african-restaurant-grocery-polokwane-central/23978", "https://www.ubereats.com/za/store/mama-testimony-restaurant/wr2qTA0aXpq6RkkgBTK4xA"]'
WHERE slug = 'mama-testimony-african-restaurant-grocery-polokwane-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Salvus Commercial Insurance Brokers is an insurance brokerage in Platinum Park, Bendor Park, providing commercial insurance broking services to businesses in the area.',
    description_enriched_at = datetime('now')
WHERE slug = 'salvus-commercial-insurance-brokers-bendor-park' AND description_enriched_at IS NULL;
