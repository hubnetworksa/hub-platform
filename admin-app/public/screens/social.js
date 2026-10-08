// Social: Facebook and Instagram for each city. The setup checklist (shared
// by every admin), the page links, and ready-to-post captions from what's new
// on each site, to copy into Facebook / Instagram until automatic posting is
// switched on (SOCIALS-PLAN.md).

export async function render(view, ui) {
  const { h, fill, api } = ui;
  ui.page({ title: ['Social', ui.help(ui.HELP.social.title)], context: 'Captions ready to post — nothing posts automatically' });
  fill(view, ui.state.loading());
  let d;
  try {
    d = await api('/api/social');
  } catch (e) {
    fill(view, ui.state.error(e));
    return;
  }
  if (!d.sites.length) {
    fill(view, ui.state.empty('No sites to show yet.'));
    return;
  }
  const cityTab = (s) => () => {
    const title = h('span', {}, '');
    const fillBar = h('span', {});
    const sync = () => {
      const done = s.steps.filter(Boolean).length;
      title.textContent = `Setup: ${done} of ${d.steps.length} done`;
      fillBar.style.width = `${Math.max(1, (done / d.steps.length) * 100)}%`;
    };
    sync();
    const checklist = ui.card({
      title: title,
      body: h(
        'div',
        {},
        h('div', { class: 'meter' }, fillBar),
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
                    const box = e.target;
                    const was = s.steps[i];
                    s.steps[i] = box.checked;
                    sync();
                    try {
                      await api('/api/social', 'POST', { site: s.slug, step: i, done: s.steps[i] });
                    } catch (err) {
                      s.steps[i] = was;
                      box.checked = was;
                      sync();
                      alert(err.message);
                    }
                  },
                }),
                label
              )
            )
          )
        ),
        h('p', { class: 'note' }, 'Step-by-step instructions, names, bios and images: SOCIALS-PLAN.md and social/<city>/ in the repository.')
      ),
    });
    return h(
      'div',
      { class: 'stack' },
      h('div', { class: 'two' }, checklist, linksCard(ui, s)),
      h('h3', {}, 'Ready to post'),
      s.ideas.length
        ? h('div', { class: 'ideas' }, s.ideas.map((it) => ideaCard(ui, it)))
        : ui.card({ body: ui.state.empty('Nothing new this week. Captions appear here for new listings (last 7 days), events in the next 10 days and news from the last 3 days.') }),
      h('p', { class: 'note' }, 'Follower numbers and automatic daily posting need the Pages connected to Meta’s API (section 3 of SOCIALS-PLAN.md). Until then, copy a caption and post it with the matching image from the site.')
    );
  };
  fill(view, ui.tabs(d.sites.map((s) => ({ id: s.slug, label: ui.siteName(s.slug), render: cityTab(s) })), { store: 'hub.tab.social' }));
}

function linksCard(ui, s) {
  const { h, api } = ui;
  const fb = h('input', { class: 'input', type: 'url', placeholder: 'https://www.facebook.com/…', value: s.facebook ?? '' });
  const ig = h('input', { class: 'input', type: 'url', placeholder: 'https://www.instagram.com/…', value: s.instagram ?? '' });
  const msg = h('p', { class: 'msg', role: 'status' });
  const form = h(
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
    );
  const chips =
    s.facebook || s.instagram
      ? h('div', { class: 'chips' }, s.facebook ? h('a', { class: 'btn small', href: s.facebook, target: '_blank', rel: 'noopener' }, 'Open Facebook', ui.icon('ext', 13)) : null, s.instagram ? h('a', { class: 'btn small', href: s.instagram, target: '_blank', rel: 'noopener' }, 'Open Instagram', ui.icon('ext', 13)) : null)
      : null;
  return ui.card({ title: 'Page links', body: h('div', {}, form, chips) });
}

function ideaCard(ui, it) {
  const { h } = ui;
  const copyBtn = (label, text) =>
    h(
      'button',
      {
        class: 'btn',
        type: 'button',
        onclick: async (e) => {
          const btn = e.currentTarget;
          try {
            await navigator.clipboard.writeText(text);
            btn.textContent = 'Copied ✓';
          } catch {
            prompt('Copy this caption:', text);
          }
        },
      },
      label
    );
  return h(
    'article',
    { class: 'card idea' },
    h('div', { class: 'up-top' }, h('span', { class: 'pill info' }, it.kind), h('a', { class: 'meta', href: it.link, target: '_blank', rel: 'noopener' }, 'Open page ', ui.icon('ext', 12))),
    h('h3', {}, it.title),
    h('pre', { class: 'caption' }, it.caption),
    // Each network gets its own tagged link, so Analytics can tell them apart.
    h('div', { class: 'row' }, copyBtn('Copy for Facebook', it.caption), copyBtn('Copy for Instagram', it.captionIg || it.caption))
  );
}
