UPDATE businesses
SET description = 'Inzame-Zabantu Community Health Clinic is a public primary health care facility in Browns Farm, Philippi, run by the Western Cape provincial government. It offers free curative, preventative and promotive care for patients aged 13 and up, including chronic disease checks, HIV and TB screening, and family planning services.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.westerncape.gov.za/facility/inzame-zabantu-community-health-clinic", "https://www.thinklocal.co.za/biz/inzame-zabantu-community-health-clinic-philippi", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=138717"]'
WHERE slug = 'inzame-zabantu-community-health-clinic-browns-farm' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mzamomhle Clinic is a public primary health care clinic on Sagwityi Road in Browns Farm, Philippi, part of the Nyanga Health District. It provides general healthcare services including child, women''s and men''s health, TB, HIV and STI care, and substance abuse support.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.capetown.gov.za/Family%20and%20home/see-all-city-facilities/our-service-facilities/Clinics%20and%20healthcare%20facilities/Mzamomhle%20Clinic", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=113301", "https://d7.westerncape.gov.za/facility/mzamomhle-clinic"]'
WHERE slug = 'mzamomhle-clinic-browns-farm' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'McDonald''s Blue Downs is a fast-food restaurant on Hindle Road offering drive-thru, takeaway and dine-in service, with air-conditioned seating and a play area for children.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.mcdonalds.co.za/location/mcdonalds-blue-downs", "https://www.tripadvisor.com/Restaurant_Review-g312659-d32995172-Reviews-Mcdonald_s_Blue_Downs-Cape_Town_Central_Western_Cape.html", "https://www.findmy.co.za/food/category-detail/mcdonalds-blue-downs/24516"]'
WHERE slug = 'mcdonalds-blue-downs' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'OK Furniture Blue Downs is a furniture and homeware store inside the Cavalier Centre on Hindle Road, Blue Downs, part of the OK Furniture retail chain.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 08:00-13:00, Sun 09:00-13:00',
    source_urls = '["https://www.okfurniture.co.za/blue-downs", "https://appliancerepair.co.za/places/ok-furniture-blue-downs/", "https://www.tiendeo.co.za/stores/cape-town/ok-furniture-shop-cavalier-centrehindle-road/220"]'
WHERE slug = 'ok-furniture-blue-downs' AND description_enriched_at IS NULL;
