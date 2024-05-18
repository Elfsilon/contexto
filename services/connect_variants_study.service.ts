import { ConnectVariantsTask, Status } from '../types/study.types'
import { StudyService } from './types'

export class ConnectVariantsStudyService implements StudyService<ConnectVariantsTask, Map<number, number>> {
  mockTasks: ConnectVariantsTask = {
    collectionID: 0,
    itemID: 0,
    targets: ['Target 1', 'Target 2', 'Target 3', 'Target 4'],
    variants: ['666', '42', '1488', '228'],
    answers: {
      0: 1,
      1: 2,
      2: 3,
      3: 0,
    },
  }

  getTask(collectionID: number): ConnectVariantsTask {
    return this.mockTasks
  }

  checkAnswer(task: ConnectVariantsTask, answers: Map<number, number>): Status {
    for (const [key, value] of answers) {
      if (task.answers.get(key) !== value) {
        return Status.Fail
      }
    }

    return Status.Success
  }

  sendResult(collectionID: number, itemID: number, time: number, status: Status): void {}
}
