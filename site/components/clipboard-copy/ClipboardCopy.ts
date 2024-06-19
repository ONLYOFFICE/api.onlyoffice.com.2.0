// https://github.com/github/clipboard-copy-element/blob/main/src/clipboard-copy-element.ts

declare global {
  interface Window {
    ClipboardCopy: typeof ClipboardCopy
  }

  interface HTMLElementTagNameMap {
    "oe-clipboard-copy": ClipboardCopy
  }
}

function define(): void {
  if (!window.customElements.get("oe-clipboard-copy")) {
    window.ClipboardCopy = ClipboardCopy
    window.customElements.define("oe-clipboard-copy", ClipboardCopy)
  }
}

export class ClipboardCopy extends HTMLElement {
  get for(): string {
    return this.getAttribute("for") || ""
  }

  set for(selector: string) {
    this.setAttribute("for", selector)
  }

  connectedCallback(): void {
    this.addEventListener("click", handleClick)

    if (!this.hasAttribute("role")) {
      this.setAttribute("role", "button")
    }
  }
}

function handleClick(e: MouseEvent): void {
  const t = e.currentTarget
  if (t instanceof HTMLElement) {
    copy(t)
  }
}

async function copy(e: HTMLElement): Promise<void> {
  const id = e.getAttribute("for")
  if (!id) {
    return
  }

  let r: Node = e.ownerDocument
  if ("getRootNode" in e) {
    r = e.getRootNode()
  }

  if (!(r instanceof Document)) {
    return
  }

  const t = r.querySelector(id)
  if (!t) {
    return
  }

  switch (true) {
  case t instanceof HTMLInputElement:
  case t instanceof HTMLTextAreaElement:
    await copyText(t.value)
    dispatch(e)
    break
  case t instanceof HTMLAnchorElement && t.hasAttribute("href"):
    await copyText(t.href)
    dispatch(e)
    break
  default:
    await copyNode(t)
    dispatch(e)
    break
  }
}

async function copyText(t: string): Promise<void> {
  if ("clipboard" in navigator) {
    await navigator.clipboard.writeText(t)
    return
  }

  const b = document.body
  if (!b) {
    throw new Error("document.body is null")
  }

  const n = createNode(t)
  b.appendChild(n)
  copyNode(n)
  b.removeChild(n)
}

export async function copyNode(e: Element): Promise<void> {
  if ("clipboard" in navigator) {
    await navigator.clipboard.writeText(e.textContent || '')
    return
  }

  const s = getSelection()
  if (!s) {
    throw new Error("getSelection() is null")
  }

  s.removeAllRanges()

  const r = document.createRange()
  r.selectNodeContents(e)
  s.addRange(r)

  document.execCommand("copy")
  s.removeAllRanges()
}

function createNode(t: string): Element {
  const n = document.createElement("pre")
  n.style.width = "1px"
  n.style.height = "1px"
  n.style.position = "fixed"
  n.style.top = "5px"
  n.textContent = t
  return n
}

function dispatch(e: HTMLElement): void {
  const cv = new CustomEvent("oe-clipboard-copy", {bubbles: true})
  e.dispatchEvent(cv)
}

define()
