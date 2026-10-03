/** The request's JSON body as an object, or null if it isn't one. */
export async function jsonBody(request: Request): Promise<Record<string, unknown> | null> {
  try {
    const b = await request.json();
    return b && typeof b === 'object' && !Array.isArray(b) ? (b as Record<string, unknown>) : null;
  } catch {
    return null;
  }
}

export function str(v: unknown, max: number): string {
  return typeof v === 'string' ? v.trim().slice(0, max) : '';
}
