@Component
export struct Header {
  private title: ResourceStr
  build() {
    Column({ space: 8 }) {
      Row() {
        Text(this.title)
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
      .height(30)
    }
  }
}