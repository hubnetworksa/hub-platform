/** Origin and WebAuthn RP ID for this request (the app's own hostname). */
export function originOf(request: Request): { origin: string; rpId: string } {
  const u = new URL(request.url);
  return { origin: u.origin, rpId: u.hostname };
}
