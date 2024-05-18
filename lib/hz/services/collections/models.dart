class Field<T> {
  final String name;
  final T value;

  const Field({required this.name, required this.value});
}

enum PartOfSpeech { noun, verb, adjective }

class Word {
  Word({
    required String target,
    required String reading,
    required List<String> meanings,
    required PartOfSpeech partOfSpeech,
    String? dictionaryForm,
    String? presentAffirmativeForm,
    String? presentNegativeForm,
  })  : target = Field(name: 'Target', value: target),
        reading = Field(name: 'Reading', value: reading),
        meanings = Field(name: 'Meanings', value: meanings),
        partOfSpeech = Field(name: 'Part of speech', value: partOfSpeech),
        dictionaryForm = Field(name: 'Dictionary form', value: dictionaryForm),
        presentAffirmativeForm = Field(name: 'Present affirmative form', value: presentAffirmativeForm),
        presentNegativeForm = Field(name: 'Present negative form', value: presentNegativeForm);

  Field<String> target;
  Field<String> reading;
  Field<List<String>> meanings;
  Field<PartOfSpeech> partOfSpeech;
  Field<String?> dictionaryForm;
  Field<String?> presentAffirmativeForm;
  Field<String?> presentNegativeForm;
}
