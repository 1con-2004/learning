  //  实际上的初始加载页面.在加载完后它会重定向到应用的主页面（pages/Index），这也是典型的闪屏页行为。
import { router } from '@kit.ArkUI';
 // 一方面是给程序加载时间,另一方面是还可以设置开屏的广告
@Entry
@Component
struct SplashPage {

  pageTransition() {
    PageTransitionEnter({ type: RouteType.Push, duration: 1000 })
      .slide(SlideEffect.Right)
    PageTransitionEnter({ type: RouteType.Pop, duration: 1000 })
      .slide(SlideEffect.Left)
    PageTransitionExit({ type: RouteType.Push, duration: 1000 })
      .slide(SlideEffect.Left)
    PageTransitionExit({ type: RouteType.Pop, duration: 1000 })
      .slide(SlideEffect.Right)
  }
  /// 闪屏页

  @State message: string = '闪屏页';

  aboutToAppear() {
    console.log('CustomComponent: aboutToAppear called. Component is about to appear.');
    setTimeout(() => {
      router.replaceUrl({ url: 'pages/Index' });
    },0) /// 1800
  }

  build() {
    RelativeContainer() {
      Image($r('app.media.ic_launcher'))
        .width(150)
        .alignSelf(ItemAlign.Center)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
    }
    .height('100%')
    .width('100%')
    .backgroundColor(0x000000)
  }


}