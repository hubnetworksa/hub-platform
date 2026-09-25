import suburbsRaw from '../data/suburbs.json';
import categoriesRaw from '../data/categories.json';
import businessesRaw from '../data/businesses.json';
import businessCategoriesRaw from '../data/business-categories.json';
import shoppingCentersRaw from '../data/shopping-centers.json';
import businessPhotosRaw from '../data/business-photos.json';
import sponsorshipsRaw from '../data/sponsorships.json';
import siteSettingsRaw from '../data/site-settings.json';
import eventsRaw from '../data/events.json';
import newsRaw from '../data/news.json';
import fuelRaw from '../data/fuel-prices.json';
import { centsToRand } from '../../functions/_lib/pricing';

export interface Suburb {
  id: number;
  slug: string;
  name: string;
  /** Site-specific macro-region slug (e.g. "polokwane"/"seshego"/"limpopo-other" for
   *  Polokwane, "pretoria"/"centurion"/"gauteng-other" for Pretoria) — see
   *  src/site-content/<slug>/areaGroups.ts's regionLabel() for display names. */
  region: string;
  bio: string | null;
  landmarks: string | null;
  lat: number | null;
  lng: number | null;
  image_key: string | null;
}

export interface Category {
  id: number;
  slug: string;
  name: string;
}

export interface ShoppingCenter {
  id: number;
  slug: string;
  name: string;
  suburb_id: number | null;
  address: string | null;
  lat: number | null;
  lng: number | null;
  type: 'mall' | 'fuel_station';
  description: string | null;
}

export interface Business {
  id: number;
  slug: string;
  name: string;
  suburb_id: number;
  address: string | null;
  phone: string | null;
  website: string | null;
  email: string | null;
  description: string;
  lat: number | null;
  lng: number | null;
  source_urls: string;
  shopping_center_id: number | null;
  hours: string | null;
  owner_user_id: number | null;
  /** 0 = Basic/Free, 1 = Verified, 2 = Featured — see functions/_lib/pricing.ts's TIER_NAMES. */
  subscription_tier: number;
  subscription_status: string | null;
  subscription_expires_at: string | null;
  /** Featured-plan perk: page links, shown only while the business is Featured. */
  social_instagram?: string | null;
  social_facebook?: string | null;
  social_linkedin?: string | null;
  social_youtube?: string | null;
}

/** The Featured tier's numeric value — gates the Photos gallery and
 *  "Featured this month"/search-pin placement. Kept in sync by hand with
 *  functions/_lib/pricing.ts's TIER_NAMES (that file can't be imported
 *  from build-time Astro code — it's bundled separately for Pages
 *  Functions — so the tier numbers are just duplicated as a constant). */
export const FEATURED_TIER = 2;

/** Listing order everywhere a plan should count: Featured, then Verified,
 *  then everyone else, alphabetical within each. */
export function byPlanThenName(a: { subscription_tier: number; name: string }, b: { subscription_tier: number; name: string }): number {
  return (b.subscription_tier ?? 0) - (a.subscription_tier ?? 0) || a.name.localeCompare(b.name);
}

export interface BusinessPhoto {
  id: number;
  business_id: number;
  r2_key: string;
  sort_order: number;
  caption: string | null;
}

/** An active, currently-sold exclusive sponsorship slot — see
 *  functions/_lib/pricing.ts's SponsorProductType. Build-time snapshot,
 *  same rebuild-to-refresh pattern as every other static data file here. */
export interface Sponsorship {
  id: number;
  product_type: 'category_sponsor' | 'suburb_sponsor' | 'homepage_banner' | 'centre_sponsor' | 'guide_sponsor' | 'tourism_sponsor';
  product_target: string | null;
  business_id: number;
  business_name: string;
  business_slug: string;
  current_period_end: string | null;
}

interface BusinessCategoryLink {
  business_id: number;
  category_id: number;
  is_primary: number;
}

export const suburbs = suburbsRaw as Suburb[];
export const categories = categoriesRaw as Category[];
export const businesses = businessesRaw as Business[];
export const shoppingCenters = shoppingCentersRaw as ShoppingCenter[];
export const businessPhotos = businessPhotosRaw as BusinessPhoto[];
export const sponsorships = sponsorshipsRaw as Sponsorship[];
const businessCategories = businessCategoriesRaw as BusinessCategoryLink[];

