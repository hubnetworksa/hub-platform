import type { APIRoute } from 'astro';
import site from '../site';
import { businesses, categories, suburbs, shoppingCenters, upcomingEvents, news, categoryHasBusinesses, businessesInShoppingCenter } from '../lib/data';
import { guidesFor } from '../lib/guides';
import { TOURISM } from '../site-content/tourism';

// /llms.txt (llmstxt.org): a short, plain-Markdown map of the site's main
// sections for language-model tools. Built per site from the same data as
// the pages, so the counts match what's published.
export const GET: APIRoute = () => {
  const base = `https://${site.domain}`;
  const fmt = (n: number) => n.toLocaleString('en-US');
  const liveCategories = categories.filter((c) => categoryHasBusinesses(c.id)).length;
  const liveCentres = shoppingCenters.filter((c) => businessesInShoppingCenter(c.id).length > 0).length;
  const guides = guidesFor(site.slug);
  const tourism = site.features.tourism ? TOURISM[site.slug] : undefined;
  const link = (path: string, label: string, note: string) => `- [${label}](${base}${path}): ${note}`;

  const lines = [
    `# ${site.siteName}`,
    '',
    `> ${site.siteName} is a local business directory for ${site.cityLabel}, ${site.province}, South Africa: ${fmt(businesses.length)} listings with addresses, phone numbers, trading hours and directions, reviewed before they go live.`,
    '',
    '## Directory',
    '',
    link('/category/', 'Categories', `${fmt(liveCategories)} business categories, each with a page per suburb.`),
    link('/suburb/', 'Suburbs', `${fmt(suburbs.length)} ${site.cityLabel} suburbs and the businesses listed in each.`),
    link('/shopping-center/', 'Shopping centres', `${fmt(liveCentres)} shopping centres and malls with their stores.`),
    '',
    '## Local information',
    '',
    link('/events/', 'Events', `${fmt(upcomingEvents().length)} upcoming events, markets and gigs with ticket prices.`),
    link('/news/', 'Local news', `${fmt(news.length)} short local news summaries, each linking to its sources.`),
    ...(guides.length > 0 ? [link('/guides/', 'Guides', `${guides.length} plain-language buyer's guides for hiring local trades.`)] : []),
    ...(tourism ? [link('/tourism/', 'Things to do', `Attractions and day trips in and around ${site.cityLabel}.`)] : []),
    '',
    '## About',
    '',
    link('/about/', 'About', `Who runs ${site.siteName}, what it covers and how listings are checked.`),
    link('/contact/', 'Contact', `How to reach ${site.siteName}: ${site.contactEmail}.`),
    link('/terms/', 'Terms of use', 'Terms of use and listing rules.'),
    link('/privacy/', 'Privacy & POPIA', 'How personal information is handled.'),
    '',
    '## Optional',
    '',
    link('/sitemap-index.xml', 'Sitemap', 'Every indexable page, split by page type.'),
    '',
  ];
  return new Response(lines.join('\n'), { headers: { 'Content-Type': 'text/plain; charset=utf-8' } });
};
