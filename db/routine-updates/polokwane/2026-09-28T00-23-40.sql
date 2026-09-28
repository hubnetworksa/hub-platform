UPDATE businesses
SET description = 'JR Electrical is an electrical contracting business in Polokwane Central offering general electrician services, with hourly rates and an emergency call-out service for urgent work.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.facebook.com/jrelectrical.stazaworx/", "https://jrelectrical.com/contact/", "https://www.procompare.co.za/providers/jr-electrical"]'
WHERE slug = 'jr-electrical-polokwane-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mamashela Funeral Directors & Tombstone is a funeral home in Polokwane Central providing burial, cremation and memorial services, funeral planning, and tombstones.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.yep.co.za/biz/store/mamashela-funerals/254779", "https://www.brabys.com/za/limpopo/polokwane/undertakers-funeral-directors/mamashela-funeral-directors-tombstone", "https://www.procompare.co.za/providers/mamashela-funeral-directors-tombstone"]'
WHERE slug = 'mamashela-funeral-directors-tombstone-polokwane-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pietersburg Funeral Supplies is a casket and coffin manufacturer and supplier in Polokwane Central, with a showroom displaying its range of caskets, coffins and other funeral supplies; its caskets are sold wholesale to registered undertakers rather than directly to the public.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.thinklocal.co.za/biz/pietersburg-funeral-supplies-polokwane", "https://www.brabys.com/za/limpopo/polokwane/undertakers-funeral-directors/pietersburg-funeral-supplies", "https://www.procompare.co.za/providers/pietersburg-funeral-supplies-1"]'
WHERE slug = 'pietersburg-funeral-supplies-polokwane-central' AND description_enriched_at IS NULL;
