UPDATE businesses
SET description = 'Ntsoane Optometrist is an optometry practice inside Seshego Plaza, offering eye tests, spectacles and contact lenses, and is a registered provider with major medical aid schemes.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat-Sun Closed',
    source_urls = '["https://www.yep.co.za/biz/store/ntsoane-optometrist/52004", "https://polokwane.infoisinfo.co.za/card/ntsoane-optometrist/319833", "https://www.primecure.co.za/provider/ntsoane-optometrist/"]'
WHERE slug = 'ntsoane-optometrist-seshego' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TlouTlou Cleaning & Pest Control is a 100% black-owned pest control and cleaning company established in 2006, offering fumigation and pest eradication alongside domestic, carpet and office cleaning services from its Polokwane head office serving all nine provinces.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://ttcp.co.za/contact-us/", "https://www.procompare.co.za/providers/tloutlou", "https://ttcp.co.za/pest-control-in-polokwane/"]'
WHERE slug = 'tloutlou-cleaning-pest-control-seshego' AND description_enriched_at IS NULL;
