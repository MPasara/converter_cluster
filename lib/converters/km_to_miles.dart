import 'package:converter_cluster/constants.dart';
import 'package:converter_cluster/widgets/converter_drawer.dart';
import 'package:converter_cluster/widgets/convertion_form.dart';
import 'package:flutter/material.dart';

class KmToMiles extends StatefulWidget {
  const KmToMiles({Key? key}) : super(key: key);
  static const String id = 'KmToMiles';

  @override
  State<KmToMiles> createState() => _KmToMilesState();
}

class _KmToMilesState extends State<KmToMiles> {
  FocusManager focusManager = FocusManager.instance;
  final _formKey = GlobalKey<FormState>();
  final _kmController = TextEditingController();
  final _milesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        focusManager.primaryFocus?.unfocus();
        _kmController.text = '';
        _milesController.text = '';
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('KM - MILES'),
          backgroundColor: Colors.black26,
        ),
        drawer: const ConverterDrawer(),
        body: ConvertionForm(
          firstTextFieldLabel: 'Enter km value',
          firstFieldController: _kmController,
          secondFieldController: _milesController,
          formKey: _formKey,
          keyboardType: kDecimalInputKeyboard,
          errorLabel: 'Please enter km value',
          onPressedFunction: () => _convertKmToMiles(context),
        ),
      ),
    );
  }

  void _convertKmToMiles(BuildContext context) {
    if (_formKey.currentState!.validate() == false) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Form is not valid'),
        ),
      );
    }

    double _kilometers = double.parse(_kmController.text);
    double _miles = _kilometers * 0.6214;
    _milesController.text = _miles.toStringAsFixed(2);
  }
}
