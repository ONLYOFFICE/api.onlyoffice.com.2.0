import {type Meta} from "@storybook/preact"
import {type JSX, h} from "preact"
import {Breadcrumb, BreadcrumbCrumb} from "./main.tsx"

export default {
  title: "UI Foundation / Breadcrumb",
} satisfies Meta

export function Default(): JSX.Element {
  return <Breadcrumb aria-label="Breadcrumb">
    <BreadcrumbCrumb href="/">First</BreadcrumbCrumb>
    <BreadcrumbCrumb href="/">Second</BreadcrumbCrumb>
    <BreadcrumbCrumb href="/">Third</BreadcrumbCrumb>
    <BreadcrumbCrumb href="/">In the middle</BreadcrumbCrumb>
    <BreadcrumbCrumb href="/">Fourth</BreadcrumbCrumb>
    <BreadcrumbCrumb href="/">Fifth</BreadcrumbCrumb>
    <BreadcrumbCrumb href="/">Sixth</BreadcrumbCrumb>
  </Breadcrumb>
}
