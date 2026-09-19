UPDATE businesses
SET description = 'Old Khaki is a South African casual-lifestyle clothing brand offering relaxed, durable clothing, footwear and accessories for men and women, from everyday essentials to outdoor-ready pieces, at its Mall of the North branch.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://mallofthenorth.co.za/stores/", "https://www.tiendeo.co.za/stores/polokwane/old-khaki", "https://www.oldkhaki.co.za/home.html"]'
WHERE slug = 'old-khaki-mall-of-the-north-bendor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Old Mutual is a pan-African financial services group, established in Cape Town in 1845 as South Africa''s first mutual life insurer, offering life assurance, investment, wealth and short-term insurance products at its Mall of the North branch.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://mallofthenorth.co.za/stores/", "https://mycityinfo.co.za/places/south-africa/limpopo/polokwane/finance/old-mutual-bank-mall-of-the-north/", "https://www.facebook.com/OldMutualPolokwaneMallOfTheNorth/", "https://www.oldmutual.co.za/about"]'
WHERE slug = 'old-mutual-bendor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PEP is South Africa''s largest single-brand retailer, founded in 1965 and offering affordable clothing, footwear and homeware; this branch trades inside Savannah Mall.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://savannahmall.co.za/shop/79/", "https://www.facebook.com/PEPPolokwaneSavannahMall/", "https://en.wikipedia.org/wiki/Pep_(South_Africa)"]'
WHERE slug = 'pep-savannah-mall-fauna-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PEP is South Africa''s largest single-brand retailer, founded in 1965 and offering affordable clothing, footwear and homeware; this branch trades inside Mall of the North.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://mallofthenorth.co.za/stores/", "https://www.shopshours.co.za/pep-stores/polokwane/c-57f3ca0347d677c3b27aacca", "https://my-catalogue.co.za/stores/polokwane/pep-stores/mall-of-the-north-cnr-r81-n1-national-road", "https://en.wikipedia.org/wiki/Pep_(South_Africa)"]'
WHERE slug = 'pep-bendor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PEP Home is the homeware arm of PEP, South Africa''s largest single-brand retailer, selling affordable kitchen, bedroom, bathroom and lifestyle products; this branch trades inside Savannah Mall.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://savannahmall.co.za/shops/", "https://www.tiendeo.co.za/stores/polokwane/pep-home-shop-savannah-mall-corner-thabo-mbeki-grimm-street/71325", "https://www.pepstores.com/collections/home"]'
WHERE slug = 'pep-home-savannah-mall-fauna-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PEP Home is the homeware arm of PEP, South Africa''s largest single-brand retailer, selling affordable kitchen, bedroom, bathroom and lifestyle products; this branch trades inside Mall of the North.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://mallofthenorth.co.za/stores/", "https://www.tiendeo.co.za/stores/polokwane/pep-home", "https://www.pepstores.com/collections/home"]'
WHERE slug = 'pep-home-mall-of-the-north-bendor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PEPPS Ga-Ledwaba Primary School is a primary school in Lebowakgomo offering Early Childhood Development, Foundation Phase and Intermediate Phase education, run under the PEPPS network of Limpopo schools founded in 1998 and operating from its own purpose-built campus since 2016.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://pepps.co.za/contact-us/", "https://homeappliancerepairs.co.za/5424222591238691960/", "https://www.citizen.co.za/review-online/news-headlines/2016/04/28/pepps-lebowakgomo-gets-own-building/"]'
WHERE slug = 'pepps-ga-ledwaba-primary-school-lebowakgomo' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PNA is a South African stationery, art and craft, and educational-books retailer founded in 1992 with over 140 stores nationwide; this branch trades inside Savannah Mall.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://savannahmall.co.za/shops/", "https://www.yep.co.za/biz/store/pna-savannah/322277", "https://www.pna.co.za/about-us/"]'
WHERE slug = 'pna-savannah-mall-fauna-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pest Control Hygiene and Cleaning is a Flora Park-based pest control and cleaning company with 25 years'' experience, offering termite proofing, insect and rodent treatment, and general cleaning services including carpets, floors and offices.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.aiyellow.com/pestcontrolhygieneandcleaning/?lang=it", "https://pchcpolokwane.business.site/", "https://www.facebook.com/PestControlHygieneandCleaning/"]'
WHERE slug = 'pest-control-hygiene-and-cleaning-flora-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pick ''n Pay Liquor is the dedicated liquor retail format of the Pick n Pay Group, founded in 1967, stocking beer, spirits and wine; this branch trades inside Savannah Mall.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://savannahmall.co.za/shop/pick-n-pay-liquor/", "https://www.shopshours.co.za/pick-n-pay-liquor/polokwane/c-57f3ca1147d677c3b27af499", "https://en.wikipedia.org/wiki/Pick_n_Pay"]'
WHERE slug = 'pick-n-pay-liquor-savannah-mall-fauna-park' AND description_enriched_at IS NULL;
