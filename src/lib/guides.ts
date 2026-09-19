// Buyer's guides. Only guides whose full text exists are listed here — the
// index and the [slug] route are both generated from this array, so adding a
// guide means adding an entry (no unwritten/placeholder guides are published).
//
// Text is written city-neutrally where possible; anything that mentions the
// city takes it via the `title`/`intro` functions so every per-city build
// reads correctly.

export interface GuideSection {
  /** Anchor id used by the in-page "In this guide" list. */
  id: string;
  /** Full numbered heading shown in the article. */
  heading: string;
  /** Shorter label shown in the "In this guide" list. */
  tocLabel: string;
  paragraphs: string[];
}

export interface Guide {
  slug: string;
  /** Index-card category label (e.g. "Home & Trade"). */
  categoryLabel: string;
  /** Slug of the directory category whose real listings appear under the article. */
  categorySlug: string;
  /** Last breadcrumb segment. */
  breadcrumbLabel: string;
  readTime: string;
  /** Human-readable, shown in the byline. */
  updatedLabel: string;
  /** ISO 8601 (year-month), used for Article structured data. */
  updatedIso: string;
  title: (cityLabel: string) => string;
  blurb: string;
  intro: string;
  sections: GuideSection[];
}

export const GUIDES: Guide[] = [
  {
    slug: 'how-to-choose-a-plumber',
    categoryLabel: 'Home & Trade',
    categorySlug: 'plumbers',
    breadcrumbLabel: 'Plumbers',
    readTime: '6 min',
    updatedLabel: 'September 2026',
    updatedIso: '2026-09',
    title: (cityLabel) => `How to choose a plumber in ${cityLabel}`,
    blurb: 'PIRB registration, itemised quotes, insurance claims and warranties — the checks worth doing before you phone anyone.',
    intro:
      'A burst geyser at 21:00 is the worst time to start comparing quotes. These are the checks worth doing now, while nothing is leaking — and the questions that separate a registered plumber from a man with a bakkie.',
    sections: [
      {
        id: 'pirb-registration',
        heading: '1. Check the PIRB registration',
        tocLabel: '1. Check the PIRB registration',
        paragraphs: [
          'Any plumber working on a geyser or issuing a Certificate of Compliance must be registered with the Plumbing Industry Registration Board. Ask for the registration number and check it before work starts — an unregistered CoC will not satisfy your insurer.',
        ],
      },
      {
        id: 'written-quote',
        heading: '2. Get the quote in writing, itemised',
        tocLabel: '2. Get the quote in writing',
        paragraphs: [
          'A quote should separate call-out, labour rate, parts and VAT. Vague single-figure quotes are where disputes start. For geyser replacement, confirm whether the drip tray, vacuum breakers and overflow pipe are included — they usually are not.',
        ],
      },
      {
        id: 'insurance',
        heading: '3. Confirm who claims from insurance',
        tocLabel: '3. Confirm who claims',
        paragraphs: [
          'Most household policies cover geyser failure but require you to use an approved supplier. Phone your insurer before authorising work — paying cash and claiming later is usually refused.',
        ],
      },
      {
        id: 'warranty',
        heading: '4. Ask what happens if it fails again',
        tocLabel: '4. Ask about the warranty',
        paragraphs: [
          "A reasonable workmanship warranty is six months on labour, with the manufacturer's warranty on the unit itself. Get both in writing on the invoice, not verbally on the day.",
        ],
      },
    ],
  },
];

export const guideBySlug = (slug: string) => GUIDES.find((g) => g.slug === slug);
