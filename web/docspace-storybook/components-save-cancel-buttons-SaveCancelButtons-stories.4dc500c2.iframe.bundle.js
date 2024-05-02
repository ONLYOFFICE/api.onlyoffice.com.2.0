"use strict";(self.webpackChunk_docspace_shared=self.webpackChunk_docspace_shared||[]).push([[7293],{"./components/save-cancel-buttons/SaveCancelButtons.stories.tsx":(__unused_webpack_module,__webpack_exports__,__webpack_require__)=>{__webpack_require__.r(__webpack_exports__),__webpack_require__.d(__webpack_exports__,{Default:()=>Default,__namedExportsOrder:()=>__namedExportsOrder,default:()=>SaveCancelButtons_stories});var react=__webpack_require__("../../node_modules/react/index.js"),styled_components_browser_esm=__webpack_require__("../../node_modules/styled-components/dist/styled-components.browser.esm.js"),enums=__webpack_require__("./enums/index.ts"),utils=__webpack_require__("./utils/index.ts"),components_button=__webpack_require__("./components/button/index.tsx"),components_text=__webpack_require__("./components/text/index.tsx"),themes=__webpack_require__("./themes/index.ts");const displaySettings=styled_components_browser_esm.AH`
  position: absolute;
  display: block;
  flex-direction: column-reverse;
  align-items: flex-start;
  border-top: ${props=>!props.hasScroll||props.showReminder||props.hideBorder?"none":"1px solid #ECEEF1"};

  ${props=>props.hasScroll&&styled_components_browser_esm.AH`
      bottom: auto;
    `}

  .buttons-flex {
    display: flex;
    width: 100%;

    box-sizing: border-box;

    @media ${utils.Hw} {
      padding: 16px;
      bottom: 0;
    }
  }

  .unsaved-changes {
    position: absolute;
    padding-top: 16px;
    padding-bottom: 16px;
    font-size: 12px;
    font-weight: 600;
    width: calc(100% - 32px);
    bottom: 56px;
    background-color: ${props=>props.hasScroll?props.theme.mainButtonMobile.buttonWrapper.background:"none"};

    @media ${utils.Hw} {
      ${props=>"rtl"===props.theme.interfaceDirection?styled_components_browser_esm.AH`
              padding-right: 16px;
            `:styled_components_browser_esm.AH`
              padding-left: 16px;
            `}
    }
  }

  ${props=>props.showReminder&&props.hasScroll&&styled_components_browser_esm.AH`
      .unsaved-changes {
        border-top: 1px solid #eceef1;
        width: calc(100% - 16px);

        ${"rtl"===props.theme.interfaceDirection?styled_components_browser_esm.AH`
              right: 0;
              padding-right: 16px;
            `:styled_components_browser_esm.AH`
              left: 0;
              padding-left: 16px;
            `}
      }
    `}
`,tabletButtons=styled_components_browser_esm.AH`
  position: static;
  display: flex;
  max-width: none;
  flex-direction: row;
  justify-content: flex-start;
  align-items: center;

  border-top: none;

  .buttons-flex {
    width: auto;
  }

  .unsaved-changes {
    border-top: none;
    position: static;
    padding: 0;
    margin-bottom: 0;

    ${props=>"rtl"===props.theme.interfaceDirection?"margin-right: 8px;":"margin-left: 8px;"}
  }
`,StyledSaveCancelButtons=styled_components_browser_esm.Ay.div`
  display: flex;
  position: absolute;
  justify-content: space-between;
  box-sizing: border-box;
  align-items: center;
  bottom: ${props=>props.theme.saveCancelButtons.bottom};
  width: ${props=>props.theme.saveCancelButtons.width};
  background-color: ${({theme})=>theme.backgroundColor};

  ${props=>"rtl"===props.theme.interfaceDirection?`right: ${props.theme.saveCancelButtons.left};`:`left: ${props.theme.saveCancelButtons.left};`}

  .save-button {
    ${props=>"rtl"===props.theme.interfaceDirection?styled_components_browser_esm.AH`
            margin-left: ${props.theme.saveCancelButtons.marginRight};
          `:styled_components_browser_esm.AH`
            margin-right: ${props.theme.saveCancelButtons.marginRight};
          `}
  }
  .unsaved-changes {
    color: ${props=>props.theme.saveCancelButtons.unsavedColor};
  }

  ${props=>props.displaySettings&&displaySettings};

  @media ${utils.OL} {
    ${props=>props.displaySettings&&tabletButtons}
    ${props=>!props.displaySettings&&styled_components_browser_esm.AH`
        justify-content: flex-end;
        position: fixed;

        .unsaved-changes {
          display: none;
        }
      `}
  }

  @media ${utils.Hw} {
    position: fixed;
    inset-inline: 0;
    bottom: 0;
    ${({showReminder})=>showReminder&&styled_components_browser_esm.AH`
        padding-top: 30px;
      `}
  }
`;StyledSaveCancelButtons.defaultProps={theme:themes.C6};const SaveCancelButton_styled=StyledSaveCancelButtons;var jsx_runtime=__webpack_require__("../../node_modules/react/jsx-runtime.js");const SaveCancelButtons=({id,className,reminderText,saveButtonLabel="Save",cancelButtonLabel="Cancel",onCancelClick,onSaveClick,showReminder,displaySettings,disableRestoreToDefault,hasScroll,isSaving,cancelEnable,tabIndex,hideBorder,additionalClassSaveButton,additionalClassCancelButton,saveButtonDisabled})=>{const onKeydown=react.useCallback((e=>{if(!displaySettings)switch(e.key){case enums.Hl.enter:onSaveClick?.();break;case enums.Hl.esc:onCancelClick?.()}}),[displaySettings,onCancelClick,onSaveClick]);react.useEffect((()=>(document.addEventListener("keydown",onKeydown,!1),()=>{document.removeEventListener("keydown",onKeydown,!1)})),[onKeydown]);const cancelButtonDisabled=!cancelEnable&&("boolean"==typeof disableRestoreToDefault?disableRestoreToDefault:!showReminder),tabIndexSaveButton=tabIndex||-1,tabIndexCancelButton=tabIndex?tabIndex+1:-1,classNameSave=additionalClassSaveButton?`save-button ${additionalClassSaveButton}`:"save-button",classNameCancel=additionalClassCancelButton?`cancel-button ${additionalClassCancelButton}`:"cancel-button",buttonSize=(0,utils.xl)()?components_button.M.small:components_button.M.normal;return(0,jsx_runtime.jsxs)(SaveCancelButton_styled,{className,id,displaySettings,showReminder,hasScroll,hideBorder,"data-testid":"save-cancel-buttons",children:[(0,jsx_runtime.jsxs)("div",{className:"buttons-flex",children:[(0,jsx_runtime.jsx)(components_button.$,{tabIndex:tabIndexSaveButton,className:classNameSave,size:buttonSize,isDisabled:!showReminder||saveButtonDisabled,primary:!0,onClick:onSaveClick,label:saveButtonLabel,minWidth:displaySettings?"auto":"",isLoading:isSaving,scale:(0,utils.Fr)()}),(0,jsx_runtime.jsx)(components_button.$,{tabIndex:tabIndexCancelButton,className:classNameCancel,size:buttonSize,isDisabled:cancelButtonDisabled||isSaving,onClick:onCancelClick,label:cancelButtonLabel,minWidth:displaySettings?"auto":"",scale:(0,utils.Fr)()})]}),showReminder&&reminderText&&(0,jsx_runtime.jsx)(components_text.E,{className:"unsaved-changes",children:reminderText})]})};SaveCancelButtons.displayName="SaveCancelButtons";try{SaveCancelButtons.displayName="SaveCancelButtons",SaveCancelButtons.__docgenInfo={description:"",displayName:"SaveCancelButtons",props:{id:{defaultValue:null,description:"Accepts css id",name:"id",required:!1,type:{name:"string"}},className:{defaultValue:null,description:"Accepts css class",name:"className",required:!1,type:{name:"string"}},reminderText:{defaultValue:null,description:"Message text that notifies of the unsaved changes",name:"reminderText",required:!1,type:{name:"string"}},saveButtonLabel:{defaultValue:{value:"Save"},description:"Save button label",name:"saveButtonLabel",required:!1,type:{name:"string"}},cancelButtonLabel:{defaultValue:{value:"Cancel"},description:"Cancel button label",name:"cancelButtonLabel",required:!1,type:{name:"string"}},onSaveClick:{defaultValue:null,description:"Sets a callback function that is triggered when the save button is clicked",name:"onSaveClick",required:!1,type:{name:"(() => void)"}},onCancelClick:{defaultValue:null,description:"Sets a callback function that is triggered when the cancel button is clicked",name:"onCancelClick",required:!1,type:{name:"(() => void)"}},showReminder:{defaultValue:null,description:"Reminder message that notifies of the unsaved changes (Only shown on desktops)",name:"showReminder",required:!1,type:{name:"boolean"}},displaySettings:{defaultValue:null,description:"Sets save and cancel buttons block to 'position: static' instead of absolute",name:"displaySettings",required:!1,type:{name:"boolean"}},hasScroll:{defaultValue:null,description:"Displays the scrollbar",name:"hasScroll",required:!1,type:{name:"boolean"}},minwidth:{defaultValue:null,description:"Sets the min width of the button",name:"minwidth",required:!1,type:{name:"string"}},disableRestoreToDefault:{defaultValue:null,description:"Sets the Cancel button disabled by default",name:"disableRestoreToDefault",required:!1,type:{name:"boolean"}},isSaving:{defaultValue:null,description:"Sets the button to present a disabled state while executing an operation after clicking the save button",name:"isSaving",required:!1,type:{name:"boolean"}},cancelEnable:{defaultValue:null,description:"Activates the disabled button",name:"cancelEnable",required:!1,type:{name:"boolean"}},tabIndex:{defaultValue:null,description:"Accepts css tab-index",name:"tabIndex",required:!1,type:{name:"number"}},hideBorder:{defaultValue:null,description:"Hide top border",name:"hideBorder",required:!1,type:{name:"boolean"}},additionalClassSaveButton:{defaultValue:null,description:"",name:"additionalClassSaveButton",required:!1,type:{name:"string"}},additionalClassCancelButton:{defaultValue:null,description:"",name:"additionalClassCancelButton",required:!1,type:{name:"string"}},saveButtonDisabled:{defaultValue:null,description:"",name:"saveButtonDisabled",required:!1,type:{name:"boolean"}}}},"undefined"!=typeof STORYBOOK_REACT_CLASSES&&(STORYBOOK_REACT_CLASSES["components/save-cancel-buttons/SaveCancelButton.tsx#SaveCancelButtons"]={docgenInfo:SaveCancelButtons.__docgenInfo,name:"SaveCancelButtons",path:"components/save-cancel-buttons/SaveCancelButton.tsx#SaveCancelButtons"})}catch(__react_docgen_typescript_loader_error){}try{SaveCancelButtons.displayName="SaveCancelButtons",__function.__docgenInfo={description:"",displayName:"SaveCancelButtons",props:{id:{defaultValue:null,description:"Accepts css id",name:"id",required:!1,type:{name:"string | undefined"}},className:{defaultValue:null,description:"Accepts css class",name:"className",required:!1,type:{name:"string | undefined"}},reminderText:{defaultValue:null,description:"Message text that notifies of the unsaved changes",name:"reminderText",required:!1,type:{name:"string | undefined"}},saveButtonLabel:{defaultValue:{value:"Save"},description:"Save button label",name:"saveButtonLabel",required:!1,type:{name:"string | undefined"}},cancelButtonLabel:{defaultValue:{value:"Cancel"},description:"Cancel button label",name:"cancelButtonLabel",required:!1,type:{name:"string | undefined"}},onSaveClick:{defaultValue:null,description:"Sets a callback function that is triggered when the save button is clicked",name:"onSaveClick",required:!1,type:{name:"(() => void) | undefined"}},onCancelClick:{defaultValue:null,description:"Sets a callback function that is triggered when the cancel button is clicked",name:"onCancelClick",required:!1,type:{name:"(() => void) | undefined"}},showReminder:{defaultValue:null,description:"Reminder message that notifies of the unsaved changes (Only shown on desktops)",name:"showReminder",required:!1,type:{name:"boolean | undefined"}},displaySettings:{defaultValue:null,description:"Sets save and cancel buttons block to 'position: static' instead of absolute",name:"displaySettings",required:!1,type:{name:"boolean | undefined"}},hasScroll:{defaultValue:null,description:"Displays the scrollbar",name:"hasScroll",required:!1,type:{name:"boolean | undefined"}},minwidth:{defaultValue:null,description:"Sets the min width of the button",name:"minwidth",required:!1,type:{name:"string | undefined"}},disableRestoreToDefault:{defaultValue:null,description:"Sets the Cancel button disabled by default",name:"disableRestoreToDefault",required:!1,type:{name:"boolean | undefined"}},isSaving:{defaultValue:null,description:"Sets the button to present a disabled state while executing an operation after clicking the save button",name:"isSaving",required:!1,type:{name:"boolean | undefined"}},cancelEnable:{defaultValue:null,description:"Activates the disabled button",name:"cancelEnable",required:!1,type:{name:"boolean | undefined"}},tabIndex:{defaultValue:null,description:"Accepts css tab-index",name:"tabIndex",required:!1,type:{name:"number | undefined"}},hideBorder:{defaultValue:null,description:"Hide top border",name:"hideBorder",required:!1,type:{name:"boolean | undefined"}},additionalClassSaveButton:{defaultValue:null,description:"",name:"additionalClassSaveButton",required:!1,type:{name:"string | undefined"}},additionalClassCancelButton:{defaultValue:null,description:"",name:"additionalClassCancelButton",required:!1,type:{name:"string | undefined"}},saveButtonDisabled:{defaultValue:null,description:"",name:"saveButtonDisabled",required:!1,type:{name:"boolean | undefined"}}}},"undefined"!=typeof STORYBOOK_REACT_CLASSES&&(STORYBOOK_REACT_CLASSES["components/save-cancel-buttons/SaveCancelButton.tsx#SaveCancelButtons"]={docgenInfo:SaveCancelButtons.__docgenInfo,name:"SaveCancelButtons",path:"components/save-cancel-buttons/SaveCancelButton.tsx#SaveCancelButtons"})}catch(__react_docgen_typescript_loader_error){}const SaveCancelButtons_stories={title:"Components/SaveCancelButtons",component:SaveCancelButtons,parameters:{docs:{description:{component:"Save and cancel buttons are located in the settings sections."}}},argTypes:{onSaveClick:{action:"onSaveClick"},onCancelClick:{action:"onCancelClick"}}},StyledWrapper=styled_components_browser_esm.Ay.div`
  position: relative;
  height: 300px;

  .positionAbsolute {
    position: absolute;
  }
`,Template=({onSaveClick,onCancelClick,...args})=>{const isAutoDocs="undefined"!=typeof window&&window?.location?.href.includes("docs");return(0,jsx_runtime.jsx)(StyledWrapper,{children:(0,jsx_runtime.jsx)(SaveCancelButtons,{...args,className:isAutoDocs&&!args.displaySettings?`positionAbsolute ${args.className}`:args.className,onSaveClick:()=>onSaveClick?.(),onCancelClick:()=>onCancelClick?.()})})};Template.displayName="Template";const Default={render:args=>(0,jsx_runtime.jsx)(Template,{...args}),args:{showReminder:!1,reminderText:"You have unsaved changes",saveButtonLabel:"Save",cancelButtonLabel:"Cancel"}};Default.parameters={...Default.parameters,docs:{...Default.parameters?.docs,source:{originalSource:'{\n  render: args => <Template {...args} />,\n  args: {\n    showReminder: false,\n    reminderText: "You have unsaved changes",\n    saveButtonLabel: "Save",\n    cancelButtonLabel: "Cancel"\n  }\n}',...Default.parameters?.docs?.source}}};const __namedExportsOrder=["Default"]},"./components/button/Button.enums.ts":(__unused_webpack_module,__webpack_exports__,__webpack_require__)=>{__webpack_require__.d(__webpack_exports__,{M:()=>ButtonSize});let ButtonSize=function(ButtonSize){return ButtonSize.extraSmall="extraSmall",ButtonSize.small="small",ButtonSize.normal="normal",ButtonSize.medium="medium",ButtonSize}({})},"./components/button/index.tsx":(__unused_webpack_module,__webpack_exports__,__webpack_require__)=>{__webpack_require__.d(__webpack_exports__,{$:()=>Button_Button,M:()=>Button_enums.M});var Button_enums=__webpack_require__("./components/button/Button.enums.ts"),react=__webpack_require__("../../node_modules/react/index.js"),loader=__webpack_require__("./components/loader/index.tsx"),styled_components_browser_esm=__webpack_require__("../../node_modules/styled-components/dist/styled-components.browser.esm.js"),utils=__webpack_require__("./utils/index.ts"),themes=__webpack_require__("./themes/index.ts"),jsx_runtime=__webpack_require__("../../node_modules/react/jsx-runtime.js");const activeCss=styled_components_browser_esm.AH`
  background-color: ${props=>props.primary?props.theme.button.backgroundColor.primaryActive:props.theme.button.backgroundColor.baseActive};

  color: ${props=>props.primary?props.theme.button.color.primaryActive:props.theme.button.color.baseActive};

  ${props=>props.primary?styled_components_browser_esm.AH`
          border: ${props.theme.button.border.primaryActive};
          box-sizing: ${props.theme.button.boxSizing};
        `:styled_components_browser_esm.AH`
          border: ${props.theme.button.border.baseActive};
          box-sizing: ${props.theme.button.boxSizing};
        `}

  .btnIcon {
    svg {
      path {
        fill: ${props=>props.primary?props.theme.button.color.primaryActive:props.theme.button.color.baseActive};
      }
    }
  }
`,hoverCss=styled_components_browser_esm.AH`
  background-color: ${props=>props.primary?props.theme.button.backgroundColor.primaryHover:props.theme.button.backgroundColor.baseHover};

  color: ${props=>props.primary?props.theme.button.color.primaryHover:props.theme.button.color.baseHover};

  ${props=>props.primary?styled_components_browser_esm.AH`
          border: ${props.theme.button.border.primaryHover};
          box-sizing: ${props.theme.button.boxSizing};
        `:styled_components_browser_esm.AH`
          border: ${props.theme.button.border.baseHover};
          box-sizing: ${props.theme.button.boxSizing};
        `}

  .btnIcon {
    svg {
      path {
        fill: ${props=>props.primary?props.theme.button.color.primaryHover:props.theme.button.color.baseHover};
      }
    }
  }
`,disableCss=styled_components_browser_esm.AH`
  background-color: ${props=>props.primary?props.theme.button.backgroundColor.primaryDisabled:props.theme.button.backgroundColor.baseDisabled};

  color: ${props=>props.primary?props.theme.button.color.primaryDisabled:props.theme.button.color.baseDisabled};

  ${props=>props.primary?styled_components_browser_esm.AH`
          border: ${props.theme.button.border.primaryDisabled};
          box-sizing: ${props.theme.button.boxSizing};
        `:styled_components_browser_esm.AH`
          border: ${props.theme.button.border.baseDisabled};
          box-sizing: ${props.theme.button.boxSizing};
        `}

  .btnIcon {
    svg {
      path {
        fill: ${props=>props.primary?props.theme.button.color.primaryDisabled:props.theme.button.color.baseDisabled};
      }
    }
  }
`,ButtonWrapper=react.forwardRef((({primary,scale,size,isHovered,isClicked,isDisabled,disableHover,isLoading,label,minWidth,...props},ref)=>(0,jsx_runtime.jsx)("button",{ref,type:"button",...props})));ButtonWrapper.displayName="ButtonWrapper";const StyledButton=(0,styled_components_browser_esm.Ay)(ButtonWrapper).attrs((props=>({disabled:props.isDisabled||props.isLoading?"disabled":"",tabIndex:props.tabIndex})))`
  position: relative;
  direction: ${props=>props?.interfaceDirection&&"rtl"};
  height: ${props=>(props=>props.theme.button.height[props.size||Button_enums.M.normal])(props)};
  font-size: ${props=>(props=>props.theme.button.fontSize[props.size||Button_enums.M.normal])(props)};

  color: ${props=>props.primary?props.theme.button.color.primary:props.theme.button.color.base};

  background-color: ${props=>props.primary?props.theme.button.backgroundColor.primary:props.theme.button.backgroundColor.base};

  border: ${props=>props.primary?props.theme.button.border.primary:props.theme.button.border.base};

  ${props=>props.scale&&"width: 100%;"};
  min-width: ${props=>props.minWidth&&props.minWidth};

  padding: ${props=>`${props.theme.button.padding[props.size||Button_enums.M.normal]}`};

  cursor: ${props=>props.isDisabled||props.isLoading?"default !important":"pointer"};

  font-family: ${props=>props.theme.fontFamily};
  margin: ${props=>props.theme.button.margin};
  display: ${props=>props.theme.button.display};
  font-weight: ${props=>props.theme.button.fontWeight};
  text-align: ${props=>props.theme.button.textAlign};
  text-decoration: ${props=>props.theme.button.textDecoration};
  vertical-align: ${props=>props.theme.button.topVerticalAlign};
  border-radius: ${props=>props.theme.button.borderRadius};
  -moz-border-radius: ${props=>props.theme.button.borderRadius};
  -webkit-border-radius: ${props=>props.theme.button.borderRadius};

  ${utils.h0};

  stroke: ${props=>props.theme.button.stroke};
  overflow: ${props=>props.theme.button.overflow};
  text-overflow: ${props=>props.theme.button.textOverflow};
  white-space: ${props=>props.theme.button.whiteSpace};
  -webkit-tap-highlight-color: rgba(0, 0, 0, 0);

  ${props=>!props.isDisabled&&!props.isLoading&&(props.isHovered?hoverCss:!props.disableHover&&styled_components_browser_esm.AH`
          &:hover {
            ${hoverCss}
          }
        `)}

  ${props=>!props.isDisabled&&!props.isLoading&&(props.isClicked?activeCss:styled_components_browser_esm.AH`
          &:active {
            ${activeCss}
          }
        `)}

  ${props=>(props.isDisabled||props.isLoading)&&disableCss}

  &:focus {
    outline: ${props=>props.theme.button.outline};
  }

  .loader {
    display: flex;
    justify-content: center;
    align-items: center;

    position: absolute;

    top: 0;
    left: 0;
    right: 0;
    bottom: 0;

    width: 100%;
    height: 100%;

    background-color: transparent;
  }

  .button-content {
    width: 100%;
    height: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 8px;
    visibility: ${props=>props.isLoading?"hidden":"visible"};
  }

  .icon {
    width: auto;
    display: flex;
    align-items: center;
  }
`;StyledButton.defaultProps={theme:themes.C6};const themeActiveCss=styled_components_browser_esm.AH`
  border-color: ${props=>props.$currentColorScheme?.main?.buttons};

  background: ${props=>props.primary&&props.$currentColorScheme?.main?.buttons};

  opacity: ${props=>!props.isDisabled&&"1"};

  filter: ${props=>props.primary&&(props.theme.isBase?"brightness(90%)":"brightness(82%)")};

  color: ${props=>props.$currentColorScheme?.text?.buttons};
`,themeHoverCss=styled_components_browser_esm.AH`
  border-color: ${props=>props.$currentColorScheme?.main?.buttons};

  background: ${props=>props.primary&&props.$currentColorScheme?.main?.buttons};

  opacity: ${props=>props.primary&&!props.isDisabled&&"0.85"};

  color: ${props=>props.primary&&props.$currentColorScheme?.text?.buttons};
`;StyledButton.defaultProps={theme:themes.C6};const StyledThemeButton=(0,styled_components_browser_esm.Ay)(StyledButton)((({primary,$currentColorScheme,isDisabled,isLoading,isClicked,isHovered,disableHover,title})=>$currentColorScheme&&!title&&styled_components_browser_esm.AH`
    ${primary&&styled_components_browser_esm.AH`
      background: ${$currentColorScheme.main?.buttons};
      opacity: ${isDisabled&&"0.6"};
      border: ${"1px solid"} ${$currentColorScheme.main?.buttons};
      color: ${$currentColorScheme.text?.buttons};

      .loader {
        svg {
          color: ${$currentColorScheme.text?.buttons};
        }
        background-color: ${$currentColorScheme.main?.buttons};
      }
    `}

    ${!isDisabled&&!isLoading&&(isHovered&&primary?themeHoverCss:!disableHover&&primary&&styled_components_browser_esm.AH`
          &:hover,
          &:focus {
            ${themeHoverCss}
          }
        `)}

    ${!isDisabled&&!isLoading&&(isClicked?primary&&themeActiveCss:primary&&styled_components_browser_esm.AH`
          &:active {
            ${themeActiveCss}
          }
        `)}
  `));try{ButtonWrapper.displayName="ButtonWrapper",ButtonWrapper.__docgenInfo={description:"",displayName:"ButtonWrapper",props:{isDisabled:{defaultValue:null,description:"Sets the button to show a disabled state",name:"isDisabled",required:!1,type:{name:"boolean"}},className:{defaultValue:null,description:"Accepts class",name:"className",required:!1,type:{name:"string"}},id:{defaultValue:null,description:"Accepts id",name:"id",required:!1,type:{name:"string"}},style:{defaultValue:null,description:"Accepts CSS style",name:"style",required:!1,type:{name:"CSSProperties"}},title:{defaultValue:null,description:"",name:"title",required:!1,type:{name:"string"}},ref:{defaultValue:null,description:"",name:"ref",required:!1,type:{name:"((((instance: HTMLButtonElement | null) => void) | RefObject<HTMLButtonElement>) & (string | ((instance: HTMLButtonElement | null) => void) | RefObject<...>)) | null"}},label:{defaultValue:null,description:"Button text",name:"label",required:!0,type:{name:"string"}},isLoading:{defaultValue:null,description:"Sets a button to show a loader icon",name:"isLoading",required:!1,type:{name:"boolean"}},tabIndex:{defaultValue:null,description:"Button tab index",name:"tabIndex",required:!1,type:{name:"number"}},onClick:{defaultValue:null,description:"Sets the action initiated upon clicking the button",name:"onClick",required:!1,type:{name:"((e: MouseEvent<Element, MouseEvent>) => void)"}},size:{defaultValue:null,description:"Size of the button.\nThe normal size equals 36px and 40px in height on the Desktop and Touchcreen devices.",name:"size",required:!1,type:{name:"enum",value:[{value:'"extraSmall"'},{value:'"small"'},{value:'"normal"'},{value:'"medium"'}]}},scale:{defaultValue:null,description:"Scales the width of the button to 100%",name:"scale",required:!1,type:{name:"boolean"}},icon:{defaultValue:null,description:"Icon node element",name:"icon",required:!1,type:{name:"ReactNode"}},disableHover:{defaultValue:null,description:"Disable hover effect",name:"disableHover",required:!1,type:{name:"boolean"}},primary:{defaultValue:null,description:"Sets the button primary",name:"primary",required:!1,type:{name:"boolean"}},isHovered:{defaultValue:null,description:"Sets the button to show a hovered state",name:"isHovered",required:!1,type:{name:"boolean"}},isClicked:{defaultValue:null,description:"Sets the button to show a clicked state",name:"isClicked",required:!1,type:{name:"boolean"}},minWidth:{defaultValue:null,description:"Sets the minimal button width",name:"minWidth",required:!1,type:{name:"string"}},$currentColorScheme:{defaultValue:null,description:"",name:"$currentColorScheme",required:!1,type:{name:"TColorScheme"}},interfaceDirection:{defaultValue:null,description:"",name:"interfaceDirection",required:!1,type:{name:"string"}},disabled:{defaultValue:null,description:"",name:"disabled",required:!1,type:{name:"string"}},theme:{defaultValue:{value:"getBaseTheme()"},description:"",name:"theme",required:!1,type:{name:"DefaultTheme"}},as:{defaultValue:null,description:"",name:"as",required:!1,type:{name:"undefined"}},forwardedAs:{defaultValue:null,description:"",name:"forwardedAs",required:!1,type:{name:"undefined"}}}},"undefined"!=typeof STORYBOOK_REACT_CLASSES&&(STORYBOOK_REACT_CLASSES["components/button/Button.styled.tsx#ButtonWrapper"]={docgenInfo:ButtonWrapper.__docgenInfo,name:"ButtonWrapper",path:"components/button/Button.styled.tsx#ButtonWrapper"})}catch(__react_docgen_typescript_loader_error){}try{ButtonWrapper.displayName="ButtonWrapper",StyledComponent.__docgenInfo={description:"",displayName:"ButtonWrapper",props:{isDisabled:{defaultValue:null,description:"Sets the button to show a disabled state",name:"isDisabled",required:!1,type:{name:"boolean | undefined"}},className:{defaultValue:null,description:"Accepts class",name:"className",required:!1,type:{name:"string | undefined"}},id:{defaultValue:null,description:"Accepts id",name:"id",required:!1,type:{name:"string | undefined"}},style:{defaultValue:null,description:"Accepts CSS style",name:"style",required:!1,type:{name:"CSSProperties | undefined"}},title:{defaultValue:null,description:"",name:"title",required:!1,type:{name:"string | undefined"}},ref:{defaultValue:null,description:"",name:"ref",required:!1,type:{name:"((((instance: HTMLButtonElement | null) => void) | RefObject<HTMLButtonElement> | undefined) & (string | ((instance: HTMLButtonElement | null) => void) | RefObject<...>)) | null"}},key:{defaultValue:null,description:"",name:"key",required:!1,type:{name:"Key | null | undefined"}},label:{defaultValue:null,description:"Button text",name:"label",required:!0,type:{name:"string"}},isLoading:{defaultValue:null,description:"Sets a button to show a loader icon",name:"isLoading",required:!1,type:{name:"boolean | undefined"}},tabIndex:{defaultValue:null,description:"Button tab index",name:"tabIndex",required:!1,type:{name:"number | undefined"}},onClick:{defaultValue:null,description:"Sets the action initiated upon clicking the button",name:"onClick",required:!1,type:{name:"((e: MouseEvent<Element, MouseEvent>) => void) | undefined"}},size:{defaultValue:null,description:"Size of the button.\nThe normal size equals 36px and 40px in height on the Desktop and Touchcreen devices.",name:"size",required:!1,type:{name:"ButtonSize | undefined"}},scale:{defaultValue:null,description:"Scales the width of the button to 100%",name:"scale",required:!1,type:{name:"boolean | undefined"}},icon:{defaultValue:null,description:"Icon node element",name:"icon",required:!1,type:{name:"ReactNode"}},disableHover:{defaultValue:null,description:"Disable hover effect",name:"disableHover",required:!1,type:{name:"boolean | undefined"}},primary:{defaultValue:null,description:"Sets the button primary",name:"primary",required:!1,type:{name:"boolean | undefined"}},isHovered:{defaultValue:null,description:"Sets the button to show a hovered state",name:"isHovered",required:!1,type:{name:"boolean | undefined"}},isClicked:{defaultValue:null,description:"Sets the button to show a clicked state",name:"isClicked",required:!1,type:{name:"boolean | undefined"}},minWidth:{defaultValue:null,description:"Sets the minimal button width",name:"minWidth",required:!1,type:{name:"string | undefined"}},$currentColorScheme:{defaultValue:null,description:"",name:"$currentColorScheme",required:!1,type:{name:"TColorScheme | undefined"}},interfaceDirection:{defaultValue:null,description:"",name:"interfaceDirection",required:!1,type:{name:"string | undefined"}},disabled:{defaultValue:null,description:"",name:"disabled",required:!1,type:{name:"string | undefined"}},theme:{defaultValue:{value:"getBaseTheme()"},description:"",name:"theme",required:!1,type:{name:"DefaultTheme | undefined"}},as:{defaultValue:null,description:"",name:"as",required:!1,type:{name:"undefined"}},forwardedAs:{defaultValue:null,description:"",name:"forwardedAs",required:!1,type:{name:"undefined"}}}},"undefined"!=typeof STORYBOOK_REACT_CLASSES&&(STORYBOOK_REACT_CLASSES["components/button/Button.styled.tsx#ButtonWrapper"]={docgenInfo:ButtonWrapper.__docgenInfo,name:"ButtonWrapper",path:"components/button/Button.styled.tsx#ButtonWrapper"})}catch(__react_docgen_typescript_loader_error){}const ButtonTheme=(0,react.forwardRef)(((props,ref)=>{const defaultTheme=(0,react.useContext)(styled_components_browser_esm.Dx),currentColorScheme=defaultTheme?.currentColorScheme;return(0,jsx_runtime.jsx)(StyledThemeButton,{...props,ref,$currentColorScheme:currentColorScheme})}));ButtonTheme.displayName="ButtonTheme";const Button_theme=ButtonTheme;try{ButtonTheme.displayName="ButtonTheme",ButtonTheme.__docgenInfo={description:"",displayName:"ButtonTheme",props:{isDisabled:{defaultValue:null,description:"Sets the button to show a disabled state",name:"isDisabled",required:!1,type:{name:"boolean"}},className:{defaultValue:null,description:"Accepts class",name:"className",required:!1,type:{name:"string"}},id:{defaultValue:null,description:"Accepts id",name:"id",required:!1,type:{name:"string"}},style:{defaultValue:null,description:"Accepts CSS style",name:"style",required:!1,type:{name:"CSSProperties"}},title:{defaultValue:null,description:"",name:"title",required:!1,type:{name:"string"}},label:{defaultValue:null,description:"Button text",name:"label",required:!0,type:{name:"string"}},isLoading:{defaultValue:null,description:"Sets a button to show a loader icon",name:"isLoading",required:!1,type:{name:"boolean"}},tabIndex:{defaultValue:null,description:"Button tab index",name:"tabIndex",required:!1,type:{name:"number"}},onClick:{defaultValue:null,description:"Sets the action initiated upon clicking the button",name:"onClick",required:!1,type:{name:"((e: MouseEvent<Element, MouseEvent>) => void)"}},size:{defaultValue:null,description:"Size of the button.\nThe normal size equals 36px and 40px in height on the Desktop and Touchcreen devices.",name:"size",required:!1,type:{name:"enum",value:[{value:'"extraSmall"'},{value:'"small"'},{value:'"normal"'},{value:'"medium"'}]}},scale:{defaultValue:null,description:"Scales the width of the button to 100%",name:"scale",required:!1,type:{name:"boolean"}},icon:{defaultValue:null,description:"Icon node element",name:"icon",required:!1,type:{name:"ReactNode"}},disableHover:{defaultValue:null,description:"Disable hover effect",name:"disableHover",required:!1,type:{name:"boolean"}},primary:{defaultValue:null,description:"Sets the button primary",name:"primary",required:!1,type:{name:"boolean"}},isHovered:{defaultValue:null,description:"Sets the button to show a hovered state",name:"isHovered",required:!1,type:{name:"boolean"}},isClicked:{defaultValue:null,description:"Sets the button to show a clicked state",name:"isClicked",required:!1,type:{name:"boolean"}},minWidth:{defaultValue:null,description:"Sets the minimal button width",name:"minWidth",required:!1,type:{name:"string"}},$currentColorScheme:{defaultValue:null,description:"",name:"$currentColorScheme",required:!1,type:{name:"TColorScheme"}},interfaceDirection:{defaultValue:null,description:"",name:"interfaceDirection",required:!1,type:{name:"string"}}}},"undefined"!=typeof STORYBOOK_REACT_CLASSES&&(STORYBOOK_REACT_CLASSES["components/button/Button.theme.tsx#ButtonTheme"]={docgenInfo:ButtonTheme.__docgenInfo,name:"ButtonTheme",path:"components/button/Button.theme.tsx#ButtonTheme"})}catch(__react_docgen_typescript_loader_error){}try{ButtonTheme.displayName="ButtonTheme",ForwardRefExoticComponent.__docgenInfo={description:"",displayName:"ButtonTheme",props:{isDisabled:{defaultValue:null,description:"Sets the button to show a disabled state",name:"isDisabled",required:!1,type:{name:"boolean | undefined"}},className:{defaultValue:null,description:"Accepts class",name:"className",required:!1,type:{name:"string | undefined"}},id:{defaultValue:null,description:"Accepts id",name:"id",required:!1,type:{name:"string | undefined"}},style:{defaultValue:null,description:"Accepts CSS style",name:"style",required:!1,type:{name:"CSSProperties | undefined"}},title:{defaultValue:null,description:"",name:"title",required:!1,type:{name:"string | undefined"}},label:{defaultValue:null,description:"Button text",name:"label",required:!0,type:{name:"string"}},isLoading:{defaultValue:null,description:"Sets a button to show a loader icon",name:"isLoading",required:!1,type:{name:"boolean | undefined"}},tabIndex:{defaultValue:null,description:"Button tab index",name:"tabIndex",required:!1,type:{name:"number | undefined"}},onClick:{defaultValue:null,description:"Sets the action initiated upon clicking the button",name:"onClick",required:!1,type:{name:"((e: MouseEvent<Element, MouseEvent>) => void) | undefined"}},size:{defaultValue:null,description:"Size of the button.\nThe normal size equals 36px and 40px in height on the Desktop and Touchcreen devices.",name:"size",required:!1,type:{name:"ButtonSize | undefined"}},scale:{defaultValue:null,description:"Scales the width of the button to 100%",name:"scale",required:!1,type:{name:"boolean | undefined"}},icon:{defaultValue:null,description:"Icon node element",name:"icon",required:!1,type:{name:"ReactNode"}},disableHover:{defaultValue:null,description:"Disable hover effect",name:"disableHover",required:!1,type:{name:"boolean | undefined"}},primary:{defaultValue:null,description:"Sets the button primary",name:"primary",required:!1,type:{name:"boolean | undefined"}},isHovered:{defaultValue:null,description:"Sets the button to show a hovered state",name:"isHovered",required:!1,type:{name:"boolean | undefined"}},isClicked:{defaultValue:null,description:"Sets the button to show a clicked state",name:"isClicked",required:!1,type:{name:"boolean | undefined"}},minWidth:{defaultValue:null,description:"Sets the minimal button width",name:"minWidth",required:!1,type:{name:"string | undefined"}},$currentColorScheme:{defaultValue:null,description:"",name:"$currentColorScheme",required:!1,type:{name:"TColorScheme | undefined"}},interfaceDirection:{defaultValue:null,description:"",name:"interfaceDirection",required:!1,type:{name:"string | undefined"}},ref:{defaultValue:null,description:"Allows getting a ref to the component instance.\nOnce the component unmounts, React will set `ref.current` to `null`\n(or call the ref with `null` if you passed a callback ref).\n@see {@link https://react.dev/learn/referencing-values-with-refs#refs-and-the-dom React Docs}",name:"ref",required:!1,type:{name:"LegacyRef<HTMLButtonElement> | undefined"}},key:{defaultValue:null,description:"",name:"key",required:!1,type:{name:"Key | null | undefined"}}}},"undefined"!=typeof STORYBOOK_REACT_CLASSES&&(STORYBOOK_REACT_CLASSES["components/button/Button.theme.tsx#ButtonTheme"]={docgenInfo:ButtonTheme.__docgenInfo,name:"ButtonTheme",path:"components/button/Button.theme.tsx#ButtonTheme"})}catch(__react_docgen_typescript_loader_error){}const Button_Button=react.forwardRef(((props,ref)=>{const{isLoading,icon,label,primary}=props;return(0,jsx_runtime.jsxs)(Button_theme,{...props,ref,"data-testid":"button",children:[isLoading&&(0,jsx_runtime.jsx)(loader.a,{className:"loader",color:"",size:"20px",type:loader.R.track,label,primary:primary||!1}),(0,jsx_runtime.jsxs)("div",{className:"button-content not-selectable",children:[icon&&(0,jsx_runtime.jsx)("div",{className:"icon",children:icon}),label]})]})}));Button_Button.displayName="Button";try{Button_Button.displayName="Button",Button_Button.__docgenInfo={description:"",displayName:"Button",props:{label:{defaultValue:null,description:"Button text",name:"label",required:!0,type:{name:"string"}},title:{defaultValue:null,description:"",name:"title",required:!1,type:{name:"string"}},primary:{defaultValue:null,description:"Sets the button primary",name:"primary",required:!1,type:{name:"boolean"}},size:{defaultValue:null,description:"Size of the button.\nThe normal size equals 36px and 40px in height on the Desktop and Touchcreen devices.",name:"size",required:!1,type:{name:"enum",value:[{value:'"extraSmall"'},{value:'"small"'},{value:'"normal"'},{value:'"medium"'}]}},scale:{defaultValue:null,description:"Scales the width of the button to 100%",name:"scale",required:!1,type:{name:"boolean"}},icon:{defaultValue:null,description:"Icon node element",name:"icon",required:!1,type:{name:"ReactNode"}},tabIndex:{defaultValue:null,description:"Button tab index",name:"tabIndex",required:!1,type:{name:"number"}},className:{defaultValue:null,description:"Accepts class",name:"className",required:!1,type:{name:"string"}},id:{defaultValue:null,description:"Accepts id",name:"id",required:!1,type:{name:"string"}},style:{defaultValue:null,description:"Accepts CSS style",name:"style",required:!1,type:{name:"CSSProperties"}},isHovered:{defaultValue:null,description:"Sets the button to show a hovered state",name:"isHovered",required:!1,type:{name:"boolean"}},disableHover:{defaultValue:null,description:"Disable hover effect",name:"disableHover",required:!1,type:{name:"boolean"}},isClicked:{defaultValue:null,description:"Sets the button to show a clicked state",name:"isClicked",required:!1,type:{name:"boolean"}},isDisabled:{defaultValue:null,description:"Sets the button to show a disabled state",name:"isDisabled",required:!1,type:{name:"boolean"}},isLoading:{defaultValue:null,description:"Sets a button to show a loader icon",name:"isLoading",required:!1,type:{name:"boolean"}},minWidth:{defaultValue:null,description:"Sets the minimal button width",name:"minWidth",required:!1,type:{name:"string"}},onClick:{defaultValue:null,description:"Sets the action initiated upon clicking the button",name:"onClick",required:!1,type:{name:"((e: MouseEvent<Element, MouseEvent>) => void)"}}}},"undefined"!=typeof STORYBOOK_REACT_CLASSES&&(STORYBOOK_REACT_CLASSES["components/button/Button.tsx#Button"]={docgenInfo:Button_Button.__docgenInfo,name:"Button",path:"components/button/Button.tsx#Button"})}catch(__react_docgen_typescript_loader_error){}try{Button_Button.displayName="Button",ForwardRefExoticComponent.__docgenInfo={description:"",displayName:"Button",props:{label:{defaultValue:null,description:"Button text",name:"label",required:!0,type:{name:"string"}},title:{defaultValue:null,description:"",name:"title",required:!1,type:{name:"string | undefined"}},primary:{defaultValue:null,description:"Sets the button primary",name:"primary",required:!1,type:{name:"boolean | undefined"}},size:{defaultValue:null,description:"Size of the button.\nThe normal size equals 36px and 40px in height on the Desktop and Touchcreen devices.",name:"size",required:!1,type:{name:"ButtonSize | undefined"}},scale:{defaultValue:null,description:"Scales the width of the button to 100%",name:"scale",required:!1,type:{name:"boolean | undefined"}},icon:{defaultValue:null,description:"Icon node element",name:"icon",required:!1,type:{name:"ReactNode"}},tabIndex:{defaultValue:null,description:"Button tab index",name:"tabIndex",required:!1,type:{name:"number | undefined"}},className:{defaultValue:null,description:"Accepts class",name:"className",required:!1,type:{name:"string | undefined"}},id:{defaultValue:null,description:"Accepts id",name:"id",required:!1,type:{name:"string | undefined"}},style:{defaultValue:null,description:"Accepts CSS style",name:"style",required:!1,type:{name:"CSSProperties | undefined"}},isHovered:{defaultValue:null,description:"Sets the button to show a hovered state",name:"isHovered",required:!1,type:{name:"boolean | undefined"}},disableHover:{defaultValue:null,description:"Disable hover effect",name:"disableHover",required:!1,type:{name:"boolean | undefined"}},isClicked:{defaultValue:null,description:"Sets the button to show a clicked state",name:"isClicked",required:!1,type:{name:"boolean | undefined"}},isDisabled:{defaultValue:null,description:"Sets the button to show a disabled state",name:"isDisabled",required:!1,type:{name:"boolean | undefined"}},isLoading:{defaultValue:null,description:"Sets a button to show a loader icon",name:"isLoading",required:!1,type:{name:"boolean | undefined"}},minWidth:{defaultValue:null,description:"Sets the minimal button width",name:"minWidth",required:!1,type:{name:"string | undefined"}},onClick:{defaultValue:null,description:"Sets the action initiated upon clicking the button",name:"onClick",required:!1,type:{name:"((e: MouseEvent<Element, MouseEvent>) => void) | undefined"}},ref:{defaultValue:null,description:"Allows getting a ref to the component instance.\nOnce the component unmounts, React will set `ref.current` to `null`\n(or call the ref with `null` if you passed a callback ref).\n@see {@link https://react.dev/learn/referencing-values-with-refs#refs-and-the-dom React Docs}",name:"ref",required:!1,type:{name:"LegacyRef<HTMLButtonElement> | undefined"}},key:{defaultValue:null,description:"",name:"key",required:!1,type:{name:"Key | null | undefined"}}}},"undefined"!=typeof STORYBOOK_REACT_CLASSES&&(STORYBOOK_REACT_CLASSES["components/button/Button.tsx#Button"]={docgenInfo:Button_Button.__docgenInfo,name:"Button",path:"components/button/Button.tsx#Button"})}catch(__react_docgen_typescript_loader_error){}try{Button.displayName="Button",Button.__docgenInfo={description:"",displayName:"Button",props:{label:{defaultValue:null,description:"Button text",name:"label",required:!0,type:{name:"string"}},title:{defaultValue:null,description:"",name:"title",required:!1,type:{name:"string"}},primary:{defaultValue:null,description:"Sets the button primary",name:"primary",required:!1,type:{name:"boolean"}},size:{defaultValue:null,description:"Size of the button.\nThe normal size equals 36px and 40px in height on the Desktop and Touchcreen devices.",name:"size",required:!1,type:{name:"enum",value:[{value:'"extraSmall"'},{value:'"small"'},{value:'"normal"'},{value:'"medium"'}]}},scale:{defaultValue:null,description:"Scales the width of the button to 100%",name:"scale",required:!1,type:{name:"boolean"}},icon:{defaultValue:null,description:"Icon node element",name:"icon",required:!1,type:{name:"ReactNode"}},tabIndex:{defaultValue:null,description:"Button tab index",name:"tabIndex",required:!1,type:{name:"number"}},className:{defaultValue:null,description:"Accepts class",name:"className",required:!1,type:{name:"string"}},id:{defaultValue:null,description:"Accepts id",name:"id",required:!1,type:{name:"string"}},style:{defaultValue:null,description:"Accepts CSS style",name:"style",required:!1,type:{name:"CSSProperties"}},isHovered:{defaultValue:null,description:"Sets the button to show a hovered state",name:"isHovered",required:!1,type:{name:"boolean"}},disableHover:{defaultValue:null,description:"Disable hover effect",name:"disableHover",required:!1,type:{name:"boolean"}},isClicked:{defaultValue:null,description:"Sets the button to show a clicked state",name:"isClicked",required:!1,type:{name:"boolean"}},isDisabled:{defaultValue:null,description:"Sets the button to show a disabled state",name:"isDisabled",required:!1,type:{name:"boolean"}},isLoading:{defaultValue:null,description:"Sets a button to show a loader icon",name:"isLoading",required:!1,type:{name:"boolean"}},minWidth:{defaultValue:null,description:"Sets the minimal button width",name:"minWidth",required:!1,type:{name:"string"}},onClick:{defaultValue:null,description:"Sets the action initiated upon clicking the button",name:"onClick",required:!1,type:{name:"((e: MouseEvent<Element, MouseEvent>) => void)"}}}},"undefined"!=typeof STORYBOOK_REACT_CLASSES&&(STORYBOOK_REACT_CLASSES["components/button/index.tsx#Button"]={docgenInfo:Button.__docgenInfo,name:"Button",path:"components/button/index.tsx#Button"})}catch(__react_docgen_typescript_loader_error){}try{Button.displayName="Button",ForwardRefExoticComponent.__docgenInfo={description:"",displayName:"Button",props:{label:{defaultValue:null,description:"Button text",name:"label",required:!0,type:{name:"string"}},title:{defaultValue:null,description:"",name:"title",required:!1,type:{name:"string | undefined"}},primary:{defaultValue:null,description:"Sets the button primary",name:"primary",required:!1,type:{name:"boolean | undefined"}},size:{defaultValue:null,description:"Size of the button.\nThe normal size equals 36px and 40px in height on the Desktop and Touchcreen devices.",name:"size",required:!1,type:{name:"ButtonSize | undefined"}},scale:{defaultValue:null,description:"Scales the width of the button to 100%",name:"scale",required:!1,type:{name:"boolean | undefined"}},icon:{defaultValue:null,description:"Icon node element",name:"icon",required:!1,type:{name:"ReactNode"}},tabIndex:{defaultValue:null,description:"Button tab index",name:"tabIndex",required:!1,type:{name:"number | undefined"}},className:{defaultValue:null,description:"Accepts class",name:"className",required:!1,type:{name:"string | undefined"}},id:{defaultValue:null,description:"Accepts id",name:"id",required:!1,type:{name:"string | undefined"}},style:{defaultValue:null,description:"Accepts CSS style",name:"style",required:!1,type:{name:"CSSProperties | undefined"}},isHovered:{defaultValue:null,description:"Sets the button to show a hovered state",name:"isHovered",required:!1,type:{name:"boolean | undefined"}},disableHover:{defaultValue:null,description:"Disable hover effect",name:"disableHover",required:!1,type:{name:"boolean | undefined"}},isClicked:{defaultValue:null,description:"Sets the button to show a clicked state",name:"isClicked",required:!1,type:{name:"boolean | undefined"}},isDisabled:{defaultValue:null,description:"Sets the button to show a disabled state",name:"isDisabled",required:!1,type:{name:"boolean | undefined"}},isLoading:{defaultValue:null,description:"Sets a button to show a loader icon",name:"isLoading",required:!1,type:{name:"boolean | undefined"}},minWidth:{defaultValue:null,description:"Sets the minimal button width",name:"minWidth",required:!1,type:{name:"string | undefined"}},onClick:{defaultValue:null,description:"Sets the action initiated upon clicking the button",name:"onClick",required:!1,type:{name:"((e: MouseEvent<Element, MouseEvent>) => void) | undefined"}},ref:{defaultValue:null,description:"Allows getting a ref to the component instance.\nOnce the component unmounts, React will set `ref.current` to `null`\n(or call the ref with `null` if you passed a callback ref).\n@see {@link https://react.dev/learn/referencing-values-with-refs#refs-and-the-dom React Docs}",name:"ref",required:!1,type:{name:"LegacyRef<HTMLButtonElement> | undefined"}},key:{defaultValue:null,description:"",name:"key",required:!1,type:{name:"Key | null | undefined"}}}},"undefined"!=typeof STORYBOOK_REACT_CLASSES&&(STORYBOOK_REACT_CLASSES["components/button/index.tsx#Button"]={docgenInfo:Button.__docgenInfo,name:"Button",path:"components/button/index.tsx#Button"})}catch(__react_docgen_typescript_loader_error){}}}]);
//# sourceMappingURL=components-save-cancel-buttons-SaveCancelButtons-stories.4dc500c2.iframe.bundle.js.map