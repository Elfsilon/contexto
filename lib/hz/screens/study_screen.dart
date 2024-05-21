import 'package:cringe/core/utils/context.dart';
import 'package:cringe/hz/controllers/study_cubit.dart';
import 'package:cringe/hz/controllers/study_state.dart';
import 'package:cringe/hz/models/task.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudyScreen extends StatefulWidget {
  const StudyScreen({super.key});

  @override
  State<StudyScreen> createState() => _StudyScreenState();
}

class _StudyScreenState extends State<StudyScreen> {
  int selectedCollectionId = 2;

  @override
  void initState() {
    super.initState();
    final cubit = context.read<StudyCubit>();
    cubit.pickTask(selectedCollectionId);
  }

  void submitTask(int index) {
    final cubit = context.read<StudyCubit>();
    cubit.submitTask(answers: {0: index}, timeMs: 5000);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.color.neutral.n6,
      body: BlocBuilder<StudyCubit, StudyState>(
        builder: (context, state) {
          if (state.task == Task.empty()) {
            return Center(
              child: SizedBox.square(
                dimension: 32,
                child: CircularProgressIndicator(
                  color: context.theme.color.accent.blue.primary,
                ),
              ),
            );
          }

          final Widget userInputWidget;
          if (state.task.type == TaskType.def) {
            userInputWidget = StudyInput(
              answer: state.task.variants[0],
              hasError: state.failedIndexes.isNotEmpty,
              onSubmit: (matched) => submitTask(matched ? 0 : -1),
            );
          } else {
            userInputWidget = StudyOptions(
              values: state.task.variants,
              failedOptionIndexes: state.failedIndexes,
              onSelect: submitTask,
            );
          }

          return Stack(
            children: [
              Positioned(
                bottom: 40,
                right: 50,
                child: Text(state.counter.toString(), style: context.theme.font.heading),
              ),
              Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 600),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        state.task.title,
                        textAlign: TextAlign.center,
                        style: context.theme.font.title.copyWith(color: context.theme.color.neutral.n3),
                      ),
                      const SizedBox(height: 24),
                      Text(state.task.targets.join(", "),
                          textAlign: TextAlign.center, style: context.theme.font.heading),
                      const SizedBox(height: 32),
                      userInputWidget,
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class StudyInput extends StatefulWidget {
  const StudyInput({
    super.key,
    required this.answer,
    this.hasError = false,
    this.onSubmit,
  });

  final String answer;
  final bool hasError;
  final Function(bool)? onSubmit;

  @override
  State<StudyInput> createState() => _StudyInputState();
}

class _StudyInputState extends State<StudyInput> {
  final _focusNode = FocusNode();
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _focusNode.requestFocus();
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        _focusNode.requestFocus();
      }
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const inputBorder = OutlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent),
    );

    return TextField(
      autofocus: true,
      focusNode: _focusNode,
      controller: _controller,
      textAlign: TextAlign.center,
      showCursor: false,
      decoration: InputDecoration(
        border: inputBorder,
        focusedBorder: inputBorder,
        enabledBorder: inputBorder,
        focusedErrorBorder: inputBorder,
        errorBorder: inputBorder,
        hintText: "Start typing",
        hintStyle: context.theme.font.body.copyWith(
          color: context.theme.color.neutral.n4,
        ),
      ),
      onSubmitted: (value) {
        widget.onSubmit?.call(_controller.text == widget.answer);
        _controller.clear();
      },
    );
  }
}

class StudyOptions extends StatelessWidget {
  const StudyOptions({
    super.key,
    required this.values,
    required this.onSelect,
    this.failedOptionIndexes = const {},
  });

  final List<String> values;
  final Function(int index) onSelect;
  final Set<int> failedOptionIndexes;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 300),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: values.isNotEmpty
            ? List.generate(2 * values.length - 1, (i) {
                if (i % 2 != 0) return const SizedBox(height: 8);

                final index = i ~/ 2;
                final failed = failedOptionIndexes.contains(index);

                return StudyOption(
                  index: index,
                  failed: failed,
                  value: values[index],
                  onSelect: onSelect,
                );
              })
            : [],
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
    this.failed = false,
  });

  final int index;
  final String value;
  final bool failed;
  final Function(int index) onSelect;

  @override
  State<StudyOption> createState() => _StudyOptionState();
}

class _StudyOptionState extends State<StudyOption> {
  bool hover = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var borderColor = context.theme.color.neutral.n3;
    var color = context.theme.color.neutral.n6;

    if (widget.failed) {
      borderColor = context.theme.color.accent.red.primary;
      color = context.theme.color.accent.red.secondary;
    } else if (hover) {
      borderColor = context.theme.color.neutral.n2;
      color = context.theme.color.neutral.n4;
    }

    return InkWell(
      child: InkWell(
        hoverColor: Colors.transparent,
        onTap: widget.failed ? null : () => widget.onSelect(widget.index),
        onHover: widget.failed ? null : (value) => setState(() => hover = value),
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