const suburbById = new Map(suburbs.map((s) => [s.id, s]));
const categoryById = new Map(categories.map((c) => [c.id, c]));
const businessById = new Map(businesses.map((b) => [b.id, b]));
const shoppingCenterById = new Map(shoppingCenters.map((c) => [c.id, c]));

const categoriesByBusinessId = new Map<number, Category[]>();
const businessesByCategoryId = new Map<number, Business[]>();
for (const link of businessCategories) {
  const category = categoryById.get(link.category_id);
  const business = businessById.get(link.business_id);
  if (!category || !business) continue;
  if (!categoriesByBusinessId.has(link.business_id)) categoriesByBusinessId.set(link.business_id, []);
  categoriesByBusinessId.get(link.business_id)!.push(category);
  if (!businessesByCategoryId.has(link.category_id)) businessesByCategoryId.set(link.category_id, []);
  businessesByCategoryId.get(link.category_id)!.push(business);
}

const businessesBySuburbId = new Map<number, Business[]>();
for (const business of businesses) {
  if (!businessesBySuburbId.has(business.suburb_id)) businessesBySuburbId.set(business.suburb_id, []);
  businessesBySuburbId.get(business.suburb_id)!.push(business);
}

const businessesByShoppingCenterId = new Map<number, Business[]>();
for (const business of businesses) {
  if (business.shopping_center_id == null) continue;
  if (!businessesByShoppingCenterId.has(business.shopping_center_id)) businessesByShoppingCenterId.set(business.shopping_center_id, []);
  businessesByShoppingCenterId.get(business.shopping_center_id)!.push(business);
}

const photosByBusinessId = new Map<number, BusinessPhoto[]>();
for (const photo of businessPhotos) {
  if (!photosByBusinessId.has(photo.business_id)) photosByBusinessId.set(photo.business_id, []);
  photosByBusinessId.get(photo.business_id)!.push(photo);
}

export const suburbBySlug = (slug: string) => suburbs.find((s) => s.slug === slug);
export const categoryBySlug = (slug: string) => categories.find((c) => c.slug === slug);
export const businessBySlug = (slug: string) => businesses.find((b) => b.slug === slug);
export const shoppingCenterBySlug = (slug: string) => shoppingCenters.find((c) => c.slug === slug);
export const suburbFor = (business: Business) => suburbById.get(business.suburb_id);
export const categoriesFor = (business: Business) => categoriesByBusinessId.get(business.id) ?? [];
export const businessesInSuburb = (suburbId: number) => businessesBySuburbId.get(suburbId) ?? [];
export const businessesInCategory = (categoryId: number) => businessesByCategoryId.get(categoryId) ?? [];
export const businessesInShoppingCenter = (id: number) => businessesByShoppingCenterId.get(id) ?? [];

// Only meaningful when it actually has businesses linked — a shopping
// centre imported from OSM with nothing nearby yet shouldn't be treated
// as "real" for display/linking purposes.
export function shoppingCenterFor(business: Business): ShoppingCenter | undefined {
  if (business.shopping_center_id == null) return undefined;
  return shoppingCenterById.get(business.shopping_center_id);
}

export function businessesInSuburbAndCategory(suburbId: number, categoryId: number) {
  return businessesInCategory(categoryId).filter((b) => b.suburb_id === suburbId);
}

// Only ever meaningful to render when the business is CURRENTLY Featured
// (see FEATURED_TIER) — a downgraded business's rows stay in
// business_photos/R2 untouched, the page just stops showing them, so
// callers must still check business.subscription_tier themselves rather
// than assume a non-empty array means "show the gallery".
export function photosFor(business: Business): BusinessPhoto[] {
  return photosByBusinessId.get(business.id) ?? [];
}

const sponsorshipByKey = new Map<string, Sponsorship>();
for (const s of sponsorships) {
  sponsorshipByKey.set(`${s.product_type}:${s.product_target ?? ''}`, s);
}

/** The current sponsor of a slot, or `undefined` if it's open (never
 *  sold, or sold-but-expired as of the last rebuild). `target` is a
 *  category/suburb/shopping-centre slug, or omit it for the single
 *  homepage_banner slot. */
export function sponsorFor(productType: Sponsorship['product_type'], target?: string): Sponsorship | undefined {
  return sponsorshipByKey.get(`${productType}:${target ?? ''}`);
}

const siteSettings = new Map((siteSettingsRaw as { key: string; value: string }[]).map((r) => [r.key, r.value]));

