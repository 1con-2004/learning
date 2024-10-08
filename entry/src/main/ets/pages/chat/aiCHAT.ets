import router from '@ohos.router';
@Entry
@Component
struct AICHAT{
   build() {
     Column() {
       Text("AI对话入口")

       Button('返回主页')
         .onClick(() => {
           router.pushUrl({ url: 'pages/Index' });  // 直接跳转到主页
         })
         .width(100)
         .height(40);

     }
   }

}