-- Job 4: description enrichment sweep, checkpoint 1 of 2 (records 1-10)
UPDATE businesses
SET description = 'Ackermans is a fashion and homeware retail chain store operating a branch inside Longbeach Mall in Noordhoek.',
    description_enriched_at = datetime('now')
WHERE slug = 'ackermans-noordhoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Attorneys West & Rossouw is a Noordhoek-based law firm of attorneys, notaries and conveyancers, with branch offices in Simon''s Town, Paarl and Strand, specialising in property law, family law, estate planning and administration, and commercial law.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.southafricanlawyer.co.za/law-firm/attorneys-west-rossouw/noordhoek/", "https://attorneyswr.co.za/", "https://www.attorneys.co.za/CompanyHomePage.asp?CompanyID=559"]'
WHERE slug = 'attorneys-west-rossouw-noordhoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Cape Dutch Gardens is a nursery and garden centre in the Noordhoek Garden Emporium, stocking plants, trees, seeds, pots, irrigation supplies, garden tools, pavers and stone, with a growing focus on vegetable seedlings, herbs and soil mediums.',
    description_enriched_at = datetime('now')
WHERE slug = 'cape-dutch-gardens-noordhoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Caroline''s Health & Beauty is a spa in Noordhoek Farm Village established in 2002, offering facials, body massage, manicures, pedicures, reflexology and waxing treatments in private treatment rooms, and stocking Esse and Skin Creamery skincare products.',
    description_enriched_at = datetime('now')
WHERE slug = 'carolines-health-and-beauty-noordhoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Clicks Longbeach Mall is a pharmacy and health, beauty and homeware store branch inside Longbeach Mall in Noordhoek, offering a pharmacy dispensary alongside health, beauty and household products.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-17:00, Sat 08:00-17:00, Sun 09:00-15:00',
    source_urls = '["https://longbeachmall.co.za/stores/clicks/", "https://clicks.co.za/store/Long-Beach-Mall/148", "https://my-catalogue.co.za/stores/cape-town/clicks/long-beach-mall-cnr-buller-louw-drive-sunnydale-roads-milkwood-park-noordhoek"]'
WHERE slug = 'clicks-longbeach-mall-noordhoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Damhuis Restaurant (Die Damhuis) is a seafood and South African cuisine restaurant on the Melkbosstrand beachfront, recommending advance bookings for its regular sittings.',
    description_enriched_at = datetime('now'),
    hours = 'Tue-Sun 09:00-23:00, Mon Closed',
    source_urls = '["https://www.diedamhuis.co.za/contact/", "https://www.tripadvisor.com/Restaurant_Review-g667022-d2535230-Reviews-or75-Damhuis_Restaurant-Melkbosstrand_Western_Cape.html", "https://www.diedamhuis.co.za/"]'
WHERE slug = 'damhuis-restaurant-melkbosstrand' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Equibox is an equestrian supplies shop in Noordhoek Farm Village, stocking riding apparel and tack from brands including Harry''s Horse, Shires Equestrian, Imperial Riding, HV Polo and Premier Equine UK.',
    description_enriched_at = datetime('now'),
    hours = 'Open daily 09:00-17:00'
WHERE slug = 'equibox-noordhoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'FaithJuice is a small raw juice bar in Noordhoek Farm Village, serving fresh pressed juices, smoothies, smoothie bowls, warm oats and juice cleanses since 2015, with an emphasis on sustainable practices such as reusable glass jars and compostable straws.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://faithjuice.co.za/contact/", "https://thefarmvillage.co.za/faithjuice/", "https://faithjuice.co.za/about/"]'
WHERE slug = 'faithjuice-noordhoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Foschini is a fashion clothing retail chain store operating a branch inside Longbeach Mall in Noordhoek.',
    description_enriched_at = datetime('now')
WHERE slug = 'foschini-noordhoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Greeff Christie''s International Real Estate operates an estate agency office in Noordhoek Farm Village''s Milking Shed, part of a Cape Town property agency founded in 2001 and affiliated with Christie''s International Real Estate for global property marketing.',
    description_enriched_at = datetime('now')
WHERE slug = 'greeff-christies-international-real-estate-noordhoek' AND description_enriched_at IS NULL;
