UPDATE businesses
SET description = 'Eagle Clothing is a South African plus-size fashion retailer with a store in Mall of the North, Bendor, stocking men''s and women''s shirts, jeans and accessories in sizes up to 10XL.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://mallofthenorth.co.za/stores/", "https://www.eagleclothing.co.za/pages/stores-listing", "https://www.facebook.com/EagleClothingSA/photos/2695224860613158/", "https://www.eagleclothing.co.za/pages/about"]'
WHERE slug = 'eagle-clothing-bendor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'FILA is a global sportswear brand, owned by South Korea''s Misto Holdings, with a store in Mall of the North, Bendor, selling performance and lifestyle footwear, apparel and accessories.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://mallofthenorth.co.za/stores/", "https://www.facebook.com/Fila.RSA/posts/321942940547339/", "https://fila.co.za/"]'
WHERE slug = 'fila-bendor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'FNB (First National Bank), one of South Africa''s big-four banks and part of the FirstRand group, operates a branch at Savannah Mall, Fauna Park, offering personal and business banking, loans and investment services.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 09:00-17:00, Sun 09:00-15:00',
    source_urls = '["https://savannahmall.co.za/shops/", "https://www.cylex.net.za/company/fnb-savannah-23842229.html", "https://za.polomap.com/polokwane/14700"]'
WHERE slug = 'fnb-bank-savannah-mall-fauna-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'FNB (First National Bank), part of the FirstRand group and one of South Africa''s big-four banks, operates a full-service branch in Mall of the North, Bendor, offering personal and business banking, loans and investment services.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://mallofthenorth.co.za/stores/", "https://mycityinfo.co.za/places/south-africa/limpopo/polokwane/finance/fnb-mall-of-the-north/", "https://www.fnb.co.za/downloads/savingInvestments/Polokwane.PDF"]'
WHERE slug = 'fnb-bendor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Foto First is a South African photographic printing franchise, represented in all nine provinces, with a store in Mall of the North, Bendor, offering photo prints, digital printing and photographic equipment using Fujifilm lab technology.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://mallofthenorth.co.za/stores/", "https://fotofirst.co.za/store-locator/", "https://fotofirst.co.za/"]'
WHERE slug = 'foto-first-bendor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Freedom of Movement is a South African lifestyle brand, founded in Stellenbosch in 2013, with a store in Mall of the North, Bendor, selling apparel, footwear and leather goods including bags, sneakers and vellies.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://mallofthenorth.co.za/stores/", "https://www.freedomofmovement.co.za/pages/fom-mall-of-the-north", "https://www.freedomofmovement.co.za/"]'
WHERE slug = 'freedom-of-movement-bendor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'G-Star RAW is a Dutch denim brand founded in Amsterdam in 1989, with a store in Mall of the North, Bendor, specialising in raw, unwashed denim jeans along with jackets and shirts.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://mallofthenorth.co.za/stores/", "https://www.g-star.com/en_sg/stores/za/g-star-raw---mall-of-the-north", "https://bash.com/store/g-star-raw-mall-of-the-north-polokwane-limpopo-0699/029298", "https://en.wikipedia.org/wiki/G-Star_(company)"]'
WHERE slug = 'g-star-raw-bendor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'H&M is a Swedish multinational fashion retailer with a store in Mall of the North, Bendor, offering affordable, on-trend clothing and accessories for women, men, teenagers and children.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://mallofthenorth.co.za/stores/", "https://www.hm.com/za/store-locator/south-africa/polokwane/mall-of-the-north/", "https://en.wikipedia.org/wiki/H%26M"]'
WHERE slug = 'hm-mall-of-the-north-bendor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Hi-Fi Corp is a South African electronics retailer with a store in Mall of the North, Bendor, selling TVs, home appliances, smartphones and other consumer electronics at discounted prices.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://mallofthenorth.co.za/stores/", "https://www.hificorp.co.za/storelocator/store/index/id/1297", "https://reviewonline.co.za/522740/mall-of-the-north-welcomes-hifi-corporation/", "https://www.yep.co.za/biz/store/hi-fi-corporation/622959"]'
WHERE slug = 'hi-fi-corp-bendor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Identity is a South African fashion retailer, part of the Truworths International group and trading since 1999, with a store in Mall of the North, Bendor, offering on-trend clothing, footwear and accessories for young shoppers.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://mallofthenorth.co.za/stores/", "https://www.tiendeo.co.za/stores/polokwane/identity", "https://capegatecentre.co.za/shop/identity"]'
WHERE slug = 'identity-mall-of-the-north-bendor' AND description_enriched_at IS NULL;
