UPDATE businesses
SET description = 'Living Hope runs a 22-bed health care centre on its Capri campus in Fish Hoek, the only facility of its kind in the Southern Peninsula, alongside a wound-dressing clinic and home-based care services. The centre supports people affected by HIV/AIDS and other chronic illnesses through prevention, care and treatment programmes, combined with community development work in education and social support.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.livinghope.co.za/contact-us/", "https://www.yep.co.za/biz/store/living-hope/218685", "https://www.livinghope.co.za/ministries/healthcare/health-care-centre/"]'
WHERE slug = 'living-hope-capri-village' AND description_enriched_at IS NULL;
