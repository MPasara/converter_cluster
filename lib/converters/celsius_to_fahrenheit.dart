import 'package:flutter/material.dart';
import '../widgets/converter_drawer.dart';
import '../widgets/convertion_form.dart';

class CelsiusToFahrenheit extends StatefulWidget {
  static const String id = '/';
  const CelsiusToFahrenheit({Key? key}) : super(key: key);

  @override
  State<CelsiusToFahrenheit> createState() => _CelsiusToFahrenheitState();
}

class _CelsiusToFahrenheitState extends State<CelsiusToFahrenheit> {
  final FocusManager _focusManager = FocusManager.instance;
  final _fahrenheitController = TextEditingController();
  final _celsiusController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _focusManager.primaryFocus?.unfocus();
        _fahrenheitController.text = '';
        _celsiusController.text = '';
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black26,
          title: const Text('Celsius - Fahrenheit'),
        ),
        drawer: const ConverterDrawer(),
        body: ConvertionForm(
          formKey: _formKey,
          firstFieldController: _celsiusController,
          secondFieldController: _fahrenheitController,
          keyboardType: const TextInputType.numberWithOptions(
              signed: true, decimal: true),
          firstTextFieldLabel: 'Enter celsius value',
          errorLabel: 'Please enter celsius value',
          onPressedFunction: () => _convertCelsiusToFahrenheit(context),
        ),
      ),
    );
  }

  void _convertCelsiusToFahrenheit(BuildContext context) {
    if (_formKey.currentState!.validate() == false) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Form is not valid'),
        ),
      );
    }
    double celsius = double.parse(_celsiusController.text);
    double fahrenheit = (celsius * 1.8) + 32.0;
    _fahrenheitController.text = fahrenheit.toStringAsFixed(2);
  }
}
