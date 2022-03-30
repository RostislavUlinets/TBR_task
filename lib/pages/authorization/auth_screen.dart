import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

///Main screen for test task
class AuthScreen extends StatefulWidget {
  ///Static route name for screen
  static const String routeName = '/auth';

  ///Constructor
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  ///Flag for text field erase icon state
  bool showEraseButton = false;

  ///Flag for button state
  bool isButtonActive = false;

  ///Controller for text field
  final TextEditingController myController = TextEditingController();

  ///TextField phone number mask
  final MaskTextInputFormatter maskFormatter = MaskTextInputFormatter(
    mask: '(###) ###-####',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  //Used to avoid magic numbers in code
  final int correctLenghtForPhoneNumber = 14;
  final double buttonSize = 48.0;

  @override
  void initState() {
    myController.addListener(() {
      setState(() {
        isButtonActive =
            myController.text.length == correctLenghtForPhoneNumber;
        showEraseButton = myController.text.isEmpty;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 120.0),
              child: Text(
                "Get Started",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextField(
              controller: myController,
              keyboardType: TextInputType.number,
              inputFormatters: [maskFormatter],
              decoration: InputDecoration(
                suffixIcon: showEraseButton
                    ? null
                    : IconButton(
                        onPressed: () {
                          myController.text = '';
                        },
                        icon: const Icon(
                          Icons.close,
                        ),
                      ),
                hintText: "(201) 555-0123",
                helperText: "Enter your phone number",
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: isButtonActive
                    ? () {
                        FlushbarHelper.createSuccess(
                          message: 'Номер телефону введено успішно',
                        ).show(context);
                      }
                    : null,
                child: Icon(
                  Icons.arrow_circle_right,
                  color: isButtonActive ? Colors.blueAccent : Colors.black38,
                  size: buttonSize,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
