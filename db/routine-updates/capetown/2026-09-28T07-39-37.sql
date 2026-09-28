UPDATE businesses
SET description = 'Capitec Bank''s Philippi branch operates from The Junxion Mall, offering everyday retail banking, savings and lending services to the surrounding community.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 08:00-13:00, Sun Closed'
WHERE slug = 'capitec-bank-the-junxion-mall-philippi' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Convenient Motor Spares is a motor parts and vehicle spares supplier on Delft Main Road, Delft.',
    description_enriched_at = datetime('now')
WHERE slug = 'convenient-motor-spares-delft' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Dunns is a fashion and footwear retailer with a store in Philippi Shopping Centre, Philippi.',
    description_enriched_at = datetime('now')
WHERE slug = 'dunns-philippi-shopping-centre-philippi' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Jet is a discount clothing, footwear and homeware retailer, with a branch trading from Delft Mall, Delft.',
    description_enriched_at = datetime('now')
WHERE slug = 'jet-delft-mall-delft' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'McDonald''s is a fast-food restaurant chain, with a branch trading from Lansdowne Corner Shopping Centre, Lansdowne.',
    description_enriched_at = datetime('now')
WHERE slug = 'mcdonalds-lansdowne-corner-lansdowne' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mohammed''s Meat Hyper is a halal-certified butcher and meat retailer on Lansdowne Road, Lansdowne.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.waze.com/live-map/directions/za/wc/cape-town/mohameds-meat-hyper", "https://www.cylex.net.za/company/mohammed''s-meat-hyper-23708910.html", "https://www.thinklocal.co.za/biz/mohammeds-meat-hyper-cape-town", "https://www.zabihah.com/restaurants/c9f49460-7767-11ef-95ae-6045bdeb9f57/mohammeds-meat-hyper-cape-town-western-cape"]'
WHERE slug = 'mohammeds-meat-hyper-lansdowne' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Nedbank''s Philippi branch is a full-service bank, trading from The Junxion Mall.',
    description_enriched_at = datetime('now')
WHERE slug = 'nedbank-the-junxion-mall-philippi' AND description_enriched_at IS NULL;
