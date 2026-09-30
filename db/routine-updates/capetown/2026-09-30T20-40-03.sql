-- Job 4: description enrichment sweep -- clears the entire current backlog (10 businesses)

UPDATE businesses
SET description = 'Bradlows is a furniture and appliance retailer inside The Junxion Mall in Philippi, part of a national chain with over 120 years in South African homes, stocking pieces for the kitchen, living room, dining room and bedroom.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.jamii.co.za/6977-philippi-furniture-store-bradlows-philippi-junxion-mall", "https://rsa.worldorgs.com/catalog/cape-town/furniture-store/bradlows-philippi-junction", "https://www.facebook.com/BradlowsPhilippi/"]'
WHERE slug = 'bradlows-the-junxion-mall-philippi' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Cashbuild Lansdowne Corner is a building materials and hardware retailer at Lansdowne Corner Shopping Centre, part of the national Cashbuild chain serving DIY and construction needs in the area.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:00-18:00, Sat 07:00-16:00, Sun 08:00-14:00'
WHERE slug = 'cashbuild-lansdowne-corner-lansdowne' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Caxton Books is a specialised bookseller and stationer on Imam Haron Road in Lansdowne, supplying books and stationery to schools and libraries across southern Africa alongside general retail stock.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:30-17:00, Sat 08:30-13:00, Sun Closed',
    source_urls = '["https://southafricafirm.com/western-cape/caxton-books-lansdowne-17918", "https://firmania.co.za/cape-town/caxton-books-lansdowne-87845", "https://caxtonbooks.co.za/"]'
WHERE slug = 'caxton-books-lansdowne' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Clicks Lansdowne Corner is a pharmacy and health, beauty and homeware retailer at Lansdowne Corner Shopping Centre, part of the national Clicks chain.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 09:00-17:00, Sun 09:00-14:00'
WHERE slug = 'clicks-lansdowne-corner-lansdowne' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Clothing Junction is a fashion and clothing retailer inside The Junxion Mall in Philippi, part of a national value-fashion chain.',
    description_enriched_at = datetime('now')
WHERE slug = 'clothing-junction-the-junxion-mall-philippi' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Cyster Medical is a general practice at Delft Mall, offering consultations and family medical care to the local community.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat-Sun Closed',
    source_urls = '["https://www.medpages.info/sf/index.php?page=organisation&orgcode=299191", "https://sabusinesslistings.co.za/listings/cyster-medical/", "https://www.recomed.co.za/general-practitioner/cape-town/lj-cyster/2098/1884/"]'
WHERE slug = 'cyster-medical-delft' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Delft Community Health Centre is a Western Cape Government primary healthcare facility offering extended-hour care, including X-ray services, emergency stabilisation, 24-hour maternity care, chronic medication, child health and family planning.',
    description_enriched_at = datetime('now'),
    hours = 'Open 24 hours',
    source_urls = '["https://www.medpages.info/sf/index.php?page=organisation&orgcode=110059", "https://d7.westerncape.gov.za/facility/delft-community-health-centre", "https://www.westerncape.gov.za/health-wellness/facility/delft-chc"]'
WHERE slug = 'delft-community-health-centre-delft' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Steers Delft Mall is a flame-grilled burgers, chicken and ribs takeaway outlet inside Delft Mall, part of the national Steers chain.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 08:30-21:00'
WHERE slug = 'steers-delft-mall-delft' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tekkie Town is a footwear retailer inside The Junxion Mall in Philippi, part of a national sneaker and shoe chain.',
    description_enriched_at = datetime('now')
WHERE slug = 'tekkie-town-the-junxion-mall-philippi' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Venue Company is a Muslim-owned, halaal-catered event venue on Imam Haron Road in Lansdowne, hosting functions such as weddings and other gatherings for up to around 200 guests, with catering, sound and DJ equipment, and on-site salaah facilities.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-venue-company-lansdowne' AND description_enriched_at IS NULL;
