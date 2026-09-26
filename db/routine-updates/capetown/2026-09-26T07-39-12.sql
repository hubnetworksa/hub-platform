UPDATE businesses
SET description = 'Byers Glass is a glass merchant in Wetton, Cape Town, supplying and fitting glass for vehicles as well as other applications.',
    description_enriched_at = datetime('now')
WHERE slug = 'byers-glass-wetton' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Castor King is a supplier of castors, wheels, ladders, skates, trolleys and lifting equipment in Wetton, Cape Town, catering to institutional, light, medium and heavy-duty needs.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.cybo.com/ZA-biz/castor-king", "https://www.brabys.com/za/western-cape/cape-town/wetton/castors-wheels/castor-king", "https://www.castorking.co.za/"]'
WHERE slug = 'castor-king-wetton' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Nedbank operates a bank branch inside Westgate Mall in Westgate, Mitchells Plain.',
    description_enriched_at = datetime('now'),
    hours = 'Mon 08:30-16:00, Tue-Thu 09:00-16:00, Fri 08:30-16:00, Sat 08:30-12:00, Sun Closed'
WHERE slug = 'nedbank-westgate-mall-westgate' AND description_enriched_at IS NULL;
