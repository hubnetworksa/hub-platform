// Two-tier category structure — broad sections that expand into the
// specific categories from db/migrations/0003 + 0005. Doesn't change any
// category URLs (keeps existing SEO equity), just organizes how they're
// browsed: the flat 57-item list was the #1 complaint about site structure.

import { slugify } from './slug';

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
    categorySlugs: [
      'fashion-clothing', 'shoe-stores', 'jewellers', 'electronics-appliances', 'books-stationery', 'mobile-phones',
      'toy-stores', 'furniture-homeware', 'hardware-stores', 'general-retail', 'agricultural-farming-supplies',
      'building-materials-timber-merchants',
    ],
  },
  {
    slug: 'health-beauty',
    name: 'Health & Beauty',
    iconPath: '<path d="M12 21s-7-4.5-9.5-9C.7 8.4 2 5 5.5 5c2 0 3.3 1.2 4 2.2.7-1 2-2.2 4-2.2 3.5 0 4.8 3.4 3 7-2.5 4.5-9.5 9-9.5 9Z"/>',
    categorySlugs: [
      'pharmacies', 'dentists', 'doctors-gps', 'clinics-healthcare', 'physiotherapists', 'opticians',
      'beauty-hair-salons', 'spas-wellness', 'vets-animal-care', 'pet-stores', 'barbershops', 'traditional-healers',
    ],
  },
  {
    slug: 'automotive',
    name: 'Automotive',
    iconPath: '<path d="M4 16V11l2-5h12l2 5v5"/><path d="M4 16h16"/><circle cx="7.5" cy="16.5" r="1.5"/><circle cx="16.5" cy="16.5" r="1.5"/>',
    categorySlugs: [
      'car-dealerships', 'automotive-repairs', 'motor-spares', 'tow-trucks-roadside', 'driving-schools',
      'fuel-stations', 'logistics-courier-transport', 'panel-beaters-spray-painters', 'tyre-fitment-centres',
      'car-wash-detailing',
    ],
  },
  {
    slug: 'professional-financial',
    name: 'Professional & Financial Services',
    iconPath: '<rect x="3" y="7" width="18" height="12" rx="2"/><path d="M8 7V5a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"/><path d="M3 12h18"/>',
    categorySlugs: [
      'accountants', 'attorneys-legal', 'estate-agents', 'insurance', 'computer-it-services', 'software-development',
      'printing-services', 'photographers', 'business-consulting', 'commercial-property-office-space',
      'engineering-surveying', 'financial-investment-services', 'marketing-advertising', 'recruitment-hr-services',
      'bookkeeping-services', 'tax-practitioners', 'construction-claims-management',
    ],
  },
  {
    slug: 'home-trade',
    name: 'Home & Trade Services',
    iconPath: '<path d="M14.7 6.3a4 4 0 0 0-5.4 5.4L3 18v3h3l6.3-6.3a4 4 0 0 0 5.4-5.4l-2.8 2.8-2-2 2.8-2.8Z"/>',
    categorySlugs: [
      'building-construction', 'electricians', 'plumbers', 'locksmiths', 'cleaning-services', 'pest-control',
      'nurseries-garden-centres', 'industrial-suppliers-manufacturing', 'solar-renewable-energy',
      'painters-decorators', 'borehole-water-services', 'roofing-contractors', 'appliance-repairs',
      'fencing-security-installations', 'rubbish-rubble-removal',
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
    categorySlugs: ['events-function-venues', 'wedding-services', 'fitness-gyms', 'florists', 'museums-heritage-sites', 'party-event-hire'],
  },
  {
    slug: 'community-essential',
    name: 'Community & Essential Services',
    iconPath: '<path d="M4 21h16M5 21V10M9 21V10M15 21V10M19 21V10M3 10l9-6 9 6"/>',
    categorySlugs: ['schools-education', 'security-services', 'funeral-services', 'government-municipal-services', 'banks-atms', 'churches-religious-organisations'],
  },
];

export function groupForCategory(categorySlug: string): CategoryGroup | undefined {
  return CATEGORY_GROUPS.find((g) => g.categorySlugs.includes(categorySlug));
}

/** Generic folder/tag icon for a group the admin typed in free-hand (see
 *  functions/api/admin/categories.ts) — it has no hand-drawn icon of its
 *  own until a developer adds one here, same honesty as the group picker
 *  on the admin Categories page. */
export const DEFAULT_GROUP_ICON = '<path d="M4 7a2 2 0 0 1 2-2h4l2 2h6a2 2 0 0 1 2 2v9a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2V7Z"/>';

/** A category row shaped enough to resolve its group — just the two
 *  columns resolveCategoryGroups() needs, so it isn't coupled to the full
 *  Category type in src/lib/data.ts (which imports this module). */
export interface GroupableCategory {
  slug: string;
  /** NULL/absent for every category created before the admin "Add
   *  category" feature (db/migrations/<city>/*_category_group_schema.sql)
   *  — those fall back to the hardcoded categorySlugs lists above. */
  group_name?: string | null;
}

/**
 * The effective groups for a live category list: CATEGORY_GROUPS' hardcoded
 * sections, each rebuilt with only the categories that actually belong to it
 * right now (by DB group_name when a category has one, else by the
 * hardcoded categorySlugs membership), PLUS a freshly synthesized group for
 * any DB group_name that doesn't match an existing section's name — e.g. an
 * admin typing a brand-new group on the admin Categories page. A synthesized
 * group gets a slugified-name URL and the generic icon above; a developer
 * can later promote it into CATEGORY_GROUPS with a real icon/order without
 * changing any URL (the slug is the same either way).
 *
 * This is the single place DB group_name is allowed to override the
 * hardcoded TS map — every page/script that groups categories should go
 * through this (or src/lib/data.ts's groupForCategory(), which wraps it)
 * rather than reading CATEGORY_GROUPS' categorySlugs directly.
 */
export function resolveCategoryGroups<C extends GroupableCategory>(categoryList: C[]): CategoryGroup[] {
  const byNameKey = new Map<string, CategoryGroup>();
  const order: CategoryGroup[] = [];

  for (const hardcoded of CATEGORY_GROUPS) {
    const group: CategoryGroup = { ...hardcoded, categorySlugs: [] };
    byNameKey.set(hardcoded.name.trim().toLowerCase(), group);
    order.push(group);
  }

  for (const category of categoryList) {
    const dbGroupName = category.group_name?.trim();
    if (dbGroupName) {
      const key = dbGroupName.toLowerCase();
      let group = byNameKey.get(key);
      if (!group) {
        group = { slug: slugify(dbGroupName), name: dbGroupName, iconPath: DEFAULT_GROUP_ICON, categorySlugs: [] };
        byNameKey.set(key, group);
        order.push(group);
      }
      group.categorySlugs.push(category.slug);
      continue;
    }
    // No DB override: fall back to whichever hardcoded group already
    // listed this slug (unchanged pre-admin-feature behaviour). A category
    // in neither place is simply ungrouped, same as today.
    const fallback = CATEGORY_GROUPS.find((g) => g.categorySlugs.includes(category.slug));
    if (fallback) byNameKey.get(fallback.name.trim().toLowerCase())!.categorySlugs.push(category.slug);
  }

  return order;
}
