import { Header } from '../component/CommonHeader'
@Entry
@Component
struct ImagePage {
  @State imageWidth: number = 200

  build() {
    Column() {
      Row(){
        Header({title: '图片查看页面'})
      }
      .margin(10)
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
      Row(){
        Button('缩小')
          .width(80)
          .onClick(()=>{
            let temp: number =this.imageWidth<10?0:this.imageWidth-10
            this.imageWidth=temp
          })
        Button('放大')
          .width(80)
          .onClick(()=>{
            let temp: number =this.imageWidth>290?300:this.imageWidth+10
            this.imageWidth=temp
          })
      }
      .justifyContent(FlexAlign.SpaceEvenly)
      .width('100%')
      .margin(15)
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
  }
}
