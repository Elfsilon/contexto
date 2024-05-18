import { PickOneTask, Status } from '../types/study.types'
import { Random } from '../utils/random'
import { StudyService } from './types'

export class PickOneStudyService implements StudyService<PickOneTask, number> {
  mockTasks: PickOneTask[] = [
    {
      collectionID: 0,
      itemID: 0,
      target: 'Default task 1',
      variants: ['666', '42', '1488', '228'],
      answerIndex: 1,
    },
    {
      collectionID: 0,
      itemID: 0,
      target: 'Default task 1',
      variants: ['666', '228', '1488', '42'],
      answerIndex: 3,
    },
  ]

  getTask(collectionID: number): PickOneTask {
    return new Random().randItem(this.mockTasks)
  }

  /**
   *
   * @param answer index of right answer
   */
  checkAnswer(task: PickOneTask, answer: number): Status {
    return answer === task.answerIndex ? Status.Success : Status.Fail
  }

  sendResult(collectionID: number, itemID: number, time: number, status: Status): void {}
}
