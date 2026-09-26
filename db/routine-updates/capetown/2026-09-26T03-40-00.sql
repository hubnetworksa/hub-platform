UPDATE businesses
SET description = 'Debonairs Pizza Mandalay is a pizza delivery and takeaway branch of the national Debonairs Pizza chain, based in Mandalay Mall, Khayelitsha.',
    description_enriched_at = datetime('now')
WHERE slug = 'debonairs-pizza-mandalay-mandalay' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Dr R Lalloo is a dental practice in the Charlesville Mall complex in Matroosfontein, offering general dentistry including preventive, cosmetic and restorative treatment.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 10:00-18:00, Sat 10:00-13:00, Sun Closed',
    source_urls = '["https://www.brabys.com/za/western-cape/bonteheuwel/charlesville/dentists/dr-r-lalloo", "https://www.searchinafrica.com/business/5816671/south-africa/western-cape/bonteheuwel/charlesville/valhalla-dve/dentists/dental-surgeons/dr-r-lalloo", "https://www.africanadvice.com/1248821/Dentists/Western_Cape/Dr_R_Lalloo/", "https://www.recomed.co.za/dentist/cape-town/ro-lalloo/16728/22757/"]'
WHERE slug = 'dr-r-lalloo-matroosfontein' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'KFC Mandalay is a fast-food restaurant branch of the national fried-chicken chain, located in Mandalay Mall, Khayelitsha, serving dine-in, takeaway and delivery.',
    description_enriched_at = datetime('now')
WHERE slug = 'kfc-mandalay-mandalay' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mdzananda Animal Clinic is a veterinary-council-registered non-profit clinic founded in 1996, providing low-cost and subsidised veterinary care, sterilisation and pet-health education to the Khayelitsha community, and running mobile clinics into the wider area.',
    description_enriched_at = datetime('now'),
    hours = 'Mon/Wed/Fri 08:00-16:00, Tue/Thu 09:00-16:00, Sat 08:00-12:30, Sun Closed',
    source_urls = '["https://mdzananda.co.za/contact/", "https://www.africabizinfo.com/ZA/mdzananda-animal-clinic-082-251-0554", "https://petworld.co.za/blogs/care/the-mdzananda-animal-clinic-a-beacon-of-hope-in-khayelitsha"]'
WHERE slug = 'mdzananda-animal-clinic-mandela-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PEP Mandalay is a branch of the national PEP clothing, footwear and homeware retail chain, in Mandalay Mall, Khayelitsha.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:30-17:30, Sat 09:00-14:00, Sun 09:00-13:00'
WHERE slug = 'pep-mandalay-mandalay' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Shoprite Charlesville is a branch of the Shoprite supermarket chain, anchoring Charlesville Mall in Matroosfontein.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 08:00-20:00'
WHERE slug = 'shoprite-charlesville-matroosfontein' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Shoprite LiquorShop Mandalay is a liquor store branch of the Shoprite group, in Mandalay Mall, Khayelitsha.',
    description_enriched_at = datetime('now'),
    hours = 'Mon 09:00-17:00, Tue 08:00-18:00, Wed 08:00-17:00, Thu-Sun 10:00-18:00'
WHERE slug = 'shoprite-liquorshop-mandalay-mandalay' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tops Mandela Park is a liquor store attached to the Spar supermarket at Khaya Corner in Mandela Park, Khayelitsha.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 09:00-18:00, Sun Closed'
WHERE slug = 'tops-mandela-park-mandela-park' AND description_enriched_at IS NULL;
