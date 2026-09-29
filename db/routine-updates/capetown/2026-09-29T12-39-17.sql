UPDATE businesses
SET description = 'Jamaica Me Crazy is a Caribbean grillhouse on Roodebloem Road in Woodstock, serving Caribbean-inspired dishes with a South African twist and a reputation built over more than 15 years in the neighbourhood.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 11:00-23:00, Sun 12:00-22:00',
    source_urls = '["https://www.jamaicamecrazy.co.za/", "https://www.thinklocal.co.za/biz/jamaica-me-crazy-woodstock", "https://www.tripadvisor.com/Restaurant_Review-g6776544-d2629691-Reviews-Jamaica_Me_Crazy-Woodstock_Western_Cape.html", "https://www.myguidecapetown.com/restaurants/jamaica-me-crazy-caribbean-restaurant"]'
WHERE slug = 'jamaica-me-crazy-woodstock' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Kind Regards is a restaurant and bar in Observatory blending Indian and Portuguese influences, with a seasonally changing menu that includes ribs, pizza and butter chicken alongside live music.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://vymaps.com/ZA/Kind-Regards-CPT-664032377393890/", "https://www.facebook.com/p/Kind-Regards-Obz-100086205529254/", "http://www.findglocal.com/ZA/Cape-Town/664023184061476/Kind-Regards-CPT", "https://wanderlog.com/place/details/11039893/kind-regards"]'
WHERE slug = 'kind-regards-observatory' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Roamwork is a coworking space on the upper floors of The Harrington building in Zonnebloem, offering private offices, dedicated desks and hot-desking alongside meeting rooms and a members'' cafe, open since 2018.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://za.polomap.com/cape-town/159185", "https://www.wesgro.co.za/long-stay/work/roam-work-cape-town", "https://www.office-hub.com/za/buildings/the-harrington-zonnebloem-wc-a363m000001WwT6AAK"]'
WHERE slug = 'roamwork-zonnebloem' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Salisburys is a delicatessen and wine shop on Roodebloem Road in Woodstock, serving deli fare, coffee and a curated selection of wines.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:30-20:00, Sat 08:00-18:00, Sun 08:00-16:00',
    source_urls = '["https://www.salisburys.co.za/", "https://www.eatout.co.za/venue/salisburys-deli-wineshop/", "https://www.tripadvisor.com/Restaurant_Review-g312659-d4570154-Reviews-Salisburys_Deli_and_Wineshop-Cape_Town_Central_Western_Cape.html", "https://www.dining-out.co.za/md/Salisburys-Deli-and-Coffee-Shop/4464"]'
WHERE slug = 'salisburys-woodstock' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sticky BBQ is a ribs specialist on Station Road in Observatory, known for ribs slow-cooked for hours, marinated overnight and finished with a sticky barbecue glaze, with hours running late into the night.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 12:00-01:00, Fri-Sat 12:00-02:00, Sun 12:00-00:00',
    source_urls = '["https://foursquare.com/v/sticky-fingers-bbq/4c0693e48a81c9b673ed2590", "https://www.eatout.co.za/venue/sticky-fingers/", "https://www.tripadvisor.com/Restaurant_Review-g312659-d3601120-Reviews-Sticky_BBQ_Observatory-Cape_Town_Central_Western_Cape.html", "https://stickybbq.com/"]'
WHERE slug = 'sticky-bbq-observatory' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Swan Cafe is a Parisian-style creperie on the corner of Buitenkant and Barrack Street in Zonnebloem, serving sweet crepes and savoury buckwheat galettes alongside a curated tea selection, with vegan and gluten-free options.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 08:30-16:00, Sun 09:00-14:00',
    source_urls = '["https://swancafe.co.za/", "https://www.eatout.co.za/venue/swan-cafe/", "https://www.capetownmagazine.com/swan-cafe"]'
WHERE slug = 'swan-cafe-zonnebloem' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Vintage with Love is a secondhand and vintage clothing store in Zonnebloem, offering pre-loved fashion and accessories as part of a sustainable-fashion retail concept.',
    description_enriched_at = datetime('now')
WHERE slug = 'vintage-with-love-zonnebloem' AND description_enriched_at IS NULL;
