enum TrainingMode { target, field, both, none }

enum PartOfSpeech { noun, verb, adjective }

abstract interface class CollectionModel {
  CollectionItem toCollectionItem();
}

class Field<T> {
  final String name;
  final T value;

  const Field({required this.name, required this.value});
}

class SelectableField {
  SelectableField({
    required this.mode,
    required this.name,
    required this.value,
  });

  String name;
  String value;
  TrainingMode mode;
}

class CollectionItem {
  CollectionItem({
    required this.target,
    required this.fields,
  });

  SelectableField target;
  List<SelectableField> fields;
}

class Word implements CollectionModel {
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

  @override
  CollectionItem toCollectionItem() {
    return CollectionItem(
      target: SelectableField(mode: TrainingMode.both, name: target.name, value: target.value),
      fields: [
        SelectableField(mode: TrainingMode.both, name: reading.name, value: reading.value),
        SelectableField(mode: TrainingMode.both, name: meanings.name, value: meanings.value.join(", ")),
        if (dictionaryForm.value != null)
          SelectableField(mode: TrainingMode.target, name: dictionaryForm.name, value: dictionaryForm.value!),
        if (presentAffirmativeForm.value != null)
          SelectableField(
              mode: TrainingMode.target, name: presentAffirmativeForm.name, value: presentAffirmativeForm.value!),
        if (presentNegativeForm.value != null)
          SelectableField(mode: TrainingMode.target, name: presentNegativeForm.name, value: presentNegativeForm.value!),
      ],
    );
  }
}

class Context implements CollectionModel {
  Context({
    required String target,
    required List<String> meanings,
  })  : target = Field(name: 'Target', value: target),
        meanings = Field(name: 'Meanings', value: meanings);

  Field<String> target;
  Field<List<String>> meanings;

  @override
  CollectionItem toCollectionItem() {
    return CollectionItem(
      target: SelectableField(mode: TrainingMode.both, name: target.name, value: target.value),
      fields: [
        SelectableField(mode: TrainingMode.both, name: meanings.name, value: meanings.value.join(", ")),
      ],
    );
  }
}

class Kana implements CollectionModel {
  Kana({
    required String target,
    required String reading,
  })  : target = Field(name: 'Target', value: target),
        reading = Field(name: 'Reading', value: reading);

  Field<String> target;
  Field<String> reading;

  @override
  CollectionItem toCollectionItem() {
    return CollectionItem(
      target: SelectableField(mode: TrainingMode.both, name: target.name, value: target.value),
      fields: [
        SelectableField(mode: TrainingMode.target, name: reading.name, value: reading.value),
      ],
    );
  }
}
