UPDATE businesses
SET description = 'Crossroads CDC is a public primary healthcare clinic on Cwayi Street operated by the Western Cape Department of Health, serving the Crossroads community.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:00-16:00'
WHERE slug = 'crossroads-cdc-crossroads' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'VDS Roadhouse is a fast-food roadhouse on Kentucky Avenue in Colorado Park known for its signature double and triple beef burgers, smash burgers and chips.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.mrd.com/delivery/restaurant/vds-roadhouse-colorado-park/32358", "http://www.vdsroadhouse.co.za/contact.php", "https://www.vdsroadhouse.co.za/menu.php"]'
WHERE slug = 'vds-roadhouse-colorado' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Otto''s Cafe is a strictly halal cafe on Rokeby Road in Crawford, serving coffee, freshly baked goods and casual all-day dining.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://triptap.com/places/za/western-cape/cape-town/ottos-cafe-t025b000", "https://www.instagram.com/ottos_cafe/", "https://www.ottoscafe.co.za/"]'
WHERE slug = 'ottos-cafe-crawford' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'L&W Traders is a general retail store inside Colorado City Centre in Colorado Park, Mitchells Plain.',
    description_enriched_at = datetime('now')
WHERE slug = 'lw-traders-colorado' AND description_enriched_at IS NULL;
