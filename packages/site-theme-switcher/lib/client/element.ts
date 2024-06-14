interface State {
  darkTheme: string
  lightTheme: string
  themePreference: string
}

export class ThemeSwitcher extends HTMLElement {
  static get tagName(): string {
    return "theme-switcher"
  }

  get #state(): State {
    const d = localStorage.getItem(ThemeSwitcher.tagName)
    if (!d) {
      return {
        darkTheme: "regular",
        lightTheme: "regular",
        themePreference: "auto"
      }
    }
    return JSON.parse(d)
  }

  set #state(s: State | null) {
    if (!s) {
      localStorage.removeItem(ThemeSwitcher.tagName)
      return
    }
    const d = JSON.stringify(s)
    localStorage.setItem(ThemeSwitcher.tagName, d)
  }

  connectedCallback(): void {
    const s = this.#state
    this.#set(s)

    const rc = this.querySelector("radiogroup-container")
    if (!rc) {
      return
    }

    if (rc.radios.length !== 0) {
      for (const [i, r] of rc.radios.entries()) {
        if (r.dataset.value === s.themePreference) {
          rc.check(i)
          break
        }
      }
    } else {
      for (const r of rc.querySelectorAll<HTMLElement>('[role="radio"]')) {
        if (r.dataset.value === s.themePreference) {
          r.ariaChecked = "true"
        }
      }
    }

    rc.addEventListener("radiogroupcontainerchange", (ev) => {
      const s = this.#state
      s.themePreference = "auto"
      if (ev.radioValue) {
        s.themePreference = ev.radioValue
      }
      this.#set(s)
      this.#state = s
    })
  }

  #set(s: State): void {
    const d = document.documentElement.dataset
    d.darkTheme = s.darkTheme
    d.lightTheme = s.lightTheme
    d.themePreference = s.themePreference
  }
}
