UPDATE businesses
SET description = 'PSG Wealth Polokwane Ismini Park is a financial advisory branch offering wealth planning, employee benefits, and personal and commercial insurance advice from its Ismini Office Park office in Bendor.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-16:30',
    source_urls = '["https://www.psg.co.za/branch-office/polokwane-ismini-park-johan-van-ravesteyn", "https://south-africa.worldplaces.me/view-place/75911841-psg-wealth-polokwane-ismini-park-gerhard-mare.html", "https://advisers.psg.co.za/branch-office/polokwane-ismini-park-gerhard-mare"]'
WHERE slug = 'psg-wealth-polokwane-ismini-park-bendor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'ZUCH Accommodation at Pafuri offers self-catering apartments, villas and cabins with air-conditioning, private bathrooms, a swimming pool and secure parking, close to attractions such as the Pietersburg Snake & Reptile Park and Peter Mokaba Stadium.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.lekkeslaap.co.za/accommodation/zuch-accommodation-at-pafuri", "https://zuchaccommodation.co.za/", "https://www.safarinow.com/go/zuch-accommodation-at-pafuri-self-catering/"]'
WHERE slug = 'zuch-accommodation-at-pafuri-penina-park' AND description_enriched_at IS NULL;