/** Formatted Rand price for a site_settings key (e.g. "price_featured_cents"), or a dash if not yet configured. */
export function priceRand(key: string): string {
  const cents = Number(siteSettings.get(key));
  return Number.isFinite(cents) && cents > 0 ? `R${centsToRand(cents)}` : '—';
}

/** A business's saved website as a usable https link, or null. Some rows were saved
 *  without a scheme ("www.builders.co.za") or aren't a web address at all
 *  ("Farmersfolly") — rendered raw those became broken relative links. */
export function websiteUrl(raw: string | null | undefined): string | null {
  const value = (raw ?? '').trim();
  if (!value || /\s/.test(value)) return null;
  const candidate = /^https?:\/\//i.test(value) ? value : /^[a-z][a-z0-9+.-]*:/i.test(value) ? '' : `https://${value.replace(/^\/\//, '')}`;
  try {
    const url = new URL(candidate);
    return url.hostname.includes('.') ? url.toString() : null;
  } catch {
    return null;
  }
}

export function parseSourceUrls(business: Business): string[] {
  try {
    return JSON.parse(business.source_urls);
  } catch {
    return [];
  }
}

// --- Events (ported from the mockup's Events screen) ---

export const EVENT_TYPES = ['Music', 'Market', 'Sport', 'Theatre', 'Food & Drink', 'Family', 'Other'] as const;

export interface Event {
  id: number;
  slug: string;
  title: string;
  type: string;
  event_date: string;
  event_time: string | null;
  venue: string | null;
  suburb: string | null;
  address: string | null;
  price: string;
  ticket_url: string;
  host: string | null;
  image_url: string | null;
  image_credit: string | null;
  organiser: string | null;
  organiser_note: string | null;
  doors: string | null;
  ages: string | null;
  parking: string | null;
  traders: string | null;
  lineup_json: string | null;
  tiers_json: string | null;
  description: string;
  featured: number;
  event_owner_user_id: number | null;
}

export interface EventTier {
  name: string;
  price: string;
  note?: string;
  url: string;
}

export interface EventLineupItem {
  name: string;
  role: string;
  time: string;
}

export const events = eventsRaw as Event[];

const MONTHS = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
const WEEKDAYS = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

export const eventBySlug = (slug: string) => events.find((e) => e.slug === slug);

/** Today's date in South Africa (UTC+2, no DST) as YYYY-MM-DD — the
 *  cut-off for what counts as upcoming at build time. */
export function todaySast(now = new Date()): string {
  return new Date(now.getTime() + 2 * 3600_000).toISOString().slice(0, 10);
}

/** Events that haven't happened yet. Past events keep their own pages (they
 *  may be linked or indexed) but drop off every listing. */
export function upcomingEvents(): Event[] {
  const today = todaySast();
  return events.filter((e) => e.event_date >= today);
}

/** Featured first, then soonest first — same ordering as the mockup's public listing. */
export function eventsSorted(): Event[] {
  return upcomingEvents().sort((a, b) => {
    if (!!a.featured !== !!b.featured) return a.featured ? -1 : 1;
    return a.event_date < b.event_date ? -1 : 1;
  });
}

/** How many events of each type — feeds the "This month" sidebar box. */
export function eventTypeCounts(): { label: string; count: number }[] {
  const counts = new Map<string, number>();
  for (const e of upcomingEvents()) counts.set(e.type, (counts.get(e.type) ?? 0) + 1);
  return [...counts.entries()].map(([label, count]) => ({ label, count }));
}

export function eventDateParts(event: Event): { month: string; day: string; weekday: string } {
  const [y, m, d] = event.event_date.split('-').map(Number);
  const date = new Date(Date.UTC(y, m - 1, d, 12));
  return { month: MONTHS[m - 1], day: String(d), weekday: WEEKDAYS[date.getUTCDay()] };
}

export function eventDateLong(event: Event): string {
  const { month, day, weekday } = eventDateParts(event);
  const [y] = event.event_date.split('-');
  return `${weekday} ${Number(day)} ${month} ${y}`;
}

/** Same fallbacks as the mockup's detailVals() — optional enrichment fields
 *  (organiser/address/doors/ages/parking/lineup/tiers) fall back to
 *  whatever's already on the core event row rather than showing blank. */
