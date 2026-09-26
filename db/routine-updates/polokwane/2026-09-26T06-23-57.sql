UPDATE businesses
SET description = 'Smart BnB is a guesthouse in Mankweng offering private, secure self-catering rooms (each with a kettle, fridge, TV and free toiletries) and a terrace, located next to Paledi Mall close to the University of Limpopo and Mankweng Hospital.',
    description_enriched_at = datetime('now')
WHERE slug = 'smart-bnb-mankweng' AND description_enriched_at IS NULL;
