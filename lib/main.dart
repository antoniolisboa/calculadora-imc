import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int primaryColor = 0xFF94D2BD;
  int secondColor = 0xFFE9D8A6;
  int textColor = 0XFF001219;

  double imc = 0.0;
  String infoText = 'Sem informações';
  String stateIcon = 'void';
  String indication = 'Aguardando';

  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Namedida',
          style: TextStyle(
            color: Color(textColor),
            fontFamily: 'Raleway',
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(primaryColor),
        actions: [
          IconButton(
            onPressed: _resetFields,
            icon: Icon(
              Icons.refresh,
              color: Color(textColor),
            ),
          ),
          const SizedBox(
            width: 32,
          ),
        ],
      ),
      backgroundColor: Colors.white, //Color(secondColor),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Color(primaryColor),
                    boxShadow: [
                      BoxShadow(
                        color: Color(primaryColor),
                        blurRadius: 0.5,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'IMC:',
                            style: TextStyle(
                              color: Color(textColor),
                              fontSize: 18,
                              fontFamily: 'Raleway',
                            ),
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 32,
                              ),
                              Text(
                                imc.toStringAsPrecision(3),
                                style: TextStyle(
                                  color: Color(textColor),
                                  fontSize: 40,
                                  fontFamily: 'SmoochSans',
                                ),
                              ),
                            ],
                          ),
                          Text(
                            infoText,
                            style: TextStyle(
                              color: Color(textColor),
                              fontSize: 18,
                              fontFamily: 'Raleway',
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 22,
                        ),
                        child: Container(
                          color: Color(textColor),
                          height: 86,
                          width: 1,
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            'Indicação:',
                            style: TextStyle(
                              color: Color(textColor),
                              fontSize: 18,
                              fontFamily: 'Raleway',
                            ),
                          ),
                          _setStateIcon(stateIcon),
                          Text(
                            indication,
                            style: TextStyle(
                              color: Color(textColor),
                              fontSize: 18,
                              fontFamily: 'Raleway',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Insira seu Peso';
                    }
                  },
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                      RegExp('[0-9.]'),
                    ),
                  ],
                  cursorColor: Color(textColor),
                  decoration: InputDecoration(
                    suffixText: 'Kg',
                    suffixStyle: TextStyle(
                      color: Color(textColor),
                      fontFamily: 'Raleway',
                    ),
                    errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                    ),
                    focusedErrorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(primaryColor),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(primaryColor),
                      ),
                    ),
                    labelText: 'Peso',
                    labelStyle: TextStyle(
                      color: Color(textColor),
                      fontFamily: 'Raleway',
                    ),
                    hintText: 'Peso em Kg',
                    hintStyle: TextStyle(
                      color: Color(textColor),
                      fontFamily: 'Raleway',
                    ),
                  ),
                  controller: weightController,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Insira sua Altura';
                    }
                  },
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                      RegExp('[0-9.]'),
                    ),
                  ],
                  cursorColor: Color(textColor),
                  decoration: InputDecoration(
                    suffixText: 'm',
                    suffixStyle: TextStyle(
                      color: Color(textColor),
                      fontFamily: 'Raleway',
                    ),
                    errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                    ),
                    focusedErrorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(primaryColor),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(primaryColor),
                      ),
                    ),
                    labelText: 'Altura',
                    labelStyle: TextStyle(
                      color: Color(textColor),
                      fontFamily: 'Raleway',
                    ),
                    hintText: 'Altura em metros',
                    hintStyle: TextStyle(
                      color: Color(textColor),
                      fontFamily: 'Raleway',
                    ),
                  ),
                  controller: heightController,
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Color(primaryColor),
                          padding: const EdgeInsets.all(18),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _calculate();
                          }
                        },
                        child: Text(
                          'Calcular',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(textColor),
                            fontFamily: 'Raleway',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Icon _setStateIcon(String value) {
    Icon? state;
    if (value == 'void') {
      state = Icon(
        Icons.all_inclusive,
        color: Color(textColor),
        size: 50,
      );
    } else if (value == 'healthy') {
      state = const Icon(
        Icons.favorite,
        color: Colors.pinkAccent,
        size: 50,
      );
    } else if (value == 'hungry') {
      state = const Icon(
        Icons.restaurant,
        color: Color(0xFFDC2F02),
        size: 50,
      );
    } else if (value == 'obesity') {
      state = const Icon(
        Icons.directions_bike,
        color: Color(0xFF560BAD),
        size: 50,
      );
    }
    return state!;
  }

  void _resetFields() {
    weightController.text = '';
    heightController.text = '';
    setState(() {
      imc = 0.0;
      infoText = 'Sem informações';
      stateIcon = 'void';
      indication = 'Aguardando';
      _formKey = GlobalKey<FormState>();
    });
  }

  void _calculate() {
    setState(() {
      double? weight = double.tryParse(weightController.text);
      double? height = double.tryParse(heightController.text);

      imc = weight! / (height! * height);

      if (imc < 18.6) {
        infoText = 'Abaixo do peso';
        stateIcon = 'hungry';
        indication = 'Foco na alimentação';
      } else if (imc < 24.9) {
        infoText = 'Peso ideal';
        stateIcon = 'healthy';
        indication = 'Saudável';
      } else if (imc < 29.9) {
        infoText = 'Levemente acima\ndo peso';
        stateIcon = 'obesity';
        indication = 'Pratique esportes';
      } else if (imc < 34.9) {
        infoText = 'Obesidade grau I';
        stateIcon = 'obesity';
        indication = 'Pratique esportes';
      } else if (imc < 39.9) {
        infoText = 'Obesidade grau II';
        stateIcon = 'obesity';
        indication = 'Pratique esportes';
      } else {
        infoText = 'Obesidade grau III';
        stateIcon = 'obesity';
        indication = 'Pratique esportes';
      }
    });
  }
}
