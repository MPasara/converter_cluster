import 'package:converter_cluster/constants.dart';
import 'package:converter_cluster/widgets/converter_drawer.dart';
import 'package:converter_cluster/widgets/convertion_form.dart';
import 'package:flutter/material.dart';

class MilesToKm extends StatefulWidget {
  const MilesToKm({Key? key}) : super(key: key);
  static const String id = 'MilesToKg';

  @override
  State<MilesToKm> createState() => _MilesToKmState();
}

class _MilesToKmState extends State<MilesToKm> {
  FocusManager focusManager = FocusManager.instance;
  final _formKey = GlobalKey<FormState>();
  final _milesController = TextEditingController();
  final _kmController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        focusManager.primaryFocus?.unfocus();
        _milesController.text = '';
        _kmController.text = '';
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('MILES - KM'),
          backgroundColor: Colors.black26,
        ),
        drawer: const ConverterDrawer(),
        body: ConvertionForm(
          formKey: _formKey,
          firstFieldController: _milesController,
          firstTextFieldLabel: 'Enter miles value',
          secondFieldController: _kmController,
          errorLabel: 'Please enter miles value',
          keyboardType: kDecimalInputKeyboard,
          onPressedFunction: () => _convertMilesToKm(context),
        ),
      ),
    );
  }

  void _convertMilesToKm(BuildContext context) {
    if (_formKey.currentState!.validate() == false) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Form is not valid'),
        ),
      );
    }
    double _miles = double.parse(_milesController.text);
    double _kilometers = _miles * 1.609344;
    _kmController.text = _kilometers.toStringAsFixed(2);
  }
}