export function eventDetail(event: Event) {
  const lineup: EventLineupItem[] = parseJsonArray(event.lineup_json);
  const tiers: EventTier[] = parseJsonArray(event.tiers_json);
  return {
    organiser: event.organiser || event.host || 'Organiser to be confirmed',
    organiserNote: event.organiser_note || '',
    address: event.address || [event.venue, event.suburb].filter(Boolean).join(', '),
    doors: event.doors || event.event_time || '',
    ages: event.ages || 'All ages',
    parking: event.parking || 'Parking at the venue',
    traders: event.traders || '',
    hasTraders: !!event.traders,
    lineup,
    hasLineup: lineup.length > 0,
    tiers: tiers.length > 0 ? tiers : [{ name: 'General entry', price: event.price, note: 'Single ticket type', url: event.ticket_url }],
  };
}

function parseJsonArray<T>(raw: string | null): T[] {
  if (!raw) return [];
  try {
    const parsed = JSON.parse(raw);
    return Array.isArray(parsed) ? parsed : [];
  } catch {
    return [];
  }
}

// --- Local news (written by the daily news agent; see ROUTINE.news.<city>.md) ---

export const NEWS_CATEGORIES = ['Traffic', 'Utilities', 'Business', 'Sport', 'Tourism', 'Community'] as const;

export interface NewsArticle {
  id: number;
  slug: string;
  title: string;
  category: string;
  published_date: string;
  source_name: string;
  source_url: string;
  summary: string;
  body: string;
  image_url: string | null;
  image_credit: string | null;
  verification_json: string;
}

export const news = newsRaw as NewsArticle[];

export const newsBySlug = (slug: string) => news.find((n) => n.slug === slug);

/** Newest first. */
export function newsSorted(): NewsArticle[] {
  return [...news].sort((a, b) => (a.published_date === b.published_date ? b.id - a.id : a.published_date < b.published_date ? 1 : -1));
}

export function newsDateLong(article: NewsArticle): string {
  const [y, m, d] = article.published_date.split('-').map(Number);
  const date = new Date(Date.UTC(y, m - 1, d, 12));
  return `${WEEKDAYS[date.getUTCDay()]} ${d} ${MONTHS[m - 1]} ${y}`;
}

export function newsDateShort(article: NewsArticle): string {
  const [, m, d] = article.published_date.split('-').map(Number);
  return `${d} ${MONTHS[m - 1]}`;
}

/** Every source the agent read for this article — [{name?, url}] parsed from verification_json (plain URL strings). */
export function newsSources(article: NewsArticle): { url: string; host: string }[] {
  let list: unknown = [];
  try {
    list = JSON.parse(article.verification_json);
  } catch {
    list = [];
  }
  const urls = Array.isArray(list) ? list.filter((u): u is string => typeof u === 'string') : [];
  return urls.map((url) => {
    let host = url;
    try {
      host = new URL(url).hostname.replace(/^www\./, '');
    } catch {
      /* keep raw */
    }
    return { url, host };
  });
}

export function newsParagraphs(article: NewsArticle): string[] {
  return article.body.split(/\n{2,}/).map((p) => p.trim()).filter(Boolean);
}

// --- Fuel prices (monthly, regulated; inserted by the news routine) ---

export interface FuelPrice {
  period: string;
  region: string;
  grade: string;
  price_cents: number;
  change_cents: number;
  source_url: string;
}

/** Cape Town buys at the coastal price; Pretoria and Polokwane at the inland (Gauteng/Limpopo) price. */
const FUEL_REGION: Record<string, string> = { capetown: 'coastal', pretoria: 'inland', polokwane: 'inland' };

/** The most recent month's prices for this site's region, in a fixed grade order — null if none loaded yet. */
export function latestFuel(siteSlug: string): { period: string; region: string; rows: FuelPrice[] } | null {
  const region = FUEL_REGION[siteSlug];
  const all = (fuelRaw as FuelPrice[]).filter((f) => f.region === region);
  if (all.length === 0) return null;
  const period = all.map((f) => f.period).sort().reverse()[0];
  const order = ['Petrol 95', 'Petrol 93', 'Diesel 50ppm', 'Diesel 500ppm'];
  const rows = all.filter((f) => f.period === period).sort((a, b) => order.indexOf(a.grade) - order.indexOf(b.grade));
  return { period, region, rows };
}

export function fuelPeriodLabel(period: string): string {
  const [y, m] = period.split('-').map(Number);
  return `${MONTHS[m - 1]} ${y}`;
}
