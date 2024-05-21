import 'package:cringe/hz/models/task.dart';
import 'package:cringe/hz/services/collections/models.dart';

class Context implements CollectionModel {
  Context({
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
            mode: TrainingMode.field,
            name: explanation.name,
            value: explanation.value!,
          ),
      ],
    );
  }
}

List<CollectionItem> createContextCollection() {
  return [
    Context(target: "これは何ですか", meanings: ["What is this?"]),
    Context(target: "魚はおいしい", meanings: ["Fish is delicious"]),
    Context(
      target: "私はよくテレビを見ます",
      meanings: ["I often watch TV"],
    ),
    Context(
      target: "エリクさんは時々朝ご飯を食べません",
      meanings: ["Sometimes Erik doesn't eat breakfast"],
    ),
    Context(
      target: "私は明日京都に行きます",
      meanings: ["I will go to Kyoto tomorrow"],
    ),
    Context(
      target: "私は今日家に帰りません",
      meanings: ["I will not return home today"],
    ),
    Context(
      target: "コーヒーを飲みます",
      meanings: ["I drink coffee"],
      explanation: "What? Coffee - direct object",
    ),
    Context(
      target: "音楽を聞きます",
      meanings: ["I listen to music"],
      explanation: "What? Music - direct object",
    ),
    Context(
      target: "テレビを見ます",
      meanings: ["I watch TV"],
      explanation: "What? TV - direct object",
    ),
    Context(
      target: "図書館で本を読みます",
      meanings: ["I will read books in the library"],
      explanation: "Where? Library. What? book",
    ),
    Context(
      target: "うちでテレビを見ます",
      meanings: ["I will watch TV at home"],
      explanation: "Where? home. What? TV",
    ),
    Context(
      target: "私は今日学校に行きません (へ can be used)",
      meanings: ["I will not go to school today"],
      explanation: "When? Today. Where? School",
    ),
    Context(
      target: "私はうちに帰ります (へ can be used)",
      meanings: ["I will return (to) home"],
      explanation: "Where? Home",
    ),
    Context(
      target: "日曜日に京都に行きます",
      meanings: ["I will go to Kyoto on Sunday"],
      explanation: "When? Sunday. Where? Kyoto",
    ),
    Context(
      target: "十一時に寝ます",
      meanings: ["I will go to bed at 11"],
      explanation: "When? 11",
    ),
    Context(
      target: "十一時ごろに寝ます",
      meanings: ["I will go to bed at about 11"],
      explanation: "When? About 11",
    ),
    Context(
      target: "明日来ます",
      meanings: ["I will come tomorrow"],
      explanation: "に do not use with time relative to the present moment like 'tomorrow'",
    ),
    Context(
      target: "明日来ません",
      meanings: ["I won't come today"],
      explanation: "に do not use with time relative to the present moment like 'today'",
    ),
    Context(
      target: "毎晩テレビを見ます",
      meanings: ["I watch TV every evening"],
      explanation: "に doesn't use with regular intervals like 'every evening'",
    ),
    Context(
      target: "いつ行きますか",
      meanings: ["When will you go?"],
      explanation: "に doesn't use with 'when'",
    ),
    Context(
      target: "朝(に)新聞を読みます",
      meanings: ["I read the newspaper in the morning"],
      explanation: "に is optional with the parts of a day like 'morning'",
    ),
    Context(
      target: "週末(に)何をしますか",
      meanings: ["What will you do on weekends?"],
      explanation: "に is optional with 'weekends'",
    ),
  ].map((e) => e.toCollectionItem()).toList();
}
