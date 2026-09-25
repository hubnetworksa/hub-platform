UPDATE businesses
SET description = 'Jacky''s Chinese Restaurant is a Chinese and sushi buffet and takeaway restaurant in Bothasig Square, serving dishes such as kung pao chicken, sweet and sour pork and chow mein alongside sushi rolls.',
    description_enriched_at = datetime('now'),
    hours = 'Open daily 11:00-21:00',
    source_urls = '["https://www.facebook.com/p/Jackys-Chinese-Restaurant-100066840572784/", "https://www.dining-out.co.za/md-menu/Jackys-Chinese-Restaurant/6373", "https://restaurants-in-cape-town.co.za/restaurants/jackys-chinese-restaurant/"]'
WHERE slug = 'jackys-chinese-restaurant-bothasig' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SA Dairy Factory Shop is a factory outlet supplying dairy and other food and beverage products at retail and wholesale prices from its store in Boston, Bellville.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-17:00, Sat 09:00-14:00, Sun Closed'
WHERE slug = 'sa-dairy-factory-shop-boston' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Vida e Caffe is a South African cafe franchise, founded in 2001 and inspired by Portuguese espresso bars, serving coffee and light food from its outlet in Edgemead Village Centre.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.facebook.com/EdgemeadVillageCentre/", "https://za.africabz.com/western-cape/vida-e-caffe-edgemead-village-445093", "https://en.wikipedia.org/wiki/Vida_e_Caff%C3%A8"]'
WHERE slug = 'vida-e-caffe-edgemead' AND description_enriched_at IS NULL;
