// Shared legal copy for /privacy/ and /terms/. Structure, headings and base
// wording come from the design mockup's single "Legal" screen (four documents:
// Privacy & POPIA, Terms of use, Listing rules, Cookies). The real clauses the
// site already published before the redesign are merged in as extra
// paragraphs/sections so no legal content is lost. Strings are trusted,
// hand-written constants (some contain inline <a> markup) rendered with set:html.

import type { Site } from '../site';

export type LegalDocKey = 'privacy' | 'terms' | 'listing' | 'cookies';

export interface LegalSection {
  heading: string;
  /** One or more paragraphs (trusted HTML). */
  paragraphs: string[];
}

export interface LegalDoc {
  key: LegalDocKey;
  /** Tab label + page title. */
  label: string;
  /** Route the doc lives on. */
  route: '/privacy/' | '/terms/';
  /** URL fragment that selects this doc (empty for a route's primary doc). */
  hash: string;
  sections: LegalSection[];
}

/** Bump when the wording below changes. */
export const LEGAL_UPDATED = '1 September 2026';

export function legalDocs(site: Pick<Site, 'siteName' | 'contactEmail'>): LegalDoc[] {
  const mail = `<strong>${site.contactEmail}</strong> (or use the <a href="/contact/">contact form</a>)`;
  const year = new Date().getFullYear();

  return [
    {
      key: 'privacy',
      label: 'Privacy & POPIA',
      route: '/privacy/',
      hash: '',
      sections: [
        {
          heading: 'What we collect',
          paragraphs: [
            'When you submit or claim a listing we collect your name, business name, phone number, email address and physical address. When you browse we collect standard server logs and analytics on which pages you view.',
            'Business listing data (name, address, contact details) also comes from publicly available sources — business owners’ own submissions and research against public web sources (including map services like Google Maps) — never from private or personal accounts. If you submit a business listing or a correction, we store the contact details you provide solely to publish or verify that listing.',
          ],
        },
        {
          heading: 'Why we collect it',
          paragraphs: [
            'Business details are published so customers can find you. Contact details are used to verify the listing, send enquiry notifications and bill you if you are on a paid plan. We do not sell personal information to third parties.',
          ],
        },
        {
          heading: 'Your rights under POPIA',
          paragraphs: [
            'You may ask us what we hold about you, correct it, or ask us to delete it. Requests go to the Information Officer at the address on the Contact page and are answered within 30 days.',
            'Under South Africa’s Protection of Personal Information Act (POPIA), you can ask us to correct or delete personal information we hold about you. Every business page has a “Request data removal” link that sends us a removal request with your reason — we review each one by hand and confirm by email once it’s actioned, usually within a few days. You can also email us directly (see “Contact” below).',
          ],
        },
        {
          heading: 'Information Officer',
          paragraphs: [
            'Our registered Information Officer is listed with the Information Regulator of South Africa. Complaints may be lodged with the Regulator directly if you are not satisfied with our response.',
          ],
        },
        {
          heading: 'Retention',
          paragraphs: [
            'Listing data stays while the listing is live and for 12 months after removal. Billing records are kept for five years as required by SARS.',
          ],
        },
        {
          heading: 'Third-party data',
          paragraphs: [
            'Some listings draw on publicly available Google Maps content as part of our research process.',
          ],
        },
        {
          heading: 'Contact',
          paragraphs: [`Questions about this policy or your data: ${mail}.`],
        },
      ],
    },
    {
      key: 'terms',
      label: 'Terms of use',
      route: '/terms/',
      hash: '',
      sections: [
        {
          heading: 'Using the directory',
          paragraphs: [
            'The directory is free to search. You may not scrape, bulk-copy or resell the listing data, or use it to send unsolicited marketing.',
          ],
        },
        {
          heading: 'Accuracy',
          paragraphs: [
            'We review every listing by hand, but details change. We do not warrant that any listing is current, and we are not a party to any transaction between you and a listed business.',
            `${site.siteName} aims for accurate listings but cannot guarantee every detail (hours, contact information, etc.) is current — always confirm directly with a business before relying on it for anything time-sensitive. Report inaccuracies via the “Report this listing” link on any business page.`,
          ],
        },
        {
          heading: 'Paid placements',
          paragraphs: [
            'Featured and sponsored placements are always labelled. Paying does not change how we rank organic results, and refunds are handled per the billing terms below.',
          ],
        },
        {
          heading: 'Billing',
          paragraphs: [
            'Paid plans are month to month and renew automatically until cancelled. Cancel any time from your dashboard; the plan runs to the end of the paid month.',
          ],
        },
        {
          heading: 'Liability',
          paragraphs: ['Our liability is limited to the fees you paid us in the preceding three months.'],
        },
        {
          heading: 'Data sources',
          paragraphs: [
            'Listings come from business owners’ own submissions, from research against publicly available web sources (business websites, social media pages, other directories, and map services including Google Maps).',
          ],
        },
        {
          heading: 'Copyright',
          paragraphs: [
            `All original photography, graphics, the ${site.siteName} logo, and site design are © ${year} ${site.siteName}. They may not be copied, downloaded, reproduced, or reused on another site or in another publication without prior written permission. This does not apply to business listing data itself — see “Data sources” above for where that comes from.`,
          ],
        },
        {
          heading: 'Contact',
          paragraphs: [mail],
        },
      ],
    },
    {
      key: 'listing',
      label: 'Listing rules',
      route: '/terms/',
      hash: '#listing-rules',
      sections: [
        {
          heading: 'Who may list',
          paragraphs: [
            'Any lawful business trading in the city or its surrounds. One listing per physical location.',
          ],
        },
        {
          heading: 'Submitting a listing',
          paragraphs: [
            'By submitting a business listing, you confirm you’re authorised to provide that business’s information and that it’s accurate. We may edit, decline, or remove listings at our discretion.',
          ],
        },
        {
          heading: 'What we reject',
          paragraphs: [
            'Businesses without a verifiable address or phone number, listings that duplicate an existing entry, adult services, and anything advertising an illegal product or service.',
          ],
        },
        {
          heading: 'Claiming',
          paragraphs: [
            'To claim an existing listing you must verify ownership by phone call to the number already on file, or by email from a domain matching the business website.',
          ],
        },
        {
          heading: 'Removal',
          paragraphs: [
            'We remove listings on request from the owner, when a business closes, or when a listing breaks these rules. Paid plans are pro-rated on removal.',
          ],
        },
      ],
    },
    {
      key: 'cookies',
      label: 'Cookies',
      route: '/privacy/',
      hash: '#cookies',
      sections: [
        {
          heading: 'Essential cookies',
          paragraphs: ['We set a session cookie when you sign in so the site works.'],
        },
        {
          heading: 'Analytics',
          paragraphs: [
            'We use Google Analytics to count page views and search terms in aggregate.',
          ],
        },
        {
          heading: 'Advertising',
          paragraphs: [
            'This site is prepared for advertising through Google AdSense, but no ads are shown yet — the AdSense script is loaded for site verification only, and no cookies are set by it at this stage. Once ads go live, Google and its partners may use cookies to serve and measure ads, including personalised ads based on your visits to this and other sites. You can view or opt out of personalised advertising at Google’s <a href="https://adssettings.google.com/" target="_blank" rel="noopener noreferrer">Ads Settings</a>, and read more at Google’s <a href="https://policies.google.com/technologies/ads" target="_blank" rel="noopener noreferrer">How Google uses information from sites that use its services</a>. This page will be updated again once ads are actually switched on.',
          ],
        },
      ],
    },
  ];
}
