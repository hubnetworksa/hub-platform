UPDATE businesses
SET description = 'Rondebosch Veterinary Hospital is a fully equipped small-animal veterinary hospital offering general consultations, preventive care, diagnostics, treatments and surgical procedures, backed by an ongoing staff continuing-education programme.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-12:00 & 15:00-18:00, Sat 09:00-11:30',
    source_urls = '["https://rondeboschvet.com/contact/", "https://savet.co.za/vet/rondebosch-veterinary-hospital", "https://rondeboschvet.com/", "https://opening-hours.co.za/01331374/Rondebosch_Veterinary_Hospital"]'
WHERE slug = 'rondebosch-veterinary-hospital-rondebosch' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Pantry is an artisan bakery and coffee shop in Rondebosch with a quick-counter concept focused on freshly baked goods and coffee.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 06:30-17:00, Sat 07:30-15:00, Sun 07:30-14:00',
    source_urls = '["https://za.africabz.com/western-cape/the-pantry-311513", "https://www.facebook.com/thepantryrondebosch/", "https://thepantrysa.co.za/"]'
WHERE slug = 'the-pantry-rondebosch' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Van Schaik Bookstore is a branch of the national academic and general bookstore chain, located inside Riverside Mall in Rondebosch and stocking textbooks, stationery and general reading titles.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 08:30-17:00, Fri 09:00-17:00, Sat 09:00-13:00, Sun Closed',
    source_urls = '["https://www.yellosa.co.za/company/426485/van-schaik-bookstore-rondebosch", "https://za.africabz.com/western-cape/van-schaik-bookstore-rondebosch-84178", "https://riversidemall.co.za/store/van-schaik-bookstore/"]'
WHERE slug = 'van-schaik-bookstore-rondebosch' AND description_enriched_at IS NULL;
