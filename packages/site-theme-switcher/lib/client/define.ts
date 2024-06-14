import {ThemeSwitcher} from "./element.ts"

declare global {
  interface Window {
    ThemeSwitcher: typeof ThemeSwitcher
  }

  interface HTMLElementTagNameMap {
    "theme-switcher": ThemeSwitcher
  }

  namespace preact {
    namespace JSX {
      interface IntrinsicElements {
        "theme-switcher": HTMLAttributes<ThemeSwitcher>
      }
    }
  }
}

export function define(): void {
  if (window.customElements.get(ThemeSwitcher.tagName)) {
    return
  }
  window.ThemeSwitcher = ThemeSwitcher
  window.customElements.define(ThemeSwitcher.tagName, ThemeSwitcher)
}
