UPDATE businesses
SET description = 'Mens Clinic International''s Polokwane branch, based in Library Gardens, is part of a national men''s sexual health clinic network, offering diagnosis and treatment for erectile dysfunction, premature ejaculation, low libido and male infertility, plus confidential counselling and personalised treatment plans.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat 08:00-13:00',
    source_urls = '["https://www.brabys.com/za/limpopo/polokwane/moregloed/clinics/mens-clinic-international", "https://yellpo.com/countries/south-africa/cities/limpopo/items/mens-clinic-international-polokwane", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=119339"]'
WHERE slug = 'mens-clinic-international-polokwane-central' AND description_enriched_at IS NULL;
