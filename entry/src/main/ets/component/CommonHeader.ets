import router from '@ohos.router'
@Component
export struct Header {
  private title: ResourceStr
  build() {
      Row({space: 5}) {
        Image('https://pic.616pic.com/ys_img/00/09/00/33RycAZAJG.jpg')
          .margin({right:30})
          .width(30)
          .onClick(()=>{
            router.back()
          })
        Text(this.title)
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
      }
      .margin(10)
      .width('90%')
      .height(30)
    }
}