-- Job 4: description enrichment sweep, batch 1 of 2 (10 records)
UPDATE businesses
SET description = 'Cafe Delicieux is a cafe in Welgemoed Forum shopping centre, Welgemoed, popular for its all-day breakfast and lunch menu and featured on Cape Town lifestyle blogs.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:15-18:00, Sat 08:30-15:00, Sun 09:00-14:00'
WHERE slug = 'cafe-delicieux-welgemoed' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Clicks Brighton Square is a pharmacy and health, beauty and personal care retailer inside Brighton Square Shopping Centre, Kraaifontein.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat 08:00-13:00, Sun Closed'
WHERE slug = 'clicks-brighton-square-kraaifontein' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'DentalWize Kraaifontein is a dental practice inside Brighton Square Shopping Centre, offering general and family dental care.',
    description_enriched_at = datetime('now')
WHERE slug = 'dentalwize-brighton-square-kraaifontein' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Dis-Chem Pharmacy Okavango Crossing is a pharmacy inside Okavango Crossing shopping centre in Kraaifontein, part of the Dis-Chem chain, offering a dispensary and health, beauty and wellness products.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:30-19:00, Sat 08:30-17:00, Sun 09:00-17:00',
    source_urls = '["https://www.dischem.co.za/okavango-kraaifontein", "https://www.cylex.net.za/company/dis-chem-pharmacy-okavango---kraaifontein-23816919.html", "https://www.tiendeo.co.za/stores/kraaifontein/dischem-cnr-okavango-langeberg-rd-shop-okavango-crossing/75584"]'
WHERE slug = 'dis-chem-okavango-crossing-kraaifontein' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'McDonald''s Okavango Crossing is a fast food restaurant with drive-thru service inside Okavango Crossing shopping centre, Kraaifontein.',
    description_enriched_at = datetime('now')
WHERE slug = 'mcdonalds-okavango-crossing-kraaifontein' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mostert & Partners is a law firm in Belmont Park, Kraaifontein, practising as attorneys, notaries and conveyancers across family, labour, divorce, corporate, commercial and immigration law.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 09:00-18:00, Sun Closed',
    source_urls = '["https://www.yep.co.za/biz/store/iyp/6855163_2", "https://www.thinklocal.co.za/biz/mostert-partners-kraaifontein", "https://www.procompare.co.za/providers/mostert-partners-1"]'
WHERE slug = 'mostert-partners-kraaifontein' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Neighbourhood Cafe @ Ramasibi is a restaurant and cafe in Panorama offering wood-fired pizza, burgers and an all-day breakfast and lunch menu, with dinner service on Friday and Saturday evenings.',
    description_enriched_at = datetime('now')
WHERE slug = 'neighbourhood-cafe-ramasibi-panorama' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PEP Brighton Square is a clothing, footwear and homeware retailer inside Brighton Square Shopping Centre, Kraaifontein.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-17:30, Sat 09:00-14:00, Sun 09:00-13:00'
WHERE slug = 'pep-brighton-square-kraaifontein' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Panorama Physio & Rehab Centre is a physiotherapy practice based in the Panorama Healthcare Centre on Rothschild Boulevard, Panorama.',
    description_enriched_at = datetime('now')
WHERE slug = 'panorama-physio-rehab-centre-panorama' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pick n Pay Panorama is a supermarket inside Panorama Shopping Centre on Hendrik Verwoerd Drive, Panorama.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 07:00-21:00, Sun 08:00-20:00'
WHERE slug = 'pick-n-pay-panorama-shopping-centre-panorama' AND description_enriched_at IS NULL;
