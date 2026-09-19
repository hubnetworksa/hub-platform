-- Job 4: description enrichment sweep (batch of 3 -- full backlog for this run)

UPDATE businesses
SET description = 'Hi-Q Polokwane Ladine is a tyre and autocare centre in Bendor Park offering wheel alignment, wheel balancing, tyre rotation, puncture repairs and battery sales, part of the national Hi-Q tyre and autocare chain.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:30-18:00, Sat 07:30-13:00, Sun Closed',
    source_urls = '["https://www.tiendeo.co.za/stores/polokwane/hi-q-silicon-street/25713", "https://www.yep.co.za/biz/store/iyp/10006588_1", "https://www.facebook.com/hiqladine/", "https://hiq.co.za/store-locator/limpopo/hi-q-tyres-&-autocare-polokwane-ladine"]'
WHERE slug = 'hi-q-polokwane-ladine-bendor-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Proforum Limpopo Accountants is an accounting and auditing practice in Bendor, part of the national Proforum group, founded in 1999 and offering accounting, auditing and business advisory services.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.yellosa.co.za/company/735030/proforum-limpopo-rekenmeesters", "https://www.yellowpages.net/phone,27-152960523,Accountant,Polokwane,ZA383312.html", "https://thecoregroup.associates/proforum/"]'
WHERE slug = 'proforum-limpopo-accountants-bendor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Trevor''s Haven Preschool, Creche & Aftercare is a childcare centre in Bendor caring for children from three months old through to age five, with aftercare, overnight stays and babysitting services also offered.',
    description_enriched_at = datetime('now')
WHERE slug = 'trevors-haven-preschool-bendor' AND description_enriched_at IS NULL;
