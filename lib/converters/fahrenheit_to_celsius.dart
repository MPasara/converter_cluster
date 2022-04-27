import 'package:converter_cluster/widgets/convertion_form.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../widgets/converter_drawer.dart';

class FahrenheitToCelsius extends StatefulWidget {
  const FahrenheitToCelsius({Key? key}) : super(key: key);
  static const String id = 'FahrenheitToCelsius';

  @override
  State<FahrenheitToCelsius> createState() => _FahrenheitToCelsiusState();
}

class _FahrenheitToCelsiusState extends State<FahrenheitToCelsius> {
  FocusManager focusManager = FocusManager.instance;
  final _fahrenheitController = TextEditingController();
  final _celsiusController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        focusManager.primaryFocus?.unfocus();
        _fahrenheitController.text = '';
        _celsiusController.text = '';
      },
      child: Scaffold(
        drawer: const ConverterDrawer(),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black26,
          title: const Text('Fahrenheit - Celsius'),
        ),
        body: ConvertionForm(
          formKey: _formKey,
          firstFieldController: _fahrenheitController,
          secondFieldController: _celsiusController,
          keyboardType: kDecimalInputKeyboard,
          errorLabel: 'Please enter fahrenheit value',
          firstTextFieldLabel: 'Enter fahrenheit value',
          onPressedFunction: () => _convertFahrenheitToCelsius(context),
        ),
      ),
    );
  }

  void _convertFahrenheitToCelsius(BuildContext context) {
    if (_formKey.currentState!.validate() == false) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Form is not valid'),
        ),
      );
    }
    double _fahrenheit = double.parse(_fahrenheitController.text);
    double _celsius = (_fahrenheit - 32) * (5 / 9);
    _celsiusController.text = _celsius.toStringAsFixed(2);
  }
}
