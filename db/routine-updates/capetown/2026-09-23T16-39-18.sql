-- Job 4: description enrichment sweep (9 businesses, full backlog this run)

UPDATE businesses
SET description = 'Bevlon Contractors is a Cape Town business that has operated in the petrochemical industry for over 30 years, specialising in petroleum installations and maintenance, oil spill clean-up, and the transport of petroleum-based products, based in Killarney Gardens.',
    description_enriched_at = datetime('now')
WHERE slug = 'bevlon-contractors-killarney-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Brito''s Meat Centre is a butchery and meat retailer offering premium meats, everyday groceries and in-store specials, inside Montague Gardens Convenience Centre, Montague Gardens.',
    description_enriched_at = datetime('now'),
    hours = 'Mon 09:00-17:00, Tue-Fri 08:00-17:00, Sat 08:00-13:00, Sun Closed',
    source_urls = '["https://www.brabys.com/za/western-cape/milnerton/montague-gdns-ind/butchers-retail/britos-meat-centre", "https://za.africabz.com/western-cape/britos-meat-centre-montague-gardens-205250", "https://stores.britos.co.za/stores/"]'
WHERE slug = 'britos-meat-centre-montague-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Clicks Pharmacy Montague Gardens is a pharmacy and retail health store inside John Montague Centre, Montague Gardens.',
    description_enriched_at = datetime('now')
WHERE slug = 'clicks-pharmacy-montague-gardens-montague-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'First Battery Centre Montague Gardens is a battery specialist supplying and fitting car, truck and motorcycle batteries, including commercial and start-stop options, with a free battery, starter and alternator check plus battery recycling, inside Montague Gardens Convenience Centre, Montague Gardens.',
    description_enriched_at = datetime('now')
WHERE slug = 'first-battery-centre-montague-gardens-montague-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Iron Horse Relocations is a removals company handling residential and commercial relocations locally, nationally and internationally, offering packing and unpacking, logistics coordination, and secure, alarmed storage with 24-hour monitoring, in Montague Gardens.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.homify.co.za/professionals/5207804/iron-horse-relocations-house-moving-office-furniture-removals-company-cape-town", "https://givingmore.co.za/iron-horse-relocations", "https://www.ironhorserelocations.com/"]'
WHERE slug = 'iron-horse-relocations-montague-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Killarney Gardens Hardware is a hardware store serving the Killarney Gardens industrial area with building and hardware supplies.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:00-16:30, Sat-Sun Closed',
    source_urls = '["https://www.brabys.com/za/western-cape/milnerton/killarney-gardens/hardware-merchants/killarney-gardens-hardware", "https://south-africa.searchinafrica.com/business/4816116/south-africa/western-cape/milnerton/killarney-gardens/killarney-ave/hardware-merchants/killarney-gardens-hardware", "https://www.ivote.co.za/view/south-africa/killarney-gardens-hardware-in-cape-town"]'
WHERE slug = 'killarney-gardens-hardware-killarney-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Scientific Manufacturing is a family-run business established in 1971, specialising in laboratory test equipment and light-duty stainless steel engineering, based in Killarney Gardens.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.brabys.com/za/western-cape/milnerton/killarney-gardens/laboratory-scientific-equipment-supplies/scientific-manufacturing-cc", "https://www.xpose.co.za/listings/scientific-manufacturing-killarney-gardens/", "http://inkillarneygardens.co.za/listing/scientific-manufacturing/"]'
WHERE slug = 'scientific-manufacturing-killarney-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Summer Greens Meat Market is a butchery serving the Summer Greens area of Milnerton from Seven Eleven Centre.',
    description_enriched_at = datetime('now')
WHERE slug = 'summer-greens-meat-market-summer-greens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'ULMA Packaging Systems is part of the Spanish ULMA Group and supplies stainless steel and galvanised strapping, buckles, tensioning tools and clips from its Killarney Gardens office.',
    description_enriched_at = datetime('now')
WHERE slug = 'ulma-packaging-systems-killarney-gardens' AND description_enriched_at IS NULL;
