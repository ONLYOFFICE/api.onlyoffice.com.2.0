"use strict";(self.webpackChunk_docspace_shared=self.webpackChunk_docspace_shared||[]).push([[704],{"./components/room-logo/RoomLogo.stories.tsx":(__unused_webpack_module,__webpack_exports__,__webpack_require__)=>{__webpack_require__.r(__webpack_exports__),__webpack_require__.d(__webpack_exports__,{Default:()=>Default,__namedExportsOrder:()=>__namedExportsOrder,default:()=>RoomLogo_stories});var enums=__webpack_require__("./enums/index.ts"),main=(__webpack_require__("../../node_modules/react/index.js"),__webpack_require__("../../node_modules/react-device-detect/main.js")),archiveurl=__webpack_require__("../../public/images/icons/32/room/archive.svg?url"),customurl=__webpack_require__("../../public/images/icons/32/room/custom.svg?url"),editingurl=__webpack_require__("../../public/images/icons/32/room/editing.svg?url"),publicurl=__webpack_require__("../../public/images/icons/32/room/public.svg?url"),formurl=__webpack_require__("../../public/images/icons/32/room/form.svg?url"),components_checkbox=__webpack_require__("./components/checkbox/index.tsx"),styled_components_browser_esm=__webpack_require__("../../node_modules/styled-components/dist/styled-components.browser.esm.js"),themes=__webpack_require__("./themes/index.ts");const StyledContainer=styled_components_browser_esm.Ay.div`
  width: 32px;
  height: 32px;

  min-width: 32px;
  min-height: 32px;

  display: flex;
  align-items: center;
  justify-content: center;

  ${({theme})=>"rtl"===theme.interfaceDirection?"margin-left: 12px;":"margin-right: 12px;"}

  .room-logo_checkbox {
    display: none;

    .checkbox {
      ${({theme})=>"rtl"===theme.interfaceDirection?"margin-left: 0;":"margin-right: 0;"}
    }
  }
`;StyledContainer.defaultProps={theme:themes.C6};const StyledLogoContainer=styled_components_browser_esm.Ay.div`
  width: 32px;
  height: 32px;

  .room-logo_icon {
    border-radius: 6px;
  }
`;var jsx_runtime=__webpack_require__("../../node_modules/react/jsx-runtime.js");const RoomLogoPure=({id,className,style,type,isArchive,withCheckbox,isChecked,isIndeterminate,onChange})=>{const icon=(()=>{if(isArchive)return archiveurl;switch(type){case enums.Ts.EditingRoom:return editingurl;case enums.Ts.CustomRoom:return customurl;case enums.Ts.PublicRoom:return publicurl;case enums.Ts.FormRoom:return formurl;default:return""}})();return(0,jsx_runtime.jsxs)(StyledContainer,{id,className,style,"data-testid":"room-logo",children:[(0,jsx_runtime.jsx)(StyledLogoContainer,{className:"room-logo_icon-container",onClick:()=>{main.Fr&&onChange?.()},children:(0,jsx_runtime.jsx)("img",{className:"room-logo_icon",alt:"room-logo",src:icon})}),withCheckbox&&(0,jsx_runtime.jsx)(components_checkbox.S,{className:"room-logo_checkbox checkbox",isChecked,isIndeterminate,onChange})]})};RoomLogoPure.displayName="RoomLogoPure",RoomLogoPure.defaultProps={isPrivacy:!1,isArchive:!1,withCheckbox:!1,isChecked:!1,isIndeterminate:!1};try{RoomLogoPure.displayName="RoomLogoPure",RoomLogoPure.__docgenInfo={description:"",displayName:"RoomLogoPure",props:{type:{defaultValue:null,description:"Accepts room type",name:"type",required:!0,type:{name:"enum",value:[{value:"1"},{value:"2"},{value:"6"},{value:"5"}]}},isPrivacy:{defaultValue:{value:"false"},description:"Adds privacy icon",name:"isPrivacy",required:!1,type:{name:"boolean"}},isArchive:{defaultValue:{value:"false"},description:"Adds archive icon",name:"isArchive",required:!1,type:{name:"boolean"}},withCheckbox:{defaultValue:{value:"false"},description:"Adds checkbox when row/tile is hovered or checked",name:"withCheckbox",required:!1,type:{name:"boolean"}},isChecked:{defaultValue:{value:"false"},description:"Sets a checked state of the checkbox",name:"isChecked",required:!1,type:{name:"boolean"}},isIndeterminate:{defaultValue:{value:"false"},description:"Sets an indeterminate state of the checkbox",name:"isIndeterminate",required:!1,type:{name:"boolean"}},onChange:{defaultValue:null,description:"Sets onChange checkbox callback function",name:"onChange",required:!1,type:{name:"(() => void)"}},id:{defaultValue:null,description:"Accepts id",name:"id",required:!1,type:{name:"string"}},className:{defaultValue:null,description:"Accepts class name",name:"className",required:!1,type:{name:"string"}},style:{defaultValue:null,description:"Accepts css style",name:"style",required:!1,type:{name:"CSSProperties"}}}},"undefined"!=typeof STORYBOOK_REACT_CLASSES&&(STORYBOOK_REACT_CLASSES["components/room-logo/RoomLogo.tsx#RoomLogoPure"]={docgenInfo:RoomLogoPure.__docgenInfo,name:"RoomLogoPure",path:"components/room-logo/RoomLogo.tsx#RoomLogoPure"})}catch(__react_docgen_typescript_loader_error){}try{RoomLogoPure.displayName="RoomLogoPure",__function.__docgenInfo={description:"",displayName:"RoomLogoPure",props:{type:{defaultValue:null,description:"Accepts room type",name:"type",required:!0,type:{name:"RoomsType"}},isPrivacy:{defaultValue:{value:!1},description:"Adds privacy icon",name:"isPrivacy",required:!1,type:{name:"boolean | undefined"}},isArchive:{defaultValue:{value:!1},description:"Adds archive icon",name:"isArchive",required:!1,type:{name:"boolean | undefined"}},withCheckbox:{defaultValue:{value:!1},description:"Adds checkbox when row/tile is hovered or checked",name:"withCheckbox",required:!1,type:{name:"boolean | undefined"}},isChecked:{defaultValue:{value:!1},description:"Sets a checked state of the checkbox",name:"isChecked",required:!1,type:{name:"boolean | undefined"}},isIndeterminate:{defaultValue:{value:!1},description:"Sets an indeterminate state of the checkbox",name:"isIndeterminate",required:!1,type:{name:"boolean | undefined"}},onChange:{defaultValue:null,description:"Sets onChange checkbox callback function",name:"onChange",required:!1,type:{name:"(() => void) | undefined"}},id:{defaultValue:null,description:"Accepts id",name:"id",required:!1,type:{name:"string | undefined"}},className:{defaultValue:null,description:"Accepts class name",name:"className",required:!1,type:{name:"string | undefined"}},style:{defaultValue:null,description:"Accepts css style",name:"style",required:!1,type:{name:"CSSProperties | undefined"}}}},"undefined"!=typeof STORYBOOK_REACT_CLASSES&&(STORYBOOK_REACT_CLASSES["components/room-logo/RoomLogo.tsx#RoomLogoPure"]={docgenInfo:RoomLogoPure.__docgenInfo,name:"RoomLogoPure",path:"components/room-logo/RoomLogo.tsx#RoomLogoPure"})}catch(__react_docgen_typescript_loader_error){}const RoomLogo_stories={title:"Components/RoomLogo",component:RoomLogoPure,parameters:{docs:{description:{component:"Room logo allow you display default room logo depend on type and private"}}}},Default={args:{type:enums.Ts.CustomRoom,isPrivacy:!1,isArchive:!1,withCheckbox:!1,isChecked:!1,isIndeterminate:!1,onChange:()=>{}}};Default.parameters={...Default.parameters,docs:{...Default.parameters?.docs,source:{originalSource:"{\n  args: {\n    type: RoomsType.CustomRoom,\n    isPrivacy: false,\n    isArchive: false,\n    withCheckbox: false,\n    isChecked: false,\n    isIndeterminate: false,\n    onChange: () => {}\n  }\n}",...Default.parameters?.docs?.source}}};const __namedExportsOrder=["Default"]},"./components/checkbox/Checkbox.tsx":(__unused_webpack_module,__webpack_exports__,__webpack_require__)=>{__webpack_require__.d(__webpack_exports__,{S:()=>Checkbox,M:()=>CheckboxPure});var _rect,_rect2,react=__webpack_require__("../../node_modules/react/index.js");function _extends(){return _extends=Object.assign?Object.assign.bind():function(target){for(var i=1;i<arguments.length;i++){var source=arguments[i];for(var key in source)Object.prototype.hasOwnProperty.call(source,key)&&(target[key]=source[key])}return target},_extends.apply(this,arguments)}const checkbox_indeterminate_react=function SvgCheckboxindeterminatereact(props){return react.createElement("svg",_extends({width:16,height:16,viewBox:"0 0 16 16",fill:"none",xmlns:"http://www.w3.org/2000/svg"},props),_rect||(_rect=react.createElement("rect",{x:.5,y:.5,width:15,height:15,rx:2.5,fill:"#fff",stroke:"#D0D5DA"})),_rect2||(_rect2=react.createElement("rect",{x:3,y:3,width:10,height:10,rx:2,fill:"#333"})))};var checkbox_checked_react_rect,_path;function checkbox_checked_react_extends(){return checkbox_checked_react_extends=Object.assign?Object.assign.bind():function(target){for(var i=1;i<arguments.length;i++){var source=arguments[i];for(var key in source)Object.prototype.hasOwnProperty.call(source,key)&&(target[key]=source[key])}return target},checkbox_checked_react_extends.apply(this,arguments)}const checkbox_checked_react=function SvgCheckboxcheckedreact(props){return react.createElement("svg",checkbox_checked_react_extends({width:16,height:16,viewBox:"0 0 16 16",fill:"none",xmlns:"http://www.w3.org/2000/svg"},props),checkbox_checked_react_rect||(checkbox_checked_react_rect=react.createElement("rect",{x:.5,y:.5,width:15,height:15,rx:2.5,fill:"#fff",stroke:"#D0D5DA"})),_path||(_path=react.createElement("path",{d:"M7.98 11.635a1.3 1.3 0 01-1.807 0l-2.799-2.73a1.224 1.224 0 010-1.762 1.3 1.3 0 011.806 0l1.668 1.626a.33.33 0 00.456 0l4.515-4.404a1.3 1.3 0 011.807 0c.24.233.374.55.374.88 0 .331-.134.648-.374.882l-5.647 5.508z",fill:"#333"})))};var checkbox_react_rect;function checkbox_react_extends(){return checkbox_react_extends=Object.assign?Object.assign.bind():function(target){for(var i=1;i<arguments.length;i++){var source=arguments[i];for(var key in source)Object.prototype.hasOwnProperty.call(source,key)&&(target[key]=source[key])}return target},checkbox_react_extends.apply(this,arguments)}const checkbox_react=function SvgCheckboxreact(props){return react.createElement("svg",checkbox_react_extends({width:16,height:16,viewBox:"0 0 16 16",fill:"none",xmlns:"http://www.w3.org/2000/svg"},props),checkbox_react_rect||(checkbox_react_rect=react.createElement("rect",{x:.5,y:.5,width:15,height:15,rx:2.5,fill:"#fff",stroke:"#D0D5DA"})))};var components_text=__webpack_require__("./components/text/index.tsx"),styled_components_browser_esm=__webpack_require__("../../node_modules/styled-components/dist/styled-components.browser.esm.js"),themes=__webpack_require__("./themes/index.ts");const StyledLabel=styled_components_browser_esm.Ay.label`
  display: flex;
  align-items: center;
  position: relative;
  margin: 0;

  user-select: none;
  -o-user-select: none;
  -moz-user-select: none;
  -webkit-user-select: none;
  -webkit-tap-highlight-color: rgba(0, 0, 0, 0);

  .checkbox {
    margin-right: 12px;
    ${props=>"rtl"===props.theme.interfaceDirection&&styled_components_browser_esm.AH`
        margin-right: 0;
        margin-left: 12px;
      `}
    overflow: visible;
    outline: none;
  }

  svg {
    ${props=>props.hasError&&styled_components_browser_esm.AH`
        rect {
          stroke: ${props.theme.checkbox.errorColor} !important;
        }
        path {
          fill: ${props.theme.checkbox.errorColor} !important;
        }
      `}
    ${props=>props.isIndeterminate||props.isDisabled?!props.isDisabled&&styled_components_browser_esm.AH`
            rect {
              fill: ${props.theme.checkbox.fillColor};
              stroke: ${props.theme.checkbox.borderColor};
            }
            }
            rect:last-child {
              fill: ${props.theme.checkbox.indeterminateColor};
              stroke: ${props.theme.checkbox.fillColor};
            }
          `:styled_components_browser_esm.AH`
            rect {
              fill: ${props.theme.checkbox.fillColor};
              stroke: ${props.theme.checkbox.borderColor};
            }
            path {
              fill: ${props.theme.checkbox.arrowColor};
            }
            &:focus {
              outline: none;
              rect {
                stroke: ${props.theme.checkbox.focusColor};
              }
            }
          `}

    ${props=>props.isDisabled&&!props.isIndeterminate?styled_components_browser_esm.AH`
            rect {
              fill: ${props.theme.checkbox.disableFillColor};
              stroke: ${props.theme.checkbox.disableBorderColor};
            }
            path {
              fill: ${props.theme.checkbox.disableArrowColor};
            }
          `:props.isDisabled&&styled_components_browser_esm.AH`
            rect {
              fill: ${props.theme.checkbox.disableFillColor};
              stroke: ${props.theme.checkbox.disableBorderColor};
            }
            rect:last-child {
              fill: ${props.theme.checkbox.disableIndeterminateColor};
            }
          `}
  }
  &:hover {
    ${props=>props.isDisabled?styled_components_browser_esm.AH`
            cursor: not-allowed;
          `:props.isIndeterminate?styled_components_browser_esm.AH`
          cursor: pointer;
          rect:nth-child(1) {
              stroke: ${props.theme.checkbox.hoverBorderColor};
            }
          rect:last-child {
              fill: ${props.theme.checkbox.hoverIndeterminateColor};
            `:styled_components_browser_esm.AH`
              cursor: pointer;

              rect:nth-child(1) {
                stroke: ${props.theme.checkbox.hoverBorderColor};
              }
            `}
  }

  &:active {
    ${props=>props.isDisabled?styled_components_browser_esm.AH`
            cursor: not-allowed;
          `:props.isIndeterminate?styled_components_browser_esm.AH`
          cursor: pointer;
          rect:nth-child(1) {
              stroke: ${props.theme.checkbox.pressedBorderColor};
              fill: ${props.theme.checkbox.pressedFillColor};
            }
          rect:last-child {
              fill: ${props.theme.checkbox.hoverIndeterminateColor};
            `:styled_components_browser_esm.AH`
              cursor: pointer;

              rect:nth-child(1) {
                stroke: ${props.theme.checkbox.pressedBorderColor};
                fill: ${props.theme.checkbox.pressedFillColor};
              }
            `}
  }

  .wrapper {
    display: inline-block;
  }

  .checkbox-text {
    color: ${props=>props.isDisabled?props.theme.text.disableColor:props.hasError?props.theme.checkbox.errorColor:props.theme.text.color};
    margin-top: -2px;
  }

  .help-button {
    display: inline-block;

    ${({theme})=>"rtl"===theme.interfaceDirection?"margin-right: 4px;":"margin-left: 4px;"}
  }
`;StyledLabel.defaultProps={theme:themes.C6};const HiddenInput=styled_components_browser_esm.Ay.input`
  opacity: 0.0001;
  position: absolute;
  right: 0;
  z-index: -1;
`;var jsx_runtime=__webpack_require__("../../node_modules/react/jsx-runtime.js");const RenderCheckboxIcon=({isChecked,isIndeterminate,tabIndex})=>isIndeterminate?(0,jsx_runtime.jsx)(checkbox_indeterminate_react,{tabIndex,className:"checkbox not-selectable"}):isChecked?(0,jsx_runtime.jsx)(checkbox_checked_react,{tabIndex,className:"checkbox not-selectable"}):(0,jsx_runtime.jsx)(checkbox_react,{tabIndex,className:"checkbox not-selectable"}),CheckboxPure=({id,className,style,label,value,title,truncate=!1,hasError=!1,onChange,isChecked=!1,isIndeterminate=!1,isDisabled,name,tabIndex=-1,helpButton,...rest})=>{const[checked,setChecked]=react.useState(isChecked),ref=react.useRef(null),prevProps=react.useRef({indeterminate:!1,prevChecked:isChecked});react.useEffect((()=>{prevProps.current.indeterminate!==isIndeterminate&&ref.current&&(prevProps.current.indeterminate=isIndeterminate||!1,ref.current.indeterminate=isIndeterminate||!1),prevProps.current.prevChecked!==isChecked&&(setChecked(isChecked),prevProps.current.prevChecked=isChecked)}),[isIndeterminate,isChecked,checked]);return(0,jsx_runtime.jsxs)(StyledLabel,{id,style,isDisabled:isDisabled||!1,isIndeterminate:isIndeterminate||!1,className,title,hasError:hasError||!1,"data-testid":"checkbox",children:[(0,jsx_runtime.jsx)(HiddenInput,{name,type:"checkbox",checked,disabled:isDisabled,ref,value,onChange:e=>{isDisabled&&e.preventDefault(),e.stopPropagation(),setChecked(e.target.checked),onChange?.(e)},tabIndex:-1,...rest}),(0,jsx_runtime.jsx)(RenderCheckboxIcon,{tabIndex:tabIndex||0,isChecked:checked||!1,isIndeterminate:isIndeterminate||!1}),(0,jsx_runtime.jsxs)("div",{className:"wrapper",children:[label&&(0,jsx_runtime.jsx)(components_text.E,{as:"span",title,truncate,className:"checkbox-text",children:label}),helpButton&&(0,jsx_runtime.jsx)("span",{className:"help-button",onClick:e=>e.preventDefault(),children:helpButton})]})]})};CheckboxPure.displayName="CheckboxPure",CheckboxPure.displayName="CheckboxPure";const Checkbox=react.memo(CheckboxPure);try{CheckboxPure.displayName="CheckboxPure",CheckboxPure.__docgenInfo={description:"",displayName:"CheckboxPure",props:{id:{defaultValue:null,description:"Used as HTML id property",name:"id",required:!1,type:{name:"string"}},name:{defaultValue:null,description:"Used as HTML `name` property",name:"name",required:!1,type:{name:"string"}},value:{defaultValue:null,description:"Value of the input",name:"value",required:!1,type:{name:"string"}},label:{defaultValue:null,description:"Label of the input",name:"label",required:!1,type:{name:"string"}},isChecked:{defaultValue:{value:"false"},description:"Sets the checked state of the checkbox",name:"isChecked",required:!1,type:{name:"boolean"}},isIndeterminate:{defaultValue:{value:"false"},description:"The state is displayed as a rectangle in the checkbox when set to true",name:"isIndeterminate",required:!1,type:{name:"boolean"}},isDisabled:{defaultValue:null,description:"Disables the Checkbox input",name:"isDisabled",required:!1,type:{name:"boolean"}},onChange:{defaultValue:null,description:"Is triggered whenever the CheckboxInput is clicked",name:"onChange",required:!1,type:{name:"((e: ChangeEvent<HTMLInputElement>) => void)"}},className:{defaultValue:null,description:"Accepts class",name:"className",required:!1,type:{name:"string"}},style:{defaultValue:null,description:"Accepts css style",name:"style",required:!1,type:{name:"CSSProperties"}},title:{defaultValue:null,description:"Title",name:"title",required:!1,type:{name:"string"}},truncate:{defaultValue:{value:"false"},description:"Disables word wrapping",name:"truncate",required:!1,type:{name:"boolean"}},helpButton:{defaultValue:null,description:"Renders the help button",name:"helpButton",required:!1,type:{name:"ReactNode"}},tabIndex:{defaultValue:{value:"-1"},description:"Checkbox tab index",name:"tabIndex",required:!1,type:{name:"number"}},hasError:{defaultValue:{value:"false"},description:"Notifies if the error occurs",name:"hasError",required:!1,type:{name:"boolean"}}}},"undefined"!=typeof STORYBOOK_REACT_CLASSES&&(STORYBOOK_REACT_CLASSES["components/checkbox/Checkbox.tsx#CheckboxPure"]={docgenInfo:CheckboxPure.__docgenInfo,name:"CheckboxPure",path:"components/checkbox/Checkbox.tsx#CheckboxPure"})}catch(__react_docgen_typescript_loader_error){}try{CheckboxPure.displayName="CheckboxPure",__function.__docgenInfo={description:"",displayName:"CheckboxPure",props:{id:{defaultValue:null,description:"Used as HTML id property",name:"id",required:!1,type:{name:"string | undefined"}},name:{defaultValue:null,description:"Used as HTML `name` property",name:"name",required:!1,type:{name:"string | undefined"}},value:{defaultValue:null,description:"Value of the input",name:"value",required:!1,type:{name:"string | undefined"}},label:{defaultValue:null,description:"Label of the input",name:"label",required:!1,type:{name:"string | undefined"}},isChecked:{defaultValue:{value:!1},description:"Sets the checked state of the checkbox",name:"isChecked",required:!1,type:{name:"boolean | undefined"}},isIndeterminate:{defaultValue:{value:!1},description:"The state is displayed as a rectangle in the checkbox when set to true",name:"isIndeterminate",required:!1,type:{name:"boolean | undefined"}},isDisabled:{defaultValue:null,description:"Disables the Checkbox input",name:"isDisabled",required:!1,type:{name:"boolean | undefined"}},onChange:{defaultValue:null,description:"Is triggered whenever the CheckboxInput is clicked",name:"onChange",required:!1,type:{name:"((e: ChangeEvent<HTMLInputElement>) => void) | undefined"}},className:{defaultValue:null,description:"Accepts class",name:"className",required:!1,type:{name:"string | undefined"}},style:{defaultValue:null,description:"Accepts css style",name:"style",required:!1,type:{name:"CSSProperties | undefined"}},title:{defaultValue:null,description:"Title",name:"title",required:!1,type:{name:"string | undefined"}},truncate:{defaultValue:{value:!1},description:"Disables word wrapping",name:"truncate",required:!1,type:{name:"boolean | undefined"}},helpButton:{defaultValue:null,description:"Renders the help button",name:"helpButton",required:!1,type:{name:"ReactNode"}},tabIndex:{defaultValue:{value:-1},description:"Checkbox tab index",name:"tabIndex",required:!1,type:{name:"number | undefined"}},hasError:{defaultValue:{value:!1},description:"Notifies if the error occurs",name:"hasError",required:!1,type:{name:"boolean | undefined"}}}},"undefined"!=typeof STORYBOOK_REACT_CLASSES&&(STORYBOOK_REACT_CLASSES["components/checkbox/Checkbox.tsx#CheckboxPure"]={docgenInfo:CheckboxPure.__docgenInfo,name:"CheckboxPure",path:"components/checkbox/Checkbox.tsx#CheckboxPure"})}catch(__react_docgen_typescript_loader_error){}},"./components/checkbox/index.tsx":(__unused_webpack_module,__webpack_exports__,__webpack_require__)=>{__webpack_require__.d(__webpack_exports__,{S:()=>_Checkbox__WEBPACK_IMPORTED_MODULE_0__.S});var _Checkbox__WEBPACK_IMPORTED_MODULE_0__=__webpack_require__("./components/checkbox/Checkbox.tsx")},"./components/text/Text.styled.ts":(__unused_webpack_module,__webpack_exports__,__webpack_require__)=>{__webpack_require__.d(__webpack_exports__,{A:()=>__WEBPACK_DEFAULT_EXPORT__,s:()=>StyledAutoDirSpan});var styled_components__WEBPACK_IMPORTED_MODULE_2__=__webpack_require__("../../node_modules/styled-components/dist/styled-components.browser.esm.js"),_themes__WEBPACK_IMPORTED_MODULE_0__=__webpack_require__("./themes/index.ts"),_utils__WEBPACK_IMPORTED_MODULE_1__=__webpack_require__("./utils/index.ts");const styleCss=styled_components__WEBPACK_IMPORTED_MODULE_2__.AH`
  font-size: ${props=>props.fontSizeProp&&props.theme.getCorrectFontSize(props.fontSizeProp)};
  outline: 0 !important;
  margin: 0;
  font-weight: ${props=>props.fontWeightProp?props.fontWeightProp:props.isBold?700:props.theme.text.fontWeight};

  ${props=>props.isItalic&&styled_components__WEBPACK_IMPORTED_MODULE_2__.AH`
      font-style: italic;
    `}
  ${props=>props.backgroundColor&&styled_components__WEBPACK_IMPORTED_MODULE_2__.AH`
      background-color: ${props.backgroundColor};
    `}
  ${props=>props.isInline?styled_components__WEBPACK_IMPORTED_MODULE_2__.AH`
          display: inline-block;
        `:props.display&&styled_components__WEBPACK_IMPORTED_MODULE_2__.AH`
          display: ${props.display};
        `}
  ${props=>props.lineHeight&&styled_components__WEBPACK_IMPORTED_MODULE_2__.AH`
      line-height: ${props.lineHeight};
    `}
`,StyledText=styled_components__WEBPACK_IMPORTED_MODULE_2__.Ay.p`
  ${styleCss};

  ${_utils__WEBPACK_IMPORTED_MODULE_1__.Pj};

  ${props=>props.noSelect&&_utils__WEBPACK_IMPORTED_MODULE_1__.h0}
`;StyledText.defaultProps={theme:_themes__WEBPACK_IMPORTED_MODULE_0__.C6};const StyledAutoDirSpan=styled_components__WEBPACK_IMPORTED_MODULE_2__.Ay.span`
  display: inherit;
  white-space: inherit;
  overflow: inherit;
  text-overflow: inherit;
  pointer-events: none;
`,__WEBPACK_DEFAULT_EXPORT__=StyledText},"./components/text/Text.tsx":(__unused_webpack_module,__webpack_exports__,__webpack_require__)=>{__webpack_require__.d(__webpack_exports__,{E:()=>Text,c:()=>TextPure});var react__WEBPACK_IMPORTED_MODULE_0__=__webpack_require__("../../node_modules/react/index.js"),_Text_styled__WEBPACK_IMPORTED_MODULE_1__=__webpack_require__("./components/text/Text.styled.ts"),react_jsx_runtime__WEBPACK_IMPORTED_MODULE_2__=__webpack_require__("../../node_modules/react/jsx-runtime.js");const TextPure=({title,tag,as,fontSize="13px",fontWeight,color,textAlign="left",onClick,dir,children,...rest})=>{const isAutoDir="auto"===dir,dirProp=isAutoDir?{}:{dir};return(0,react_jsx_runtime__WEBPACK_IMPORTED_MODULE_2__.jsx)(_Text_styled__WEBPACK_IMPORTED_MODULE_1__.A,{fontSizeProp:fontSize,fontWeightProp:fontWeight,colorProp:color,textAlign,as:!as&&tag?tag:as,title,"data-testid":"text",onClick,...dirProp,...rest,children:isAutoDir?(0,react_jsx_runtime__WEBPACK_IMPORTED_MODULE_2__.jsx)(_Text_styled__WEBPACK_IMPORTED_MODULE_1__.s,{dir:"auto",children}):children})};TextPure.displayName="TextPure";const Text=react__WEBPACK_IMPORTED_MODULE_0__.memo(TextPure);Text.displayName="Text";try{Text.displayName="Text",Text.__docgenInfo={description:"",displayName:"Text",props:{as:{defaultValue:null,description:"Sets the tag through which the component is rendered",name:"as",required:!1,type:{name:"ElementType<any, keyof IntrinsicElements>"}},tag:{defaultValue:null,description:"Accepts the tag id",name:"tag",required:!1,type:{name:"string"}},backgroundColor:{defaultValue:null,description:"Sets background color",name:"backgroundColor",required:!1,type:{name:"string"}},color:{defaultValue:null,description:"Specifies the text color",name:"color",required:!1,type:{name:"string"}},display:{defaultValue:null,description:"Sets the 'display' property",name:"display",required:!1,type:{name:"string"}},fontSize:{defaultValue:{value:"13px"},description:"Sets the font size",name:"fontSize",required:!1,type:{name:"string"}},fontWeight:{defaultValue:null,description:"Sets the font weight",name:"fontWeight",required:!1,type:{name:"string | number"}},isBold:{defaultValue:null,description:"Sets font weight value to bold",name:"isBold",required:!1,type:{name:"boolean"}},isInline:{defaultValue:null,description:"Sets the 'display?: inline-block' property",name:"isInline",required:!1,type:{name:"boolean"}},isItalic:{defaultValue:null,description:"Sets the font style",name:"isItalic",required:!1,type:{name:"boolean"}},lineHeight:{defaultValue:null,description:"Sets the line height",name:"lineHeight",required:!1,type:{name:"string"}},noSelect:{defaultValue:null,description:"Disables text selection",name:"noSelect",required:!1,type:{name:"boolean"}},textAlign:{defaultValue:{value:"left"},description:"Sets the 'text-align' property",name:"textAlign",required:!1,type:{name:"string"}},title:{defaultValue:null,description:"Title",name:"title",required:!1,type:{name:"string"}},className:{defaultValue:null,description:"Sets the class name",name:"className",required:!1,type:{name:"string"}},truncate:{defaultValue:null,description:"Disables word wrapping",name:"truncate",required:!1,type:{name:"boolean"}},id:{defaultValue:null,description:"",name:"id",required:!1,type:{name:"string"}},style:{defaultValue:null,description:"",name:"style",required:!1,type:{name:"CSSProperties"}},dir:{defaultValue:null,description:"",name:"dir",required:!1,type:{name:"string"}},onClick:{defaultValue:null,description:"",name:"onClick",required:!1,type:{name:"((e: MouseEvent<Element, MouseEvent>) => void)"}},htmlFor:{defaultValue:null,description:"",name:"htmlFor",required:!1,type:{name:"string"}}}},"undefined"!=typeof STORYBOOK_REACT_CLASSES&&(STORYBOOK_REACT_CLASSES["components/text/Text.tsx#Text"]={docgenInfo:Text.__docgenInfo,name:"Text",path:"components/text/Text.tsx#Text"})}catch(__react_docgen_typescript_loader_error){}try{Text.displayName="Text",__function.__docgenInfo={description:"",displayName:"Text",props:{as:{defaultValue:null,description:"Sets the tag through which the component is rendered",name:"as",required:!1,type:{name:"ElementType<any, keyof IntrinsicElements> | undefined"}},tag:{defaultValue:null,description:"Accepts the tag id",name:"tag",required:!1,type:{name:"string | undefined"}},backgroundColor:{defaultValue:null,description:"Sets background color",name:"backgroundColor",required:!1,type:{name:"string | undefined"}},color:{defaultValue:null,description:"Specifies the text color",name:"color",required:!1,type:{name:"string | undefined"}},display:{defaultValue:null,description:"Sets the 'display' property",name:"display",required:!1,type:{name:"string | undefined"}},fontSize:{defaultValue:{value:"13px"},description:"Sets the font size",name:"fontSize",required:!1,type:{name:"string | undefined"}},fontWeight:{defaultValue:null,description:"Sets the font weight",name:"fontWeight",required:!1,type:{name:"string | number | undefined"}},isBold:{defaultValue:null,description:"Sets font weight value to bold",name:"isBold",required:!1,type:{name:"boolean | undefined"}},isInline:{defaultValue:null,description:"Sets the 'display?: inline-block' property",name:"isInline",required:!1,type:{name:"boolean | undefined"}},isItalic:{defaultValue:null,description:"Sets the font style",name:"isItalic",required:!1,type:{name:"boolean | undefined"}},lineHeight:{defaultValue:null,description:"Sets the line height",name:"lineHeight",required:!1,type:{name:"string | undefined"}},noSelect:{defaultValue:null,description:"Disables text selection",name:"noSelect",required:!1,type:{name:"boolean | undefined"}},textAlign:{defaultValue:{value:"left"},description:"Sets the 'text-align' property",name:"textAlign",required:!1,type:{name:"string | undefined"}},title:{defaultValue:null,description:"Title",name:"title",required:!1,type:{name:"string | undefined"}},className:{defaultValue:null,description:"Sets the class name",name:"className",required:!1,type:{name:"string | undefined"}},truncate:{defaultValue:null,description:"Disables word wrapping",name:"truncate",required:!1,type:{name:"boolean | undefined"}},id:{defaultValue:null,description:"",name:"id",required:!1,type:{name:"string | undefined"}},style:{defaultValue:null,description:"",name:"style",required:!1,type:{name:"CSSProperties | undefined"}},dir:{defaultValue:null,description:"",name:"dir",required:!1,type:{name:"string | undefined"}},onClick:{defaultValue:null,description:"",name:"onClick",required:!1,type:{name:"((e: MouseEvent<Element, MouseEvent>) => void) | undefined"}},htmlFor:{defaultValue:null,description:"",name:"htmlFor",required:!1,type:{name:"string | undefined"}}}},"undefined"!=typeof STORYBOOK_REACT_CLASSES&&(STORYBOOK_REACT_CLASSES["components/text/Text.tsx#Text"]={docgenInfo:Text.__docgenInfo,name:"Text",path:"components/text/Text.tsx#Text"})}catch(__react_docgen_typescript_loader_error){}},"./components/text/index.tsx":(__unused_webpack_module,__webpack_exports__,__webpack_require__)=>{__webpack_require__.d(__webpack_exports__,{E:()=>_Text__WEBPACK_IMPORTED_MODULE_0__.E});var _Text__WEBPACK_IMPORTED_MODULE_0__=__webpack_require__("./components/text/Text.tsx")},"../../public/images/icons/32/room/archive.svg?url":(module,__unused_webpack_exports,__webpack_require__)=>{module.exports=__webpack_require__.p+"images/icons/32/room/archive.svg?hash=c96b095f55f86ef36a14"},"../../public/images/icons/32/room/custom.svg?url":(module,__unused_webpack_exports,__webpack_require__)=>{module.exports=__webpack_require__.p+"images/icons/32/room/custom.svg?hash=9732f6b7b1416f896699"},"../../public/images/icons/32/room/editing.svg?url":(module,__unused_webpack_exports,__webpack_require__)=>{module.exports=__webpack_require__.p+"images/icons/32/room/editing.svg?hash=f8a5ad72823da680c4e2"},"../../public/images/icons/32/room/form.svg?url":(module,__unused_webpack_exports,__webpack_require__)=>{module.exports=__webpack_require__.p+"images/icons/32/room/form.svg?hash=93488eeac8d18132b3d9"},"../../public/images/icons/32/room/public.svg?url":(module,__unused_webpack_exports,__webpack_require__)=>{module.exports=__webpack_require__.p+"images/icons/32/room/public.svg?hash=0e2da4f89e096cc6d2f0"}}]);
//# sourceMappingURL=components-room-logo-RoomLogo-stories.884f4fd3.iframe.bundle.js.map