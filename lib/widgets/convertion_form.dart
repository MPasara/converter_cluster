import 'package:flutter/material.dart';

class ConvertionForm extends StatelessWidget {
  const ConvertionForm({
    Key? key,
    required GlobalKey<FormState> formKey,
    required this.firstFieldController,
    required this.secondFieldController,
    required this.firstTextFieldLabel,
    required this.onPressedFunction,
    required this.errorLabel,
    required this.keyboardType,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final TextEditingController firstFieldController;
  final TextEditingController secondFieldController;
  final String firstTextFieldLabel;
  final Function onPressedFunction;
  final String errorLabel;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: firstFieldController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return errorLabel;
                }
                return null;
              },
              keyboardType: keyboardType,
              decoration: InputDecoration(
                labelText: firstTextFieldLabel,
                labelStyle: const TextStyle(color: Colors.white54),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3.0),
                  borderSide: const BorderSide(color: Colors.teal),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.teal),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.teal),
              ),
              //#50E3C2 -> btn color
              onPressed: () {
                onPressedFunction();
              },
              child: const Icon(Icons.compare_arrows_outlined),
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextFormField(
              textAlign: TextAlign.center,
              decoration: const InputDecoration(hintText: 'Result'),
              controller: secondFieldController,
              enabled: false,
            )
          ],
        ),
      ),
    );
  }
}
