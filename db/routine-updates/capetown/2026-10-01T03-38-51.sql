UPDATE businesses
SET description = 'Maya''s Hardware is a one-stop hardware store in Thembokwezi Square, Mandalay, stocking hardware materials, LPG gas, DIY tools, and a full range of paint, plumbing, electrical, and garden supplies.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.facebook.com/mayashardwarelithapark/", "https://mayashardware.co.za/contact-us/", "https://mayashardware.co.za/"]'
WHERE slug = 'mayas-hardware-mandalay' AND description_enriched_at IS NULL;
