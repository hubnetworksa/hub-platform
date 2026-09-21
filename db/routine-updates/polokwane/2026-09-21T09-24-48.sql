UPDATE businesses
SET description = 'Dr. M.B. Seopa Dental and Medical Aesthetics is a dental practice in Polokwane Central offering basic, cosmetic and specialised dentistry alongside medical aesthetic treatments.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.facebook.com/drmbseopa/", "https://seopadental.co.za/about-us/", "https://seopadental.co.za/services/"]'
WHERE slug = 'dr-m-b-seopa-dental-and-medical-aesthetics-polokwane-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mary-Jane Mphahlele Attorneys Inc is a full-service law firm in Polokwane Central handling deceased estate administration, insolvency, litigation and arbitration, divorce and family law, commercial law, debt collection, and personal injury and medical negligence matters.',
    description_enriched_at = datetime('now')
WHERE slug = 'mary-jane-mphahlele-attorneys-inc-polokwane-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Thomas Grobler Attorneys is a Polokwane Central law firm established in 1993, practising litigation in the Magistrate, High, Criminal and Labour Courts alongside debt collection, conveyancing, commercial law and deceased estate administration.',
    description_enriched_at = datetime('now')
WHERE slug = 'thomas-grobler-attorneys-polokwane-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tsebang Chartered Accountants & Auditors is a Bendor accounting firm providing accounting, audit, taxation and business advisory services to businesses, individuals, trusts and non-profit organisations.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.facebook.com/TsebangInc/", "http://www.tsebang.co.za/", "https://www.sayellow.com/view/south-africa/tsebang-chartered-accountants-and-auditors-in-polokwane", "https://www.procompare.co.za/providers/tsebang-incorporated"]'
WHERE slug = 'tsebang-chartered-accountants-auditors-bendor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Van Der Walt Attorneys is a Bendor law firm providing legal services including family law and contract law matters.',
    description_enriched_at = datetime('now')
WHERE slug = 'van-der-walt-attorneys-bendor' AND description_enriched_at IS NULL;
