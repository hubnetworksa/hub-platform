UPDATE businesses
SET description = 'News Cafe in The Sanctuary Shopping Centre is the Firgrove branch of a South African all-day cafe, cocktail bar and entertainment venue chain, serving breakfast, lunch and cocktails into the early hours on weekends.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 07:30-22:00, Fri 07:30-02:00, Sat 08:30-02:00, Sun 08:30-22:00',
    source_urls = '["https://www.newscafe.co.za/stores/south-africa/somerset-west/", "https://www.facebook.com/alexandrajohn.dahlia/posts/news-cafe-somerset-westshop-g14-the-sanctuary-shopping-centre-niblick-way-firgro/4628730487413534/", "https://www.newscafe.co.za/about/"]'
WHERE slug = 'news-cafe-firgrove' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ridgemor Villa Guest House is an 8-room luxury guest house on a Firgrove farm dating back to 1670, one of the oldest in the area, offering en-suite rooms and a swimming pool amid the Winelands vineyards.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.lekkeslaap.co.za/accommodation/ridgemor-villa-guest-house", "https://www.booking.com/hotel/za/ridgemor-villa.html", "https://ridgemorvilla.com/"]'
WHERE slug = 'ridgemor-villa-guest-house-firgrove' AND description_enriched_at IS NULL;
