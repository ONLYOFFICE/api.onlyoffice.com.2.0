const d: Record<string, string> = {
  "bash": "Bash",
  "c#": "C Sharp",
  "c++": "C++",
  "csharp": "C Sharp",
  "css": "CSS",
  "go": "Go",
  "groovy": "Groovy",
  "html": "HTML",
  "http": "HTTP",
  "ini": "INI",
  "java": "Java",
  "javascript": "JavaScript",
  "js": "JavaScript",
  "json": "JSON",
  "json5": "JSON5",
  "jsx": "JSX",
  "kotlin": "Kotlin",
  "php": "PHP",
  "powershell": "PowerShell",
  "python": "Python",
  "ruby": "Ruby",
  "shell": "Shell",
  "swift": "Swift",
  "tsx": "TSX",
  "txt": "Text",
  "ts": "TypeScript",
  "typescript": "TypeScript",
  "vb": "Visual Basic",
  "vue": "Vue",
  "xml": "XML",
  "yaml": "YAML",
  "yml": "YAML",
}

export function langToTitle(l: string): string {
  l = l.trim().toLowerCase()

  const t = d[l]
  if (!t) {
    return ""
  }

  return t
}
