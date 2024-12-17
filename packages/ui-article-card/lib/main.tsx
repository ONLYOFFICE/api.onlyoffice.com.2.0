import {type ChildrenIncludable} from "@onlyoffice/preact-types"
import {type JSX} from "preact"

export function ArticleCard(p: ChildrenIncludable): JSX.Element {
  return <article class="article-card">{p.children}</article>
}

export function ArticleCardPreview(p: ChildrenIncludable): JSX.Element {
  return <div class="article-card__preview">{p.children}</div>
}

export function ArticleCardContent(p: ChildrenIncludable): JSX.Element {
  return <div class="article-card__content">{p.children}</div>
}
