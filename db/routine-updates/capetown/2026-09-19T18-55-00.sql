UPDATE businesses
SET description = 'Pirates Steakhouse and Pub is a long-hours steakhouse and sports pub on Main Road, Plumstead, serving a full menu until 2am and pizzas until 5am, with a pub menu of burgers, toasted sandwiches and chips available around the clock.',
    description_enriched_at = datetime('now'),
    hours = 'Open 24 hours'
WHERE slug = 'pirates-steakhouse-and-pub-plumstead' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Platinum Hospitality Holdings is a hotel asset management company overseeing a portfolio of hotels across South Africa, operating from an office at The Point in Sea Point.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://thepointmall.co.za/merchant/platinum-hospitality-holdings/", "https://phholdings.co.za/contact/", "https://phholdings.co.za/hotel-portfolio/"]'
WHERE slug = 'platinum-hospitality-holdings-sea-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pixel Place Copy and Print in Kenridge offers printing on paper, board, photo and canvas plus mug printing, alongside lamination, binding, copying, typing, and business cards and flyers.',
    description_enriched_at = datetime('now')
WHERE slug = 'pixel-place-copy-and-print-kenridge' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Plush Bazaar at The Old Biscuit Mill in Woodstock is a curated retail and prop-hire shop specialising in eclectic antique and vintage-style furnishings, mixing French-country and Victorian pieces.',
    description_enriched_at = datetime('now')
WHERE slug = 'plush-bazaar-woodstock' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Poetry is a women''s fashion boutique inside Victoria Wharf at the V&A Waterfront, selling clothing, footwear, accessories, bath and body products and homewares in a "country chic" style, with some merchandise sourced from India and Morocco alongside local design.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.shopshours.co.za/poetry/cape-town", "https://www.tiendeo.co.za/stores/cape-town/poetry", "https://www.waterfront.co.za/stores/poetry"]'
WHERE slug = 'poetry-va-waterfront' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PostNet in Cape Quarter is a branch of the national printing, courier and mailbox-services franchise, trading inside the Cape Quarter Lifestyle Village in De Waterkant.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:30, Sat 09:00-13:00, Sun Closed'
WHERE slug = 'postnet-cape-quarter-de-waterkant' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PostNet in Gardens Shopping Centre is a branch of the national printing, courier and mailbox-services franchise, offering printing from A6 to A0, litho print-on-demand, and domestic and international courier services.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 09:00-17:00, Sun 09:00-14:00'
WHERE slug = 'postnet-gardens-shopping-centre-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PostNet Riverlands is a branch of the national printing, courier and mailbox-services franchise, trading inside Riverlands Mall in Observatory and offering copy, print, mailing and DHL service-point facilities.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 09:00-17:00, Sun 09:00-17:00'
WHERE slug = 'postnet-riverlands-observatory' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Queen''s Hair Beauty in Golden Acre is a hair and beauty salon offering wig installation, wig making, makeup and nail-care services.',
    description_enriched_at = datetime('now')
WHERE slug = 'queens-hair-beauty-golden-acre-cape-town-cbd' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'RSAWEB is an internet service provider offering fibre and other internet access, cloud and hosting solutions, with an office at The Point in Sea Point.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://thepointmall.co.za/", "https://shop.rsaweb.co.za/business-contact-us/", "https://craft.co/rsaweb"]'
WHERE slug = 'rsaweb-sea-point' AND description_enriched_at IS NULL;
