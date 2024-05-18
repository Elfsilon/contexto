export enum Status {
  Success,
  Fail,
  Skip,
}

export interface TaskBase {
  collectionID: number
  itemID: number
}

export interface DefaultTask extends TaskBase {
  target: string
  answer: string
}

export interface PickOneTask extends TaskBase {
  target: string
  variants: string[]
  answerIndex: number
}

export interface PickManyTask extends TaskBase {
  target: string
  variants: string[]
  answerIndexes: number[]
}

export interface ConnectVariantsTask extends TaskBase {
  targets: string[]
  variants: string[]
  answers: Map<number, number>
}
