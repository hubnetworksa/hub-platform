// Social: Facebook and Instagram for each city. The setup checklist (shared
// by every admin), the page links, and ready-to-post captions from what's new
// on each site, to copy into Facebook / Instagram until automatic posting is
// switched on (SOCIALS-PLAN.md).

let current = null;

export async function render(view, ui) {
  const { h, fill, api, mobileHead, pageHead, errorBox } = ui;
  const head = () => [mobileHead('Social'), pageHead('Social', 'Facebook and Instagram for each city: setup, page links and ready-to-post captions.')];
  fill(view, head(), h('div', { class: 'skeleton' }));
  let d;
  try {
    d = await api('/api/social');
  } catch (e) {
    fill(view, head(), errorBox(e));
    return;
  }
  if (!current || !d.sites.some((s) => s.slug === current)) current = d.sites[0]?.slug;
  const body = h('div');
  const draw = () => {
    const s = d.sites.find((x) => x.slug === current);
    const done = s.steps.filter(Boolean).length;
    fill(
      body,
      h('div', { class: 'filters' }, h('div', { class: 'seg', role: 'group', 'aria-label': 'City' }, d.sites.map((x) => h('button', { type: 'button', 'aria-pressed': String(x.slug === current), onclick: () => ((current = x.slug), draw()) }, `${ui.siteName(x.slug)} · ${x.steps.filter(Boolean).length}/${d.steps.length}`)))),
      h(
        'div',
        { class: 'two' },
        h(
          'section',
          { class: 'card' },
          h('h2', { class: 'card-sub' }, `Setup: ${done} of ${d.steps.length} done`),
          h('div', { class: 'meter', style: 'margin-bottom:12px' }, h('span', { style: `width:${Math.max(1, (done / d.steps.length) * 100)}%` })),
          h(
            'ul',
            { class: 'steplist' },
            d.steps.map((label, i) =>
              h(
                'li',
                {},
                h(
                  'label',
                  { class: 'check' },
                  h('input', {
                    type: 'checkbox',
                    checked: s.steps[i],
                    onchange: async (e) => {
                      const was = s.steps[i];
                      s.steps[i] = e.target.checked;
                      try {
                        await api('/api/social', 'POST', { site: s.slug, step: i, done: s.steps[i] });
                      } catch (err) {
                        s.steps[i] = was;
                        alert(err.message);
                      }
                      draw();
                    },
                  }),
                  label
                )
              )
            )
          ),
          h('p', { class: 'note' }, 'Step-by-step instructions, names, bios and images: SOCIALS-PLAN.md and social/<city>/ in the repository.')
        ),
        linksCard(ui, s)
      ),
      h('h2', { class: 'section-title' }, 'Ready to post'),
      s.ideas.length
        ? h('div', { class: 'ideas' }, s.ideas.map((it) => ideaCard(ui, it)))
        : h('section', { class: 'card' }, h('div', { class: 'empty' }, h('b', {}, 'Nothing new this week'), 'Captions appear here for new listings (last 7 days), events in the next 10 days and news from the last 3 days.')),
      h('p', { class: 'note' }, 'Follower numbers and automatic daily posting need the Pages connected to Meta’s API (section 3 of SOCIALS-PLAN.md). Until then, copy a caption and post it with the matching image from the site.')
    );
  };
  draw();
  fill(view, head(), body);
}

function linksCard(ui, s) {
  const { h, api } = ui;
  const fb = h('input', { class: 'input', type: 'url', placeholder: 'https://www.facebook.com/…', value: s.facebook ?? '' });
  const ig = h('input', { class: 'input', type: 'url', placeholder: 'https://www.instagram.com/…', value: s.instagram ?? '' });
  const msg = h('p', { class: 'msg', role: 'status' });
  return h(
    'section',
    { class: 'card' },
    h('h2', { class: 'card-sub' }, 'Page links'),
    h(
      'form',
      {
        class: 'form',
        onsubmit: async (e) => {
          e.preventDefault();
          msg.className = 'msg';
          msg.textContent = 'Saving…';
          try {
            const r = await api('/api/social', 'POST', { site: s.slug, facebook: fb.value.trim(), instagram: ig.value.trim() });
            s.facebook = r.facebook;
            s.instagram = r.instagram;
            msg.className = 'msg ok';
            msg.textContent = 'Saved. Ask Claude to add them to the site’s footer.';
          } catch (err) {
            msg.className = 'msg err';
            msg.textContent = err.message;
          }
        },
      },
      h('label', { class: 'field' }, h('span', {}, 'Facebook Page'), fb),
      h('label', { class: 'field' }, h('span', {}, 'Instagram profile'), ig),
      h('div', {}, h('button', { class: 'btn primary', type: 'submit' }, 'Save links')),
      msg
    ),
    s.facebook || s.instagram
      ? h('div', { class: 'chips', style: 'margin-top:12px' }, s.facebook ? h('a', { class: 'btn small', href: s.facebook, target: '_blank', rel: 'noopener' }, 'Open Facebook', ui.icon('ext', 13)) : null, s.instagram ? h('a', { class: 'btn small', href: s.instagram, target: '_blank', rel: 'noopener' }, 'Open Instagram', ui.icon('ext', 13)) : null)
      : null
  );
}

function ideaCard(ui, it) {
  const { h } = ui;
  return h(
    'article',
    { class: 'card idea' },
    h('div', { class: 'up-top' }, h('span', { class: 'pill info' }, it.kind), h('a', { class: 'meta', href: it.link, target: '_blank', rel: 'noopener' }, 'Open page ', ui.icon('ext', 12))),
    h('h3', {}, it.title),
    h('pre', { class: 'caption' }, it.caption),
    h(
      'button',
      {
        class: 'btn',
        type: 'button',
        onclick: async (e) => {
          const btn = e.currentTarget;
          try {
            await navigator.clipboard.writeText(it.caption);
            btn.textContent = 'Copied ✓';
          } catch {
            prompt('Copy this caption:', it.caption);
          }
        },
      },
      'Copy caption'
    )
  );
}
