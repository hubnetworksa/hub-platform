// Sanitizes owner-authored HTML (from the GrapesJS page builder) before it's
// stored and served to every visitor of that business's page. The builder's
// own UI never exposes a way to add scripts or event handlers, but the
// publish endpoint is just a POST request — anyone with an authenticated
// owner session could send crafted HTML directly, bypassing the UI. Uses
// HTMLRewriter (built into the Workers runtime) rather than a regex-based
// approach, since regex HTML sanitizers are notoriously bypassable.
const DANGEROUS_TAGS = new Set(['script', 'iframe', 'object', 'embed', 'link', 'meta', 'style', 'form', 'base']);

class StripDangerousHandler {
  element(el: Element) {
    const tag = el.tagName.toLowerCase();
    if (DANGEROUS_TAGS.has(tag)) {
      el.remove();
      return;
    }
    for (const name of [...el.attributes].map(([n]) => n)) {
      if (/^on/i.test(name)) el.removeAttribute(name);
    }
    const href = el.getAttribute('href');
    if (href && /^\s*(javascript|data|vbscript):/i.test(href)) el.removeAttribute('href');
    const src = el.getAttribute('src');
    if (src && /^\s*(javascript|vbscript):/i.test(src)) el.removeAttribute('src');
    if (src && /^\s*data:/i.test(src) && !/^\s*data:image\//i.test(src)) el.removeAttribute('src');
  }
}

export async function sanitizeOwnerHtml(html: string): Promise<string> {
  const marker = 'sanitize-body-content';
  const wrapped = `<!doctype html><html><body id="${marker}">${html}</body></html>`;
  const rewriter = new HTMLRewriter().on('*', new StripDangerousHandler());
  const res = rewriter.transform(new Response(wrapped, { headers: { 'Content-Type': 'text/html' } }));
  const text = await res.text();
  const match = text.match(new RegExp(`<body id="${marker}">([\\s\\S]*)<\\/body>`));
  return match ? match[1] : '';
}
