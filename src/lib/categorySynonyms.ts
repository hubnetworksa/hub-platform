// Search/SEO keyword synonyms per category — informal terms, trade jargon,
// and near-synonyms real people type that don't literally appear in the
// formal category name (e.g. "junk removal" for Rubbish & Rubble Removal).
// Shared across all sites, same as categoryGroups.ts — purely additive,
// never changes a category's actual slug/name/URL. Used to:
//  - widen on-site search matching (search-index.json.ts / SearchBox.astro)
//  - enrich category page meta descriptions and on-page copy
//  - populate `keywords` in business/category JSON-LD structured data
//
// Owner should review/extend this over time as new phrasing turns up in
// search console queries — it's a hand-drafted starting list, not sourced
// from real query data yet.

export const CATEGORY_SYNONYMS: Record<string, string[]> = {
  accommodation: [
    'guesthouse', 'guest house', 'guesthouses', 'guest houses', 'bnb', 'b&b', "b&b's",
    'bed and breakfast', 'self-catering', 'self-catering accommodation', 'lodge', 'lodges',
    'backpackers', 'boutique hotel', 'overnight accommodation', 'places to stay', 'accommodation near me',
  ],
  accountants: ['accounting', 'accounting firm', 'auditor'],
  'agricultural-farming-supplies': ['farm supplies', 'farming equipment', 'agri supplies', 'feed store', 'animal feed'],
  'appliance-repairs': ['fridge repair', 'washing machine repair', 'stove repair', 'appliance technician', 'oven repair'],
  'attorneys-legal': ['lawyer', 'law firm', 'legal services', 'advocate', 'conveyancer', 'divorce lawyer'],
  'automotive-repairs': ['car repair', 'mechanic', 'auto repair', 'car service', 'engine repair'],
  bakeries: ['bakery', 'cakes', 'cake shop', 'custom cakes', 'pastries'],
  'banks-atms': ['bank', 'atm', 'cash machine', 'bank branch'],
  barbershops: ['barber', 'mens haircut', "men's hair salon", 'haircuts', 'fade'],
  'beauty-hair-salons': ['hair salon', 'hairdresser', 'nail salon', 'beauty parlour', 'hair stylist', 'nails'],
  'bookkeeping-services': ['bookkeeper', 'accounts', 'payroll services', 'bookkeeping'],
  'books-stationery': ['bookstore', 'stationery shop', 'office supplies', 'school stationery'],
  'borehole-water-services': ['borehole drilling', 'water tank installation', 'well drilling', 'jojo tank', 'borehole pump'],
  'building-construction': ['builder', 'building contractor', 'construction company', 'renovations', 'home builder'],
  'building-materials-timber-merchants': ['hardware wholesaler', 'timber yard', 'building supplies', 'cement supplier', 'sand and stone'],
  'business-consulting': ['management consultant', 'business advisor', 'strategy consultant'],
  butcheries: ['butchery', 'butcher', 'meat shop', 'biltong'],
  'car-dealerships': ['car dealer', 'used cars', 'new car sales', 'motor dealership', 'car sales'],
  'car-wash-detailing': ['car wash', 'valet', 'auto detailing', 'car cleaning'],
  catering: ['caterer', 'event catering', 'party food', 'catering services'],
  'churches-religious-organisations': ['church', 'mosque', 'temple', 'synagogue', 'place of worship'],
  'cleaning-services': ['cleaners', 'domestic cleaning', 'office cleaning', 'house cleaning', 'cleaning company'],
  'clinics-healthcare': ['clinic', 'medical centre', 'health centre', 'day clinic'],
  'commercial-property-office-space': ['office space to let', 'commercial property', 'office rental', 'warehouse to rent', 'shop to let'],
  'computer-it-services': ['computer repair', 'it support', 'laptop repair', 'tech support', 'network support'],
  'convenience-stores': ['spaza shop', 'corner shop', 'tuck shop'],
  dentists: ['dentist', 'dental practice', 'teeth', 'dental clinic'],
  'doctors-gps': ['doctor', 'gp', 'general practitioner', 'medical doctor', 'family doctor'],
  'driving-schools': ['driving lessons', "learner's licence", 'k53', 'drivers licence'],
  electricians: ['electrician', 'electrical contractor', 'wiring', 'electrical repairs'],
  'electronics-appliances': ['electronics shop', 'appliance store', 'tv shop', 'electronics store'],
  'engineering-surveying': ['engineer', 'land surveyor', 'civil engineer', 'structural engineer'],
  'estate-agents': ['real estate agent', 'property agent', 'realtor', 'houses for sale', 'property for sale'],
  'events-function-venues': ['function venue', 'wedding venue', 'conference venue', 'event hall', 'venue hire'],
  'fashion-clothing': ['clothing store', 'fashion shop', 'boutique', 'clothes shop'],
  'fencing-security-installations': ['fence installer', 'security gates', 'electric fencing', 'palisade fencing', 'razor wire'],
  'financial-investment-services': ['financial advisor', 'investment company', 'wealth management', 'financial planner'],
  'fitness-gyms': ['gym', 'fitness centre', 'personal trainer', 'crossfit'],
  florists: ['florist', 'flower shop', 'flower delivery', 'flowers'],
  'fuel-stations': ['petrol station', 'garage', 'filling station', 'gas station'],
  'funeral-services': ['funeral parlour', 'undertaker', 'funeral home', 'mortuary'],
  'furniture-homeware': ['furniture store', 'homeware shop', 'home decor', 'furniture shop'],
  'general-retail': ['general dealer', 'variety store'],
  'government-municipal-services': ['municipality', 'home affairs', 'licensing department', 'government office', 'municipal offices'],
  'hardware-stores': ['hardware shop', 'diy store', 'tool shop'],
  hotels: ['hotel', 'guest lodge'],
  'industrial-suppliers-manufacturing': ['factory', 'manufacturer', 'industrial supplier', 'wholesaler'],
  insurance: ['insurance broker', 'car insurance', 'life insurance', 'short-term insurance'],
  jewellers: ['jewellery shop', 'jeweller', 'jewelry store', 'jewellery repairs'],
  'liquor-stores': ['bottle store', 'off-licence', 'liquor shop', 'bottle shop'],
  locksmiths: ['locksmith', 'key cutting', 'lock repair', 'car key replacement'],
  'logistics-courier-transport': ['courier service', 'delivery service', 'freight', 'removals', 'transport company'],
  'marketing-advertising': ['marketing agency', 'advertising agency', 'digital marketing', 'social media marketing'],
  'mobile-phones': ['cell phone shop', 'phone repairs', 'smartphone store', 'cellphone repairs'],
  'motor-spares': ['car parts', 'auto spares', 'spare parts shop', 'second hand parts'],
  'museums-heritage-sites': ['museum', 'heritage site', 'historical site'],
  'nurseries-garden-centres': ['plant nursery', 'garden centre', 'landscaping supplies', 'plants'],
  opticians: ['optometrist', 'eye test', 'spectacles', 'glasses shop', 'eye care'],
  'painters-decorators': ['painter', 'house painter', 'decorator', 'painting contractor'],
  'panel-beaters-spray-painters': ['panel beater', 'car body repair', 'spray painter', 'smash repairs'],
  'party-event-hire': ['party hire', 'tent hire', 'event equipment hire', 'jumping castle hire', 'chair hire'],
  'pest-control': ['exterminator', 'fumigation', 'pest removal', 'termite treatment'],
  'pet-stores': ['pet shop', 'pet supplies', 'pet food'],
  pharmacies: ['pharmacy', 'chemist', 'drugstore'],
  photographers: ['photographer', 'photo studio', 'wedding photographer', 'portrait photography'],
  physiotherapists: ['physio', 'physiotherapy', 'sports injury'],
  plumbers: ['plumber', 'plumbing services', 'burst pipe', 'geyser repair'],
  'printing-services': ['printers', 'printing shop', 'signage', 'banner printing'],
  'recruitment-hr-services': ['recruitment agency', 'job agency', 'staffing agency', 'hr consultant'],
  'restaurants-takeaways': ['restaurant', 'takeaway', 'fast food', 'eatery'],
  'roofing-contractors': ['roofer', 'roof repair', 'roof waterproofing', 'roof leak'],
  'rubbish-rubble-removal': ['junk removal', 'rubble removal', 'waste removal', 'garden refuse removal', 'skip hire', 'builders rubble'],
  'schools-education': ['school', 'tutoring', 'education centre', 'preschool', 'crèche', 'creche'],
  'security-services': ['security company', 'armed response', 'guarding services', 'cctv installation'],
  'shoe-stores': ['shoe shop', 'footwear store', 'shoes'],
  'software-development': ['app developer', 'web developer', 'software company', 'app development'],
  'solar-renewable-energy': ['solar installer', 'solar panels', 'inverter installation', 'load shedding solutions'],
  'spas-wellness': ['spa', 'massage', 'wellness centre', 'day spa'],
  'supermarkets-groceries': ['supermarket', 'grocery store', 'groceries'],
  'tax-practitioners': ['tax consultant', 'tax returns', 'sars', 'tax advisor'],
  'tow-trucks-roadside': ['tow truck', 'roadside assistance', 'vehicle recovery', 'car towing'],
  'toy-stores': ['toy shop', 'toys'],
  'traditional-healers': ['sangoma', 'inyanga', 'traditional medicine'],
  'travel-agents': ['travel agency', 'flight bookings', 'holiday packages'],
  'tyre-fitment-centres': ['tyre shop', 'wheel alignment', 'tyre fitment', 'puncture repair'],
  'vets-animal-care': ['vet', 'veterinarian', 'animal hospital', 'animal clinic'],
  'wedding-services': ['wedding planner', 'bridal services', 'wedding coordinator'],
};

export function synonymsFor(categorySlug: string): string[] {
  return CATEGORY_SYNONYMS[categorySlug] ?? [];
}

// City-qualified search terms (e.g. "polokwane accommodation", "plumbers
// in pretoria") — kept separate from CATEGORY_SYNONYMS above because that
// list is shared across all three sites and a hardcoded city name would
// be wrong on the other two. Takes the category's own display name and
// the live site's cityLabel, so it's correct wherever it's called from.
export function locationSynonymsFor(categoryName: string, cityLabel: string): string[] {
  const cat = categoryName.toLowerCase();
  const city = cityLabel.toLowerCase();
  return [`${city} ${cat}`, `${cat} in ${city}`];
}
