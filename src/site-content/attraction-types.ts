// Shared by every city's tourism/*.ts content file and src/pages/tourism/[slug].astro.

export interface PracticalRow {
  label: string;
  value: string;
}

export interface TieIn {
  label: string;
  href: string;
}

export interface Attraction {
  slug: string;
  name: string;
  /** Used verbatim for <title> — written for search. */
  pageTitle: string;
  /** Used verbatim for <meta name="description">. */
  metaDescription: string;
  /** One-line teaser for the overview page grid. */
  teaser: string;
  /** Paragraphs separated by a blank line. */
  whatItIs: string;
  whatToDo: string;
  practical: PracticalRow[];
  /** Items rendered as a "Before you go" callout, for anything unconfirmed. */
  beforeYouGo: string[];
  /** "Nearby tie-ins" prose. */
  nearby: string;
  /** Explicit internal links (suburb pages / directory categories / other attractions). */
  tieIns: TieIn[];
  address: {
    streetAddress?: string;
    addressLocality: string;
    addressRegion: string;
    postalCode?: string;
    addressCountry: 'ZA';
  };
  /** Approximate — verify against Google Maps. */
  geo?: { lat: number; lng: number };
  /** schema.org openingHours strings (e.g. "Mo-Fr 08:00-15:30"). Set only once confirmed. */
  openingHours?: string[];
  /** schema.org priceRange (e.g. "R12 – R18"). Set only once confirmed. */
  priceRange?: string;
  /** true when entry is free; leave undefined if paid or unknown. */
  isAccessibleForFree?: boolean;
  /** Description of the real photo required. Rendered as an HTML comment
   *  when no imageUrl is set yet. */
  imageNeeded: string;
  /** /media/tourism/<slug>.jpg — a real, freely-licensed photo (Wikimedia
   *  Commons: public domain or CC-BY/-SA/-ND, never NC), uploaded to R2.
   *  Undefined until one has actually been sourced — imageNeeded above is
   *  the placeholder until then. */
  imageUrl?: string;
  /** "Photo by <artist> / Wikimedia Commons, <license>" — required whenever
   *  imageUrl is set; Commons' CC-BY/-SA licenses require attribution. */
  imageCredit?: string;
  /** The Commons file's own description-page URL, for the credit link. */
  imageSourceUrl?: string;
}
