@Entry
@Component
struct ImagePage {
  @State message: string = 'Hello World'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .onClick(()=>{
            this.message='Hello Master'
          })
        Image('https://pic.huitu.com/pic/20230408/632020_20230408095152974201_0.jpg')
          .width(250)
        Text($r('app.string.Image_name'))
          .fontSize(20)
      }
      .width('100%')
    }
    .height('100%')
  }
}
