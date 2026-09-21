-- Job 4: description enrichment sweep, batch 2 of 2 (records 11-20)
UPDATE businesses
SET description = 'PostNet Table View West Coast Village is a branch of the PostNet retail network inside West Coast Village in Bloubergstrand, offering printing, courier, stationery and other business support services.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-18:00, Sat 08:00-13:00, Sun/PH 09:30-13:00'
WHERE slug = 'postnet-table-view-west-coast-village-bloubergstrand' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'RHOG Engineering is a precision engineering workshop in Killarney Gardens specialising in machining and producing spares, along with the servicing and maintenance of factory machinery and equipment to keep client downtime to a minimum.',
    description_enriched_at = datetime('now')
WHERE slug = 'rhog-engineering-killarney-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rummage Preloved is a vintage and second-hand clothing store in the courtyard of Imhoff Farm, stocking a constantly changing collection of laundered, pressed and thoughtfully sourced pre-loved clothing and accessories, and accepting items on consignment.',
    description_enriched_at = datetime('now')
WHERE slug = 'rummage-preloved-kommetjie' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'S & H Optometrists, trading as Stephenson & Hodgkinson Optometrists, has provided eye care from The Arcade on Main Road, Fish Hoek for more than 25 years, with an on-site lens laboratory and diagnostic equipment for eye tests and spectacles.',
    description_enriched_at = datetime('now')
WHERE slug = 's-and-h-optometrists-fish-hoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SPAR Fish Hoek is a supermarket branch in the Valyland Centre on Recreation Road, Fish Hoek, offering groceries, fresh produce and everyday essentials to the surrounding community.',
    description_enriched_at = datetime('now')
WHERE slug = 'spar-fish-hoek-fish-hoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SafeTop is a hardware and DIY retailer in Pride Park, Wetton, founded in 1989 and stocking fasteners, power tool accessories, adhesive tapes, paint aerosols and hand tools, with its own manufacturing division producing fasteners such as drive nails and wall plugs.',
    description_enriched_at = datetime('now')
WHERE slug = 'safetop-wetton' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Salty Sea Dog is a Simon''s Town institution known for its fish and chips, serving casual seafood dishes from a waterfront jetty setting next to the South African Naval base and False Bay Yacht Club.',
    description_enriched_at = datetime('now')
WHERE slug = 'salty-sea-dog-simons-town' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Shoprite Dunoon anchors The Stables Shopping Centre on Potsdam Road, a centre serving Dunoon''s roughly 80,000 residents along with the surrounding industrial area, offering groceries and everyday essentials.',
    description_enriched_at = datetime('now')
WHERE slug = 'shoprite-dunoon-dunoon' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Shoprite Westridge is a supermarket anchoring Westridge Shopping Centre on Wespoort Drive, Mitchells Plain, with in-store bakery, meat market and deli counters alongside groceries and everyday essentials.',
    description_enriched_at = datetime('now'),
    hours = 'Mon 08:00-13:00, Tue-Sat 08:00-18:00, Sun 08:00-17:00'
WHERE slug = 'shoprite-westridge-westridge' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Strandfontein Post Office is a South African Post Office branch on the corner of Benguela Street and Wave Singel in Strandfontein, handling postal and counter services for the surrounding community.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Tue 08:00-17:00, Wed 08:30-16:30, Thu-Fri 08:00-17:00, Sat 08:00-13:00, Sun Closed'
WHERE slug = 'strandfontein-post-office-strandfontein' AND description_enriched_at IS NULL;
