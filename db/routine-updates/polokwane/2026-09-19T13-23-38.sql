UPDATE businesses
SET description = 'A gynaecology and obstetrics practice at the Medical Centre on Burger Street, Hospital Park, offering specialist consultations and obstetric care.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat-Sun Closed',
    source_urls = '["https://www.medicalnetwork.co.za/Profile/36907/Dr-Jacobus-Stephanus-Van-Heerden", "https://www.yep.co.za/biz/store/kamfer-wj-van-heerden-js-drs/440516", "https://www.brabys.com/za/limpopo/polokwane/gynaecologists/dr-jsk-van-heerden"]'
WHERE slug = 'dr-jsk-van-heerden-hospark' AND description_enriched_at IS NULL;
