UPDATE businesses
SET description = '3@1 Thornhill is a branch of the 3@1 Business Centre franchise inside Thornhill Shopping Centre, offering printing, copying, scanning, binding and courier services for businesses and individuals.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://3at1companyregistration.co.za/locate-a-store/", "https://www.facebook.com/3at1thornhill/", "https://3at1polokwane.co.za/"]'
WHERE slug = '3-1-thornhill-thornhill-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = '77 On Burger is a self-catering guesthouse in Hospital Park offering a fully equipped three-bedroom, two-bathroom apartment with WiFi, air-conditioning and a private kitchen.',
    description_enriched_at = datetime('now')
WHERE slug = '77-on-burger-hospark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'BMW Polokwane is an authorised BMW dealership operated by Legacy Motor Group in Baobab Gardens, Thornhill, also housing the BMW Motorrad and MINI brands and serving as the only BMW dealership in Limpopo.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.bmw.co.za/en/retailers-pages/bmw_polokwane.html", "https://www.facebook.com/BMWPolokwane/", "https://dealerfloor.co.za/dealer-news/lmg-preparing-for-flagship-bmw-dealership-in-polokwane"]'
WHERE slug = 'bmw-polokwane-thornhill-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Eskulaap Hotel is a hotel and conference venue in Polokwane set on a hectare of landscaped gardens, with an on-site restaurant, swimming pool and conference facilities for up to 120 delegates.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.eskulaap.co.za/", "https://www.yellosa.co.za/company/168625/eskulaap-park", "https://www.tripadvisor.com/Hotel_Review-g312624-d1461911-Reviews-Eskulaap_Hotel-Polokwane_Limpopo_Province.html"]'
WHERE slug = 'eskulaap-hotel-polokwane-central' AND description_enriched_at IS NULL;
