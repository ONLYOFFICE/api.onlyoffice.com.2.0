const d: Record<string, string> = {
  "bash": "bash",
  "c#": "cs",
  "c++": "cpp",
  "csharp": "cs",
  "css": "css",
  "go": "go",
  "groovy": "groovy",
  "html": "html",
  "http": "http",
  "ini": "ini",
  "java": "java",
  "javascript": "js",
  "js": "js",
  "json": "json",
  "json5": "json5",
  "jsx": "jsx",
  "kotlin": "kt",
  "php": "php",
  "powershell": "ps1",
  "python": "py",
  "ruby": "rb",
  "shell": "sh",
  "swift": "swift",
  "tsx": "tsx",
  "txt": "txt",
  "ts": "ts",
  "typescript": "ts",
  "vb": "vb",
  "vue": "vue",
  "xml": "xml",
  "yaml": "yaml",
  "yml": "yml",
}

export function langToExt(l: string): string {
  l = l.trim().toLowerCase()

  const e = d[l]
  if (!e) {
    return ""
  }

  return `.${e}`
}
