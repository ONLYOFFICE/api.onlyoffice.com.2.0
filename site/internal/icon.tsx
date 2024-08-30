import * as rich24 from "@onlyoffice/ui-icons/rich/24.tsx"
import * as rich32 from "@onlyoffice/ui-icons/rich/32.tsx"
import * as rich48 from "@onlyoffice/ui-icons/rich/48.tsx"
import * as rich64 from "@onlyoffice/ui-icons/rich/64.tsx"
import {type JSX, h} from "preact"

type InternalIcon = typeof rich32.DesktopEditorsIcon
type InternalIconProperties = Parameters<InternalIcon>[0]

export interface IconProperties extends InternalIconProperties {
  src: "rich24" | "rich32" | "rich48" | "rich64"
  name: string
}

export function Icon(p: IconProperties): JSX.Element {
  const {src, name, ...props} = p

  const s = icons[src]
  if (!s) {
    throw new Error(`The icon set '${src}' does not exist.`)
  }

  const I = s[name]
  if (!I) {
    throw new Error(`The icon '${name}' does not exist in the '${src}' icon set.`)
  }

  return <I {...props} />
}

const icons: Record<IconProperties["src"], Record<string, InternalIcon>> = {
  rich24: {
    "bug": rich24.BugIcon,
    "desktop-editors": rich24.DesktopEditorsIcon,
    "docs-api": rich24.DocsApiIcon,
    "docspace-api": rich24.DocspaceApiIcon,
    "document-builder": rich24.DocumentBuilderIcon,
    "github": rich24.GithubIcon,
    "javascript-sdk": rich24.JavascriptSdkIcon,
    "office-api": rich24.OfficeApiIcon,
    "plugins": rich24.PluginsIcon,
    "self-hosted": rich24.SelfHostedIcon,
  },
  rich32: {
    "desktop-editors": rich32.DesktopEditorsIcon,
    "docs-api": rich32.DocsApiIcon,
    "docspace-api": rich32.DocspaceApiIcon,
    "document-builder": rich32.DocumentBuilderIcon,
    "javascript-sdk": rich32.JavascriptSdkIcon,
    "office-api": rich32.OfficeApiIcon,
    "plugins": rich32.PluginsIcon,
    "self-hosted": rich32.SelfHostedIcon,
    "workspace-api": rich32.WorkspaceApiIcon,
  },
  rich48: {
    "desktop-editors": rich48.DesktopEditorsIcon,
    "docs-api": rich48.DocsApiIcon,
    "docspace-api": rich48.DocspaceApiIcon,
    "document-builder": rich48.DocumentBuilderIcon,
    "javascript-sdk": rich48.JavascriptSdkIcon,
    "office-api": rich48.OfficeApiIcon,
    "plugins": rich48.PluginsIcon,
    "self-hosted": rich48.SelfHostedIcon,
    "workspace-api": rich48.WorkspaceApiIcon,
  },
  rich64: {
    "desktop-editors": rich64.DesktopEditorsIcon,
    "docs-api": rich64.DocsApiIcon,
    "docspace-api": rich64.DocspaceApiIcon,
    "document-builder": rich64.DocumentBuilderIcon,
    "javascript-sdk": rich64.JavascriptSdkIcon,
    "office-api": rich64.OfficeApiIcon,
    "plugins": rich64.PluginsIcon,
    "self-hosted": rich64.SelfHostedIcon,
    "workspace-api": rich64.WorkspaceApiIcon,
  },
}
