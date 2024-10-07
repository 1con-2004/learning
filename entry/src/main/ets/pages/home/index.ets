
import { ChatComponent } from "../chat/index";

import router from '@ohos.router';
@Component
export struct HomeComponent {
  private currentRoom: string = '客厅';
  private temperature: number = 26;
  private humidity: number = 40;
  private mediaPlaying: string = 'Dream it Possible';

  build() {
    Column() {
      // 顶部导航栏
      this._buildTopBar();

      // 中部卡片组件区域
      this._buildMiddleCards();

      // 底部快捷开关
      this._buildBottomControls();
    }
    .width('100%')
    .height('100%')
    .padding({ left: 10, right: 10, top: 10, bottom: 10 })
    .backgroundColor('#F0F0F0');
  }

  @Builder
  _buildTopBar() {
    Row() {
      // 房间切换按钮
      Button(this.currentRoom)
        .onClick(() => {
          this.switchRoom();
        })
        .width(120)
        .height(40)
        .backgroundColor('#FFFFFF')
        .borderRadius(20)
        .fontSize(16)
        .fontColor('#000000');

      // 使用 Padding 占位
      Blank().width(20);  // 使用 Blank() 替换 Spacer

      // AI 聊天按钮
      Button('AI 聊天')
        .onClick(() => {
          // 改用 Router.push() 实现页面跳转
          router.pushUrl({ url: 'pages/chat/index' });
        })
        .width(40)
        .height(40)
        .backgroundImage('url(/common/dialog_logo.png)')
    }
    .width('100%')
    .height(50)
    .padding({ top: 10, bottom: 10 });
  }

  @Builder
  _buildMiddleCards() {
    Column() { // 替换掉 Grid，改为 Column 并手动控制每行的布局
      Row() {
        this._buildInfoCard('温度', `${this.temperature}°C`, '#FFD700');
        this._buildInfoCard('湿度', `${this.humidity}%`, '#87CEFA');
        this._buildMediaCard('影音娱乐', this.mediaPlaying, '#8A2BE2');
        this._buildMoreCard();
      }
      .width('100%')
      .height(100)
      .padding({ top: 10 });
    }
    .width('100%')
    .padding({ top: 10 });
  }

  @Builder
  _buildInfoCard(title: string, value: string, color: string) {
    Column() {
      Text(title)
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .fontColor('#000000');
      Text(value)
        .fontSize(24)
        .fontColor(color)
        .fontWeight(FontWeight.Bold)
        .padding({ top: 10 });
    }
    .width(100)
    .height(100)
    .backgroundColor('#FFFFFF')
    .borderRadius(10)
    .margin({ bottom: 10 });
  }

  @Builder
  _buildMediaCard(title: string, song: string, color: string) {
    Column() {
      Text(title)
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .fontColor('#000000');
      Text(song)
        .fontSize(18)
        .fontColor(color)
        .padding({ top: 10 });

      // 切换歌曲按钮
      Button('下一首')
        .onClick(() => {
          this.changeSong();
        })
        .fontSize(14)
        .fontColor('#FFFFFF')
        .backgroundColor('#0000FF')
        .width(80)
        .height(30)
        .borderRadius(15)
        .margin({ top: 10 });
    }
    .width(100)
    .height(100)
    .backgroundColor('#FFFFFF')
    .borderRadius(10)
    .margin({ bottom: 10 });
  }

  @Builder
  _buildMoreCard() {
    Button('更多')
      .onClick(() => {
        router.pushUrl({ url: 'pages/MoreStatus' });
      })
      .width(100)
      .height(100)
      .backgroundColor('#FFFFFF')
      .borderRadius(10)
      .fontSize(18)
      .fontColor('#000000')
      .margin({ bottom: 10 });
  }

  @Builder
  _buildBottomControls() {
    Row() {
      Button('灯光开关')
        .onClick(() => {
          this.toggleLights();
        })
        .fontSize(16)
        .width(120)
        .height(50)
        .backgroundColor('#FFA07A')
        .borderRadius(10);

      Blank().width(20);  // 占位，替换 Spacer

      Button('调节温度')
        .onClick(() => {
          this.adjustTemperature();
        })
        .fontSize(16)
        .width(120)
        .height(50)
        .backgroundColor('#87CEEB')
        .borderRadius(10);
    }
    .width('100%')
    .padding({ top: 20 });
  }

  // 模拟功能
  switchRoom() {
    this.currentRoom = this.currentRoom === '客厅' ? '卧室' : '客厅';
  }

  changeSong() {
    this.mediaPlaying = this.mediaPlaying === 'Dream it Possible' ? 'Imagine Dragons' : 'Dream it Possible';
  }

  toggleLights() {
    console.log('切换灯光状态');
  }

  adjustTemperature() {
    this.temperature += 1;
  }
}
