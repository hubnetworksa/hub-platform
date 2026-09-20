UPDATE businesses
SET description = 'The Crazy Store in Edgemead Village Centre is a variety and homeware retailer in Edgemead, trading seven days a week including Sunday hours.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:30-18:00, Sat 08:30-17:00, Sun 09:00-15:00'
WHERE slug = 'the-crazy-store-edgemead' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Crazy Store in Welgemoed Forum is a variety and homeware store in Welgemoed, offering a range of household, gift and stationery items.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-crazy-store-welgemoed' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Crazy Store at Erica Square is a variety and homeware retailer in Belhar, trading seven days a week including Sunday hours.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 09:00-15:00, Sun 09:00-14:00'
WHERE slug = 'the-crazy-store-erica-square-belhar' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Crazy Store at Richmond Corner is a variety and homeware store in Richwood, Milnerton, offering a range of household, gift and stationery items.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-crazy-store-richmond-corner-richwood' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Dentist on Main is an established dental practice in Rondebosch, in the area for over 15 years, offering preventative dentistry, scaling and polishing, root canal therapy, crowns, digital X-rays and tooth whitening.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-13:00, 14:00-17:00, Sat 08:00-12:00, Sun Closed',
    source_urls = '["https://www.dentistonmain.co.za/contact/", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=207211", "https://www.dentistonmain.co.za/about/"]'
WHERE slug = 'the-dentist-on-main-rondebosch' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Eatery at Antrim House is a bistro-style restaurant in Three Anchor Bay offering an eclectic menu of risotto, catch of the day, pork belly and rack of lamb, with vegan, vegetarian and gluten-free options, open daily.',
    description_enriched_at = datetime('now'),
    hours = 'Daily 07:30-20:30'
WHERE slug = 'the-eatery-at-antrim-house-three-anchor-bay' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Fix in Golden Acre Shopping Centre is a fashion brand under the Foschini Group, formerly known as Fashion Express, offering women''s clothing, footwear and accessories including plus-size and sleepwear ranges, in Cape Town''s CBD.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-fix-cape-town-cbd' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Foodbarn Café & Tapas is a café in Noordhoek Farm Village, Noordhoek, serving breakfast, lunch and all-day snacks from 8am daily, with a tapas menu and wine pairings in the evening.',
    description_enriched_at = datetime('now'),
    hours = 'Daily from 08:00'
WHERE slug = 'the-foodbarn-cafe-and-tapas-noordhoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Glass & Bead Cabin at The Old Biscuit Mill is a bead and glassware store in Woodstock, selling beads, glass straws and handblown glass items, with in-store glass-blowing demonstrations, custom glass trophies and jewellery repairs.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-glass-bead-cabin-woodstock' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Good Food Cafe at Merrypak is a café in Ndabeni serving homemade breakfasts, lunches and snacks, including vegetarian and low-carb options, along with coffee, cakes and smoothies.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Tue 07:00-16:30, Wed-Fri 07:30-16:30, Sat 08:00-12:30, Sun Closed'
WHERE slug = 'the-good-food-cafe-ndabeni' AND description_enriched_at IS NULL;
