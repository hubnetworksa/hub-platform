UPDATE businesses
SET description = 'Groot Constantia is South Africa''s oldest wine-producing estate, founded in 1685 and now a national monument, offering wine tastings, cellar tours and vineyard visits in Constantia.',
    description_enriched_at = datetime('now'),
    hours = 'Daily 10:00-17:00',
    source_urls = '["https://grootconstantia.co.za/contact-us/", "https://constantiawineroute.com/groot-constantia/", "https://en.wikipedia.org/wiki/Groot_Constantia"]'
WHERE slug = 'groot-constantia-constantia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'H&M is an international fashion retailer with a branch in Victoria Wharf Shopping Centre at the V&A Waterfront, stocking clothing and homeware for women, men and children.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 09:00-21:00',
    source_urls = '["https://www.hm.com/za/store-locator/south-africa/cape-town/victoria-alfred-waterfront/", "https://www.alamy.com/hm-storedress-shopfashion-retail-shop-retailer-in-africa-in-victoria-wharf-shopping-centre-or-mall-in-the-va-waterfront-cape-town-south-africa-image333482402.html", "https://www.waterfront.co.za/stores/hm/"]'
WHERE slug = 'hm-va-waterfront' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'HCI (Hosken Consolidated Investments) is a diversified investment holding company with interests spanning media and broadcasting, gaming, transport, property and coal mining, with a registered office in The Point, Sea Point.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://thepointmall.co.za/", "https://www.hci.co.za/contact-us/", "https://en.wikipedia.org/wiki/Hosken_Consolidated_Investments"]'
WHERE slug = 'hci-sea-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Hair Studio Rondebosch is a hair salon on 4th Avenue offering styling, colouring, balayage, keratin treatments, extensions and braiding.',
    description_enriched_at = datetime('now'),
    hours = 'Mon Closed, Tue-Fri 08:30-18:00, Sat 08:30-16:00, Sun Closed',
    source_urls = '["https://www.fresha.com/lp/en/bt/hair-salons/in/za-cape-town/rondebosch-east", "https://za.africabz.com/western-cape/hair-studio-59047", "https://www.fresha.com/lvp/hair-studio-rondebosch-hair-styling-hair-colour-vital-keratin-balayage-brazilian-kqXbvG"]'
WHERE slug = 'hair-studio-rondebosch-east' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Hard Rock Cafe Cape Town is a themed restaurant in The Promenade, Camps Bay, serving an all-day menu of burgers and American-style dishes amid music memorabilia, with views over the Atlantic Ocean.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 07:00-18:00, Fri-Sat 07:00-23:00, Sun 07:30-22:00',
    source_urls = '["https://www.tripadvisor.com/Restaurant_Review-g312659-d12865556-Reviews-Hard_Rock_Cafe_Camps_Bay-Cape_Town_Central_Western_Cape.html", "https://www.capetownetc.com/dine/rocking-hard-camps-bay/", "https://cafe.hardrock.com/cape-town/"]'
WHERE slug = 'hard-rock-cafe-cape-town-camps-bay' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Hartlief Gourmet is a German-style deli in Gardens Shopping Centre, stocking Black Forest ham, a range of salamis and German sausages, plus coffee, sandwiches and baked goods to eat in or take away.',
    description_enriched_at = datetime('now'),
    hours = 'Mon 09:00-19:00, Tue-Fri 08:00-19:00, Sat 08:00-17:00, Sun & Public Holidays 09:00-14:00',
    source_urls = '["https://hartlief.co.za/visit-us/gardens-deli", "https://za.africabz.com/western-cape/hartlief-deli-gardens-8384", "https://www.gardensshoppingcentre.co.za/stores/hartlief-deli/"]'
WHERE slug = 'hartlief-gourmet-gardens-shopping-centre-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Healthpoint is a general practice on the 3rd floor of The Point in Sea Point, offering family medicine, an aesthetics clinic, travel medicine and vaccinations, and radiography.',
    description_enriched_at = datetime('now')
WHERE slug = 'healthpoint-sea-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Hello Indigo Halo is a crystal and gift shop in The Old Biscuit Mill, stocking raw and polished crystals, jewellery, tarot cards, incense and other esoteric supplies.',
    description_enriched_at = datetime('now')
WHERE slug = 'hello-indigo-halo-woodstock' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Heroes is a fashion and clothing store in Golden Acre Shopping Centre, in the heart of Cape Town''s CBD.',
    description_enriched_at = datetime('now')
WHERE slug = 'heroes-cape-town-cbd' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'High Street Lingerie is a lingerie boutique in Cape Quarter Lifestyle Village, De Waterkant, stocking intimate apparel from brands including KAAL by Roxy Louw, Victoria''s Secret and DKNY.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://capequarter.co.za/shops/", "https://www.highstreetshopping.co.za/pages/about-us", "https://www.highstreetshopping.co.za/collections/underwear/lingerie-cape-town"]'
WHERE slug = 'high-street-lingerie-de-waterkant' AND description_enriched_at IS NULL;
