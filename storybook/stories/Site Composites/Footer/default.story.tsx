import {
  Footer,
  FooterContainer,
  FooterCopyright,
  FooterList,
  FooterListItem,
  FooterNavigation,
  FooterThemeSwitcher,
} from "@onlyoffice/site-kit"
import {type Meta, type StoryObj} from "@storybook/preact"
import {h} from "preact"

export default {
  title: "Site Composites / Footer",
} satisfies Meta

export const Default: StoryObj = {
  parameters: {
    controls: {
      disable: true,
    },
    actions: {
      disable: true,
    },
  },
  render() {
    return <Footer>
      <FooterContainer>
        <FooterNavigation>
          <h3>Get Help</h3>
          <FooterList>
            <FooterListItem>
              <a href="/">home</a>
            </FooterListItem>
            <FooterListItem>
              <a href="/">too looooooooooooooooong</a>
            </FooterListItem>
          </FooterList>
        </FooterNavigation>
        <FooterNavigation>
          <h3>Try Now</h3>
          <FooterList>
            <FooterListItem>
              <a href="/">home</a>
            </FooterListItem>
          </FooterList>
        </FooterNavigation>
      </FooterContainer>
      <FooterThemeSwitcher>
        theme switcher
      </FooterThemeSwitcher>
      <FooterCopyright>
        <a href="/">onlyoffice.com</a>
        <p>© Ascensio System SIA 2024. All right reserved</p>
      </FooterCopyright>
    </Footer>
  },
}
