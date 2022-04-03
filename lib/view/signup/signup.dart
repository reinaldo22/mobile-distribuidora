import 'package:distribuidora/model/customer/customer.dart';
import 'package:flutter/material.dart';
import '../../utils/contants.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  int currentStep = 0;
  List<GlobalKey<FormState>> formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final cpfController = TextEditingController();
  final enderecoController = TextEditingController();
  final pagamentoController = TextEditingController();
  final passwordController = TextEditingController();
  final Customer customer = new Customer();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: fundo,
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: Text("Cadastre-se"),
          centerTitle: true,
        ),
        body: Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(primary: kPrimaryColor),
          ),
          child: Stepper(
            type: StepperType.vertical,
            steps: getSteps(),
            currentStep: this.currentStep,
            onStepContinue: () {
              setState(() {
                if (formKeys[currentStep].currentState!.validate()) {
                  if (currentStep < getSteps().length - 1) {
                    currentStep = currentStep + 1;
                  }
                  _register();
                }
              });
            },
            onStepCancel: () {
              setState(() {
                if (currentStep > 0) {
                  currentStep = currentStep - 1;
                } else {
                  currentStep = 0;
                }
              });
            },
            onStepTapped: (step) => setState(() => currentStep = step),
          ),
        ),
      ),
    );
  }

  List<Step> getSteps() => [
        Step(
          state: currentStep > 0 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 0,
          title: Text('Dados Pessoais'),
          content: Form(
            key: formKeys[0],
            child: Column(
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: "Nome"),
                  validator: (name) {
                    if (name!.isEmpty || name.length < 1) {
                      return 'Preencha o nome';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.name,
                  onSaved: (name) => customer.name = name,
                ),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(labelText: "E-mail"),
                  validator: (value) {
                    if (value!.isEmpty || value.length < 1) {
                      return 'Preencha o e-mail';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (email) => customer.email = email,
                ),
                TextFormField(
                  controller: cpfController,
                  decoration: InputDecoration(labelText: "CPF"),
                  validator: (value) {
                    if (value!.isEmpty || value.length < 1) {
                      return 'Preencha o cpf';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  onSaved: (cpf) => customer.cpf = cpf,
                ),
                TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(labelText: "Password"),
                  validator: (value) {
                    if (value!.isEmpty || value.length < 1) {
                      return 'Preencha o password';
                    }
                    return null;
                  },
                  obscureText: true,
                  onSaved: (password) => customer.password = password,
                ),
              ],
            ),
          ),
        ),
        Step(
          state: currentStep > 1 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 1,
          title: Text('Forma de Pagamento'),
          content: Form(
            key: formKeys[1],
            child: Column(
              children: [
                TextFormField(
                  controller: pagamentoController,
                  decoration: InputDecoration(labelText: "Pagamento"),
                  validator: (name) {
                    if (name!.isEmpty || name.length < 1) {
                      return 'Preencha a forma de pagamento';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.name,
                  onSaved: (pagamento) => customer.formaPagamento = pagamento,
                ),
              ],
            ),
          ),
        ),
        Step(
          state: currentStep > 2 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 2,
          title: Text('Endereço de Entrega'),
          content: Form(
            key: formKeys[2],
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: "Complemento"),
                  controller: enderecoController,
                  keyboardType: TextInputType.name,
                  validator: (endereco) {
                    if (endereco!.isEmpty || endereco.length < 1) {
                      return 'Preencha o campo para entrega';
                    }
                    return null;
                  },
                  onSaved: (endereco) => customer.endereco = endereco,
                ),
              ],
            ),
          ),
        ),
      ];

  void _register() async {
    print(">>>>>>>>CURRENTSTEPS ${currentStep}");
    print(">>>>>>>>>>>>>>>>>>>>>>>>>.${nameController.text}");
    print(">>>>>>>>>>>>>>>>>>>>>>>>>.${enderecoController.text}");
  }
}
