UPDATE businesses
SET description = 'A1 Supermarket is a grocery store on Devenish Street in Polokwane Central, stocking everyday groceries and fresh produce for the surrounding neighbourhood.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:30-17:00, Sat-Sun 07:30-14:00'
WHERE slug = 'a1-supermarket-polokwane-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Alpha Kwekery is a plant nursery in Bendor that grows and sells vegetable seedlings, including tomatoes, peppers, cabbage, spinach and beetroot, for both retail and bulk orders.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.thinklocal.co.za/biz/alpha-kwekery-polokwane", "https://www.callupcontact.com/b/business/Alpha_Kwekery/62183", "https://www.brabys.com/za/limpopo/polokwane/bendor/nursery/alpha-nursery"]'
WHERE slug = 'alpha-kwekery-bendor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Callsave is a security and telecommunications provider in Bendor, installing CCTV systems for homes and businesses alongside cost-saving telephone and internet services.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://callsave.co.za/contact-us/", "http://www.mapknows.co.za/polokwane/callsave-15892/", "https://www.facebook.com/CallSave/"]'
WHERE slug = 'callsave-bendor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Cash Converters Polokwane CBD is a second-hand goods and pawnbroking store on the corner of Thabo Mbeki and Schoeman Streets, buying and selling used electronics, tools and other items.',
    description_enriched_at = datetime('now')
WHERE slug = 'cash-converters-polokwane-cbd-polokwane-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Dr MM Chokoe is a general practice in Bendor Park offering GP consultations and primary healthcare services.',
    description_enriched_at = datetime('now')
WHERE slug = 'dr-mm-chokoe-bendor-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Nnete Lethuba Attorneys, Conveyancers & Notaries is a law firm in Polokwane Central offering conveyancing, notarial and general legal services.',
    description_enriched_at = datetime('now')
WHERE slug = 'nnete-lethuba-attorneys-polokwane-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Spar Polokwane CBD is a supermarket on Biccard Street in Polokwane Central, offering groceries, fresh produce and everyday essentials to the CBD.',
    description_enriched_at = datetime('now')
WHERE slug = 'spar-polokwane-cbd-polokwane-central' AND description_enriched_at IS NULL;
