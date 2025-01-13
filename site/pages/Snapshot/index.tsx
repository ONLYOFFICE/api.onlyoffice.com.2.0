import {snapshot} from "@onlyoffice/eleventy-snapshot"
import {type Data} from "@onlyoffice/eleventy-types"
import {Content} from "@onlyoffice/site-kit"
import {Fragment, type JSX, h} from "preact"

export function data(): Data {
  return {
    layout: "page",
    eleventyExcludeFromCollections: true,
  }
}

export function render(): JSX.Element {
  return <Content>
    {snapshot.gitTag && <>
      Tag: {snapshot.gitTag}<br />
    </>}
    {snapshot.gitBranch && <>
      Branch: {snapshot.gitBranch}<br />
    </>}
    {snapshot.gitCommit && <>
      Commit: {snapshot.gitCommit}<br />
    </>}
    {snapshot.githubTagUrl && <>
      <a href={snapshot.githubTagUrl}>{snapshot.githubTagUrl}</a><br />
    </>}
    {snapshot.githubBranchUrl && <>
      <a href={snapshot.githubBranchUrl}>{snapshot.githubBranchUrl}</a><br />
    </>}
    {snapshot.githubCommitUrl && <>
      <a href={snapshot.githubCommitUrl}>{snapshot.githubCommitUrl}</a><br />
    </>}
    {snapshot.githubRunUrl && <>
      <a href={snapshot.githubRunUrl}>{snapshot.githubRunUrl}</a><br />
    </>}
    {snapshot.giteaTagUrl && <>
      <a href={snapshot.giteaTagUrl}>{snapshot.giteaTagUrl}</a><br />
    </>}
    {snapshot.giteaBranchUrl && <>
      <a href={snapshot.giteaBranchUrl}>{snapshot.giteaBranchUrl}</a><br />
    </>}
    {snapshot.giteaCommitUrl && <>
      <a href={snapshot.giteaCommitUrl}>{snapshot.giteaCommitUrl}</a><br />
    </>}
    {snapshot.giteaRunUrl && <>
      <a href={snapshot.giteaRunUrl}>{snapshot.giteaRunUrl}</a><br />
    </>}
    {snapshot.capturedAt && <>
      Captured at: {snapshot.capturedAt}<br />
    </>}
  </Content>
}
