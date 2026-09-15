UPDATE businesses
SET description = 'INNOVATION DINING is a catering business serving East Lynne and the surrounding Pretoria area.',
    description_enriched_at = datetime('now')
WHERE slug = 'innovation-dining-east-lynne' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'INOAR Lifestyle Centre in Nieuw Muckleneuk combines a hair and beauty salon offering balayage, hair extensions, keratin treatments and permanent straightening with a retail area and coffee shop, its design inspired by the Inoar brand''s Brazilian roots.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:00-16:00, Sat 09:00-13:00',
    source_urls = '["https://inoar.co.za/inoar-centre/", "https://www.fresha.com/lvp/inoar-dey-street-pretoria-2GDz9o", "https://visi.co.za/cool-spaces-inoar-lifestyle-centre/"]'
WHERE slug = 'inoar-lifestyle-centre-muckleneuk' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'INOVAIO (Strategic Marketing & Innovation) is a project commercialisation consultancy based in Hazelwood, Pretoria, helping businesses take ideas from research and product design through to market development and commercialisation.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.inovaio.com/", "https://bizconsa.com/business/inovaio-strategic-marketing-innovation-excellent-business-management-consultant-in-pretoria/"]'
WHERE slug = 'inovaio-strategic-marketing-innovation-sterrewag' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'INPAKT GROUP is a packaging industry supplier based in Zandfontein, Pretoria, with over 22 years of experience manufacturing and supplying packaging machines and food preservation and canning equipment for meat, fish, jams, sauces, vegetables and ready meals.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.inpaktgroup.co.za/", "https://www.inpaktgroup.co.za/about/"]'
WHERE slug = 'inpakt-group-zandfontein' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'INSA Coal Holdings (Pty) Ltd is a coal mining company based in Centurion, formed through a partnership between the Action group and JSE-listed Sephaku Holdings, that acquires, explores and develops coal and mineral projects across the SADC region.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://insacoal.co.za/", "https://www.cylex.net.za/company/insa-coal-holdings--pty--ltd--23779995.html"]'
WHERE slug = 'insa-coal-holdings-pty-ltd-bronberrik' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'INTP Trading Enterprise Pty(Ltd) is an industrial supplies and manufacturing business operating in Meyerspark, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'intp-trading-enterprise-pty-ltd-meyerspark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'INY Industries is a logistics, courier and transport business based in Eersterust, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'iny-industries-eersterust' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'INYAMA E KAYA is a butcher shop on Paul Kruger Street in Les Marais, Pretoria, offering fresh meat cuts with in-store shopping or delivery and both card and NFC payment options.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://pretoria.co.za/place/inyama-e-kaya"]'
WHERE slug = 'inyama-e-kaya-les-marais' AND description_enriched_at IS NULL;
