import 'package:cringe/hz/services/collections/models.dart';

List<Word> createWordCollection() {
  return [
    Word(
      target: "朝ご飯",
      reading: "あさごはん",
      meanings: ["Breakfast"],
      partOfSpeech: PartOfSpeech.noun,
      dictionaryForm: null,
      presentAffirmativeForm: null,
      presentNegativeForm: null,
    ),
    Word(
      target: "昼ご飯",
      reading: "ひるごはん",
      meanings: ["Lunch"],
      partOfSpeech: PartOfSpeech.noun,
      dictionaryForm: null,
      presentAffirmativeForm: null,
      presentNegativeForm: null,
    ),
    Word(
      target: "聞く",
      reading: "きく",
      meanings: ["To hear"],
      partOfSpeech: PartOfSpeech.verb,
      dictionaryForm: "きく",
      presentAffirmativeForm: "聞きます",
      presentNegativeForm: "聞きません",
    ),
    Word(
      target: "日曜日",
      reading: "にちようび",
      meanings: ["Sunday"],
      partOfSpeech: PartOfSpeech.noun,
      dictionaryForm: null,
      presentAffirmativeForm: null,
      presentNegativeForm: null,
    ),
    Word(
      target: "行く",
      reading: "いく",
      meanings: ["To go"],
      partOfSpeech: PartOfSpeech.verb,
      dictionaryForm: "行く",
      presentAffirmativeForm: "行きます",
      presentNegativeForm: "いくませ",
    ),
  ];
}
