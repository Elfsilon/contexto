import 'package:cringe/hz/models/task.dart';
import 'package:cringe/hz/services/collections/models.dart';

class EnglishContext implements CollectionModel {
  EnglishContext({
    required String target,
    required List<String> meanings,
    String? explanation,
  })  : target = Field(name: 'Context', value: target),
        meanings = Field(name: 'Meanings', value: meanings),
        explanation = Field(name: 'Explanation', value: explanation);

  Field<String> target;
  Field<List<String>> meanings;
  Field<String?> explanation;

  @override
  CollectionItem toCollectionItem() {
    return CollectionItem(
      target: SelectableField(mode: TrainingMode.both, name: target.name, value: target.value),
      fields: [
        SelectableField(
          types: const [TaskType.pickOne, TaskType.connect],
          mode: TrainingMode.both,
          name: meanings.name,
          value: meanings.value.join(", "),
        ),
        if (explanation.value != null)
          SelectableField(
            types: const [TaskType.pickOne, TaskType.connect],
            mode: TrainingMode.target,
            name: explanation.name,
            value: explanation.value!,
          ),
      ],
    );
  }
}

List<CollectionItem> createEnglishContextCollection() {
  return [
    EnglishContext(
      target: "The company I work for isn't doing so well this year",
      meanings: ["Дела в компании, где я работаю, в этом году идут не очень"],
      explanation: "Present progressive is used with period around now: this day/week/year/... (not finished period)",
    ),
    EnglishContext(
      target: "What's the matter? Why are you crying?",
      meanings: ["В чем дело, почему ты плачешь?"],
    ),
    EnglishContext(
        target: "Kostya is never satisfied, he's always complaining",
        meanings: ["Костя вечно чем-то недоволен, он постоянно жалуется (бесит)"],
        explanation: "He is complaining too much (bad)"),
    EnglishContext(
      target: "This room smells, let's open the window",
      meanings: ["Комната завонялась, давай откроем окно"],
      explanation: "Present simple used with: see, hear, smell, taste",
    ),
    EnglishContext(
      target: "You don't seem very happy these days",
      meanings: ["Ты выглядишь не слишком веселым последнее время"],
      explanation:
          "Present simple used with: like, want, need, prefer, know, realise, understand, recognise, believe, suppose, remember, mean, belong, fit, contain, consist, seem",
    ),
    EnglishContext(
      target: "I'm thinking about what happened. What do you think should I do?",
      meanings: ["Я думаю о случившемся. Как ты думаешь, что мне делать?"],
      explanation: "'Have an opinion' or 'believe' - present simp, 'consider' - present prog",
    ),
    EnglishContext(
        target: "The path is icy, don't slip. Don't worry. I'm being very careful",
        meanings: ["Дорога замерзла, не подскользнись. Не переживай, я осторожно"],
        explanation: "Behaving this way because he can control the situation"),
    EnglishContext(
      target: "You are normally very patient, so why are you being so unreasonable about waiting ten more minutes?",
      meanings: ["Обычно ты очень терпелив, так почему тебя ты так бесишься с того, чтобы подождать еще 10 минут?"],
      explanation: "Behaving this way beacuse he can control patience",
    ),
    EnglishContext(
      target: "Could you bring the bill with coffee? We're running late",
      meanings: ["Принестите счет с кофе, пожалуйста. Мы опаздываем"],
    ),
    EnglishContext(
      target: "I have to go, I'm running late",
      meanings: ["Принестите счет с кофе, пожалуйста. Мы опаздываем"],
      explanation: "Used to interrupt the conversation (If you want to stop)",
    ),
    EnglishContext(
      target: "We are running out of time. Can we take a decision before we wrap up the meeting?",
      meanings: ["У нас нет времени. Можем ли мы принять решение до того как закончим встречу?"],
      explanation:
          "They have used up most of their allocated time that they have no time left, for a particular activity such as a test",
    ),
    EnglishContext(
      target: "If no one else wants to share, we'll wrap up for today",
      meanings: ["Если больше никто не хочет поделиться, то мы закончим встречу на сегодня"],
    ),
  ].map((e) => e.toCollectionItem()).toList();
}
