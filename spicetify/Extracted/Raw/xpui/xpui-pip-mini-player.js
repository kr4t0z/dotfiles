"use strict";(("undefined"!=typeof self?self:global).webpackChunkclient_web=("undefined"!=typeof self?self:global).webpackChunkclient_web||[]).push([[3667],{16653:(e,t,i)=>{i.r(t),i.d(t,{PiPMiniPlayer:()=>bt});var n=i(30758),r=i(97500),l=i.n(r),s=i(17635),a=i(59360),o=i(8539),c=i(82686),u=i(58184),d=i(38486),m=i(11375),g=i(5649),p=i(95215),h=i(50562),k=i(14631),x=i(49549),C=i(53465),v=i(54118),j=i(30109),b=i(83086);const f=({uri:e,spec:t,logger:i})=>{const r=(0,n.useRef)(e);r.current=e;const l=(0,C.K)(),s=(0,n.useMemo)((()=>t.playerControlsFactory()),[t]),a=(0,n.useCallback)((e=>{let t=null;"pause"===e?t=s.playPauseButtonFactory().hitPause({itemToBePaused:r.current}):"resume"===e&&(t=s.playPauseButtonFactory().hitResume({itemToBeResumed:r.current})),t&&i.logInteraction(t)}),[i,s]),o=(0,n.useCallback)((e=>{const t=s.likeButtonFactory(),n=e?t.hitLike({itemToBeLiked:r.current}):t.hitRemoveLike({itemNoLongerLiked:r.current});i.logInteraction(n)}),[i,s]),c=(0,n.useCallback)((()=>{const e=l.getState();if(!e)return;const t=s.previousButtonFactory().hitSkipToPrevious(y(e));i.logInteraction(t)}),[i,l,s]),u=(0,n.useCallback)((()=>{const e=l.getState();if(!e)return;const t=s.nextButtonFactory().hitSkipToNext(y(e));i.logInteraction(t)}),[i,l,s]),d=(0,n.useCallback)((e=>{const t=s.repeatButtonFactory();let n=null;switch(e){case v.p.REPEAT_TRACK:n=t.hitRepeatOneEnable();break;case v.p.REPEAT_CONTEXT:n=t.hitRepeatEnable();break;case v.p.REPEAT_NONE:n=t.hitRepeatDisable();break;default:(0,b.k)(e)}n&&i.logInteraction(n)}),[i,s]),m=(0,n.useCallback)((e=>{const t=e?"shuffle":"linear",n=e?"linear":"shuffle",l=s.shuffleButtonFactory({uri:r.current}).hitSelectShuffleMode({previousMode:n,selectedMode:t});i.logInteraction(l)}),[i,s]),g=(0,n.useCallback)((e=>{const t=s.volumeMuteButtonFactory();i.logInteraction("muted"===e?t.hitMutePlayback():t.hitUnmutePlayback())}),[i,s]),p=(0,n.useCallback)((e=>{const t=s.volumeBarFactory();i.logInteraction(t.hitSetVolume({newVolumePercentage:N(e)}))}),[i,s]),h=(0,n.useCallback)((e=>{const t=s.volumeBarFactory();i.logInteraction(t.dragSetVolume({newVolumePercentage:N(e)}))}),[i,s]),k=(0,n.useCallback)((e=>{const t=s.seekBackwardButtonFactory();i.logInteraction(t.hitSeekByTime({msSeekedOffset:e}))}),[i,s]);return{onClickSeekForward:(0,n.useCallback)((e=>{const t=s.seekForwardButtonFactory();i.logInteraction(t.hitSeekByTime({msSeekedOffset:e}))}),[i,s]),onClickSeekBack:k,onClickPlayPause:a,onClickLike:o,onClickSkipPrevious:c,onClickSkipNext:u,onClickRepeat:d,onClickShuffle:m,onClickVolumeButton:g,onClickVolumeBar:p,onDragVolumeBar:h,onClickShare:(0,n.useCallback)((()=>{const e=s.shareButtonFactory({uri:r.current});i.logInteraction(e.hitCopyToClipboard())}),[i,s]),onClickProgressBar:(0,n.useCallback)((e=>{const t=s.progressBarFactory();i.logInteraction(t.hitSeekToTime({msToSeekTo:e}))}),[i,s]),onDragProgressBar:(0,n.useCallback)((e=>{const t=s.progressBarFactory();i.logInteraction(t.dragSeekToTime({msToSeekTo:e}))}),[i,s])}};function y(e){return{itemToBeSkipped:e.item?.uri||"",positionMs:(0,j.s)(e)??-1,totalContentMs:e.duration??-1}}function N(e){return Math.floor(100*e)}var S=i(15016),B=i(64982);const w="Y1sIRIE9_S2jPP9L89qs",T="lcyebQsHz0j8IkDXTAlB",L="enGtDaA6WTTvIFhZz1wz",E="iKzG3nPAIAbL5CZAbKJU";var P=i(86070);let M=function(e){return e.xs="small",e.sm="medium",e.md="large",e}({});const R=({item:e,spec:t,logger:i,size:n=M.xs})=>{const r=e.uri,l=(0,B.v)(e),s=(0,S.p)(e),{onClickLike:a}=f({uri:r,spec:t,logger:i});return(0,P.jsxs)(P.Fragment,{children:[l&&(0,P.jsx)(x.b,{size:n,uri:r,onClick:a,className:T}),s&&(0,P.jsx)(k.b,{size:n,uri:r,onClick:a,className:T,condensed:!0})]})};var I=i(27322),D=i(46600),F=i(39876),z=i(58400);const _="yb0n1ZOvcsGEP6MtzpHw",A="wigNir143xMt4ihKMqrK",V="jbCLA5mslXPNLClPNh8h",U="srBfv7LB0I9QnzxBpeTV",W="NZlJ5gYuUaWvALQ2gGfg",K="CsqhW5xDG4TO3VV20IZJ";const Z=({item:e,onClick:t,className:i})=>{const{spec:n,logger:r}=(0,z.r)(a.w,{}),o=(0,s.NC)(D.fZ_),c=(0,d.XX)(e),k=(0,F.N)(e)?c?.title:e.name,x=(0,F.N)(e)?c?.subtitle:e.name,C=(0,I.K)(),v=function(e){switch(e){case"SMALL":return{title:"bodySmall",subtitle:"marginal"};case"MEDIUM":return{title:"bodyMedium",subtitle:"bodySmall"};default:return{title:"titleSmall",subtitle:"bodySmall"}}}(C.vertical);return(0,P.jsxs)("div",{className:l()(_,i),children:[(0,P.jsx)("div",{className:U,children:(0,P.jsx)(p.r,{title:k,children:(0,P.jsx)(u.E,{"data-testid":"context-item-info-title",as:"div",variant:v.title,className:U,dir:"auto",children:(0,P.jsx)(g.R,{item:e,onClick:t,adUrl:c?.url,children:k})})},e.uri)}),(0,P.jsx)(h.l,{className:K,item:e,size:"DEFAULT"===C.vertical?"small":"xsmall",variant:"DEFAULT"===C.vertical?"bodySmall":"marginal",enableVideoButton:!0}),(0,P.jsx)("div",{className:W,children:(0,P.jsx)(p.r,{title:x,children:(0,P.jsx)(u.E,{"data-testid":"context-item-info-subtitles",as:"div",variant:v.subtitle,className:W,semanticColor:"textSubdued",children:(0,P.jsx)(m.n,{item:e,onClick:t})})},e.uri)}),o&&(0,P.jsx)("div",{className:A,children:(0,P.jsx)("div",{className:V,children:(0,P.jsx)(R,{item:e,spec:n,logger:r,size:M.sm})})})]})};var O=i(9856),Q=i.n(O);const H=()=>!0===Q().getParser(window.navigator.userAgent).satisfies({chrome:">=123"}),J=()=>{H()&&window.focus()};var q=i(95477),G=i(39947),Y=i(18428),X=i(92984),$=i(2262);const ee="U7qJ1UbUI0C76xXqYVQY",te="wSLUJtAztEeB6cSHzEjf",ie="ivh1pWB_obHbkRTZRwlA",ne="CppZQsRDE7tQVl_Uo22Y";i(56046),i(95676);const re={title:"bodyMediumBold",subtitle:"bodySmall"},le={title:"titleSmall",subtitle:"bodyMedium"},se=n.memo((()=>{const{openURLWithSessionTransfer:e}=(0,X.L)(),t="SMALL"===(0,I.K)().vertical?re:le,i=(0,s.NC)($.rW),r=(0,G.D)("loggedin_upgrade_button"),a=(0,n.useCallback)((()=>{e(r(Y.M0),"_blank")}),[r,e]);return(0,P.jsx)("div",{className:ee,children:(0,P.jsxs)("div",{className:l()({"circular-sp-vietnamese":i},te),children:[(0,P.jsx)(u.E,{variant:t.title,dir:"auto",className:ie,children:o.Ru.get("web-player.pip-mini-player.upsell.title")}),(0,P.jsx)(u.E,{variant:t.subtitle,semanticColor:"textSubdued",children:o.Ru.get("web-player.pip-mini-player.upsell.subtitle")}),(0,P.jsx)("div",{className:ne,children:(0,P.jsx)(q.$,{onClick:a,size:"small",children:o.Ru.get("web-player.pip-mini-player.upsell.cta-button")})})]})})}));var ae=i(39565),oe=i(36041);const ce="document-pip-hover-element",ue="document-pip-cover-art",de="document-pip-cover-art-placeholder",me="transparent";var ge=i(84613),pe=i(5054);function he(e,t,i,n){try{if(!e)return i;const r=getComputedStyle(e);if(!r)return i;const l=r.getPropertyValue(t),s=parseInt(l.replace(n,""),10);return isNaN(s)?i:s}catch(e){return i}}var ke=i(5141),xe=i(67939),Ce=i(11957),ve=i(4688),je=i(8530);const be="wF7I8x6BNoB5TCxuQM6p",fe="mTVLkxm92ETj9KUKj6We",ye="_ZzrZWfp7kDAE2lh9_Wc",Ne="Z7EJBI5IBlrJ1ze7IeeW",Se="v5BmE36Bbgt7MSjmR6Xc",Be="CAQW4b5xnSED1cuM6jcp",we="GSgApqjTNqV1hBpu3zeT",Te="cRGZivJEkNn8_Q7kaHpT",Le="jOhwShRZLQkG51TckxOL",Ee="AfV1a_jkmN7Ep4mov4u7",Pe="QrDtnomlujlNGYbhYEFQ",Me="Jgem6BNDvKfWTBl3cX4W",Re="ePoosDhdXDFF4p3vqKLd",Ie="QGE_nRKg4bMbNKF_e7PM",De="ddMrU_P5vADrfZCD5KQP",Fe="x591ODwZ11KBAWKS6SiE",ze="yyE7Kg8ClZLrYU03bSoA",_e="GJYNq4mAAnZScLzJPrZb",Ae="mBYWBXnQ_1G3IS2q0zUM",Ve="F7RVFhPYBKleXl4ulrwe",Ue="Q4qOSqJZ_dfNRxOBhsGE",We="hix4I_WU5iQPehn_m5h2",Ke="gOpH1qSy5WZp_dGqBjSO";const Ze=({item:e,imageUrl:t})=>{const i=(0,ae.iz)(e),n=(0,P.jsx)(xe._,{className:Fe,src:t,loading:"eager",testid:ue,children:(0,P.jsx)("div",{className:ze,children:(0,P.jsx)(ke.s,{size:"xlarge",type:e.type,"data-testid":de})})});return i.url?(0,P.jsx)(oe.N,{className:De,to:i.url,children:n}):n},Oe=()=>{const{item:e,context:t}=(0,c.L)()??{},i=(0,n.useMemo)((()=>(0,je.h)(e?.images??void 0,{desiredSize:640})),[e?.images,640]),r=(0,ve.l)(),a=(0,s.NC)(D.a4n),{isYourDJNarrator:o}=(0,pe.CV)(),u=(0,n.useRef)(null),d=(0,n.useCallback)((()=>{if(!u.current)return;const e=u.current?.children[0];if(!e)return;const{offsetWidth:t,offsetHeight:i}=u.current;let n=Math.min(t,i);n=Math.min(n,640),1===he(e,"--extra-padding",0,"")&&(n-=Math.max(Math.min(.1*n,64),12)),e.width=e.height=n}),[]),m=(0,Ce.ox)();(0,n.useEffect)((()=>(m?.addEventListener("resize",d),()=>{m?.removeEventListener("resize",d)})),[d,m]);const g=e&&function(e){return"video"===e.mediaType||"mixed"===e.mediaType}(e),p=(0,F.N)(e);let h=!g;!g||!r&&a||(h=!0);const k=(0,n.useMemo)((()=>h&&!p&&H()),[p,h]);let x;x=o?(0,P.jsx)(ge.aU,{}):p?(0,P.jsx)(Ze,{item:e,imageUrl:i}):(0,P.jsx)(xe._,{className:Fe,src:i,loading:"eager",testid:ue,children:(0,P.jsx)("div",{className:ze,children:(0,P.jsx)(ke.s,{size:"xlarge",type:e?.type,"data-testid":de})})});const C=(0,n.useCallback)((()=>{k&&J()}),[k]),v=(0,n.useCallback)((e=>{"Enter"===e.key&&C()}),[C]);return e&&t&&h?(0,P.jsx)("div",{className:l()(Re,{[Ie]:k}),ref:e=>{u.current=e,d()},role:"button",tabIndex:k?0:-1,onClick:C,onKeyDown:v,children:x}):null};var Qe=i(52093),He=i(16079),Je=i(90441),qe=i(3532),Ge=i(5596),Ye=i(45480),Xe=i(16327),$e=i(75745);const et=()=>(0,P.jsx)("svg",{width:"7",height:"8",viewBox:"0 0 7 8",fill:"none",xmlns:"http://www.w3.org/2000/svg",className:Se,children:(0,P.jsx)("path",{fillRule:"evenodd",clipRule:"evenodd",d:"M6.37397 1.94965C6.60829 1.71534 6.60829 1.33544 6.37397 1.10113C6.13966 0.866812 5.75976 0.866812 5.52544 1.10113L3.47461 3.15196L1.42422 1.10157C1.18991 0.86726 0.81001 0.86726 0.575695 1.10158C0.341381 1.33589 0.341381 1.71579 0.575695 1.9501L2.62608 4.00049L0.575696 6.05087C0.341381 6.28519 0.341381 6.66509 0.575696 6.8994C0.81001 7.13372 1.18991 7.13372 1.42422 6.8994L3.47461 4.84902L5.52544 6.89985C5.75976 7.13416 6.13966 7.13416 6.37397 6.89985C6.60829 6.66554 6.60829 6.28564 6.37397 6.05132L4.32314 4.00049L6.37397 1.94965Z",fill:"#912616"})}),tt=n.memo((()=>"SMALL"!==(0,I.K)().vertical?(0,P.jsx)(Qe.U,{}):(0,P.jsx)(He.M,{}))),it=({className:e})=>{const{setVideoPlayerUIFlag:t}=(0,Ge.d)(),{onClick:i}=(0,Xe.D)({}),r=(0,n.useCallback)((()=>{t(Ye.n.documentPip,!1),i()}),[t,i]),s=(0,qe.mv)();return(0,P.jsxs)("div",{style:{display:"var(--mini-player-drag-display)"},className:l()(e,ye),children:[(0,P.jsx)("button",{className:Ne,onClick:r,children:s.operatingSystem===$e.f.macOS?(0,P.jsx)(et,{}):(0,P.jsx)(Je.M,{size:"xsmall",className:Se})}),(0,P.jsx)(tt,{}),(0,P.jsx)("div",{className:Be})]})};var nt=i(7045),rt=i(8159),lt=i(81532),st=i(36348),at=i(96839),ot=i(32282);const ct=({onClick:e,item:t})=>(0,P.jsx)("div",{className:E,children:(0,P.jsx)(ot.w,{sharingInfo:null,uri:t.uri,onClick:e,size:"small",interactionData:{type:"click",intent:"share"},disableTooltip:!0,ariaLabel:(0,at.gH)(t.uri)?o.Ru.get("context-menu.copy-episode-link"):o.Ru.get("context-menu.copy-track-link")})});var ut=i(88420);const dt=n.memo((({item:e,spec:t,logger:i})=>{const n=e.uri,{onClickPlayPause:r,onClickSkipPrevious:l,onClickSkipNext:a,onClickRepeat:o,onClickShuffle:c,onClickVolumeButton:u,onClickVolumeBar:d,onDragVolumeBar:m,onClickSeekBack:g,onClickSeekForward:p,onClickShare:h}=f({uri:n,spec:t,logger:i}),k=(0,s.NC)(D.fZ_),x=(0,I.K)(),C=(0,rt.YQ)(m,500,{leading:!1,trailing:!0});if(!n)return null;const v=(0,F.N)(e),j=function(e){if((0,S.p)(e)||(0,ut.d)(e))return"audio"===e.mediaType||"mixed"===e.mediaType;return!1}(e),b="SMALL"===x.horizontal,y="SMALL"===x.vertical,N="MEDIUM"===x.vertical,B="DEFAULT"===x.vertical;return v?y?(0,P.jsxs)(P.Fragment,{children:[(0,P.jsx)(lt.xJ,{onClick:r}),(0,P.jsx)(lt.v3,{onClick:p})]}):B?(0,P.jsx)(lt.v3,{onClick:p}):(0,P.jsxs)(P.Fragment,{children:[(0,P.jsx)(lt.hC,{onClick:g}),(0,P.jsx)(lt.xJ,{onClick:r}),(0,P.jsx)(lt.v3,{onClick:p}),(0,P.jsx)(st.M,{mode:st.V.SHOW_SLIDER_ON_HOVER,sliderSize:80,sliderDirection:"vertical",onToggleMuteClick:u,onVolumeBarClick:d,onVolumeBarDrag:C})]}):y?(0,P.jsxs)(P.Fragment,{children:[(0,P.jsx)(lt.xJ,{onClick:r}),j?(0,P.jsx)(lt.v3,{onClick:p}):(0,P.jsx)(lt.$K,{onClick:a})]}):(0,P.jsxs)(P.Fragment,{children:[k?(0,P.jsx)(ct,{item:e,onClick:h}):(0,P.jsx)("div",{className:w,children:(0,P.jsx)(R,{item:e,spec:t,logger:i})}),j?(0,P.jsx)(lt.hC,{onClick:g}):(0,P.jsx)(lt.uP,{onClick:c}),(0,P.jsx)(lt.dQ,{onClick:l}),(0,P.jsx)(lt.xJ,{iconSize:b||N?"small":"medium",onClick:r,className:L}),(0,P.jsx)(lt.$K,{onClick:a}),j?(0,P.jsx)(lt.v3,{onClick:p}):(0,P.jsx)(lt.s_,{onClick:o}),(0,P.jsx)(st.M,{mode:st.V.SHOW_SLIDER_ON_HOVER,sliderSize:80,sliderDirection:"vertical",onToggleMuteClick:u,onVolumeBarClick:d,onVolumeBarDrag:C})]})}));var mt=i(46300);const gt=n.memo((({item:e,spec:t,logger:i,onDragEnd:r,onDragStart:l})=>{const s=e.uri,{onClickProgressBar:a,onDragProgressBar:o}=f({uri:s,spec:t,logger:i}),c=(0,n.useCallback)(((e,t)=>{switch(t){case"drag":return o(e);case"hit":return a(e);default:return(0,b.k)(t)}}),[a,o]);return(0,P.jsx)(mt.x,{isPreview:!1,onChange:c,onDragStart:l,onDragEnd:r,timerPlacement:"above"})}));function pt(e){if(!e)return null;return{width:e.innerWidth,height:e.innerHeight}}var ht=i(79299);var kt=i(60751),xt=i(75882);var Ct=i(50370),vt=i(82092),jt=i(69798);const bt=(0,n.memo)((()=>{const e=(0,n.useRef)(null),{item:t,context:i}=(0,c.L)()??{},r=640,u=(0,s.NC)(D.Ln9),d=(0,s.NC)(D.rWU),m=(0,n.useMemo)((()=>(0,je.h)(t?.images??void 0,{desiredSize:r})),[t?.images,r]),g=(0,kt.z)(m,me),p=(0,s.NC)(D.a4n);((e,t)=>{const i=(0,xt.o)((e=>e?.nextItems?.[0]),((e,t)=>e?.uri===t?.uri)),r=(0,n.useMemo)((()=>(0,je.h)(i?.images??void 0,{desiredSize:e})),[i?.images,e]);(0,kt.z)(r,t)})(r,me);const{spec:h,logger:k}=(0,z.r)(a.w,{});(({spec:e,logger:t})=>{const i=(0,Ce.ox)(),r=(0,n.useRef)(null);null===r.current&&(r.current=pt(i)),(0,ht.s)((()=>{const n=pt(i);null!==n&&null!==r.current&&(t.logInteraction(e.dragUiResize2d({startWidthPx:r.current.width,startHeightPx:r.current.height,endWidthPx:n.width,endHeightPx:n.height})),r.current=n)}),{throttleTime:500,leading:!1,trailing:!0})})({logger:k,spec:h}),(({spec:e,logger:t,pipWindow:i})=>{(0,n.useEffect)((()=>{if(!i)return;const n=n=>{if(n.currentTarget===i){const i=e.windowControlsFactory().closeButtonFactory().hitUiHide();t.logInteraction(i)}};return i.addEventListener("pagehide",n),()=>{i.removeEventListener("pagehide",n)}}),[t,i,e])})({logger:k,spec:h,pipWindow:window.documentPictureInPicture?.window??null});const{setVideoPlayerUIFlag:x}=(0,Ge.d)(),[C,v]=(0,n.useState)("");(0,n.useLayoutEffect)((()=>{v(fe)}),[]);const j=function(){const e=(0,Ce.ox)(),[t,i]=(0,n.useState)(!1);return(0,ht.s)((()=>{const t=pt(e);null!==t&&(t.width<=300&&t.height<=300?i(!0):i(!1))}),{throttleTime:500,leading:!1,trailing:!0}),t}();(0,n.useEffect)((()=>{p&&x(Ye.n.documentPip,!0)}),[p,x]);const{enqueueSnackbar:b}=(0,vt.d)(),f=(0,n.useCallback)((e=>{var t;(t=e.target)&&"object"==typeof t&&"nodeName"in t&&"A"===t.nodeName&&"_blank"!==e.target.target&&(H()?J():b(o.Ru.get("web-player.pip-mini-player.snackbar.link-opened-in-main-window")))}),[b]);((e,t)=>{const i=(0,Ce.ox)(),r=t??i;(0,n.useEffect)((()=>{e&&r&&(r.document.title=e)}),[e,r])})(o.Ru.get("web-player.pip-mini-player.window-title"));const y=(0,n.useRef)(null),N=(0,s.NC)(D.HYy),S=(0,jt.t)(h,N),[B,w]=(0,n.useState)(!1),[T,L]=(0,n.useState)(!1),E=(0,n.useRef)(null),M=(0,n.useRef)(null),R=(0,n.useCallback)((()=>{w(!0),E.current&&clearTimeout(E.current),E.current=setTimeout((()=>{w(!1);const e=he(y.current,"--mouse-active-over-controls-fadeout-timeout",300,"ms");M.current&&clearTimeout(M.current),M.current=setTimeout((()=>{M.current=null}),e)}),1e3)}),[]),I=(0,n.useCallback)((()=>{M.current||w(!1)}),[]),_=(0,n.useCallback)((()=>{L(!0)}),[]),A=(0,n.useCallback)((()=>{L(!1)}),[]);if(!t||!i)return null;const V={"--background-color":g,"--background-image-url":`url(${m})`,"--background-image-width":"640px","--background-image-height":"640px",display:"var(--mini-player-display)"},U=function(e){return"video"===e.mediaType||"mixed"===e.mediaType}(t),W=(0,F.N)(t);return!u&&!W&&j?(0,P.jsx)(se,{}):(0,P.jsx)(Ct.n,{domRootRef:e,children:(0,P.jsxs)("div",{ref:y,className:l()("encore-dark-theme","encore-small-devices-theme",{"circular-sp-vietnamese":d},be),style:{"--mini-player-display":"none","--mini-player-drag-display":"none"},children:[(0,P.jsx)(it,{}),(0,P.jsxs)("div",{className:l()(Te,Le),style:V,ref:S,children:[(0,P.jsx)("div",{className:l()(Ee,{[Pe]:!U}),"data-testid":"pip-hover-element",children:(0,P.jsx)("div",{className:Me,id:"document-pip-main-container",children:(0,P.jsx)(Oe,{})})}),(0,P.jsx)(Z,{item:t,className:Ke,onClick:f}),(0,P.jsxs)("div",{className:l()("encore-over-media-set",_e,{[We]:B||T,[Ue]:(0,F.N)(t)}),dir:"ltr","data-testid":ce,onMouseEnter:R,onMouseMove:R,onMouseLeave:I,children:[(0,P.jsx)("div",{className:l()(Ae),dir:"ltr",children:(0,P.jsx)(dt,{item:t,spec:h,logger:k})}),(0,P.jsx)("div",{className:l()(Ve),dir:"ltr",children:(0,P.jsx)(gt,{item:t,spec:h,logger:k,onDragEnd:A,onDragStart:_})})]})]}),(0,P.jsx)("div",{className:C,children:(0,P.jsx)(nt.B,{fadeIn:!1})}),(0,P.jsx)("div",{ref:e,className:we})]})})}))}}]);
//# sourceMappingURL=xpui-pip-mini-player.js.map