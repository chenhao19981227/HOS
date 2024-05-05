
// 任务
class Task{
  static id: number=1
  name: string = '任务'+Task.id++
  finished: boolean =false
}
// 统一卡片样式
@Styles function card(){
  .width('95%')
  .padding(20)
  .backgroundColor(Color.White)
  .borderRadius(15)
  .shadow({radius: 6,color: '#1F000000',offsetX: 2,offsetY: 4})
}
// 统一任务完成样式
@Extend(Text) function finishedTask(){
  .decoration({type: TextDecorationType.LineThrough})
  .fontColor('#B1B2B1')
}

@Entry
@Component
struct ProgressPage {
  @State totalTask: number=0
  @State finishTask: number=0
  @State tasks: Task[]=[]

  handleTaskChange(){
    this.totalTask=this.tasks.length
    this.finishTask=this.tasks.filter(item=>item.finished).length
  }

  build(){
    Column(){
      // 任务进度
      Row(){
        Text('任务进度: ')
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
        Stack(){
          Progress({
            value: this.finishTask,
            total: this.totalTask,
            type: ProgressType.Ring
          })
            .width(100)
          Row(){
            Text(this.finishTask.toString())
              .fontSize(24)
              .fontColor('#36D')
            Text(' / '+this.totalTask.toString())
              .fontSize(24)
              .fontColor('#36D')
          }
        }
      }
      .card()
      .margin({top:20,bottom:10})
      .justifyContent(FlexAlign.SpaceEvenly)
      // 新增任务按钮
      Button('新增任务')
        .width(200)
        .onClick(()=>{
          this.tasks.push(new Task())
          this.handleTaskChange()
        })
      List(){
        ForEach(
          this.tasks,
          (item: Task,index)=>{
            ListItem(){
              Row(){
                Text(item.name)
                  .fontSize(20)
                Checkbox()
                  .select(item.finished)
                  .onChange(val=>{
                    item.finished=val
                    this.handleTaskChange()
                  })
              }
              .card()
              .margin({top:10,bottom:10})
              .justifyContent(FlexAlign.SpaceBetween)
            }
            .swipeAction({end: this.DeleteTask(index)})
          }
        )
      }
      .width('100%')
      .alignListItem(ListItemAlign.Center)
      .layoutWeight(1)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F1F2F3')
  }
@Builder DeleteTask(index: number){
  Button(){
    Image('https://cdn.icon-icons.com/icons2/2406/PNG/512/trash_remove_icon_145922.png')
      .fillColor(Color.White)
      .width(30)
  }
  .width(50)
  .height(50)
  .type(ButtonType.Circle)
  .backgroundColor(Color.White)
  .margin(10)
  .onClick(()=>{
    this.tasks.splice(index,1)
    this.handleTaskChange()
  })
}
}

