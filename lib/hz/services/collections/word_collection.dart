import 'package:cringe/hz/services/collections/models.dart';

List<CollectionItem> createWordCollection() {
  return [
    ..._createNouns(),
    ..._createVerbs(),
  ];
}

List<CollectionItem> _createNouns() {
  return [
    Word(
      target: "朝ご飯",
      reading: "あさごはん",
      meanings: ["Breakfast"],
      partOfSpeech: PartOfSpeech.noun,
    ).toCollectionItem(),
    Word(
      target: "昼ご飯",
      reading: "ひるごはん",
      meanings: ["Lunch"],
      partOfSpeech: PartOfSpeech.noun,
    ).toCollectionItem(),
    Word(
      target: "日曜日",
      reading: "にちようび",
      meanings: ["Sunday"],
      partOfSpeech: PartOfSpeech.noun,
    ).toCollectionItem(),
  ];
}

List<CollectionItem> _createVerbs() {
  return [
    Word(
      target: "聞く",
      reading: "きく",
      meanings: ["To hear"],
      partOfSpeech: PartOfSpeech.verb,
      dictionaryForm: "きく",
      presentAffirmativeForm: "聞きます",
      presentNegativeForm: "聞きません",
    ).toCollectionItem(),
    Word(
      target: "行く",
      reading: "いく",
      meanings: ["To go"],
      partOfSpeech: PartOfSpeech.verb,
      dictionaryForm: "行く",
      presentAffirmativeForm: "行きます",
      presentNegativeForm: "いくませ",
    ).toCollectionItem(),
  ];
}
