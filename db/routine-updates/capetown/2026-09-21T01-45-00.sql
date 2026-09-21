UPDATE businesses
SET description = 'Kommetjie Surf Shop (Komsurf) is a big-wave, cold-water surf shop on Erika Road offering surf, skate and lifestyle gear, surf lessons and board rentals, plus its own Komsurf apparel and an in-house coffee shop.',
    description_enriched_at = datetime('now')
WHERE slug = 'kommetjie-surf-shop-kommetjie' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Lekker Dite is a Halaal restaurant on Dennegeur Avenue in Strandfontein known for its Roti Gatsby and Village Chicken Burger, alongside burgers, pizzas and pizza pies.',
    description_enriched_at = datetime('now'),
    hours = 'Mon 10:30-21:00, Tue Closed, Wed-Thu 10:30-21:00, Fri-Sat 10:30-23:00, Sun 10:30-20:00'
WHERE slug = 'lekker-dite-strandfontein' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Markham at Westgate Mall is a men''s fashion store offering on-trend jeanswear, smartwear, footwear, accessories and gadgets, part of Markham''s Southern Africa-wide retail chain.',
    description_enriched_at = datetime('now')
WHERE slug = 'markham-westgate-mall-westgate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Melkbos Hardware is a hardware and building-materials store on 6th Avenue in Melkbosstrand, trading since 1978 and stocking a wide range of hardware and building supplies with a focus on personal service.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:30-18:00, Sat 07:30-14:00, Sun Closed'
WHERE slug = 'melkbos-hardware-melkbosstrand' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Melkbos Kitchen is a bistro-style restaurant on the Melkbosstrand beachfront, open since 2017, serving sushi, burgers and a frequently changing seasonal menu alongside sea views and an extensive wine and gin selection.',
    description_enriched_at = datetime('now')
WHERE slug = 'melkbos-kitchen-melkbosstrand' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'MoKsh Indian Restaurant at The Paddocks Shopping Centre serves authentic North Indian cuisine, including clay-oven dishes and curries, with child-friendly dining and takeaway options.',
    description_enriched_at = datetime('now'),
    hours = 'Mon 16:00-21:00, Tue-Thu 12:00-21:00, Fri-Sat 12:00-21:30, Sun 12:00-18:30'
WHERE slug = 'moksh-indian-restaurant-milnerton' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mr Cheap Transport is a furniture and household removals company established in 2008, also offering business removals, storage, vehicle hire and courier services on national routes.',
    description_enriched_at = datetime('now')
WHERE slug = 'mr-cheap-transport-killarney-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mr Price at Westgate Mall is a fashion and homeware retail store in Mitchells Plain, part of the Mr Price clothing chain.',
    description_enriched_at = datetime('now')
WHERE slug = 'mr-price-westgate-mall-westgate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Nedbank Table Bay Mall is a bank branch inside Table Bay Mall in Bloubergstrand, offering everyday banking services to shoppers and residents in the Blouberg area.',
    description_enriched_at = datetime('now')
WHERE slug = 'nedbank-table-bay-mall-bloubergstrand' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Noordhoek Veterinary Clinic is an appointment-based veterinary practice on Main Road in Noordhoek providing general veterinary care to the area.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:40-12:40 & 15:00-17:40, Sat 09:00-13:00, Sun 11:00-13:00',
    source_urls = '["https://za.africabz.com/western-cape/noordhoek-veterinary-clinic-179250", "https://www.brabys.com/za/western-cape/cape-town/noordhoek/veterinary-clinics/noordhoek-veterinary-clinic", "https://www.noordhoekvet.com/"]'
WHERE slug = 'noordhoek-veterinary-clinic-noordhoek' AND description_enriched_at IS NULL;
