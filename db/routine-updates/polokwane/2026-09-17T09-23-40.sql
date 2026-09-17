UPDATE businesses
SET description = 'Master Tech Auto Services is an automotive repair and diagnostics workshop in Superbia, Polokwane, servicing all makes and models with guaranteed workmanship.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat-Sun Closed',
    source_urls = '["https://www.yep.co.za/biz/store/master-tech-auto-services/233328", "https://www.thinklocal.co.za/biz/master-tech-auto-services-polokwane", "https://www.autorepairdirectory.co.za/listing-contact.php?listings_id=2063"]'
WHERE slug = 'master-tech-auto-services-superbia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Plumblink Polokwane is the Superbia branch of Plumblink, South Africa''s largest plumbing, bathroom and kitchenware retailer, part of the Bidvest group, supplying plumbing fixtures and fittings to trade and DIY customers.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:00-16:30, Sat 07:00-16:00, Sun 08:00-13:00',
    source_urls = '["https://www.sayellow.com/view/south-africa/plumblink-polokwane-in-polokwane", "https://www.tiendeo.co.za/stores/polokwane/plumblink-nikkel-street-superbia/18693", "https://www.plumblink.co.za/store/plumblink-polokwane"]'
WHERE slug = 'plumblink-superbia' AND description_enriched_at IS NULL;
