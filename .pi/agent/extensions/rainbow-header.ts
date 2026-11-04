import { type ExtensionAPI, keyHint, keyText, rawKeyHint, VERSION } from "@earendil-works/pi-coding-agent";
import { isAppleTerminalSession, rgbColor, stripTerminalSequences, Text, visibleWidth } from "@earendil-works/pi-tui";

export default function (pi: ExtensionAPI) {
	pi.on("session_start", (_event, ctx) => {
		if (ctx.mode !== "tui") return;
		ctx.ui.setHeader((_tui, theme) => {
			let expanded = false;
			return {
				setExpanded(value: boolean) { expanded = value; },
				invalidate() {},
				render(width: number): string[] {
					const top = "█▀█ ";
					const bottom = "█▀ █";
					// shortcut: mirrors Pi 1.5 startup help; update descriptions when Pi changes its actions.
					const hints = expanded ? [
						keyHint("app.interrupt", "to interrupt"),
						keyHint("app.clear", "to clear"),
						rawKeyHint(`${keyText("app.clear")} twice`, "to exit"),
						keyHint("app.exit", "to exit (empty)"),
						keyHint("app.suspend", "to suspend"),
						keyHint("tui.editor.deleteToLineEnd", "to delete to end"),
						keyHint("app.thinking.cycle", "to cycle thinking level"),
						rawKeyHint(`${keyText("app.model.cycleForward")}/${keyText("app.model.cycleBackward")}`, "to cycle models"),
						keyHint("app.model.select", "to select model"),
						keyHint("app.tools.expand", "to expand tools"),
						keyHint("app.thinking.toggle", "to expand thinking"),
						keyHint("app.editor.external", "for external editor"),
						rawKeyHint("/", "for commands"),
						rawKeyHint("!", "to run bash"),
						rawKeyHint("!!", "to run bash (no context)"),
						keyHint("app.message.followUp", "to queue follow-up"),
						keyHint("app.message.dequeue", "to edit all queued messages"),
						keyHint("app.clipboard.pasteImage", "to paste files on macOS, images, or text"),
						rawKeyHint("drop files", "to attach"),
					].join("\n") : [
						keyHint("app.interrupt", "interrupt"),
						rawKeyHint(`${keyText("app.clear")}/${keyText("app.exit")}`, "clear/exit"),
						rawKeyHint("/", "commands"),
						rawKeyHint("!", "bash"),
						keyHint("app.tools.expand", "more"),
					].join(theme.fg("muted", " · "));
					const version = theme.fg("dim", `v${VERSION}`);
					const heading = isAppleTerminalSession()
						? `Pi ${version}\n${hints}`
						: `${top} ${version}\n${bottom} ${hints}`;
					const more = expanded ? "" : `\n${theme.fg("dim", `Press ${keyText("app.tools.expand")} to show full startup help.`)}`;
					const lines = new Text(`${heading}${more}\n\nPi can explain its own features and look up its docs. Ask it how to use or extend Pi.`, 1, 0).render(width);
					// Color after wrapping so the gradient follows the visible terminal columns.
					return lines.map((line, row) => {
						let column = 0;
						return Array.from(stripTerminalSequences(line), (char) => {
							const phase = (column + row * 3) * 0.1;
							column += visibleWidth(char);
							if (char === " ") return char;
							const channel = (offset: number) => Math.round(128 + 127 * Math.sin(phase + offset));
							return theme.style(char, { fg: rgbColor(channel(0), channel(2 * Math.PI / 3), channel(4 * Math.PI / 3)) });
						}).join("");
					});
				},
			};
		});
	});

	pi.registerCommand("builtin-header", {
		description: "Restore Pi's original header and clickable logo for this session",
		handler: async (_args, ctx) => { ctx.ui.setHeader(undefined); },
	});
}
