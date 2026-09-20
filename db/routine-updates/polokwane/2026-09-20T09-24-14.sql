UPDATE businesses
SET description = 'This Hospital Park ophthalmology practice offers a full range of eye care, including cataract surgery, glaucoma management, laser eye surgery and retinal surgery.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://za.polomap.com/polokwane/10100", "https://www.brabys.com/za/limpopo/polokwane/ophthalmologist/dr-jh-weyer", "https://meditrader.co.za/dr-j-h-weyer-ophthalmologist-polokwane-limpopo"]'
WHERE slug = 'dr-j-h-weyer-hospark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'This is the provincial head office of the Limpopo Department of Health, based in Fidel Castro Ruz House on College Street, Hospital Park, coordinating health services across the province.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.govpage.co.za/limpopo-department-of-health.html", "https://www.waze.com/live-map/directions/limpopo-department-of-health-college-ave-18-hospital-park,-polokwane", "https://en.wikipedia.org/wiki/List_of_things_named_after_Fidel_Castro"]'
WHERE slug = 'limpopo-department-of-health-hospark' AND description_enriched_at IS NULL;
