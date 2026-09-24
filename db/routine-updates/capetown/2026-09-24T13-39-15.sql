UPDATE businesses
SET description = 'Danneberg Optometrist has practised from Riverside Mall in Rondebosch since 1987, offering comprehensive eye exams, contact lens fittings, retinal photography and glaucoma and driver''s licence vision screening.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:30-17:00, Sat 08:30-12:00, Sun Closed',
    source_urls = '["https://mallguide.co.za/shops/view/44695/riverside-mall-rondebosch/danneberg-optometrist", "https://za.africabz.com/western-cape/danneberg-optometrist-160416", "https://www.thinklocal.co.za/biz/danneberg-optometrists-cape-town"]'
WHERE slug = 'danneberg-optometrist-rondebosch' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Eden Beauty Collection is a boutique hair and beauty salon on Kromboom Road in Rondebosch East, offering hair styling and treatments, manicures, pedicures, lash enhancements and laser hair removal in an upmarket, relaxation-focused setting.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 08:30-17:30, Sun Closed'
WHERE slug = 'eden-beauty-collection-rondebosch-east' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'MTN Store is a network retail outlet inside Riverside Mall in Rondebosch, selling SIM cards, contracts, airtime, data bundles and mobile devices.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:30-17:00, Sat 08:30-12:45',
    source_urls = '["https://za.polomap.com/cape-town/9540", "http://2pos.co.za/2/3816", "https://nearbyza.com/place/mtn-store-rondebosch"]'
WHERE slug = 'mtn-store-rondebosch' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Medindi Manor is a guest house set in a Victorian home dating from the late 1890s on Thicket Road in Rosebank, offering luxury, superior and standard rooms around a tropical garden with an outdoor pool and veranda where breakfast is served daily.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.medindimanor.com/contact-us", "https://www.sa-venues.com/visit/medindimanor/", "https://www.booking.com/hotel/za/medindi-manor.html"]'
WHERE slug = 'medindi-manor-rosebank' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sure 2 Travel is a travel agency that has operated from Riverside Mall in Rondebosch since 2007, arranging local and international leisure and business travel, with a second branch in Sea Point.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.thinklocal.co.za/biz/sure-2-travel-rondebosch", "https://www.yep.co.za/biz/store/sure-2-travel/166870", "https://za.linkedin.com/company/sure-2-travel"]'
WHERE slug = 'sure-2-travel-rondebosch' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Italian Art Shop, on the ground floor of Riverside Mall in Rondebosch, is South Africa''s sole importer and retailer of a range of professional-grade Italian and international art materials for artists of all levels.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://riversiderondebosch.co.za/store/italian-art-shop/", "https://za.africabz.com/western-cape/italian-artshop-the-41848", "https://italianartshop.co.za/"]'
WHERE slug = 'the-italian-art-shop-rondebosch' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Vitacare Pharmacy is a community pharmacy inside Riverside Mall in Rondebosch, part of the Vitacare Group, dispensing prescription medicines and offering health and wellness services.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 08:00-18:00, Fri 08:00-12:45 & 14:00-18:00, Sat 08:00-14:00, Sun 09:00-13:00',
    source_urls = '["https://www.yep.co.za/biz/store/vitacare-pharmacies/149917", "https://za.readymap.info/4/208", "https://www.vitacaregroup.co.za/"]'
WHERE slug = 'vitacare-pharmacy-rondebosch' AND description_enriched_at IS NULL;
