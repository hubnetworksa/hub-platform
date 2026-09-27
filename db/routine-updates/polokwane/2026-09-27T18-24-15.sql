UPDATE businesses
SET description = 'JR Electrical is an electrical contracting business in Polokwane Central that also takes on building construction and kitchen renovation work alongside its electrical installations and repairs.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.facebook.com/jrelectrical.stazaworx/", "https://jrelectrical.com/contact/", "https://www.procompare.co.za/providers/jr-electrical"]'
WHERE slug = 'jr-electrical-polokwane-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mamashela Funeral Directors & Tombstone is a funeral home in Polokwane Central offering burial and cremation arrangements, funeral planning, and tombstone and memorial services.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.yep.co.za/biz/store/mamashela-funerals/254779", "https://www.brabys.com/za/limpopo/polokwane/undertakers-funeral-directors/mamashela-funeral-directors-tombstone", "https://www.facebook.com/www.mamashelafuneraldirectorsandtombstone.co.za/services"]'
WHERE slug = 'mamashela-funeral-directors-tombstone-polokwane-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pietersburg Funeral Supplies is a funeral home in Polokwane Central with its own showroom of coffins, caskets and funeral supplies, designing and manufacturing caskets rather than only arranging services.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat-Sun Closed',
    source_urls = '["https://www.thinklocal.co.za/biz/pietersburg-funeral-supplies-polokwane", "https://www.brabys.com/za/limpopo/polokwane/undertakers-funeral-directors/pietersburg-funeral-supplies", "https://www.facebook.com/PietersburgFuneralSupplies/"]'
WHERE slug = 'pietersburg-funeral-supplies-polokwane-central' AND description_enriched_at IS NULL;
