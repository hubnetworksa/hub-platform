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
  'appliance-repairs': [
    'fridge repair', 'washing machine repair', 'stove repair', 'appliance technician', 'oven repair',
    'dishwasher repair', 'tumble dryer repair', 'microwave repair',
  ],
  'attorneys-legal': ['lawyer', 'law firm', 'legal services', 'advocate', 'conveyancer', 'divorce lawyer'],
  'automotive-repairs': [
    'car repair', 'car repairs', 'mechanic', 'mechanics', 'auto repair', 'car service', 'engine repair',
    'car diagnostics', 'clutch repair', 'gearbox repair',
  ],
  bakeries: [
    'bakery', 'bakeries', 'cakes', 'cake shop', 'custom cakes', 'wedding cakes', 'cupcakes', 'pastries',
    'confectionery', 'fresh bread',
  ],
  'banks-atms': ['bank', 'atm', 'cash machine', 'bank branch'],
  barbershops: ['barber', 'mens haircut', "men's hair salon", 'haircuts', 'fade'],
  'beauty-hair-salons': ['hair salon', 'hairdresser', 'nail salon', 'beauty parlour', 'hair stylist', 'nails'],
  'bookkeeping-services': ['bookkeeper', 'accounts', 'payroll services', 'bookkeeping'],
  'books-stationery': ['bookstore', 'stationery shop', 'office supplies', 'school stationery'],
  'borehole-water-services': [
    'borehole drilling', 'water tank installation', 'well drilling', 'jojo tank', 'borehole pump',
    'borehole services', 'water storage tanks', 'borehole testing',
  ],
  'building-construction': [
    'builder', 'builders', 'building contractor', 'construction company', 'renovations', 'home builder',
    'handyman', 'handyman services', 'home renovations', 'general contractor',
  ],
  'building-materials-timber-merchants': ['hardware wholesaler', 'timber yard', 'building supplies', 'cement supplier', 'sand and stone'],
  'business-consulting': ['management consultant', 'business advisor', 'strategy consultant'],
  butcheries: [
    'butchery', 'butcheries', 'butcher', 'butchers', 'meat shop', 'meat market', 'biltong', 'biltong shop',
    'droewors', 'shisa nyama',
  ],
  'car-dealerships': [
    'car dealer', 'car dealers', 'used cars', 'used car dealer', 'new car sales', 'motor dealership', 'car sales',
    'pre-owned cars', 'car showroom',
  ],
  'car-wash-detailing': ['car wash', 'car washes', 'valet', 'valet service', 'auto detailing', 'car cleaning', 'mobile car wash'],
  catering: [
    'caterer', 'caterers', 'event catering', 'party food', 'catering services', 'wedding catering',
    'corporate catering', 'buffet catering',
  ],
  'churches-religious-organisations': ['church', 'mosque', 'temple', 'synagogue', 'place of worship'],
  'cleaning-services': [
    'cleaners', 'domestic cleaning', 'office cleaning', 'house cleaning', 'cleaning company', 'cleaning services',
    'carpet cleaning', 'deep cleaning', 'move-in cleaning',
  ],
  'clinics-healthcare': ['clinic', 'medical centre', 'health centre', 'day clinic'],
  'commercial-property-office-space': ['office space to let', 'commercial property', 'office rental', 'warehouse to rent', 'shop to let'],
  'computer-it-services': ['computer repair', 'it support', 'laptop repair', 'tech support', 'network support'],
  'convenience-stores': ['spaza shop', 'spaza', 'corner shop', 'tuck shop', 'cafe', 'café', 'convenience shop'],
  dentists: ['dentist', 'dental practice', 'teeth', 'dental clinic'],
  'doctors-gps': ['doctor', 'gp', 'general practitioner', 'medical doctor', 'family doctor'],
  'driving-schools': [
    'driving lessons', 'driving school', "learner's licence", 'learners licence', 'k53', 'drivers licence',
    'code 8 licence', 'code 10 licence',
  ],
  electricians: [
    'electrician', 'electricians', 'electrical contractor', 'wiring', 'electrical repairs', 'coc certificate',
    'certificate of compliance', 'electrical fault finding',
  ],
  'electronics-appliances': ['electronics shop', 'appliance store', 'tv shop', 'electronics store'],
  'engineering-surveying': ['engineer', 'land surveyor', 'civil engineer', 'structural engineer'],
  'estate-agents': ['real estate agent', 'property agent', 'realtor', 'houses for sale', 'property for sale'],
  'events-function-venues': ['function venue', 'wedding venue', 'conference venue', 'event hall', 'venue hire'],
  'fashion-clothing': ['clothing store', 'fashion shop', 'boutique', 'clothes shop'],
  'fencing-security-installations': [
    'fence installer', 'security gates', 'electric fencing', 'palisade fencing', 'razor wire',
    'fencing contractor', 'automated gates', 'burglar bars',
  ],
  'financial-investment-services': ['financial advisor', 'investment company', 'wealth management', 'financial planner'],
  'fitness-gyms': ['gym', 'fitness centre', 'personal trainer', 'crossfit'],
  florists: ['florist', 'flower shop', 'flower delivery', 'flowers'],
  'fuel-stations': ['petrol station', 'petrol stations', 'garage', 'filling station', 'gas station', 'diesel'],
  'funeral-services': ['funeral parlour', 'undertaker', 'funeral home', 'mortuary'],
  'furniture-homeware': ['furniture store', 'homeware shop', 'home decor', 'furniture shop'],
  'general-retail': ['general dealer', 'variety store'],
  'government-municipal-services': ['municipality', 'home affairs', 'licensing department', 'government office', 'municipal offices'],
  'hardware-stores': ['hardware shop', 'diy store', 'tool shop'],
  hotels: ['hotel', 'guest lodge'],
  'industrial-suppliers-manufacturing': [
    'factory', 'manufacturer', 'manufacturers', 'industrial supplier', 'wholesaler', 'industrial equipment',
    'factory supplies',
  ],
  insurance: ['insurance broker', 'car insurance', 'life insurance', 'short-term insurance'],
  jewellers: ['jewellery shop', 'jeweller', 'jewelry store', 'jewellery repairs'],
  'liquor-stores': [
    'bottle store', 'bottle stores', 'off-licence', 'liquor shop', 'bottle shop', 'liquor store', 'wine shop',
    'alcohol shop',
  ],
  locksmiths: [
    'locksmith', 'locksmiths', 'key cutting', 'lock repair', 'car key replacement', 'emergency locksmith',
    'safe unlocking', 'spare keys',
  ],
  'logistics-courier-transport': [
    'courier service', 'courier services', 'delivery service', 'freight', 'removals', 'removal company',
    'transport company', 'furniture removals',
  ],
  'marketing-advertising': ['marketing agency', 'advertising agency', 'digital marketing', 'social media marketing'],
  'mobile-phones': ['cell phone shop', 'phone repairs', 'smartphone store', 'cellphone repairs'],
  'motor-spares': [
    'car parts', 'auto spares', 'motor spares', 'spare parts shop', 'second hand parts', 'scrap yard', 'scrapyard',
    'used car parts',
  ],
  'museums-heritage-sites': ['museum', 'heritage site', 'historical site'],
  'nurseries-garden-centres': [
    'plant nursery', 'nurseries', 'garden centre', 'landscaping supplies', 'plants', 'garden services',
    'landscaping', 'indigenous plants',
  ],
  opticians: ['optometrist', 'eye test', 'spectacles', 'glasses shop', 'eye care'],
  'painters-decorators': [
    'painter', 'painters', 'house painter', 'decorator', 'painting contractor', 'interior painting',
    'exterior painting', 'wallpaper installer',
  ],
  'panel-beaters-spray-painters': [
    'panel beater', 'panel beaters', 'car body repair', 'spray painter', 'spray painting', 'smash repairs',
    'auto body repairs', 'dent repair',
  ],
  'party-event-hire': ['party hire', 'tent hire', 'event equipment hire', 'jumping castle hire', 'chair hire'],
  'pest-control': [
    'exterminator', 'fumigation', 'pest removal', 'termite treatment', 'pest control', 'cockroach control',
    'rodent control', 'bed bug treatment',
  ],
  'pet-stores': ['pet shop', 'pet supplies', 'pet food'],
  pharmacies: ['pharmacy', 'chemist', 'drugstore'],
  photographers: ['photographer', 'photo studio', 'wedding photographer', 'portrait photography'],
  physiotherapists: ['physio', 'physiotherapy', 'sports injury'],
  plumbers: [
    'plumber', 'plumbers', 'plumbing services', 'burst pipe', 'geyser repair', 'blocked drain',
    'geyser installation', 'leak detection',
  ],
  'printing-services': ['printers', 'printing shop', 'signage', 'banner printing'],
  'recruitment-hr-services': ['recruitment agency', 'job agency', 'staffing agency', 'hr consultant'],
  'restaurants-takeaways': [
    'restaurant', 'restaurants', 'takeaway', 'takeaways', 'takeout', 'fast food', 'food delivery',
    'shisa nyama', 'braai', 'diner', 'eatery', 'lunch spot',
  ],
  'roofing-contractors': [
    'roofer', 'roofers', 'roof repair', 'roof waterproofing', 'roof leak', 'roofing contractor', 'gutter repair',
    'ceiling repair',
  ],
  'rubbish-rubble-removal': [
    'junk removal', 'rubbish removal', 'rubble removal', 'waste removal', 'garden refuse removal', 'garden refuse',
    'skip hire', 'builders rubble', 'bin hire',
  ],
  'schools-education': ['school', 'tutoring', 'education centre', 'preschool', 'crèche', 'creche'],
  'security-services': ['security company', 'armed response', 'guarding services', 'cctv installation'],
  'shoe-stores': ['shoe shop', 'footwear store', 'shoes'],
  'software-development': ['app developer', 'web developer', 'software company', 'app development'],
  'solar-renewable-energy': [
    'solar installer', 'solar installers', 'solar panels', 'inverter installation', 'load shedding solutions',
    'inverter', 'backup power', 'generator installation', 'battery backup',
  ],
  'spas-wellness': ['spa', 'massage', 'wellness centre', 'day spa'],
  'supermarkets-groceries': [
    'supermarket', 'supermarkets', 'grocery store', 'groceries', 'grocery shop', 'food market', 'superette',
  ],
  'tax-practitioners': ['tax consultant', 'tax returns', 'sars', 'tax advisor'],
  'tow-trucks-roadside': [
    'tow truck', 'tow trucks', 'roadside assistance', 'vehicle recovery', 'car towing', 'breakdown recovery',
    'jump start service',
  ],
  'toy-stores': ['toy shop', 'toys'],
  'traditional-healers': ['sangoma', 'inyanga', 'traditional medicine'],
  'travel-agents': ['travel agency', 'flight bookings', 'holiday packages'],
  'tyre-fitment-centres': [
    'tyre shop', 'tyre shops', 'wheel alignment', 'tyre fitment', 'puncture repair', 'wheel balancing', 'new tyres',
  ],
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

// Suburb-qualified search terms (e.g. "plumbers flora park", "flora park
// plumbers") — the same near-me/in-<place> query pattern as
// locationSynonymsFor above, one level more specific. Only ever called from
// category/[slug]/[suburb].astro, which itself only generates pages for
// suburb+category combinations that already have real listings — this never
// manufactures a keyword claim for a suburb with nothing there.
export function suburbSynonymsFor(categoryName: string, suburbName: string): string[] {
  const cat = categoryName.toLowerCase();
  const suburb = suburbName.toLowerCase();
  return [`${cat} ${suburb}`, `${cat} in ${suburb}`, `${suburb} ${cat}`];
}
