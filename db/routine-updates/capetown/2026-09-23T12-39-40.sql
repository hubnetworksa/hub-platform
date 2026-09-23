-- Job 4: description enrichment sweep -- 8 businesses (full backlog this run)

UPDATE businesses
SET description = 'Bargain Books Bayside Mall is a discount bookstore inside Bayside Mall in Table View, stocking a wide range of books, stationery and gifts.',
    description_enriched_at = datetime('now')
WHERE slug = 'bargain-books-bayside-mall-table-view' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Hair D''Rosa is a hair salon in Table View offering hair extensions, balayage, colouring, keratin treatments and other hair services.',
    description_enriched_at = datetime('now'),
    hours = 'Tue-Fri 09:00-18:00, Sat 09:00-14:00, Sun-Mon Closed'
WHERE slug = 'hair-drosa-table-view' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Highlands Primary School is a public primary school in Woodlands, Mitchells Plain, first opened in 1975 with 23 learners and grown since to more than 800 learners and around 28 educators.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-14:15',
    source_urls = '["https://www.brabys.com/za/western-cape/mitchells-plain/woodlands/primary-school/highlands-primary-school", "https://www.africanadvice.com/1372585/Schools/Western_Cape/Highlands_Primary_School/", "https://www.school-register.co.za/school/highlands-primary-school/"]'
WHERE slug = 'highlands-primary-school-woodlands' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mugg & Bean Bayside Mall is a branch of the Mugg & Bean restaurant chain in Table View, serving coffee, breakfast and light meals.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 07:00-19:00, Sun 07:00-17:00',
    source_urls = '["https://themugg.com/mugg_stores/Bayside-Mall/", "https://www.tripadvisor.com/Restaurant_Review-g2427200-d10084479-Reviews-Mugg_Bean_Bayside_Mall-Table_View_Western_Cape.html", "https://locations.muggandbean.co.za/restaurants-BaysideMall-MuggBeanBaysideMall/"]'
WHERE slug = 'mugg-and-bean-bayside-mall-table-view' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Vida e Caffe Bayside Mall is a branch of the vida e caffe chain in Table View, serving espresso-based coffee and light meals.',
    description_enriched_at = datetime('now')
WHERE slug = 'vida-e-caffe-bayside-mall-table-view' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Vortex Factory Shop is a cleaning products factory outlet in Wetton, stocking a wide range of household, kitchen, laundry and car-care cleaning products.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 08:30-16:45, Fri 08:30-16:30, Sat 08:30-13:00, Sun Closed'
WHERE slug = 'vortex-factory-shop-wetton' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Woodlands Secondary School is a public, no-fee high school in Woodlands, Mitchells Plain, built in 1978 as one of the area''s oldest schools and now serving more than 1,100 learners.',
    description_enriched_at = datetime('now')
WHERE slug = 'woodlands-secondary-school-woodlands' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Woodville Primary School is a public, no-fee primary school in Woodlands, Mitchells Plain, founded in 1978 and specialising in maths, science and technology, with more than 1,100 learners enrolled.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.thinklocal.co.za/biz/woodville-primary-school-woodlands", "https://pathfinda.com/en/mitchells-plain/woodlands/shops-services/woodville-primary-school", "https://www.schoolguide.co.za/schools/ordinary-schools/woodville-primary-school.html"]'
WHERE slug = 'woodville-primary-school-woodlands' AND description_enriched_at IS NULL;
