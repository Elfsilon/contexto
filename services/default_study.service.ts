import { DefaultTask, Status } from '../types/study.types'
import { Random } from '../utils/random'
import { StudyService } from './types'

export class DefaultStudyService implements StudyService<DefaultTask, string> {
  mockTasks: DefaultTask[] = [
    {
      collectionID: 0,
      itemID: 0,
      target: 'Default task 1',
      answer: '42',
    },
    {
      collectionID: 0,
      itemID: 0,
      target: 'Default task 2',
      answer: '42',
    },
  ]

  getTask(collectionID: number): DefaultTask {
    return new Random().randItem(this.mockTasks)
  }

  checkAnswer(task: DefaultTask, answer: string): Status {
    return answer === task.answer ? Status.Success : Status.Fail
  }

  sendResult(collectionID: number, itemID: number, time: number, status: Status): void {}
}
