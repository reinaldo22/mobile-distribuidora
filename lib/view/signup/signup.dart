import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  int currentStep = 0;

  final firsName = TextEditingController();
  final secondName = TextEditingController();
  final posCode = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Cadastre-se"),
          centerTitle: true,
        ),
        body: Theme(
          data: Theme.of(context)
              .copyWith(colorScheme: ColorScheme.light(primary: Colors.red)),
          child: Stepper(
            type: StepperType.horizontal,
            steps: getSteps(),
            currentStep: currentStep,
            onStepContinue: () {
              final isLastStep = currentStep == getSteps().length - 1;
              if (isLastStep) {
                print("Completed");
              } else {
                setState(() => currentStep += 1);
              }
            },
            onStepTapped: (step) => setState(() => currentStep = step),
            onStepCancel: currentStep == 0
                ? null
                : () => setState(() => currentStep -= 1),
          ),
        ),
      ),
    );
  }

  List<Step> getSteps() => [
        Step(
          state: currentStep > 0 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 0,
          title: Text('Registro'),
          content: Column(
            children: [
              TextField(
                controller: firsName,
                decoration: InputDecoration(labelText: "Nome"),
              ),
              TextField(
                decoration: InputDecoration(labelText: "Sobrenome"),
              ),
            ],
          ),
        ),
        Step(
          state: currentStep > 1 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 1,
          title: Text('Confirma code'),
          content: Column(
            children: [
              TextField(
                controller: secondName,
                decoration: InputDecoration(labelText: "Complemento"),
              ),
            ],
          ),
        ),
        Step(
          isActive: currentStep >= 2,
          title: Text('Dados'),
          content: Column(
            children: [
              Text("Nome: ${firsName.text}"),
              Text("Segundo: ${secondName.text}"),
            ],
          ),
        ),
      ];
}
