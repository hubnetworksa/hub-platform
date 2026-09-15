// Two-tier category structure — broad sections that expand into the
// specific categories from db/migrations/0003 + 0005. Doesn't change any
// category URLs (keeps existing SEO equity), just organizes how they're
// browsed: the flat 57-item list was the #1 complaint about site structure.

export interface CategoryGroup {
  slug: string;
  name: string;
  /** Raw inner-SVG markup (path/circle/rect elements only) rendered by
   * <GroupIcon> — hand-drawn simple line icons rather than emoji, which
   * render inconsistently across devices and read as consumer-app-playful
   * rather than a directory people trust to find an attorney. */
  iconPath: string;
  categorySlugs: string[];
}

export const CATEGORY_GROUPS: CategoryGroup[] = [
  {
    slug: 'food-drink',
    name: 'Food & Drink',
    iconPath: '<path d="M6 2v8M4 2v4a2 2 0 0 0 2 2 2 2 0 0 0 2-2V2M6 12v10"/><path d="M18 2c-1.5 0-3 1.5-3 5s1 5 1 5v10"/>',
    categorySlugs: ['restaurants-takeaways', 'bakeries', 'butcheries', 'catering', 'supermarkets-groceries', 'convenience-stores', 'liquor-stores'],
  },
  {
    slug: 'shopping-retail',
    name: 'Shopping & Retail',
    iconPath: '<path d="M6 8h12l-1 12H7L6 8Z"/><path d="M9 8V6a3 3 0 0 1 6 0v2"/>',
    categorySlugs: ['fashion-clothing', 'shoe-stores', 'jewellers', 'electronics-appliances', 'books-stationery', 'mobile-phones', 'toy-stores', 'furniture-homeware', 'hardware-stores', 'general-retail'],
  },
  {
    slug: 'health-beauty',
    name: 'Health & Beauty',
    iconPath: '<path d="M12 21s-7-4.5-9.5-9C.7 8.4 2 5 5.5 5c2 0 3.3 1.2 4 2.2.7-1 2-2.2 4-2.2 3.5 0 4.8 3.4 3 7-2.5 4.5-9.5 9-9.5 9Z"/>',
    categorySlugs: ['pharmacies', 'dentists', 'doctors-gps', 'clinics-healthcare', 'physiotherapists', 'opticians', 'beauty-hair-salons', 'spas-wellness', 'vets-animal-care', 'pet-stores'],
  },
  {
    slug: 'automotive',
    name: 'Automotive',
    iconPath: '<path d="M4 16V11l2-5h12l2 5v5"/><path d="M4 16h16"/><circle cx="7.5" cy="16.5" r="1.5"/><circle cx="16.5" cy="16.5" r="1.5"/>',
    categorySlugs: ['car-dealerships', 'automotive-repairs', 'motor-spares', 'tow-trucks-roadside', 'driving-schools', 'fuel-stations', 'logistics-courier-transport'],
  },
  {
    slug: 'professional-financial',
    name: 'Professional & Financial Services',
    iconPath: '<rect x="3" y="7" width="18" height="12" rx="2"/><path d="M8 7V5a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"/><path d="M3 12h18"/>',
    categorySlugs: [
      'accountants', 'attorneys-legal', 'estate-agents', 'insurance', 'computer-it-services', 'software-development',
      'printing-services', 'photographers', 'business-consulting', 'commercial-property-office-space',
      'engineering-surveying', 'financial-investment-services', 'marketing-advertising', 'recruitment-hr-services',
    ],
  },
  {
    slug: 'home-trade',
    name: 'Home & Trade Services',
    iconPath: '<path d="M14.7 6.3a4 4 0 0 0-5.4 5.4L3 18v3h3l6.3-6.3a4 4 0 0 0 5.4-5.4l-2.8 2.8-2-2 2.8-2.8Z"/>',
    categorySlugs: [
      'building-construction', 'electricians', 'plumbers', 'locksmiths', 'cleaning-services', 'pest-control',
      'nurseries-garden-centres', 'industrial-suppliers-manufacturing', 'solar-renewable-energy',
    ],
  },
  {
    slug: 'hospitality-travel',
    name: 'Hospitality & Travel',
    iconPath: '<path d="M3 18v-6a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2v6"/><path d="M3 18h18M3 14h18"/><path d="M7 10V8a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2"/>',
    categorySlugs: ['accommodation', 'hotels', 'travel-agents'],
  },
  {
    slug: 'events-leisure',
    name: 'Events, Weddings & Leisure',
    iconPath: '<path d="M12 3v4M12 17v4M4.2 4.2l2.8 2.8M17 17l2.8 2.8M3 12h4M17 12h4M4.2 19.8 7 17M17 7l2.8-2.8"/>',
    categorySlugs: ['events-function-venues', 'wedding-services', 'fitness-gyms', 'florists', 'museums-heritage-sites'],
  },
  {
    slug: 'community-essential',
    name: 'Community & Essential Services',
    iconPath: '<path d="M4 21h16M5 21V10M9 21V10M15 21V10M19 21V10M3 10l9-6 9 6"/>',
    categorySlugs: ['schools-education', 'security-services', 'funeral-services'],
  },
];

export function groupForCategory(categorySlug: string): CategoryGroup | undefined {
  return CATEGORY_GROUPS.find((g) => g.categorySlugs.includes(categorySlug));
}
