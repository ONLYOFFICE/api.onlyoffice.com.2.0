import type {Meta} from "@storybook/preact"
import {type JSX, h} from "preact"
import {Breadcrumb, BreadcrumbCrumb} from "./main.tsx"

const meta: Meta = {
  title: "UI/Breadcrumb"
}

export function Default(): JSX.Element {
  return <Breadcrumb aria-label="Breadcrumb">
    <BreadcrumbCrumb href="/">Home</BreadcrumbCrumb>
    <BreadcrumbCrumb href="/">Components</BreadcrumbCrumb>
    <BreadcrumbCrumb href="/">Breadcrumb</BreadcrumbCrumb>
  </Breadcrumb>
}

export default meta
