@Entry
@Component
struct Index {
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
        // 网络加载
        Image('https://pic.huitu.com/pic/20230408/632020_20230408095152974201_0.jpg')
          .width(250)
        // 本地加载
        Image($r('app.media.icon'))
          .width(250)
          .interpolation(ImageInterpolation.High)
      }
      .width('100%')
    }
    .height('100%')
  }
}