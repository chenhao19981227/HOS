import router from '@ohos.router'
@Entry
@Component
struct AnimationPage {
  @State isBegin: boolean=false
  @State startX: number = 200
  @State startY: number = 180
  @State angle: number = 0
  @State src: Resource = $r('app.media.MatchstickMan')
  build() {
    Row() {
      Stack(){
        Button('返回')
          .position({x:0,y:0})
          .backgroundColor('#20101010')
          .onClick(()=>{
            router.back()
          })
        if(!this.isBegin){
          Button('开始游戏')
            .onClick(()=>{
              this.isBegin=true
            })
        }else{
          Image(this.src)
            .position({x: this.startX-100,y:this.startY-100})
            .rotate({angle: this.angle,centerX: '50%',centerY: '50%'})
            .width(200)
            .height(200)
            .backgroundColor(Color.Transparent)
            .animation({duration:200})
        }
        Row(){
          Button('←')
            .backgroundColor('#20101010')
            .onClick(()=>{
              this.startX-=20
              this.src=$r('app.media.MatchstickMan_rev')
            })
          Column({space: 40}){
            Button('↑')
              .backgroundColor('#20101010')
              .onClick(()=>{
                this.startY-=20
              })
            Button('↓')
              .backgroundColor('#20101010')
              .onClick(()=>{
                this.startY+=20
              })
          }
          Button('→')
            .backgroundColor('#20101010')
            .onClick(()=>{
              this.startX+=20
              this.src=$r('app.media.MatchstickMan')
            })
        }
        .height(240)
        .width(240)
        .position({x:20,y:150})
      }
      .width('100%')
      .height('100%')
    }
  }
}