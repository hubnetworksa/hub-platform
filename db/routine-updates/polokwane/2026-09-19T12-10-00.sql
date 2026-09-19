UPDATE businesses
SET description = 'mobiFix at Mall of the North is a branch of the South African smart-device repair franchise network, offering same-day repairs for phones, tablets, laptops and Apple products.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://mallofthenorth.co.za/stores/", "https://www.mobifixsa.com/stores/polokwane/", "https://www.safranchisebrands.co.za/listing/mobifix/"]'
WHERE slug = 'mobifix-bendor' AND description_enriched_at IS NULL;
