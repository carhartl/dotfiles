// Run: node ~/.pi/agent/tests/rainbow-header.mjs [Pi package directory]
import assert from 'node:assert/strict';
import { pathToFileURL } from 'node:url';
import { dirname, resolve } from 'node:path';
import { fileURLToPath } from 'node:url';

const root = process.argv[2] ?? '/opt/homebrew/opt/pi-coding-agent/libexec/lib/node_modules/@earendil-works/pi-coding-agent';
const load = (path) => import(pathToFileURL(resolve(root, path)).href);
const { loadExtensions } = await load('dist/core/extensions/loader.js');
const { theme, initTheme } = await load('dist/modes/interactive/theme/theme.js');
initTheme('dark');
const { KeybindingsManager } = await load('dist/core/keybindings.js');
const { setKeybindings, visibleWidth } = await load('node_modules/@earendil-works/pi-tui/dist/index.js');
setKeybindings(new KeybindingsManager({ 'app.interrupt': ['ctrl+x'], 'app.tools.expand': ['ctrl+y'] }));
const file = resolve(dirname(fileURLToPath(import.meta.url)), '../extensions/rainbow-header.ts');
const result = await loadExtensions([file], process.cwd());
assert.deepEqual(result.errors, [], 'extension must load');
const extension = result.extensions[0];
let factory;
const ctx = { mode: 'tui', ui: { setHeader(value) { factory = value; } } };
for (const handler of extension.handlers.get('session_start')) await handler({ reason: 'startup' }, ctx);
assert.equal(typeof factory, 'function');
const component = factory({}, theme);
const plain = (lines) => lines.join('\n').replace(/\x1b\[[0-9;]*m/g, '');
const compact = component.render(100);
assert.match(plain(compact), /ctrl\+x interrupt/);
assert.match(plain(compact), /ctrl\+y more/);
assert.match(plain(compact), /█▀█ /, 'preserve logo silhouette');
assert.match(plain(compact), /█▀ █/);
assert.ok(new Set(compact.join('').match(/\x1b\[(?:38|48);[^m]+m/g)).size > 30, 'smooth gradient across the header');
for (const line of compact.filter((line) => /interrupt|startup help|Pi can explain/.test(plain([line])))) {
  assert.ok((line.match(/\x1b\[38;/g) ?? []).length > 20, 'hints and onboarding also receive the gradient');
}
assert.deepEqual(component.render(100), compact, 'gradient is static');
component.setExpanded(true);
const expanded = component.render(100);
assert.ok(expanded.length > compact.length);
assert.match(plain(expanded), /to cycle thinking level/);
assert.match(plain(expanded), /to paste/);
for (const width of [1, 4, 12, 40, 100]) {
  for (const expanded of [false, true]) {
    component.setExpanded(expanded);
    component.invalidate();
    assert.ok(component.render(width).every((line) => visibleWidth(line) <= width), `fits ${width} columns`);
  }
}
await extension.commands.get('builtin-header').handler('', ctx);
assert.equal(factory, undefined, 'restore original header');
ctx.mode = 'print';
for (const handler of extension.handlers.get('session_start')) await handler({}, ctx);
assert.equal(factory, undefined, 'no header outside TUI');
console.log('PASS: rainbow, configured hints, expandable help, narrow widths, restore, and non-TUI guard');
