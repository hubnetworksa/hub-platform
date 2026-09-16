UPDATE businesses
SET description = 'Cathedral of the Sacred Heart is a Roman Catholic cathedral on Biccard Street, built between 1895 and 1897 as one of the earliest churches established in Polokwane (then Pietersburg), and serves as the seat of the Diocese of Polokwane.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://polokwanediocese.org.za/priests-and-parishes/", "https://gcatholic.org/churches/africa/4018", "https://sahistory.org.za/place/roman-catholic-church-polokwane", "https://polokwanediocese.org.za/cathedral-of-the-sacred-heart/"]'
WHERE slug = 'cathedral-of-the-sacred-heart-polokwane-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Christ Church Cathedral is the seat of the Anglican Diocese of St Mark the Evangelist and the only Anglican church in Polokwane, with a congregation dating back over a century to the town''s early days as Pietersburg; the present church on Biccard Street celebrated its Diamond Jubilee in 1957.',
    description_enriched_at = datetime('now')
WHERE slug = 'christ-church-cathedral-polokwane-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wesley Methodist Church is a Methodist congregation on Biccard Street, part of the Wesley Polokwane Ysterberg Circuit.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.gospelplaces.com/limpopo/polokwane/wesley-methodist-church", "https://www.facebook.com/polokwanemeth/", "http://www.church.net.za/societies/690"]'
WHERE slug = 'wesley-methodist-church-polokwane-central' AND description_enriched_at IS NULL;
