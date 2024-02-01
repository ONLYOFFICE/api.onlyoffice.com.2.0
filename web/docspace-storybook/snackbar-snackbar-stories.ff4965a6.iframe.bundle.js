"use strict";(self.webpackChunk_docspace_components=self.webpackChunk_docspace_components||[]).push([[1583],{"./snackbar/snackbar.stories.js":(__unused_webpack_module,__webpack_exports__,__webpack_require__)=>{__webpack_require__.r(__webpack_exports__),__webpack_require__.d(__webpack_exports__,{__namedExportsOrder:()=>__namedExportsOrder,base:()=>base,default:()=>snackbar_stories});var react=__webpack_require__("../../node_modules/react/index.js"),box=__webpack_require__("./box/index.js"),client=__webpack_require__("../../node_modules/react-dom/client.js"),prop_types=__webpack_require__("../../node_modules/prop-types/index.js"),prop_types_default=__webpack_require__.n(prop_types);function _classCallCheck(instance,Constructor){if(!(instance instanceof Constructor))throw new TypeError("Cannot call a class as a function")}function _defineProperties(target,props){for(var i=0;i<props.length;i++){var descriptor=props[i];descriptor.enumerable=descriptor.enumerable||!1,descriptor.configurable=!0,"value"in descriptor&&(descriptor.writable=!0),Object.defineProperty(target,descriptor.key,descriptor)}}function _createClass(Constructor,protoProps,staticProps){return protoProps&&_defineProperties(Constructor.prototype,protoProps),staticProps&&_defineProperties(Constructor,staticProps),Constructor}function _inherits(subClass,superClass){if("function"!=typeof superClass&&null!==superClass)throw new TypeError("Super expression must either be null or a function");subClass.prototype=Object.create(superClass&&superClass.prototype,{constructor:{value:subClass,writable:!0,configurable:!0}}),superClass&&_setPrototypeOf(subClass,superClass)}function _getPrototypeOf(o){return _getPrototypeOf=Object.setPrototypeOf?Object.getPrototypeOf:function _getPrototypeOf(o){return o.__proto__||Object.getPrototypeOf(o)},_getPrototypeOf(o)}function _setPrototypeOf(o,p){return _setPrototypeOf=Object.setPrototypeOf||function _setPrototypeOf(o,p){return o.__proto__=p,o},_setPrototypeOf(o,p)}function _possibleConstructorReturn(self,call){return!call||"object"!=typeof call&&"function"!=typeof call?function _assertThisInitialized(self){if(void 0===self)throw new ReferenceError("this hasn't been initialised - super() hasn't been called");return self}(self):call}function _createSuper(Derived){var hasNativeReflectConstruct=function _isNativeReflectConstruct(){if("undefined"==typeof Reflect||!Reflect.construct)return!1;if(Reflect.construct.sham)return!1;if("function"==typeof Proxy)return!0;try{return Date.prototype.toString.call(Reflect.construct(Date,[],(function(){}))),!0}catch(e){return!1}}();return function _createSuperInternal(){var result,Super=_getPrototypeOf(Derived);if(hasNativeReflectConstruct){var NewTarget=_getPrototypeOf(this).constructor;result=Reflect.construct(Super,arguments,NewTarget)}else result=Super.apply(this,arguments);return _possibleConstructorReturn(this,result)}}function _toConsumableArray(arr){return function _arrayWithoutHoles(arr){if(Array.isArray(arr))return _arrayLikeToArray(arr)}(arr)||function _iterableToArray(iter){if("undefined"!=typeof Symbol&&Symbol.iterator in Object(iter))return Array.from(iter)}(arr)||function _unsupportedIterableToArray(o,minLen){if(!o)return;if("string"==typeof o)return _arrayLikeToArray(o,minLen);var n=Object.prototype.toString.call(o).slice(8,-1);"Object"===n&&o.constructor&&(n=o.constructor.name);if("Map"===n||"Set"===n)return Array.from(o);if("Arguments"===n||/^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n))return _arrayLikeToArray(o,minLen)}(arr)||function _nonIterableSpread(){throw new TypeError("Invalid attempt to spread non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")}()}function _arrayLikeToArray(arr,len){(null==len||len>arr.length)&&(len=arr.length);for(var i=0,arr2=new Array(len);i<len;i++)arr2[i]=arr[i];return arr2}function zeroPad(value){var length=arguments.length>1&&void 0!==arguments[1]?arguments[1]:2,strValue=String(value);if(0===length)return strValue;var match=strValue.match(/(.*?)([0-9]+)(.*)/),prefix=match?match[1]:"",suffix=match?match[3]:"",strNo=match?match[2]:strValue,paddedNo=strNo.length>=length?strNo:(_toConsumableArray(Array(length)).map((function(){return"0"})).join("")+strNo).slice(-1*length);return"".concat(prefix).concat(paddedNo).concat(suffix)}var timeDeltaFormatOptionsDefaults={daysInHours:!1,zeroPadTime:2};function formatTimeDelta(timeDelta,options){var days=timeDelta.days,hours=timeDelta.hours,minutes=timeDelta.minutes,seconds=timeDelta.seconds,_Object$assign=Object.assign(Object.assign({},timeDeltaFormatOptionsDefaults),options),daysInHours=_Object$assign.daysInHours,zeroPadTime=_Object$assign.zeroPadTime,_Object$assign$zeroPa=_Object$assign.zeroPadDays,zeroPadDays=void 0===_Object$assign$zeroPa?zeroPadTime:_Object$assign$zeroPa,zeroPadTimeLength=Math.min(2,zeroPadTime),formattedHours=daysInHours?zeroPad(hours+24*days,zeroPadTime):zeroPad(hours,zeroPadTimeLength);return{days:daysInHours?"":zeroPad(days,zeroPadDays),hours:formattedHours,minutes:zeroPad(minutes,zeroPadTimeLength),seconds:zeroPad(seconds,zeroPadTimeLength)}}var Countdown=function(_React$Component){_inherits(Countdown,_React$Component);var _super=_createSuper(Countdown);function Countdown(){var _this;return _classCallCheck(this,Countdown),(_this=_super.apply(this,arguments)).state={count:_this.props.count||3},_this.startCountdown=function(){_this.interval=window.setInterval((function(){0===_this.state.count-1?(_this.stopCountdown(),_this.props.onComplete&&_this.props.onComplete()):_this.setState((function(prevState){return{count:prevState.count-1}}))}),1e3)},_this.stopCountdown=function(){clearInterval(_this.interval)},_this.addTime=function(seconds){_this.stopCountdown(),_this.setState((function(prevState){return{count:prevState.count+seconds}}),_this.startCountdown)},_this}return _createClass(Countdown,[{key:"componentDidMount",value:function componentDidMount(){this.startCountdown()}},{key:"componentWillUnmount",value:function componentWillUnmount(){clearInterval(this.interval)}},{key:"render",value:function render(){return this.props.children?(0,react.cloneElement)(this.props.children,{count:this.state.count}):null}}]),Countdown}(react.Component);Countdown.propTypes={count:prop_types.number,children:prop_types.element,onComplete:prop_types.func};var Countdown$1=function(_React$Component){_inherits(Countdown$1,_React$Component);var _super=_createSuper(Countdown$1);function Countdown$1(props){var _this;if(_classCallCheck(this,Countdown$1),(_this=_super.call(this,props)).mounted=!1,_this.initialTimestamp=_this.calcOffsetStartTimestamp(),_this.offsetStartTimestamp=_this.props.autoStart?0:_this.initialTimestamp,_this.offsetTime=0,_this.legacyMode=!1,_this.legacyCountdownRef=(0,react.createRef)(),_this.tick=function(){var timeDelta=_this.calcTimeDelta(),callback=timeDelta.completed&&!_this.props.overtime?void 0:_this.props.onTick;_this.setTimeDeltaState(timeDelta,void 0,callback)},_this.start=function(){if(!_this.isStarted()){var prevOffsetStartTimestamp=_this.offsetStartTimestamp;_this.offsetStartTimestamp=0,_this.offsetTime+=prevOffsetStartTimestamp?_this.calcOffsetStartTimestamp()-prevOffsetStartTimestamp:0;var timeDelta=_this.calcTimeDelta();_this.setTimeDeltaState(timeDelta,"STARTED",_this.props.onStart),_this.props.controlled||timeDelta.completed&&!_this.props.overtime||(_this.clearTimer(),_this.interval=window.setInterval(_this.tick,_this.props.intervalDelay))}},_this.pause=function(){_this.isPaused()||(_this.clearTimer(),_this.offsetStartTimestamp=_this.calcOffsetStartTimestamp(),_this.setTimeDeltaState(_this.state.timeDelta,"PAUSED",_this.props.onPause))},_this.stop=function(){_this.isStopped()||(_this.clearTimer(),_this.offsetStartTimestamp=_this.calcOffsetStartTimestamp(),_this.offsetTime=_this.offsetStartTimestamp-_this.initialTimestamp,_this.setTimeDeltaState(_this.calcTimeDelta(),"STOPPED",_this.props.onStop))},_this.isStarted=function(){return _this.isStatus("STARTED")},_this.isPaused=function(){return _this.isStatus("PAUSED")},_this.isStopped=function(){return _this.isStatus("STOPPED")},_this.isCompleted=function(){return _this.isStatus("COMPLETED")},props.date){var timeDelta=_this.calcTimeDelta();_this.state={timeDelta,status:timeDelta.completed?"COMPLETED":"STOPPED"}}else _this.legacyMode=!0;return _this}return _createClass(Countdown$1,[{key:"componentDidMount",value:function componentDidMount(){this.legacyMode||(this.mounted=!0,this.props.onMount&&this.props.onMount(this.calcTimeDelta()),this.props.autoStart&&this.start())}},{key:"componentDidUpdate",value:function componentDidUpdate(prevProps){this.legacyMode||this.props.date!==prevProps.date&&(this.initialTimestamp=this.calcOffsetStartTimestamp(),this.offsetStartTimestamp=this.initialTimestamp,this.offsetTime=0,this.setTimeDeltaState(this.calcTimeDelta()))}},{key:"componentWillUnmount",value:function componentWillUnmount(){this.legacyMode||(this.mounted=!1,this.clearTimer())}},{key:"calcTimeDelta",value:function calcTimeDelta$1(){var _this$props=this.props,date=_this$props.date,now=_this$props.now,precision=_this$props.precision,controlled=_this$props.controlled,overtime=_this$props.overtime;return function calcTimeDelta(date){var startTimestamp,options=arguments.length>1&&void 0!==arguments[1]?arguments[1]:{},_options$now=options.now,now=void 0===_options$now?Date.now:_options$now,_options$precision=options.precision,precision=void 0===_options$precision?0:_options$precision,controlled=options.controlled,_options$offsetTime=options.offsetTime,offsetTime=void 0===_options$offsetTime?0:_options$offsetTime,overtime=options.overtime;startTimestamp="string"==typeof date?new Date(date).getTime():date instanceof Date?date.getTime():date,controlled||(startTimestamp+=offsetTime);var timeLeft=controlled?startTimestamp:startTimestamp-now(),clampedPrecision=Math.min(20,Math.max(0,precision)),total=Math.round(1e3*parseFloat(((overtime?timeLeft:Math.max(0,timeLeft))/1e3).toFixed(clampedPrecision))),seconds=Math.abs(total)/1e3;return{total,days:Math.floor(seconds/86400),hours:Math.floor(seconds/3600%24),minutes:Math.floor(seconds/60%60),seconds:Math.floor(seconds%60),milliseconds:Number((seconds%1*1e3).toFixed()),completed:total<=0}}(date,{now,precision,controlled,offsetTime:this.offsetTime,overtime})}},{key:"calcOffsetStartTimestamp",value:function calcOffsetStartTimestamp(){return Date.now()}},{key:"addTime",value:function addTime(seconds){this.legacyCountdownRef.current.addTime(seconds)}},{key:"clearTimer",value:function clearTimer(){window.clearInterval(this.interval)}},{key:"isStatus",value:function isStatus(status){return this.state.status===status}},{key:"setTimeDeltaState",value:function setTimeDeltaState(timeDelta,status,callback){var _this2=this;if(this.mounted){var completing=timeDelta.completed&&!this.state.timeDelta.completed,completedOnStart=timeDelta.completed&&"STARTED"===status;completing&&!this.props.overtime&&this.clearTimer();return this.setState((function(prevState){var newStatus=status||prevState.status;return timeDelta.completed&&!_this2.props.overtime?newStatus="COMPLETED":status||"COMPLETED"!==newStatus||(newStatus="STOPPED"),{timeDelta,status:newStatus}}),(function onDone(){callback&&callback(_this2.state.timeDelta),_this2.props.onComplete&&(completing||completedOnStart)&&_this2.props.onComplete(timeDelta,completedOnStart)}))}}},{key:"getApi",value:function getApi(){return this.api=this.api||{start:this.start,pause:this.pause,stop:this.stop,isStarted:this.isStarted,isPaused:this.isPaused,isStopped:this.isStopped,isCompleted:this.isCompleted}}},{key:"getRenderProps",value:function getRenderProps(){var _this$props2=this.props,daysInHours=_this$props2.daysInHours,zeroPadTime=_this$props2.zeroPadTime,zeroPadDays=_this$props2.zeroPadDays,timeDelta=this.state.timeDelta;return Object.assign(Object.assign({},timeDelta),{api:this.getApi(),props:this.props,formatted:formatTimeDelta(timeDelta,{daysInHours,zeroPadTime,zeroPadDays})})}},{key:"render",value:function render(){if(this.legacyMode){var _this$props3=this.props,count=_this$props3.count,_children=_this$props3.children,onComplete=_this$props3.onComplete;return(0,react.createElement)(Countdown,{ref:this.legacyCountdownRef,count,onComplete},_children)}var _this$props4=this.props,className=_this$props4.className,overtime=_this$props4.overtime,children=_this$props4.children,renderer=_this$props4.renderer,renderProps=this.getRenderProps();if(renderer)return renderer(renderProps);if(children&&this.state.timeDelta.completed&&!overtime)return(0,react.cloneElement)(children,{countdown:renderProps});var _renderProps$formatte=renderProps.formatted,days=_renderProps$formatte.days,hours=_renderProps$formatte.hours,minutes=_renderProps$formatte.minutes,seconds=_renderProps$formatte.seconds;return(0,react.createElement)("span",{className},renderProps.total<0?"-":"",days,days?":":"",hours,":",minutes,":",seconds)}}]),Countdown$1}(react.Component);Countdown$1.defaultProps=Object.assign(Object.assign({},timeDeltaFormatOptionsDefaults),{controlled:!1,intervalDelay:1e3,precision:0,autoStart:!0}),Countdown$1.propTypes={date:(0,prop_types.oneOfType)([(0,prop_types.instanceOf)(Date),prop_types.string,prop_types.number]),daysInHours:prop_types.bool,zeroPadTime:prop_types.number,zeroPadDays:prop_types.number,controlled:prop_types.bool,intervalDelay:prop_types.number,precision:prop_types.number,autoStart:prop_types.bool,overtime:prop_types.bool,className:prop_types.string,children:prop_types.element,renderer:prop_types.func,now:prop_types.func,onMount:prop_types.func,onStart:prop_types.func,onPause:prop_types.func,onStop:prop_types.func,onTick:prop_types.func,onComplete:prop_types.func};const index_es=Countdown$1;var styled_components_browser_esm=__webpack_require__("../../node_modules/styled-components/dist/styled-components.browser.esm.js"),device=__webpack_require__("./utils/device.js");const StyledIframe=styled_components_browser_esm.ZP.iframe.withConfig({displayName:"styled-snackbar__StyledIframe",componentId:"sc-qth9ae-0"})(["border:none;height:60px;width:100%;@media ","{min-width:",";}"],device.tablet,(props=>props.sectionWidth+40+"px")),StyledSnackBar=(0,styled_components_browser_esm.ZP)(box.Z).withConfig({displayName:"styled-snackbar__StyledSnackBar",componentId:"sc-qth9ae-1"})(["transition:all 500ms ease;transition-property:top,right,bottom,left,opacity;font-family:Open Sans,sans-serif,Arial;font-size:",";min-height:14px;position:relative;display:flex;align-items:flex-start;color:white;line-height:16px;padding:12px 20px;margin:0;opacity:",";width:100%;background-color:",";background-image:url(",");.text-container{width:100%;display:flex;flex-direction:column;gap:5px;text-align:",";.header-body{width:100%;height:fit-content;display:flex;flex-direction:row;align-items:center;gap:8px;justify-content:start;.text-header{font-size:",";line-height:16px;font-weight:600;margin:0;}}.text-body{width:100%;display:flex;flex-direction:row;gap:10px;justify-content:",";.text{font-size:",';line-height:16px;font-weight:400;}}}.action{background:inherit;display:inline-block;border:none;font-size:inherit;color:"#333";margin:0px 4px 4px 24px;padding:0;min-width:min-content;cursor:pointer;margin-left:12px;'," text-decoration:underline;}.button{background:inherit;border:none;font-size:",';color:"#000";cursor:pointer;line-height:14px;text-decoration:underline;}'],(props=>props.theme.getCorrectFontSize("12px")),(props=>props.opacity||0),(props=>props.backgroundColor),(props=>props.backgroundImg||""),(props=>props.textalign),(props=>props.theme.getCorrectFontSize("12px")),(props=>props.textalign),(props=>props.theme.getCorrectFontSize("12px")),(props=>"rtl"===props.theme.interfaceDirection&&(0,styled_components_browser_esm.iv)(["margin-right:12px;margin-left:4px;"])),(props=>props.theme.getCorrectFontSize("13px"))),StyledAction=styled_components_browser_esm.ZP.div.withConfig({displayName:"styled-snackbar__StyledAction",componentId:"sc-qth9ae-2"})(['position:absolute;right:8px;top:8px;background:inherit;display:inline-block;border:none;font-size:inherit;color:"#333";cursor:pointer;text-decoration:underline;@media ',"{right:14px;}"],device.tablet);var cross_react=__webpack_require__("../../public/images/cross.react.svg"),common_icons_style=__webpack_require__("./utils/common-icons-style.js");const styled_snackbar_action=(0,styled_components_browser_esm.ZP)(cross_react.Z).withConfig({displayName:"styled-snackbar-action__StyledCrossIcon",componentId:"sc-i3pp6m-0"})([""," path{fill:#999976;}"],common_icons_style.Z);var danger_toast_react=__webpack_require__("../../public/images/danger.toast.react.svg");const styled_snackbar_logo=(0,styled_components_browser_esm.ZP)(danger_toast_react.Z).withConfig({displayName:"styled-snackbar-logo__StyledLogoIcon",componentId:"sc-1h9gs2e-0"})([""," path{fill:",";}"],common_icons_style.Z,(props=>props.color));var heading=__webpack_require__("./heading/index.js"),text_0=__webpack_require__("./text/index.js"),jsx_runtime=__webpack_require__("../../node_modules/react/jsx-runtime.js");function _defineProperty(obj,key,value){return(key=function _toPropertyKey(arg){var key=function _toPrimitive(input,hint){if("object"!=typeof input||null===input)return input;var prim=input[Symbol.toPrimitive];if(void 0!==prim){var res=prim.call(input,hint||"default");if("object"!=typeof res)return res;throw new TypeError("@@toPrimitive must return a primitive value.")}return("string"===hint?String:Number)(input)}(arg,"string");return"symbol"==typeof key?key:String(key)}(key))in obj?Object.defineProperty(obj,key,{value,enumerable:!0,configurable:!0,writable:!0}):obj[key]=value,obj}class SnackBar extends react.Component{constructor(props){super(props),_defineProperty(this,"onActionClick",(e=>{this.props.onAction&&this.props.onAction(e)})),_defineProperty(this,"onClickIFrame",(()=>{document.activeElement&&"iframe"===document.activeElement.nodeName.toLowerCase()&&setTimeout((()=>this.onActionClick()),500)})),_defineProperty(this,"bannerRenderer",(()=>{const{htmlContent,sectionWidth}=this.props;return(0,jsx_runtime.jsxs)("div",{id:"bar-banner",style:{position:"relative"},children:[(0,jsx_runtime.jsx)(StyledIframe,{id:"bar-frame",src:htmlContent,scrolling:"no",sectionWidth,onLoad:()=>{this.setState({isLoaded:!0})}}),this.state.isLoaded&&(0,jsx_runtime.jsx)(StyledAction,{className:"action",onClick:this.onActionClick,children:(0,jsx_runtime.jsx)(styled_snackbar_action,{size:"medium"})})]})})),_defineProperty(this,"countDownRenderer",(({minutes,seconds,completed})=>{if(completed)return(0,jsx_runtime.jsx)(jsx_runtime.Fragment,{});const{textColor,fontSize,fontWeight}=this.props;return(0,jsx_runtime.jsxs)(text_0.Z,{as:"p",color:textColor,fontSize,fontWeight,children:[zeroPad(minutes),":",zeroPad(seconds)]})})),this.state={isLoaded:!1}}static show(barConfig){const{parentElementId,...rest}=barConfig;let parentElementNode=parentElementId&&document.getElementById(parentElementId);if(!parentElementNode){const snackbarNode=document.createElement("div");snackbarNode.id="snackbar",document.body.appendChild(snackbarNode),parentElementNode=snackbarNode}window.snackbar=barConfig,client.createRoot(parentElementNode).render((0,jsx_runtime.jsx)(SnackBar,{...rest}))}static close(){if(window.snackbar&&window.snackbar.parentElementId){document.querySelector("#snackbar-container").remove()}}componentDidMount(){const{onLoad}=this.props;onLoad(),window.addEventListener("blur",this.onClickIFrame)}componentWillUnmount(){window.removeEventListener("blur",this.onClickIFrame)}render(){const{text,headerText,btnText,textColor,showIcon,fontSize,fontWeight,textAlign,htmlContent,style,countDownTime,isCampaigns,onAction,...rest}=this.props,headerStyles=headerText?{}:{display:"none"},bannerElement=this.bannerRenderer();return(0,jsx_runtime.jsx)(jsx_runtime.Fragment,{children:isCampaigns?(0,jsx_runtime.jsx)(jsx_runtime.Fragment,{children:bannerElement}):(0,jsx_runtime.jsxs)(StyledSnackBar,{id:"snackbar-container",style,...rest,children:[htmlContent?(0,jsx_runtime.jsx)("div",{dangerouslySetInnerHTML:{__html:htmlContent}}):(0,jsx_runtime.jsxs)("div",{className:"text-container",children:[(0,jsx_runtime.jsxs)("div",{className:"header-body",textalign:textAlign,children:[showIcon&&(0,jsx_runtime.jsx)(box.Z,{className:"logo",children:(0,jsx_runtime.jsx)(styled_snackbar_logo,{size:"medium",color:textColor})}),(0,jsx_runtime.jsx)(heading.Z,{size:"xsmall",isInline:!0,className:"text-header",style:headerStyles,color:textColor,children:headerText})]}),(0,jsx_runtime.jsxs)("div",{className:"text-body",children:[(0,jsx_runtime.jsx)(text_0.Z,{as:"p",className:"text",color:textColor,fontSize,fontWeight,noSelect:!0,children:text}),btnText&&(0,jsx_runtime.jsx)(text_0.Z,{color:textColor,className:"button",onClick:this.onActionClick,children:btnText}),countDownTime>-1&&(0,jsx_runtime.jsx)(index_es,{date:Date.now()+countDownTime,renderer:this.countDownRenderer,onComplete:this.onActionClick})]})]}),!btnText&&(0,jsx_runtime.jsx)("button",{className:"action",onClick:this.onActionClick,children:(0,jsx_runtime.jsx)(styled_snackbar_action,{size:"small"})})]})})}}SnackBar.displayName="SnackBar",SnackBar.propTypes={text:prop_types_default().oneOfType([prop_types_default().object,prop_types_default().string]),headerText:prop_types_default().string,btnText:prop_types_default().string,backgroundImg:prop_types_default().string,backgroundColor:prop_types_default().string,textColor:prop_types_default().string,showIcon:prop_types_default().bool,onAction:prop_types_default().func,fontSize:prop_types_default().string,fontWeight:prop_types_default().oneOfType([prop_types_default().number,prop_types_default().string]),textAlign:prop_types_default().string,htmlContent:prop_types_default().string,style:prop_types_default().oneOfType([prop_types_default().object,prop_types_default().array]),countDownTime:prop_types_default().number,sectionWidth:prop_types_default().number,isCampaigns:prop_types_default().bool,onLoad:prop_types_default().func,isMaintenance:prop_types_default().bool,opacity:prop_types_default().number},SnackBar.defaultProps={backgroundColor:"#F7E6BE",textColor:"#000",showIcon:!0,fontSize:"13px",fontWeight:"400",textAlign:"left",htmlContent:"",countDownTime:-1,isCampaigns:!1},SnackBar.__docgenInfo={description:"",methods:[{name:"show",docblock:null,modifiers:["static"],params:[{name:"barConfig",type:null}],returns:null},{name:"close",docblock:null,modifiers:["static"],params:[],returns:null},{name:"onActionClick",docblock:null,modifiers:[],params:[{name:"e",type:null}],returns:null},{name:"onClickIFrame",docblock:null,modifiers:[],params:[],returns:null},{name:"bannerRenderer",docblock:null,modifiers:[],params:[],returns:null},{name:"countDownRenderer",docblock:null,modifiers:[],params:[{name:"{ minutes, seconds, completed }",type:null}],returns:null}],displayName:"SnackBar",props:{backgroundColor:{defaultValue:{value:'"#F7E6BE"',computed:!1},description:"Specifies the background color",type:{name:"string"},required:!1},textColor:{defaultValue:{value:'"#000"',computed:!1},description:"Specifies the text color",type:{name:"string"},required:!1},showIcon:{defaultValue:{value:"true",computed:!1},description:"Displays the icon",type:{name:"bool"},required:!1},fontSize:{defaultValue:{value:'"13px"',computed:!1},description:"Sets the font size",type:{name:"string"},required:!1},fontWeight:{defaultValue:{value:'"400"',computed:!1},description:"Sets the font weight",type:{name:"union",value:[{name:"number"},{name:"string"}]},required:!1},textAlign:{defaultValue:{value:'"left"',computed:!1},description:"Specifies the text alignment",type:{name:"string"},required:!1},htmlContent:{defaultValue:{value:'""',computed:!1},description:"Allows displaying content in HTML format",type:{name:"string"},required:!1},countDownTime:{defaultValue:{value:"-1",computed:!1},description:"Sets the countdown time",type:{name:"number"},required:!1},isCampaigns:{defaultValue:{value:"false",computed:!1},description:"Required in case the snackbar is a campaign banner",type:{name:"bool"},required:!1},text:{description:"Specifies the Snackbar text",type:{name:"union",value:[{name:"object"},{name:"string"}]},required:!1},headerText:{description:"Specifies the header text",type:{name:"string"},required:!1},btnText:{description:"Specifies the button text",type:{name:"string"},required:!1},backgroundImg:{description:"Specifies the source of the image used as the Snackbar background",type:{name:"string"},required:!1},onAction:{description:"Sets a callback function that is triggered when the Snackbar is clicked",type:{name:"func"},required:!1},style:{description:"Accepts css",type:{name:"union",value:[{name:"object"},{name:"array"}]},required:!1},sectionWidth:{description:"Sets the section width",type:{name:"number"},required:!1},onLoad:{description:"Used as an indicator that a web page has fully loaded, including its content, images, style files, and external scripts",type:{name:"func"},required:!1},isMaintenance:{description:"Required in case the snackbar is a notification banner",type:{name:"bool"},required:!1},opacity:{description:"Sets opacity",type:{name:"number"},required:!1}}};const snackbar=SnackBar,snackbar_stories={title:"Components/SnackBar",component:snackbar,parameters:{docs:{description:{component:"SnackBar is used for displaying important messages."}}},argTypes:{textColor:{control:"color"},backgroundColor:{control:"color"},showIcon:{control:"boolean"}}},Wrapper=({children})=>(0,jsx_runtime.jsx)(box.Z,{id:"main-bar",displayProp:"grid",children});Wrapper.displayName="Wrapper";const BaseTemplate=args=>(0,jsx_runtime.jsx)(Wrapper,{children:(0,jsx_runtime.jsx)(snackbar,{...args,onClose:e=>alert("OnClose handled!",e)})});BaseTemplate.displayName="BaseTemplate";const base=BaseTemplate.bind({});base.args={backgroundImg:"",backgroundColor:"#f8f7bf",textColor:"#000",opacity:1,headerText:"Attention",text:"We apologize for any short-term technical issues in service functioning, that may appear on 22.06.2021 during the update of Onlyoffice Personal.",showIcon:!0,fontSize:"13px",fontWeight:"400",textAlign:"left",htmlContent:""},base.parameters={...base.parameters,docs:{...base.parameters?.docs,source:{originalSource:'args => <Wrapper>\r\n    <SnackBar {...args} onClose={e => alert("OnClose handled!", e)} />\r\n  </Wrapper>',...base.parameters?.docs?.source}}};const __namedExportsOrder=["base"]},"../../node_modules/react-dom/client.js":(__unused_webpack_module,exports,__webpack_require__)=>{var m=__webpack_require__("../../node_modules/react-dom/index.js");exports.createRoot=m.createRoot,exports.hydrateRoot=m.hydrateRoot}}]);