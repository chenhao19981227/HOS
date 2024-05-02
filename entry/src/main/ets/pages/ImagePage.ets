@Entry
@Component
struct ImagePage {
  @State message: string = 'Hello World'
  @State imageWidth: number = 30

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
          .width(this.imageWidth)
        Text($r('app.string.Image_name'))
          .fontSize(20)
        TextInput({text: this.imageWidth.toFixed(0)})
          .width(150)
          .type(InputType.Number)
          .onChange(value=>{
            this.imageWidth=parseInt(value)
          })
        Text($r('app.string.Width_label'))
          .fontSize(20)
      }
      .width('100%')
    }
    .height('100%')
  }
}
