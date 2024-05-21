import 'package:cringe/hz/models/task.dart';
import 'package:cringe/hz/services/collections/models.dart';

class Word implements CollectionModel {
  Word({
    required String target,
    required String reading,
    required List<String> meanings,
    required Tag partOfSpeech,
    String? presentAffirmativeForm,
    String? presentNegativeForm,
  })  : target = Field(name: 'Word', value: target),
        reading = Field(name: 'Reading', value: reading),
        meanings = Field(name: 'Meanings', value: meanings),
        partOfSpeech = Field(name: 'Part of speech', value: partOfSpeech),
        presentAffirmativeForm = Field(name: 'Present affirmative form', value: presentAffirmativeForm),
        presentNegativeForm = Field(name: 'Present negative form', value: presentNegativeForm);

  Field<String> target;
  Field<String> reading;
  Field<List<String>> meanings;
  Field<Tag> partOfSpeech;
  Field<String?> presentAffirmativeForm;
  Field<String?> presentNegativeForm;

  @override
  CollectionItem toCollectionItem() {
    return CollectionItem(
      target: SelectableField(mode: TrainingMode.both, name: target.name, value: target.value),
      fields: [
        SelectableField(mode: TrainingMode.both, name: reading.name, value: reading.value),
        SelectableField(
          mode: TrainingMode.both,
          name: meanings.name,
          value: meanings.value.join(", "),
          types: const [TaskType.pickOne, TaskType.connect],
        ),
        SelectableField(
          mode: TrainingMode.target,
          name: partOfSpeech.name,
          value: partOfSpeech.value.name,
          types: const [TaskType.pickOne, TaskType.connect],
        ),
        if (presentAffirmativeForm.value != null)
          SelectableField(
            mode: TrainingMode.target,
            name: presentAffirmativeForm.name,
            value: presentAffirmativeForm.value!,
          ),
        if (presentNegativeForm.value != null)
          SelectableField(
            mode: TrainingMode.target,
            name: presentNegativeForm.name,
            value: presentNegativeForm.value!,
          ),
      ],
    );
  }
}

List<CollectionItem> createWordCollection() {
  return [
    ..._createNouns(),
    ..._createVerbs(),
  ];
}

List<CollectionItem> _createNouns() {
  return [
    Word(target: "映画", reading: "えいが", meanings: ["Movie"], partOfSpeech: PartOfSpeech.noun),
    Word(target: "音楽", reading: "おんがく", meanings: ["Music"], partOfSpeech: PartOfSpeech.noun),
    Word(target: "水", reading: "みず", meanings: ["Water"], partOfSpeech: PartOfSpeech.noun),
    Word(target: "お酒", reading: "おさけ", meanings: ["Alcohol"], partOfSpeech: PartOfSpeech.noun),
    Word(target: "お茶", reading: "おちゃ", meanings: ["Green tea"], partOfSpeech: PartOfSpeech.noun),
    Word(target: "米", reading: "こめ", meanings: ["Rice"], partOfSpeech: PartOfSpeech.noun),
    Word(target: "ご飯", reading: "ごはん", meanings: ["Cooked rice"], partOfSpeech: PartOfSpeech.noun),
    Word(target: "ライス", reading: "らいす", meanings: ["Rice (foreign dishes)"], partOfSpeech: PartOfSpeech.noun),
    Word(target: "朝ご飯", reading: "あさごはん", meanings: ["Breakfast"], partOfSpeech: PartOfSpeech.noun),
    Word(target: "昼ご飯", reading: "ひるごはん", meanings: ["Lunch"], partOfSpeech: PartOfSpeech.noun),
    Word(target: "晩ご飯", reading: "ばんごはん", meanings: ["Dinner"], partOfSpeech: PartOfSpeech.noun),
    Word(target: "朝", reading: "あさ", meanings: ["Morning"], partOfSpeech: PartOfSpeech.noun),
    Word(target: "明日", reading: "あした", meanings: ["Tomorrow"], partOfSpeech: PartOfSpeech.noun),
    Word(target: "今日", reading: "きょう", meanings: ["Today"], partOfSpeech: PartOfSpeech.noun),
    Word(target: "今晩", reading: "こんばん", meanings: ["Tonight"], partOfSpeech: PartOfSpeech.noun),
    Word(target: "家", reading: "いえ", meanings: ["House, home"], partOfSpeech: PartOfSpeech.noun),
    Word(target: "肉", reading: "にく", meanings: ["Meat"], partOfSpeech: PartOfSpeech.noun),
    Word(target: "魚", reading: "さかな", meanings: ["Fish"], partOfSpeech: PartOfSpeech.noun),
    Word(target: "山", reading: "やま", meanings: ["Mountain"], partOfSpeech: PartOfSpeech.noun),
    Word(target: "何", reading: "なに", meanings: ["What"], partOfSpeech: PartOfSpeech.noun),
    Word(target: "鳥", reading: "とり", meanings: ["Bird"], partOfSpeech: PartOfSpeech.noun),
    Word(target: "鼠", reading: "ねずみ", meanings: ["Mouse"], partOfSpeech: PartOfSpeech.noun),
    Word(target: "猫", reading: "ねこ", meanings: ["Cat"], partOfSpeech: PartOfSpeech.noun),
    Word(target: "犬", reading: "いぬ", meanings: ["Dog"], partOfSpeech: PartOfSpeech.noun),
    Word(target: "学校", reading: "がっこう", meanings: ["School"], partOfSpeech: PartOfSpeech.noun),
    Word(target: "学生", reading: "がくせい", meanings: ["Student"], partOfSpeech: PartOfSpeech.noun),
    Word(target: "先生", reading: "せんせい", meanings: ["Professor"], partOfSpeech: PartOfSpeech.noun),
    Word(target: "大学", reading: "だいがく", meanings: ["College, university"], partOfSpeech: PartOfSpeech.noun),
    Word(target: "毎晩", reading: "まいばん", meanings: ["Every night"], partOfSpeech: PartOfSpeech.noun),
    Word(target: "毎日", reading: "まいにち", meanings: ["Every day"], partOfSpeech: PartOfSpeech.noun),
    Word(target: "日曜日", reading: "にちようび", meanings: ["Sunday"], partOfSpeech: PartOfSpeech.noun),
    Word(target: "土曜日", reading: "どようび", meanings: ["Saturday"], partOfSpeech: PartOfSpeech.noun),
    Word(target: "週末", reading: "しゅうまつ", meanings: ["Weekend"], partOfSpeech: PartOfSpeech.noun),
    Word(target: "俺", reading: "おれ", meanings: ["I (masculine, rough)"], partOfSpeech: PartOfSpeech.noun),
    Word(target: "僕", reading: "ぼく", meanings: ["I (masculine)"], partOfSpeech: PartOfSpeech.noun),
    Word(target: "私", reading: "わたし", meanings: ["I (femenine, formal)"], partOfSpeech: PartOfSpeech.noun),
  ].map((e) => e.toCollectionItem()).toList();
}

