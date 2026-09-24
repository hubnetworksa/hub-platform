UPDATE businesses
SET description = 'Ingwe Waste Management is a 100% Black-owned waste management company based at Plot 6 Geluk in Dalmada, providing residential, business and municipal waste collection, recycling, sanitary landfill management and cleanup services across Limpopo.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:30-17:00, Sat-Sun Closed',
    source_urls = '["https://www.cybo.com/ZA-biz/ingwe-waste-management", "https://www.thinklocal.co.za/biz/ingwe-waste-management-polokwane", "https://www.ingwewaste.co.za/"]'
WHERE slug = 'ingwe-waste-management-dalmada' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'R and G Meat Supplier is a butchery on Plot 37 Dalmada, next to the Dalmada filling station, selling fresh A-grade meat including mince, boerewors, ox liver and poultry cuts, with delivery around Polokwane.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:00-18:00, Sat-Sun 08:00-14:00',
    source_urls = '["https://www.facebook.com/randgmeatsupply/", "https://vymaps.com/ZA/R-and-G-Meat-Supplier-113777366899829/", "https://opening-hours.co.za/04330476/R_and_G_Meat_Supplier"]'
WHERE slug = 'r-and-g-meat-supplier-dalmada' AND description_enriched_at IS NULL;
