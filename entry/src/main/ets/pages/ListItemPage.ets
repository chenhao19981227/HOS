import { Header } from '../component/CommonHeader'
class Item{
  name: string
  image: ResourceStr
  price: number
  discount: number

  constructor(name: string, image: ResourceStr, price: number,discount: number=0) {
    this.name=name
    this.image=image
    this.price=price
    this.discount=discount
  }
}
@Builder function ItemCard(item: Item){
  Row(){
    Image(item.image)
      .width(100)
    Column({space: 4}){
      Text(item.name)
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
      if(item.discount){
        Text('原价:￥ '+item.price)
          .fontSize(18)
          .fontColor('#F36')
          .decoration({type: TextDecorationType.LineThrough})
        Text('折扣价:￥ '+(item.price-item.discount))
          .fontSize(18)
          .fontColor('#F36')
        Text('折扣价:￥ '+item.discount)
          .fontSize(18)
          .fontColor('#F36')
      }else{
        Text('￥ '+item.price)
          .fontSize(18)
          .fontColor('#F36')
      }
    }
    .width('100%')
    .alignItems(HorizontalAlign.Start)
    .justifyContent(FlexAlign.SpaceBetween)
  }
  .width('100%')
  .backgroundColor('#FFF')
  .borderRadius(20)
  .height(120)
  .padding(10)
}

@Styles function fillScreen(){
  .width('100%')
  .height('100%')
  .backgroundColor('#EFEFEF')
  .padding(20)
}

@Entry
@Component
struct ListItemPage {
  private items: Array<Item>=[
    new Item('华为Mate60','https://consumer.huawei.com/content/dam/huawei-cbg-site/cn/mkt/pdp/phones/mate60/img/design/design-intro.png',6999,500),
    new Item('小米6','https://d2lfcsub12kx0l.cloudfront.net/tw/product/img/Xiaomi_xiaomi_6_0419092419468_360x270.jpg',2999),
    new Item('小米11','https://i01.appmifile.com/v1/MI_18455B3E4DA706226CF7535A58E875F0267/pms_1615276371.8274623!400x400!85.png',3999),
    new Item('苹果13','https://m.media-amazon.com/images/I/71Gu0e-vdNL.jpg',4999),
    new Item('苹果13Pro','https://m.media-amazon.com/images/I/51UuPZLMaCL.jpg',5999),
    new Item('苹果13Pro','https://m.media-amazon.com/images/I/51UuPZLMaCL.jpg',5999)
  ]
  build() {
    Column({space: 8}){
      Header({title: '商品列表'})
      List({space: 8}){
        ForEach(
          this.items,
          (item: Item)=>{
            ListItem(){
              ItemCard(item)
            }
          })
      }
      .width('100%')
      .layoutWeight(1)
    }
    .fillScreen()
  }
}
