UPDATE businesses
SET description = 'Adendorff Machinery Mart is a branch of the national tools and machinery retail chain, stocking hardware, power tools, generators, air compressors and welding equipment for trade and DIY use, in Nirvana, Polokwane.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat 08:00-13:00, Sun Closed',
    source_urls = '["https://www.yellosa.co.za/company/176694/adendorff-machinery-mart", "https://my-catalogue.co.za/stores/polokwane/adendorff-machinery-mart/19-iran-street-nirvana-x1-e", "https://www.adendorff.co.za/"]'
WHERE slug = 'adendorff-machinery-mart-nirvana' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Christian Achievers Academy Private School is a private school in Ivy Park, Polokwane, offering Christian-based education.',
    description_enriched_at = datetime('now')
WHERE slug = 'christian-achievers-academy-private-school-ivy-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Farouk Gani Attorneys is a boutique law firm in Nirvana, Polokwane, established in 1977, specialising in conveyancing, deceased estates and litigation.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.ananzi.co.za/ads/za/limpopo/polokwane/nirvana/attorneys/farouk-gani-attorneys", "https://www.brabys.com/za/limpopo/polokwane/nirvana/attorneys/farouk-gani-attorneys", "https://fgattorneys.co.za/about-us/"]'
WHERE slug = 'farouk-gani-attorneys-nirvana' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Harun Ebrahim Attorneys is a law firm in Nirvana, Polokwane, practising in Road Accident Fund claims, litigation, deceased estates and divorce matters.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:15-16:00, Sat-Sun Closed'
WHERE slug = 'harun-ebrahim-attorneys-nirvana' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Masai Lodge is a guesthouse in Ivy Park, Polokwane, offering en-suite double rooms with DSTV and air conditioning, plus an on-site restaurant and bar serving breakfast.',
    description_enriched_at = datetime('now')
WHERE slug = 'masai-lodge-ivy-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'S Hansen & Associates is an accounting firm in Polokwane Central, offering accounting and related professional services to local businesses and individuals.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat-Sun Closed'
WHERE slug = 's-hansen-associates-polokwane-central' AND description_enriched_at IS NULL;
