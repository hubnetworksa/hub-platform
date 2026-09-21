UPDATE businesses
SET description = 'Body Life Activity Zone is a health and fitness club in Bendor offering gym facilities plus functional training, boxing and HIIT classes, part of the Body Life chain with multiple branches across Polokwane.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 05:00-20:00, Fri 05:00-19:00, Sat 06:00-11:00, Sun Closed',
    source_urls = '["https://www.cybo.com/ZA-biz/bodylife-bendor", "https://za.polomap.com/polokwane/3145", "https://za.polomap.com/polokwane/16150"]'
WHERE slug = 'body-life-activity-zone-bendor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Crystal Coffee Shop on Marshall Street hosts bridal and baby showers, small weddings and functions and business lunches, and offers custom cakes alongside an on-site hair and beauty salon.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.brabys.com/za/limpopo/polokwane/coffee-shops/crystal-coffee-shop", "https://www.searchinafrica.com/business/6155557/south-africa/limpopo/polokwane/marshall-st/coffee-shops/crystal-coffee-shop", "https://www.facebook.com/p/Crystal-Coffee-Shop-100063594938093/"]'
WHERE slug = 'crystal-coffee-shop-polokwane-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Dada''s World of Hardware on Genl Joubert Street stocks hardware, building materials, plumbing, electrical and DIY supplies, describing itself as one of the biggest such retailers in the area.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 08:00-21:00',
    source_urls = '["https://za.near-place.com/dadas-world-of-hardware-73-genl-joubert-street-polokwane-central-polokwane", "https://za.africabz.com/limpopo/dadas-world-of-hardware-104065", "https://www.dadasworld.co.za/"]'
WHERE slug = 'dadas-world-of-hardware-polokwane-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Eva Clothing on Market Street sells women''s dresses and traditional wear in a range of sizes, with an online store and nationwide courier delivery.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://m.facebook.com/110831611046729/photos/a.112051054258118/112060614257162/?type=3", "https://www.instagram.com/p/DR4Yz9pCFv-/", "https://evaclothing1.myshopify.com"]'
WHERE slug = 'eva-clothing-polokwane-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Favour Guest House offers self-catering, ground-floor guest rooms near the N1 with kitchenettes and private bathrooms, plus a garden, outdoor fireplace, free WiFi and on-site parking.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.booking.com/hotel/za/favour-guest-house.html", "https://www.hotel.com.au/polokwane/favour-guest-house.htm", "https://www.facebook.com/p/Favour-Guest-house-100092665327960/"]'
WHERE slug = 'favour-guest-house-penina-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'FNB Seshego Circle is a First National Bank branch offering banking and investment services, located inside Seshego Circle Shopping Centre in Seshego.',
    description_enriched_at = datetime('now')
WHERE slug = 'fnb-seshego-circle-seshego' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'LIPCO - Law For All is a branch of South Africa''s largest legal mediation company, founded in 1993, offering legal advice, legal insurance, mediation and litigation support from its Landdros Mare Street office in Polokwane Central.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 08:00-16:30, Fri 08:00-16:00, Sat-Sun Closed',
    source_urls = '["https://za.polomap.com/polokwane/5310", "https://readymap.co.za/188/4248", "https://www.lawforall.co.za/contact-us"]'
WHERE slug = 'lipco-law-for-all-polokwane-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mavuna & Netshimbupfe Inc is a 100% black women-owned law firm established in 2020, offering conveyancing, notarial and litigation services alongside general legal advisory from its Bodenstein Street office.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.mavnetshlaw.co.za/contact/", "https://www.attorneys.co.za/CompanyHomePage.asp?CompanyID=1720", "https://za.linkedin.com/company/mavuna-netshimbupfe-inc"]'
WHERE slug = 'mavuna-netshimbupfe-inc-polokwane-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PEP Cell is a cellphone accessories and electronics store, part of the PEP retail group, located in Seshego Circle Shopping Centre.',
    description_enriched_at = datetime('now')
WHERE slug = 'pep-cell-seshego-circle-seshego' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PEP is a national value retailer selling affordable clothing, footwear and homeware, trading from Shop 8 in Seshego Circle Shopping Centre.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat 08:00-15:00, Sun 09:00-13:00',
    source_urls = '["https://za.polomap.com/polokwane/2950", "https://dir.alltrack.org/view/398403-2-pep", "https://www.tiendeo.co.za/stores/polokwane/pep-stores-shop-seshego-circle-ditlou-street-polokwane-limpopo/69833"]'
WHERE slug = 'pep-seshego-circle-seshego' AND description_enriched_at IS NULL;
