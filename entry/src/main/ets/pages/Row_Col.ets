@Entry
@Component
struct Row_Col {
  @State message: string = 'Hello World'
  @State imageWidth: number = 200

  build() {
    Column(){
      Row(){
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .fontColor('#ff138fa0')
      }
      .justifyContent(FlexAlign.Center)
      .margin({top:30})
      Row(){
        Image('https://pic.huitu.com/pic/20230408/632020_20230408095152974201_0.jpg')
          .width(this.imageWidth)
      }
      .justifyContent(FlexAlign.Center)
      .margin({top: 30,bottom:15})
      Row(){
        Text($r('app.string.Image_name'))
          .fontSize(20)
      }
      Row(){
        Text($r('app.string.Width_label'))
          .fontSize(20)
        TextInput({text: this.imageWidth.toFixed(0)})
          .width(150)
          .type(InputType.Number)
          .onChange(value=>{
            this.imageWidth=parseInt(value)
          })
      }
      .margin({top:25,bottom:50})
      .justifyContent(FlexAlign.SpaceBetween)
      .width('60%')
      Row(){
        Button('缩小')
          .width(100)
          .height(50)
          .fontSize(20)
          .onClick(()=>{
            let temp: number =this.imageWidth<10?0:this.imageWidth-10
            this.imageWidth=temp
          })
        Button('放大')
          .width(100)
          .height(50)
          .fontSize(20)
          .onClick(()=>{
            let temp: number =this.imageWidth>290?300:this.imageWidth+10
            this.imageWidth=temp
          })
      }
      .margin({bottom: 30})
      .width('100%')
      .justifyContent(FlexAlign.SpaceEvenly)
      Slider({
        min: 100,
        max: 300,
        value: this.imageWidth,
        step: 10
      })
        .width('80%')
        .blockColor('#36D')
        .showTips(true)
        .trackThickness(6)
        .onChange(value=>{
          this.imageWidth=value
        })
    }
    .width('100%')
    .height('100%')
  }
}
