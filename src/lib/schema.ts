// Site-wide structured-data building blocks: the one Organization behind
// every page (emitted once per page by BaseLayout) and the publisher/author
// reference every page-level JSON-LD node points back at. Head metadata
// only: nothing here renders in the page body.

import site from '../site';
import { versioned } from './assetVersion';

const siteUrl = `https://${site.domain}`;

/** Stable node id, so every page's `publisher` resolves to the same entity. */
export const ORGANIZATION_ID = `${siteUrl}/#organization`;
export const WEBSITE_ID = `${siteUrl}/#website`;

/** The full Organization node. No sameAs (the owner wants no social or
 *  Google profile links) and no legal form or registration. The trading
 *  name is already shown on About, Contact, Privacy and Terms. */
export function organizationJsonLd() {
  const tradingName = site.legal?.legalName?.trim() || null;
  return {
    '@context': 'https://schema.org',
    '@type': 'Organization',
    '@id': ORGANIZATION_ID,
    name: site.siteName,
    url: `${siteUrl}/`,
    logo: { '@type': 'ImageObject', url: `${siteUrl}${versioned('/logo-icon.png')}` },
    // Published on /contact/ and /advertise/.
    email: site.contactEmail,
    ...(tradingName ? { parentOrganization: { '@type': 'Organization', name: tradingName } } : {}),
  };
}

/** Publisher/author reference: the @id ties it to the Organization node on
 *  the same page, and name/url/logo keep it valid on its own. */
export function organizationRef() {
  return {
    '@type': 'Organization',
    '@id': ORGANIZATION_ID,
    name: site.siteName,
    url: `${siteUrl}/`,
    logo: { '@type': 'ImageObject', url: `${siteUrl}${versioned('/logo-icon.png')}` },
  };
}

export function websiteRef() {
  return { '@type': 'WebSite', '@id': WEBSITE_ID, name: site.siteName, url: `${siteUrl}/` };
}

export type WebPageType = 'WebPage' | 'AboutPage' | 'ContactPage' | 'CollectionPage';

/** A page-level WebPage node (or subtype) with publisher and dates. */
export function webPageJsonLd({
  type = 'WebPage',
  name,
  description,
  url,
  dateModified,
  datePublished,
  mainEntity,
}: {
  type?: WebPageType;
  name: string;
  description?: string;
  url: string;
  dateModified?: string;
  datePublished?: string;
  mainEntity?: Record<string, unknown>;
}) {
  return {
    '@context': 'https://schema.org',
    '@type': type,
    name,
    ...(description ? { description } : {}),
    url,
    inLanguage: 'en-ZA',
    isPartOf: websiteRef(),
    publisher: organizationRef(),
    ...(datePublished ? { datePublished } : {}),
    ...(dateModified ? { dateModified } : {}),
    ...(mainEntity ? { mainEntity } : {}),
  };
}

/** JSON for a <script type="application/ld+json">, safe inside HTML. */
export const ldJson = (data: unknown): string => JSON.stringify(data).replace(/</g, '\\u003c');
