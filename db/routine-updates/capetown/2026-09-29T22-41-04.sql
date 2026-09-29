UPDATE businesses
SET description = 'Mungo''s High Constantia store is a sister branch of the brand''s Cape Town shops, stocking the full range of homeware textiles designed and woven at the company''s mill in Plettenberg Bay.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 09:00-17:00, Sun 09:00-14:00',
    source_urls = '["https://mungo.co.za/blog/meet-mungo-high-constantia/", "https://www.tripadvisor.com/Attraction_Review-g1722390-d12163210-Reviews-Mungo-Cape_Town_Western_Cape.html", "https://mungo.co.za/about-us/our-shops/"]'
WHERE slug = 'mungo-constantia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Parks Restaurant, formerly known as 95 at Parks, is an Italian restaurant on Constantia Main Road, closed on Mondays.',
    description_enriched_at = datetime('now'),
    hours = 'Tue-Thu 18:00-22:00, Fri-Sat 12:00-22:00, Sun 12:00-17:00, Mon Closed',
    source_urls = '["https://www.tripadvisor.co.za/Restaurant_Review-g312660-d7375849-Reviews-95_at_Parks-Constantia_Western_Cape.html", "https://www.dineplan.com/restaurants/95-at-parks", "https://www.parksrestaurant.co.za/about/"]'
WHERE slug = 'parks-restaurant-constantia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pho Thy is a halal Vietnamese restaurant in Saratoga Court on Main Road, Kenilworth, serving pho and other traditional Vietnamese dishes made with fresh ingredients in a simple, unfussy setting.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 10:00-21:00, Sun Closed'
WHERE slug = 'pho-thy-kenilworth' AND description_enriched_at IS NULL;
