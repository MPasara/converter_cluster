import 'package:converter_cluster/constants.dart';
import 'package:converter_cluster/widgets/converter_drawer.dart';
import 'package:converter_cluster/widgets/convertion_form.dart';
import 'package:flutter/material.dart';

class LbsToKg extends StatefulWidget {
  const LbsToKg({Key? key}) : super(key: key);
  static const String id = 'LbsToKg';

  @override
  State<LbsToKg> createState() => _LbsToKgState();
}

class _LbsToKgState extends State<LbsToKg> {
  FocusManager focusManager = FocusManager.instance;
  final _formKey = GlobalKey<FormState>();
  final _lbsController = TextEditingController();
  final _kgController = TextEditingController();

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
          centerTitle: true,
          backgroundColor: Colors.black26,
          title: const Text('LBS - KG'),
        ),
        drawer: const ConverterDrawer(),
        body: ConvertionForm(
          formKey: _formKey,
          firstFieldController: _lbsController,
          secondFieldController: _kgController,
          firstTextFieldLabel: 'Enter lbs value',
          errorLabel: 'Please enter lbs value',
          keyboardType: kDecimalInputKeyboard,
          onPressedFunction: () => _convertLbsToKg(context),
        ),
      ),
    );
  }

  void _convertLbsToKg(BuildContext context) {
    if (_formKey.currentState!.validate() == false) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Form is not valid'),
        ),
      );
    }

    double _lbs = double.parse(_lbsController.text);
    double _kg = _lbs / 2.2;
    _kgController.text = _kg.toStringAsFixed(2);
  }
}