List<CollectionItem> _createVerbs() {
  return [
    Word(
      target: "する",
      reading: "する",
      meanings: ["To do"],
      partOfSpeech: PartOfSpeech.irregularVerb,
      presentAffirmativeForm: "します",
      presentNegativeForm: "しません",
    ),
    Word(
      target: "来る",
      reading: "くる",
      meanings: ["To come"],
      partOfSpeech: PartOfSpeech.irregularVerb,
      presentAffirmativeForm: "来ます",
      presentNegativeForm: "来ません",
    ),
    Word(
      target: "見る",
      reading: "みる",
      meanings: ["To see"],
      partOfSpeech: PartOfSpeech.ruVerb,
      presentAffirmativeForm: "見ます",
      presentNegativeForm: "見ません",
    ),
    Word(
      target: "起きる",
      reading: "おきる",
      meanings: ["To wake up/To get up"],
      partOfSpeech: PartOfSpeech.ruVerb,
      presentAffirmativeForm: "起きます",
      presentNegativeForm: "起きません",
    ),
    Word(
      target: "寝る",
      reading: "ねる",
      meanings: ["To sleep"],
      partOfSpeech: PartOfSpeech.ruVerb,
      presentAffirmativeForm: "寝ます",
      presentNegativeForm: "寝ません",
    ),
    Word(
      target: "食べる",
      reading: "たべる",
      meanings: ["To eat"],
      partOfSpeech: PartOfSpeech.ruVerb,
      presentAffirmativeForm: "食べます",
      presentNegativeForm: "食べません",
    ),
    Word(
      target: "聞く",
      reading: "きく",
      meanings: ["To hear, to listen"],
      partOfSpeech: PartOfSpeech.uVerb,
      presentAffirmativeForm: "聞きます",
      presentNegativeForm: "聞きません",
    ),
    Word(
      target: "行く",
      reading: "いく",
      meanings: ["To go"],
      partOfSpeech: PartOfSpeech.uVerb,
      presentAffirmativeForm: "行きます",
      presentNegativeForm: "行きません",
    ),
    Word(
      target: "飲む",
      reading: "のむ",
      meanings: ["To drink"],
      partOfSpeech: PartOfSpeech.uVerb,
      presentAffirmativeForm: "飲みます",
      presentNegativeForm: "飲みません",
    ),
    Word(
      target: "読む",
      reading: "よむ",
      meanings: ["To read"],
      partOfSpeech: PartOfSpeech.uVerb,
      presentAffirmativeForm: "読みます",
      presentNegativeForm: "読みません",
    ),
    Word(
      target: "話す",
      reading: "はなす",
      meanings: ["To talk"],
      partOfSpeech: PartOfSpeech.uVerb,
      presentAffirmativeForm: "話します",
      presentNegativeForm: "話しません",
    ),
    Word(
      target: "帰る",
      reading: "かえる",
      meanings: ["To return, To come back"],
      partOfSpeech: PartOfSpeech.uVerb,
      presentAffirmativeForm: "帰ります",
      presentNegativeForm: "帰りません",
    ),
  ].map((e) => e.toCollectionItem()).toList();
}
