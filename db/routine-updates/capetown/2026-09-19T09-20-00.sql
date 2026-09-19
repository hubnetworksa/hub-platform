UPDATE businesses
SET description = 'Bardelli''s is an Italian pizzeria and restaurant in Kenilworth, serving pizzas, pasta and steaks since 1992.',
    description_enriched_at = datetime('now')
WHERE slug = 'bardellis-kenilworth' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Bergvliet Dental & Medical is a multi-practitioner dental and medical practice in Bergvliet, offering dentistry, oral hygiene and occupational therapy services under one roof.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat 08:00-13:00, Sun Closed',
    source_urls = '["https://www.facebook.com/Bergvlietdms/", "https://textmap.co.za/3/16413", "https://bergvlietdms.com/"]'
WHERE slug = 'bergvliet-dental-medical-bergvliet' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Block & Chisel''s Diep River branch is a furniture and homeware showroom offering timeless, quality-crafted pieces for the home.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-17:00, Sat 09:00-14:00, Sun Closed'
WHERE slug = 'block-and-chisel-diep-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Bootlegger Coffee Company''s Tokai branch is an all-day cafe at Forest Glade House on Tokai Road, serving breakfast through dinner alongside an after-dark tapas and cocktail menu.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 06:30-21:00, Sat-Sun 07:00-21:00'
WHERE slug = 'bootlegger-coffee-company-tokai' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Bootlegger Coffee Company''s Three Anchor Bay branch, at 257 Main Road, is an all-day cafe serving breakfast, lunch and brunch seven days a week, with an after-dark tapas and cocktail menu.',
    description_enriched_at = datetime('now')
WHERE slug = 'bootlegger-three-anchor-bay' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Capitec Bank''s Mowbray branch on Main Road provides everyday retail banking services, including account transactions, savings, loans and card services, to the local community.',
    description_enriched_at = datetime('now')
WHERE slug = 'capitec-bank-mowbray-mowbray' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Cash Converters Tokai is a secondhand goods store in Kirstenhof, buying and selling pre-loved electronics such as TVs among its range of stock.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.cashconverters.co.za/store/tokai/", "https://www.cybo.com/ZA-biz/cash-converters-tokai_1r", "https://www.facebook.com/CashConvertersTokai/posts/cash-converters-tokai-has-a-wide-range-of-pre-loved-tvs-for-more-information-cal/806021001324038/"]'
WHERE slug = 'cash-converters-tokai-kirstenhof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Chicken Licken''s Mowbray branch on Main Road serves the chain''s fried chicken, burgers and sides for eat-in, takeaway and delivery.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 09:00-22:00, Fri-Sat 09:00-23:00, Sun 09:00-22:00'
WHERE slug = 'chicken-licken-mowbray-mowbray' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Clicks Pharmacy at 3 Arts Village is a pharmacy and health, beauty and personal-care store located within the shopping centre on Main Road, Plumstead.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-19:00, Sat 08:00-17:00, Sun 09:00-15:00'
WHERE slug = 'clicks-plumstead' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Delightful Patience Hair Studio is an Afro-centric hair and beauty studio in Mowbray offering weaves, braids, nails and make-up services.',
    description_enriched_at = datetime('now')
WHERE slug = 'delightful-patience-hair-studio-mowbray' AND description_enriched_at IS NULL;
