// What an uploaded image actually is, judged by its first bytes rather than
// the browser-supplied Content-Type (which the uploader controls). Only
// raster formats are accepted: an SVG is a document that can run script, and
// /media/ serves uploads from our own origin.
export type ImageKind = { ext: 'jpg' | 'png' | 'webp'; contentType: string };

export function sniffImage(bytes: ArrayBuffer): ImageKind | null {
  const b = new Uint8Array(bytes.slice(0, 12));
  if (b[0] === 0xff && b[1] === 0xd8 && b[2] === 0xff) return { ext: 'jpg', contentType: 'image/jpeg' };
  if (b[0] === 0x89 && b[1] === 0x50 && b[2] === 0x4e && b[3] === 0x47) return { ext: 'png', contentType: 'image/png' };
  const ascii = (from: number, to: number) => String.fromCharCode(...b.slice(from, to));
  if (ascii(0, 4) === 'RIFF' && ascii(8, 12) === 'WEBP') return { ext: 'webp', contentType: 'image/webp' };
  return null;
}
