import { getRepRef } from './rep-ref';

const clean = (s: string) => s.toUpperCase().replace(/[^A-Z0-9]/g, '');

/**
 * Wires an optional "Rep code" input: pre-fills from a stored share link,
 * normalises as the user types, and shows a non-blocking validity hint.
 * Returns a getter for the normalised current value ('' when empty).
 */
export function attachRepCodeField(input: HTMLInputElement, statusEl: HTMLElement): () => string {
  let timer: number | undefined;
  let seq = 0;

  const setStatus = (text: string, color: string) => {
    statusEl.textContent = text;
    statusEl.style.color = color;
  };

  async function validate() {
    const code = clean(input.value);
    const mine = ++seq;
    if (code.length < 4) {
      setStatus('', '');
      return;
    }
    try {
      const res = await fetch(`/api/rep/validate?code=${encodeURIComponent(code)}`);
      if (!res.ok) throw new Error('unavailable');
      const data = (await res.json()) as { ok?: boolean; valid?: boolean };
      if (mine !== seq) return;
      if (data.ok && data.valid === true) setStatus('Rep code applied ✓', '#1a7f37');
      else if (data.ok && data.valid === false) setStatus('Code not recognised', 'var(--muted)');
      else setStatus('', '');
    } catch {
      if (mine === seq) setStatus('', '');
    }
  }

  if (!input.value) {
    const ref = getRepRef();
    if (ref) input.value = ref;
  }

  input.addEventListener('input', () => {
    const cleaned = clean(input.value);
    if (cleaned !== input.value) input.value = cleaned;
    window.clearTimeout(timer);
    if (!cleaned) {
      seq++;
      setStatus('', '');
      return;
    }
    timer = window.setTimeout(validate, 400);
  });

  if (input.value) {
    input.value = clean(input.value);
    void validate();
  }

  return () => clean(input.value);
}
