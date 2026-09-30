UPDATE businesses
SET description = 'FNB Lebowakgomo is a First National Bank branch inside Phasha Shopping Centre, offering everyday banking, card and ATM services to the local community.',
    description_enriched_at = datetime('now')
WHERE slug = 'fnb-lebowakgomo-lebowakgomo' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Nedbank Lebowakgomo is a bank branch inside Phasha Shopping Centre, on the corner of the R518 and R579, offering everyday banking, card and ATM services to the local community.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-16:00, Sat 08:30-12:00, Sun Closed',
    source_urls = '["https://www.tiendeo.co.za/stores/lebowakgomo/nedbank-cnr-r-r/46479", "https://www.callupcontact.com/b/Banks/Nedbank_LEBOWAKGOMO/1098", "https://nedbank.banklocationmaps.com/en/branch/935931-nedbank-branch-shop-45-entrance-2-geen-and-richards-shop-shoprite-cent-cnr-r518-and-r579"]'
WHERE slug = 'nedbank-lebowakgomo-lebowakgomo' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'KFC Mankweng (University Road) is a fried chicken and fast-food restaurant located on University Road in Mankweng, part of the national KFC chain.',
    description_enriched_at = datetime('now'),
    hours = 'Open 09:00-21:00 daily'
WHERE slug = 'kfc-mankweng-university-road-mankweng' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ko''Thabeng Guesthouse is a self-catering guesthouse in Bester, Lebowakgomo, offering three-bedroom units with private kitchens, lounges and TVs, plus free Wi-Fi and free parking.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.booking.com/hotel/za/ko-thabeng-guesthouse.html", "https://www.bedandbreakfast.eu/en/a/Nnya76H92c0f/kothabeng-guesthouse", "https://www.tripadvisor.com/Hotel_Review-g312624-d33691730-Reviews-Ko_thabeng_Guesthouse-Polokwane_Limpopo_Province.html"]'
WHERE slug = 'kothabeng-guesthouse-lebowakgomo' AND description_enriched_at IS NULL;
