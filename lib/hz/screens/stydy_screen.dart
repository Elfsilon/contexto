import 'package:cringe/core/utils/context.dart';
import 'package:cringe/hz/controllers/study_cubit.dart';
import 'package:cringe/hz/models/task.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudyScreen extends StatefulWidget {
  const StudyScreen({super.key});

  @override
  State<StudyScreen> createState() => _StudyScreenState();
}

class _StudyScreenState extends State<StudyScreen> {
  int selectedCollectionId = 1;

  @override
  void initState() {
    super.initState();
    pickTask();
  }

  void pickTask() {
    final cubit = context.read<StudyCubit>();
    cubit.pickTask(selectedCollectionId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.color.neutral.n6,
      body: BlocBuilder<StudyCubit, Task>(
        builder: (context, state) {
          if (state == Task.empty()) {
            return Center(
              child: SizedBox.square(
                dimension: 32,
                child: CircularProgressIndicator(
                  color: context.theme.color.accent.blue.primary,
                ),
              ),
            );
          }

          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  state.title,
                  style: context.theme.font.title.copyWith(
                    color: context.theme.color.neutral.n3,
                  ),
                ),
                const SizedBox(height: 24),
                Text(state.targets.join(", "), style: context.theme.font.heading),
                const SizedBox(height: 32),
                StudyOptions(
                  values: state.variants,
                  onSelect: (index) => pickTask(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class StudyOptions extends StatelessWidget {
  const StudyOptions({
    super.key,
    required this.values,
    required this.onSelect,
  });

  final List<String> values;
  final Function(int index) onSelect;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 200),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: values.isEmpty
            ? []
            : List.generate(2 * values.length - 1, (i) {
                if (i % 2 != 0) return const SizedBox(height: 8);

                final index = i ~/ 2;
                return StudyOption(index: index, value: values[index], onSelect: onSelect);
              }),
      ),
    );
  }
}

class StudyOption extends StatefulWidget {
  const StudyOption({
    super.key,
    required this.index,
    required this.value,
    required this.onSelect,
  });

  final int index;
  final String value;
  final Function(int index) onSelect;

  @override
  State<StudyOption> createState() => _StudyOptionState();
}

class _StudyOptionState extends State<StudyOption> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    final borderColor = hover ? context.theme.color.neutral.n2 : context.theme.color.neutral.n3;
    final color = hover ? context.theme.color.neutral.n4 : context.theme.color.neutral.n6;

    return InkWell(
      child: InkWell(
        hoverColor: Colors.transparent,
        onTap: () => widget.onSelect(widget.index),
        onHover: (value) => setState(() => hover = value),
        child: AnimatedContainer(
          width: double.infinity,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          decoration: BoxDecoration(
            color: color,
            border: Border.all(color: borderColor),
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
          child: Text(widget.value),
        ),
      ),
    );
  }
}
