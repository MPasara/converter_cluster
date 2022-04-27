import 'package:converter_cluster/widgets/converter_drawer.dart';
import 'package:converter_cluster/widgets/convertion_form.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class KgToLbs extends StatefulWidget {
  const KgToLbs({Key? key}) : super(key: key);
  static const String id = 'KgToLbs';

  @override
  State<KgToLbs> createState() => _KgToLbsState();
}

class _KgToLbsState extends State<KgToLbs> {
  FocusManager focusManager = FocusManager.instance;
  final _kgController = TextEditingController();
  final _lbsController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        focusManager.primaryFocus?.unfocus();
        _kgController.text = '';
        _lbsController.text = '';
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black26,
          title: const Text('KG - LBS'),
        ),
        drawer: const ConverterDrawer(),
        body: ConvertionForm(
          formKey: _formKey,
          firstFieldController: _kgController,
          secondFieldController: _lbsController,
          firstTextFieldLabel: 'Enter kg value',
          errorLabel: 'Please enter kg value',
          keyboardType: kDecimalInputKeyboard,
          onPressedFunction: () => _convertKgToLbs(context),
        ),
      ),
    );
  }

  void _convertKgToLbs(BuildContext context) {
    if (_formKey.currentState!.validate() == false) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Form is not valid'),
        ),
      );
    }
    double _kg = double.parse(_kgController.text);
    double _lbs = _kg * 2.2;
    _lbsController.text = _lbs.toStringAsFixed(2);
  }
}
