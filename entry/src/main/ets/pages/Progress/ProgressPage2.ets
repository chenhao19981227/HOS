
import { TaskList } from './TaskList'
import { TaskStatistics } from './TaskStatistics'
// 统一卡片样式

@Entry
@Component
struct ProgressPage {
  @State totalTask: number=0
  @State finishTask: number=0

  build(){
    Column(){
      TaskStatistics({finishTask: this.finishTask,totalTask: this.totalTask})
      // 新增任务按钮
      TaskList({finishTask: $finishTask,totalTask: $totalTask})
        .layoutWeight(1)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F1F2F3')
  }
}

