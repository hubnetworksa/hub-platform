UPDATE businesses
SET description = 'Forty 4 on Hoog is a 4-star, adults-only guest house set around an outdoor swimming pool and garden, with suites ranging from Junior Suites to a King Deluxe Suite with fireplace and a Presidential Suite with a kitchenette. Guests get a full English or Irish breakfast, free WiFi, private parking and full-day security.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.lekkeslaap.co.za/accommodation/forty-4-on-hoog-luxury-accommodation", "https://www.makemytrip.com/hotels-international/en-us/south_africa/capricorn-hotels/forty_4_on_hoog-details.html", "https://www.booking.com/hotel/za/forty-4-on-hoog.html"]'
WHERE slug = 'forty-4-on-hoog-capricorn' AND description_enriched_at IS NULL;
