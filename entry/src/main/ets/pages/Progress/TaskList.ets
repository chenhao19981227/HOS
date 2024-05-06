// 任务
@Observed
class Task{
  static id: number=1
  name: string = '任务'+Task.id++
  finished: boolean =false
}
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
@Component
export struct TaskList{
  @Link totalTask: number
  @Link finishTask: number
  @State tasks: Task[]=[]

  handleTaskChange(){
    this.totalTask=this.tasks.length
    this.finishTask=this.tasks.filter(item=>item.finished).length
  }
  build(){
    Column(){
      // 新增任务按钮
      Button('新增任务')
        .width(200)
        .onClick(()=>{
          this.tasks.push(new Task())
          this.handleTaskChange()
        })
      .margin({bottom: 10})
      List({space: 10}){
        ForEach(
          this.tasks,
          (item: Task,index)=>{
            ListItem(){
              TaskItem({item: item,onTaskChange: this.handleTaskChange.bind(this)})
            }
            .swipeAction({end: this.DeleteTask(index)})
          }
        )
      }
      .width('100%')
      .alignListItem(ListItemAlign.Center)
      .layoutWeight(1)
    }
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
@Component
struct TaskItem{
  @ObjectLink item: Task
  onTaskChange: ()=>void
  build(){
    Row(){
      if(this.item.finished){
        Text(this.item.name)
          .finishedTask()
      }else{
        Text(this.item.name)
      }
      Checkbox()
        .select(this.item.finished)
        .onChange(val=>{
          this.item.finished=val
          this.onTaskChange()
        })
    }
    .card()
    .justifyContent(FlexAlign.SpaceBetween)
  }
}