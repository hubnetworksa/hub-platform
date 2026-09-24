-- Job 4: description enrichment sweep, batch 1 of 2 (10 of 12 backlog records)
UPDATE businesses
SET description = 'Checkers is a full-line supermarket in Westlake Shopping Centre, Westlake, stocking groceries, fresh produce and household goods, with an in-store liquor section on site.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 08:00-20:00',
    source_urls = '["https://www.tiendeo.co.za/stores/cape-town/checkers-shop-westlake-lifestyle-centre-westlake-drive/49412", "https://my-catalogue.co.za/stores/cape-town/checkers/shop-1-westlake-lifestyle-centre-westlake", "https://www.westlakeshoppingcentre.co.za/trading"]'
WHERE slug = 'checkers-westlake' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Edgars is a department store and one of Longbeach Mall''s four anchor tenants in Noordhoek, selling clothing, footwear and homeware.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.ayoba.com/business/EdgarsLongbeachMall", "https://www.sayellow.com/view/south-africa/edgars-long-beach-mall-in-cape-town", "https://www.noordhoektourism.co.za/longbeach-mall/"]'
WHERE slug = 'edgars-noordhoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Food Lover''s Market at Longbeach Mall in Noordhoek is a fresh-food supermarket with a butchery, seafood counter and deli, alongside a wide fruit and vegetable selection.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-18:30, Sat 08:00-17:00, Sun 08:00-16:00',
    source_urls = '["https://longbeachmall.co.za/stores/food-lovers-market/", "https://za.africabz.com/western-cape/food-lovers-market-longbeach-mall-1474", "https://foodloversmarket.co.za/stores/western-cape/food-lovers-market-long-beach-mall/"]'
WHERE slug = 'food-lovers-market-noordhoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Michigan Spur at Longbeach Mall in Noordhoek is a family-friendly steakhouse serving flame-grilled steaks, ribs and burgers, with breakfast, lunch, dinner and takeaway options.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 09:00-20:00',
    source_urls = '["https://longbeachmall.co.za/stores/michigan-spur/", "https://www.callupcontact.com/b/Restaurants/Michigan_Spur/6449086", "https://eatapp.co.za/restaurant/michigan-spur-longbeach-mall-noordhoek/"]'
WHERE slug = 'michigan-spur-noordhoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pick n Pay Hypermarket is a large-format supermarket and one of Longbeach Mall''s anchor tenants in Noordhoek, Cape Town.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://longbeachmall.co.za/stores/pick-n-pay/", "https://za.africabz.com/western-cape/pick-n-pay-longbeach-mall-31880", "https://www.noordhoektourism.co.za/longbeach-mall/"]'
WHERE slug = 'pick-n-pay-noordhoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sonnekus Boutique Hotel & Bistro is a 10-room boutique hotel in St James with mountain and sea views, an on-site bistro serving breakfast and lunch daily, and a small spa.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.sonnekus.co.za/", "https://www.lekkeslaap.co.za/accommodation/sonnekus-boutique-hotel--bistro", "https://whatsonincapetown.com/sonnekus-by-ideas-cartel-in-st-james/", "https://www.hotels.com/ho349624/sonnekus-guest-house-cape-town-south-africa/"]'
WHERE slug = 'sonnekus-boutique-hotel-bistro-st-james' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Spec-Savers at Longbeach Mall in Noordhoek has provided optometry services since 2001, offering eye examinations, eyewear and contact lens fittings from two on-site optometrists.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-17:30, Sat 09:00-14:00, Sun Closed',
    source_urls = '["https://longbeachmall.co.za/stores/spec-savers/", "https://za.africabz.com/western-cape/spec-savers-longbeach-mall-38853", "https://www.specsavers.co.za/store/longbeach-mall"]'
WHERE slug = 'spec-savers-noordhoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Standard Bank operates a branch inside Longbeach Mall, Noordhoek, offering everyday banking services.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-15:30, Sat 08:30-11:00'
WHERE slug = 'standard-bank-noordhoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Cafe and Deli at Harry Goemans, in Sunnydale, is a bakery and deli-style cafe serving all-day breakfasts and light lunches such as burgers, nachos and fresh garden salads.',
    description_enriched_at = datetime('now'),
    hours = 'Mon 08:30-15:30, Tue-Sun 08:30-17:00'
WHERE slug = 'cafe-and-deli-at-harry-goemans-sunnydale' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Value Co at Longbeach Mall in Noordhoek is a large general dealer store selling home decor, homeware, beauty products, jewellery and DIY items across multiple departments.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 09:00-17:30, Sun 09:00-16:00',
    source_urls = '["https://longbeachmall.co.za/stores/value-co/", "https://za.africabz.com/western-cape/value-co-longbeach-mall-487009", "https://valueco.co.za/store/value-co-longbeach-mall/"]'
WHERE slug = 'value-co-noordhoek' AND description_enriched_at IS NULL;
