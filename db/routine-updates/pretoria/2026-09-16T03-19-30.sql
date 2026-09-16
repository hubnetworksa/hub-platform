UPDATE businesses
SET description = 'Castle Walk Stationers is a stationery and office supplies store in Castle Walk Shopping Centre, Erasmuskloof.',
    description_enriched_at = datetime('now')
WHERE slug = 'castle-walk-stationers-erasmuskloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Erasmia Akhalwayas is a casual dining restaurant in Shezan Centre, Erasmia, serving dine-in and takeaway meals such as chicken tikka, steaks, fish masala, and classic fish and chips.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://southafricafirm.com/gauteng/erasmia-akhalwayas-47405", "https://personlookup.co.za/reverse/0123704970", "https://restaurantguru.com/Akhalwayas-Centurion"]'
WHERE slug = 'erasmia-akhalwayas-erasmia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Erasmia Pharmacy is a retail pharmacy operating inside the Spar in Erasmia, offering free medicine delivery to the surrounding area.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://za.africabz.com/gauteng/erasmia-pharmacy-at-spar-52358", "https://za.asklaila.com/listing/Pretoria/centurion/erasmia-pharmacy/L1Dwfpzh/", "https://www.facebook.com/p/Erasmia-Pharmacy-at-Spar-100025742717935/"]'
WHERE slug = 'erasmia-pharmacy-erasmia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Inuka is an independent general retail business based in Celtisdal, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'inuka-independent-business-owner-celtisdal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Invelontle Solar Supplies is a solar and renewable energy supplier based in Annlin, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'invelontle-solar-supplies-annlin' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Investmech (Pty) Ltd is an engineering consulting firm in Lyttelton Manor, Centurion, formed in 1998 by former University of Pretoria lecturers and operating through testing, consulting engineering, business consulting and product units, having completed projects for more than 250 companies since 2004.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://investmech.com/", "https://investmech.com/about-us/"]'
WHERE slug = 'investmech-pty-ltd-lyttelton-manor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Investment Property is a commercial property and office space business based in Murrayfield, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'investment-property-murrayfield' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Investment Spectrum is a placement agency in Southdowns, Centurion, founded in 2017 to provide capital-raising and marketing distribution support connecting investment managers with institutional investors.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://investmentspectrum.co.za/"]'
WHERE slug = 'investment-spectrum-southdowns' AND description_enriched_at IS NULL;
