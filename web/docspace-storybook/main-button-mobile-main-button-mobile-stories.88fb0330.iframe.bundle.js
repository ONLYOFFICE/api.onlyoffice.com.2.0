"use strict";(self.webpackChunk_docspace_components=self.webpackChunk_docspace_components||[]).push([[8859],{"../../node_modules/@mdx-js/react/lib/index.js":(__unused_webpack_module,__webpack_exports__,__webpack_require__)=>{__webpack_require__.d(__webpack_exports__,{NF:()=>withMDXComponents,Zo:()=>MDXProvider,ah:()=>useMDXComponents,pC:()=>MDXContext});var react__WEBPACK_IMPORTED_MODULE_0__=__webpack_require__("../../node_modules/react/index.js");const MDXContext=react__WEBPACK_IMPORTED_MODULE_0__.createContext({});function withMDXComponents(Component){return function boundMDXComponent(props){const allComponents=useMDXComponents(props.components);return react__WEBPACK_IMPORTED_MODULE_0__.createElement(Component,{...props,allComponents})}}function useMDXComponents(components){const contextComponents=react__WEBPACK_IMPORTED_MODULE_0__.useContext(MDXContext);return react__WEBPACK_IMPORTED_MODULE_0__.useMemo((()=>"function"==typeof components?components(contextComponents):{...contextComponents,...components}),[contextComponents,components])}const emptyObject={};function MDXProvider({components,children,disableParentContext}){let allComponents;return allComponents=disableParentContext?"function"==typeof components?components({}):components||emptyObject:useMDXComponents(components),react__WEBPACK_IMPORTED_MODULE_0__.createElement(MDXContext.Provider,{value:allComponents},children)}},"./main-button-mobile/main-button-mobile.stories.js":(__unused_webpack_module,__webpack_exports__,__webpack_require__)=>{__webpack_require__.r(__webpack_exports__),__webpack_require__.d(__webpack_exports__,{Default:()=>Default,__namedExportsOrder:()=>__namedExportsOrder,default:()=>main_button_mobile_stories});var react=__webpack_require__("../../node_modules/react/index.js"),styled_components_browser_esm=__webpack_require__("../../node_modules/styled-components/dist/styled-components.browser.esm.js"),prop_types=__webpack_require__("../../node_modules/prop-types/index.js"),prop_types_default=__webpack_require__.n(prop_types),styled_main_button=__webpack_require__("./main-button-mobile/styled-main-button.js"),icon_button=__webpack_require__("./icon-button/index.js"),text_0=__webpack_require__("./text/index.js"),scrollbar=__webpack_require__("./scrollbar/index.js"),main=__webpack_require__("../../node_modules/react-device-detect/main.js"),backdrop=__webpack_require__("./backdrop/index.js"),button_alert_react=__webpack_require__("../../public/images/button.alert.react.svg"),common_icons_style=__webpack_require__("./utils/common-icons-style.js"),ColorTheme=__webpack_require__("./ColorTheme/index.js"),jsx_runtime=__webpack_require__("../../node_modules/react/jsx-runtime.js");const SubmenuItem=({option,toggle,noHover,recalculateHeight,openedSubmenuKey,setOpenedSubmenuKey})=>{const[isOpenSubMenu,setIsOpenSubMenu]=(0,react.useState)(!1);(0,react.useLayoutEffect)((()=>{recalculateHeight()}),[isOpenSubMenu]),(0,react.useEffect)((()=>{openedSubmenuKey!==option.key&&setIsOpenSubMenu(!1)}),[openedSubmenuKey,option.key]);return(0,jsx_runtime.jsxs)("div",{children:[(0,jsx_runtime.jsx)(styled_main_button.Bf,{id:option.id,label:option.label,className:`${option.className} ${option.isSeparator&&"is-separator"}`,onClick:()=>{setOpenedSubmenuKey(option.key),setIsOpenSubMenu((isOpenSubMenu=>!isOpenSubMenu))},icon:option.icon?option.icon:"",action:option.action,isActive:isOpenSubMenu,isSubMenu:!0,noHover},option.key),isOpenSubMenu&&option.items.map((item=>(0,jsx_runtime.jsx)(styled_main_button.Bf,{id:item.id,label:item.label,className:`${item.className} sublevel`,onClick:()=>{toggle(!1),setIsOpenSubMenu(!1),item.onClick&&item.onClick({action:item.action})},icon:item.icon?item.icon:"",action:item.action,withoutIcon:item.withoutIcon,noHover},item.key)))]},`mobile-submenu-${option.key}`)};SubmenuItem.displayName="SubmenuItem",SubmenuItem.__docgenInfo={description:"",methods:[],displayName:"SubmenuItem"};const sub_components_SubmenuItem=SubmenuItem;var classNames=__webpack_require__("./utils/classNames.js");const StyledButtonAlertIcon=(0,styled_components_browser_esm.ZP)(button_alert_react.Z).withConfig({displayName:"main-button-mobile__StyledButtonAlertIcon",componentId:"sc-ufk781-0"})(["cursor:pointer;vertical-align:top !important;",";"],common_icons_style.Z),ProgressBarMobile=({label,status,percent,open,onCancel,icon,onClickAction,hideButton,error})=>{const uploadPercent=percent>100?100:percent;return(0,jsx_runtime.jsxs)(styled_main_button.LH,{isUploading:open,children:[(0,jsx_runtime.jsxs)("div",{className:"progress-container",children:[(0,jsx_runtime.jsx)(text_0.Z,{className:"progress-header",fontSize:"14",onClick:()=>{onClickAction&&onClickAction(),hideButton()},truncate:!0,children:label}),(0,jsx_runtime.jsxs)("div",{className:"progress_info-container",children:[(0,jsx_runtime.jsx)(text_0.Z,{className:"progress_count",fontSize:"13",truncate:!0,children:status}),(0,jsx_runtime.jsx)(icon_button.Z,{className:"progress_icon",onClick:onCancel,iconName:icon,size:14})]})]}),(0,jsx_runtime.jsx)(styled_main_button.Y5,{children:(0,jsx_runtime.jsx)(ColorTheme.U,{themeId:ColorTheme.f.MobileProgressBar,uploadPercent,error})})]})};ProgressBarMobile.displayName="ProgressBarMobile",ProgressBarMobile.propTypes={label:prop_types_default().string,status:prop_types_default().string,percent:prop_types_default().number,open:prop_types_default().bool,onCancel:prop_types_default().func,icon:prop_types_default().string,onClickAction:prop_types_default().func,hideButton:prop_types_default().func,error:prop_types_default().bool};const MainButtonMobile=props=>{const{className,style,opened,onUploadClick,actionOptions,progressOptions,buttonOptions,percent,title,withButton,withoutButton,manualWidth,isOpenButton,onClose,sectionWidth,alert,withMenu,onClick,onAlertClick,withAlertClick,dropdownStyle}=props,[isOpen,setIsOpen]=(0,react.useState)(opened),[isUploading,setIsUploading]=(0,react.useState)(!1),[height,setHeight]=(0,react.useState)(window.innerHeight-48+"px"),[openedSubmenuKey,setOpenedSubmenuKey]=(0,react.useState)(""),divRef=(0,react.useRef)(),ref=(0,react.useRef)(),dropDownRef=(0,react.useRef)();let currentPosition,prevPosition,buttonBackground,scrollElem;(0,react.useEffect)((()=>{opened!==isOpen&&setIsOpen(opened)}),[opened]),(0,react.useEffect)((()=>{if(main.gn)return scrollElem=document.getElementsByClassName("section-scroll")[0],0===scrollElem?.scrollTop&&scrollElem.classList.add("dialog-background-scroll"),scrollElem?.addEventListener("scroll",scrollChangingBackground),()=>{scrollElem?.removeEventListener("scroll",scrollChangingBackground)}}),[]);const scrollChangingBackground=()=>{currentPosition=scrollElem.scrollTop;const scrollHeight=scrollElem.scrollHeight;currentPosition<prevPosition?setDialogBackground(scrollHeight):currentPosition>0&&currentPosition>prevPosition&&setButtonBackground(),prevPosition=currentPosition},setDialogBackground=scrollHeight=>{buttonBackground||document.getElementsByClassName("section-scroll")[0].classList.add("dialog-background-scroll"),currentPosition<scrollHeight/3&&(buttonBackground=!1)},setButtonBackground=()=>{buttonBackground=!0,scrollElem.classList.remove("dialog-background-scroll")},recalculateHeight=()=>{let height=divRef?.current?.getBoundingClientRect()?.height||window.innerHeight;height>=window.innerHeight?setHeight(window.innerHeight-48+"px"):setHeight(height+"px")};(0,react.useLayoutEffect)((()=>{const{height}=divRef.current.getBoundingClientRect();setHeight(height)}),[isOpen]),(0,react.useLayoutEffect)((()=>{recalculateHeight()}),[isOpen,isOpenButton,window.innerHeight,isUploading]),(0,react.useEffect)((()=>(window.addEventListener("resize",recalculateHeight),()=>{window.removeEventListener("resize",recalculateHeight)})),[recalculateHeight]);const toggle=isOpen=>(isOpenButton&&onClose&&onClose(),setIsOpen(isOpen));react.useEffect((()=>{if(progressOptions){const openProgressOptions=progressOptions.filter((option=>option.open));setIsUploading(openProgressOptions.length>0)}}),[progressOptions]);const noHover=!!main.tq,children=(0,jsx_runtime.jsxs)(styled_main_button.$_,{ref:divRef,children:[(0,jsx_runtime.jsx)(styled_main_button.p0,{children:actionOptions.map((option=>option.items?(0,jsx_runtime.jsx)(sub_components_SubmenuItem,{option,toggle,noHover,recalculateHeight,openedSubmenuKey,setOpenedSubmenuKey},option.key):(0,jsx_runtime.jsx)(styled_main_button.Bf,{id:option.id,label:option.label,className:(0,classNames.A)(option.className,{"is-separator":option.isSeparator}),onClick:()=>{toggle(!1),option.onClick&&option.onClick({action:option.action})},icon:option.icon?option.icon:"",action:option.action,noHover},option.key)))}),(0,jsx_runtime.jsx)(styled_main_button.f2,{isUploading,isOpenButton,children:progressOptions&&progressOptions.map((option=>(0,jsx_runtime.jsx)(ProgressBarMobile,{label:option.label,icon:option.icon,className:option.className,percent:option.percent,status:option.status,open:option.open,onCancel:option.onCancel,onClickAction:option.onClick,hideButton:()=>toggle(!1),error:option.error},option.key)))}),(0,jsx_runtime.jsx)(styled_main_button.PD,{withoutButton,children:buttonOptions?buttonOptions.map((option=>option.isSeparator?(0,jsx_runtime.jsx)("div",{className:"separator-wrapper",children:(0,jsx_runtime.jsx)("div",{className:"is-separator"})},option.key):(0,jsx_runtime.jsx)(styled_main_button.Bf,{id:option.id,className:"drop-down-item-button "+(option.isSeparator?"is-separator":""),label:option.label,onClick:option.onClick,icon:option.icon?option.icon:"",action:option.action},option.key))):""})]});return(0,jsx_runtime.jsxs)(jsx_runtime.Fragment,{children:[(0,jsx_runtime.jsx)(backdrop.Z,{zIndex:210,visible:isOpen,onClick:e=>{isOpen&&ref.current.contains(e.target)||toggle(!1)}}),(0,jsx_runtime.jsxs)("div",{ref,className,style:{zIndex:""+(isOpen?"211":"201"),...style},children:[(0,jsx_runtime.jsx)(styled_main_button.Y0,{icon:isOpen?"minus":"plus",isOpen,onClick:e=>{withMenu?toggle(!isOpen):onClick&&onClick(e)},percent}),(0,jsx_runtime.jsx)(styled_main_button.Zc,{style:dropdownStyle,open:isOpen,withBackdrop:!1,manualWidth:manualWidth||"400px",directionY:"top",directionX:"right",isMobile:main.tq,fixedDirection:!0,heightProp:height,sectionWidth,isDefaultMode:!1,className:"mainBtnDropdown",children:main.tq?(0,jsx_runtime.jsx)(scrollbar.Z,{style:{position:"absolute"},scrollclass:"section-scroll",stype:"mediumBlack",ref:dropDownRef,children}):children}),alert&&!isOpen&&(0,jsx_runtime.jsx)(styled_main_button.W4,{children:(0,jsx_runtime.jsx)(StyledButtonAlertIcon,{onClick:()=>{withAlertClick&&onAlertClick&&onAlertClick()},size:"small"})})]})]})};MainButtonMobile.propTypes={style:prop_types_default().oneOfType([prop_types_default().object,prop_types_default().array]),actionOptions:prop_types_default().array.isRequired,progressOptions:prop_types_default().array,buttonOptions:prop_types_default().array,onUploadClick:prop_types_default().func,withButton:prop_types_default().bool,isOpenButton:prop_types_default().bool,title:prop_types_default().string,percent:prop_types_default().number,sectionWidth:prop_types_default().number,manualWidth:prop_types_default().string,className:prop_types_default().string,opened:prop_types_default().bool,onClose:prop_types_default().func,onAlertClick:prop_types_default().func,withAlertClick:prop_types_default().bool,withMenu:prop_types_default().bool},MainButtonMobile.defaultProps={withMenu:!0},MainButtonMobile.__docgenInfo={description:"",methods:[],displayName:"MainButtonMobile",props:{withMenu:{defaultValue:{value:"true",computed:!1},description:"Enables the submenu",type:{name:"bool"},required:!1},style:{description:"Accepts css style",type:{name:"union",value:[{name:"object"},{name:"array"}]},required:!1},actionOptions:{description:"Drop down items options",type:{name:"array"},required:!0},progressOptions:{description:"Displays progress bar components",type:{name:"array"},required:!1},buttonOptions:{description:"Menu that opens by clicking on the button",type:{name:"array"},required:!1},onUploadClick:{description:"The function called after the button is clicked",type:{name:"func"},required:!1},withButton:{description:"Displays button inside the drop down",type:{name:"bool"},required:!1},isOpenButton:{description:"Opens a menu on clicking the button. Used with buttonOptions",type:{name:"bool"},required:!1},title:{description:"The button name in the drop down",type:{name:"string"},required:!1},percent:{description:"Loading indicator",type:{name:"number"},required:!1},sectionWidth:{description:"Width section",type:{name:"number"},required:!1},manualWidth:{description:"Specifies the exact width of the drop down component",type:{name:"string"},required:!1},className:{description:"Accepts class",type:{name:"string"},required:!1},opened:{description:"Sets the dropdown to open",type:{name:"bool"},required:!1},onClose:{description:"Closes the drop down",type:{name:"func"},required:!1},onAlertClick:{description:"If you need open upload panel when clicking on alert button",type:{name:"func"},required:!1},withAlertClick:{description:"Enables alert click",type:{name:"bool"},required:!1}}};const main_button_mobile=MainButtonMobile,mobile_actions_folder_reacturl_namespaceObject=__webpack_require__.p+"images/mobile.actions.folder.react.svg?hash=a9fff6eef044f59c2d01",mobile_actions_remove_reacturl_namespaceObject=__webpack_require__.p+"images/mobile.actions.remove.react.svg?hash=8cb356bde378299be670",mobile_star_reacturl_namespaceObject=__webpack_require__.p+"images/mobile.star.react.svg?hash=be219e9d1217f75108db";var lib=__webpack_require__("../../node_modules/@mdx-js/react/lib/index.js"),dist=__webpack_require__("../../node_modules/@storybook/blocks/dist/index.mjs");function _createMdxContent(props){const _components=Object.assign({h1:"h1",h2:"h2"},(0,lib.ah)(),props.components);return(0,jsx_runtime.jsxs)(jsx_runtime.Fragment,{children:[(0,jsx_runtime.jsx)(dist.h_,{title:"Components/MainButtonMobile",component:main_button_mobile}),"\n",(0,jsx_runtime.jsx)(_components.h1,{id:"mainbuttonmobile",children:"MainButtonMobile"}),"\n",(0,jsx_runtime.jsx)(dist.Xz,{children:(0,jsx_runtime.jsx)(dist.oG,{of:Default})}),"\n",(0,jsx_runtime.jsx)(_components.h2,{id:"properties",children:"Properties"}),"\n",(0,jsx_runtime.jsx)(dist.ZX,{})]})}const main_button_mobile_stories={title:"Components/MainButtonMobile",component:main_button_mobile,tags:["autodocs"],parameters:{docs:{page:function MDXContent(props={}){const{wrapper:MDXLayout}=Object.assign({},(0,lib.ah)(),props.components);return MDXLayout?(0,jsx_runtime.jsx)(MDXLayout,Object.assign({},props,{children:(0,jsx_runtime.jsx)(_createMdxContent,props)})):_createMdxContent(props)}}}},actionOptions=[{key:"1",label:"New document",icon:mobile_actions_folder_reacturl_namespaceObject},{key:"2",label:"New presentation",icon:mobile_actions_folder_reacturl_namespaceObject},{key:"3",label:"New spreadsheet",icon:mobile_actions_folder_reacturl_namespaceObject},{key:"4",label:"New folder",icon:mobile_actions_folder_reacturl_namespaceObject}],buttonOptions=[{key:"1",label:"Import point",icon:mobile_star_reacturl_namespaceObject,onClick:()=>setIsOpenButton(!1)},{key:"2",label:"Import point",icon:mobile_star_reacturl_namespaceObject,onClick:()=>setIsOpenButton(!1)},{key:"3",label:"Import point",isSeparator:!0},{key:"4",label:"Import point",icon:mobile_star_reacturl_namespaceObject,onClick:()=>setIsOpenButton(!1)}],StyledWrapper=styled_components_browser_esm.ZP.div.withConfig({displayName:"main-button-mobilestories__StyledWrapper",componentId:"sc-1eok8y8-0"})(["width:500px;height:600px;"," ",""],(props=>props.isAutoDocs&&(0,styled_components_browser_esm.iv)(["width:calc(100% + 40px);height:500px;position:relative;margin:0 0 -20px -20px;"])),(props=>props.isMobile&&(0,styled_components_browser_esm.iv)([".mainBtnDropdown{right:5px !important;bottom:5px !important;}"]))),Template=({...args})=>{const[isOpenUploads,setIsOpenUploads]=(0,react.useState)(!1),[isOpenOperations,setIsOpenOperations]=(0,react.useState)(!1),[isOpenButton,setIsOpenButton]=(0,react.useState)(!1),[opened,setOpened]=(0,react.useState)(null),[isUploading,setIsUploading]=(0,react.useState)(!1),[initialState,setInitialState]=(0,react.useState)({uploads:0,operations:0});const[state,dispatch]=(0,react.useReducer)((function reducer(state,action){return"start"===action.type?10===state.uploads&&7===state.operations?(setIsUploading(!1),{...state,uploads:state.uploads,operations:state.operations}):{...state,uploads:10!==state.uploads?state.uploads+1:state.uploads,operations:7!==state.operations?state.operations+1:state.operations}:state}),initialState);(0,react.useEffect)((()=>{if(setOpened(null),isUploading){const id=setInterval((()=>{dispatch({type:"start"})}),1e3);return()=>clearInterval(id)}}),[dispatch,isUploading]);const uploadPercent=state.uploads/10*100,operationPercent=state.operations/7*100,progressOptions=[{key:"1",label:"Uploads",icon:mobile_actions_remove_reacturl_namespaceObject,percent:uploadPercent,status:`${state.uploads}/10`,open:isOpenUploads,onCancel:()=>setIsOpenUploads(!1)},{key:"2",label:"Other operations",icon:mobile_actions_remove_reacturl_namespaceObject,percent:operationPercent,status:"3 files not loaded",open:isOpenOperations,onCancel:()=>setIsOpenOperations(!1),error:!0}],[isMobile,setIsMobile]=(0,react.useState)(window.innerWidth<1245);(0,react.useEffect)((()=>{const handleResize=()=>{isMobile!==window.innerWidth&&setIsMobile(window.innerWidth<1025)};return window.addEventListener("resize",handleResize),()=>{window.removeEventListener("resize",handleResize)}}),[]);const isAutoDocs="undefined"!=typeof window&&window?.location?.href.includes("docs"),{interfaceDirection}=(0,styled_components_browser_esm.Fg)(),style={position:"absolute",bottom:"26px",["rtl"===interfaceDirection?"left":"right"]:"44px"},dropdownStyle={position:"absolute",["rtl"===interfaceDirection?"left":"right"]:"60px",bottom:"25px"};return(0,jsx_runtime.jsx)(StyledWrapper,{isAutoDocs,isMobile,children:(0,jsx_runtime.jsx)(main_button_mobile,{...args,style,actionOptions,dropdownStyle,progressOptions,buttonOptions,onUploadClick:()=>{setInitialState({uploads:0,operations:0}),setIsUploading(!0),setIsOpenUploads(!0),setIsOpenOperations(!0),setIsOpenButton(!0)},withButton:!0,isOpenButton,isDefaultMode:!1,title:"Upload",percent:uploadPercent,opened})})};Template.displayName="Template";const Default=Template.bind({});Default.args={title:"Upload",percent:0,opened:null},Default.parameters={...Default.parameters,docs:{...Default.parameters?.docs,source:{originalSource:'({\n  ...args\n}) => {\n  const maxUploads = 10;\n  const maxOperations = 7;\n  const [isOpenUploads, setIsOpenUploads] = useState(false);\n  const [isOpenOperations, setIsOpenOperations] = useState(false);\n  const [isOpenButton, setIsOpenButton] = useState(false);\n  const [opened, setOpened] = useState(null);\n  const [isUploading, setIsUploading] = useState(false);\n  const [initialState, setInitialState] = useState({\n    uploads: 0,\n    operations: 0\n  });\n  const onUploadClick = () => {\n    setInitialState({\n      uploads: 0,\n      operations: 0\n    });\n    setIsUploading(true);\n    setIsOpenUploads(true);\n    setIsOpenOperations(true);\n    setIsOpenButton(true);\n    //  setOpened(false);\n  };\n\n  function reducer(state, action) {\n    switch (action.type) {\n      case "start":\n        if (state.uploads === maxUploads && state.operations === maxOperations) {\n          setIsUploading(false);\n          return {\n            ...state,\n            uploads: state.uploads,\n            operations: state.operations\n          };\n        }\n        return {\n          ...state,\n          uploads: state.uploads !== maxUploads ? state.uploads + 1 : state.uploads,\n          operations: state.operations !== maxOperations ? state.operations + 1 : state.operations\n        };\n      default:\n        return state;\n    }\n  }\n  const [state, dispatch] = useReducer(reducer, initialState);\n  useEffect(() => {\n    setOpened(null);\n    if (isUploading) {\n      const id = setInterval(() => {\n        dispatch({\n          type: "start"\n        });\n      }, 1000);\n      return () => clearInterval(id);\n    }\n  }, [dispatch, isUploading]);\n  const uploadPercent = state.uploads / maxUploads * 100;\n  const operationPercent = state.operations / maxOperations * 100;\n  const progressOptions = [{\n    key: "1",\n    label: "Uploads",\n    icon: MobileActionsRemoveReactSvgUrl,\n    percent: uploadPercent,\n    status: `${state.uploads}/${maxUploads}`,\n    open: isOpenUploads,\n    onCancel: () => setIsOpenUploads(false)\n  }, {\n    key: "2",\n    label: "Other operations",\n    icon: MobileActionsRemoveReactSvgUrl,\n    percent: operationPercent,\n    status: `3 files not loaded`,\n    open: isOpenOperations,\n    onCancel: () => setIsOpenOperations(false),\n    error: true\n  }];\n  const [isMobile, setIsMobile] = useState(window.innerWidth < 1245);\n  useEffect(() => {\n    const handleResize = () => {\n      isMobile !== window.innerWidth && setIsMobile(window.innerWidth < 1025);\n    };\n    window.addEventListener("resize", handleResize);\n    return () => {\n      window.removeEventListener("resize", handleResize);\n    };\n  }, []);\n  const isAutoDocs = typeof window !== "undefined" && window?.location?.href.includes("docs");\n  const {\n    interfaceDirection\n  } = useTheme();\n  const style = {\n    position: "absolute",\n    bottom: "26px",\n    [interfaceDirection === "rtl" ? "left" : "right"]: "44px"\n  };\n  const dropdownStyle = {\n    position: "absolute",\n    [interfaceDirection === "rtl" ? "left" : "right"]: "60px",\n    bottom: "25px"\n  };\n  return <StyledWrapper isAutoDocs={isAutoDocs} isMobile={isMobile}>\r\n      <MainButtonMobile {...args} style={style} actionOptions={actionOptions} dropdownStyle={dropdownStyle} progressOptions={progressOptions} buttonOptions={buttonOptions} onUploadClick={onUploadClick} withButton={true} isOpenButton={isOpenButton} isDefaultMode={false} title="Upload" percent={uploadPercent} opened={opened} />\r\n    </StyledWrapper>;\n}',...Default.parameters?.docs?.source}}};const __namedExportsOrder=["Default"]}}]);