import router from '@ohos.router'
class RouterInfo{
  url: string
  title: string

  constructor(url: string, title: string) {
    this.url=url
    this.title=title
  }
}

@Entry
@Component
struct Index {
  @State message: string = '页面列表'
  private routers: RouterInfo[]=[
    new RouterInfo('pages/ImagePage','图片查看页面'),
    new RouterInfo('pages/ListItemPage','商品列表页面'),
    new RouterInfo('pages/Progress/ProgressPage2','任务列表页面'),
    new RouterInfo('pages/AnimationPage','动画页面')
  ]

  build() {
    Column() {
      Text(this.message)
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
      List({space:20}){
        ForEach(
          this.routers,
          (router: RouterInfo,index)=>{
            ListItem(){
              this.RouterItem(router,index+1)
            }
          }
        )
      }
      .layoutWeight(1)
      .alignListItem(ListItemAlign.Center)
      .width('100%')
    }
    .width('100%')
    .height('100%')
  }
  @Builder RouterItem(r: RouterInfo,index: number){
    Row(){
      Text(index+'.')
        .fontSize(20)
        .fontColor(Color.White)
      Blank()
      Text(r.title)
        .fontSize(20)
        .fontColor(Color.White)
    }
    .width('90%')
    .padding(12)
    .backgroundColor('#38F')
    .borderRadius(20)
    .shadow({radius: 6,color: '#4F000000',offsetX: 2,offsetY: 4})
    .onClick(()=>{
      router.pushUrl(
        {
          url: r.url,
          params: {id: index}
        },
        router.RouterMode.Single,
        err=>{
          if(err){
            console.log('路由失败')
          }
        }
      )
    })
  }
}