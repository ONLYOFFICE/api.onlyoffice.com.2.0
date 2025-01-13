import * as Elements from "@onlyoffice/preact-elements"
import {clsx} from "clsx"
import {type JSX} from "preact"

export interface ArticleProperties extends Elements.DivProperties {
  variant?: "default" | "narrow" | "wide"
}

export function Article(p: ArticleProperties): JSX.Element {
  const {variant, ...o} = p
  o.class = clsx("article", variant && `article_variant_${variant}`, p.class)

  return <article-container>
    <Elements.Div {...o} />
  </article-container>
}

export function ArticleBreadcrumb(p: Elements.DivProperties): JSX.Element {
  const {...o} = p
  o.class = clsx("article__breadcrumb", p.class)
  return <Elements.Div {...o} />
}

export function ArticleSidebar(p: Elements.DivProperties): JSX.Element {
  const {...o} = p
  o.class = clsx("article__sidebar", p.class)
  return <Elements.Div {...o} />
}

export function ArticleContent(p: Elements.DivProperties): JSX.Element {
  const {...o} = p
  o.class = clsx("article__content", p.class)
  return <Elements.Div {...o} />
}

export function ArticleHelp(p: Elements.DivProperties): JSX.Element {
  const {...o} = p
  o.class = clsx("article__help", p.class)
  return <Elements.Div {...o} />
}
