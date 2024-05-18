import { Status } from '../types/study.types'

export interface StudyService<T, V> {
  getTask(collectionID: number): T

  checkAnswer(task: T, answer: V): Status

  /**
   *
   * @param time time in miliseconds spent on the task
   * @param status if [Skip], then counts as failed, but with a really little cost
   */
  sendResult(collectionID: number, itemID: number, time: number, status: Status): void
}
