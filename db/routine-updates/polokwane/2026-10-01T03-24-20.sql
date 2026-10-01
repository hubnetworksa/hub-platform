UPDATE businesses
SET description = 'Aesthetico is a medical aesthetic clinic at The Eye Centre in Hospital Park, offering treatments such as anti-wrinkle injections, dermal fillers, mesotherapy, chemical peels, dermapen needling and IPL laser treatments alongside beauty therapy services.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://aesthetico.co.za/contact-us-2/", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=350992", "https://www.aestheticappointment.co.za/2016/10/clinic-profile-aesthetico-medical-aesthetic-clinic.html"]'
WHERE slug = 'aesthetico-hospark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Bosman Attorneys is a law firm in Hospital Park with over 20 years of experience, handling criminal law, civil litigation, family law and legal costs matters, including bail applications and estate planning.',
    description_enriched_at = datetime('now')
WHERE slug = 'bosman-attorneys-hospark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Dr L.R. Monare''s practice is a urology clinic in Hospital Park admitting patients at Mediclinic Limpopo, with a focus on sexual dysfunction and related urological conditions.',
    description_enriched_at = datetime('now')
WHERE slug = 'dr-lr-monare-hospark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'EMB Makelaars, trading as Marianne Makelaars, is an insurance brokerage in Hospital Park offering life, short-term and long-term insurance along with estate planning services.',
    description_enriched_at = datetime('now')
WHERE slug = 'emb-makelaars-ta-marianne-makelaars-hospark' AND description_enriched_at IS NULL;
