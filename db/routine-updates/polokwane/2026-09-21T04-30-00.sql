UPDATE businesses
SET description = 'Inkmart Copiers is an office equipment supplier in Annadale, offering copiers, printers, fax machines, wide-format machines, office furniture, stationery and consumables to commercial and educational clients across Limpopo, and has operated since 2016.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://nearfinderza.com/en/business/lp/polokwane/stationers/inkmart-copiers_411472+5.html", "https://printshops.co.za/za/limpopo/polokwane/inkmart-office-equipment-annadale-polokwane-limpopo", "https://inkmart.co.za/contact-us/"]'
WHERE slug = 'inkmart-copiers-annadale' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A Nedbank ATM at the Engen filling station on Witklip Street, on the Ladanna/Annadale boundary.',
    description_enriched_at = datetime('now')
WHERE slug = 'nedbank-atm-engen-ladanna-annadale' AND description_enriched_at IS NULL;
