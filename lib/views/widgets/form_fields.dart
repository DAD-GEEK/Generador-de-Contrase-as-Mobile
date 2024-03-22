import 'package:create_password_app/model/password.dart';
import 'package:flutter/material.dart';

class FormFieldsWidget extends StatefulWidget {
  FormFieldsWidget({
    super.key,
  });

  @override
  State<FormFieldsWidget> createState() => _FormFieldsWidgetState();
}

class _FormFieldsWidgetState extends State<FormFieldsWidget> {
  Map<String, dynamic> passwordValues = {
    'password': '',
    'maxLength': 99,
    'size': 1,
    "minLength": 1,
    "option": "",
    "option_mayus": false,
    "option_minus": false,
    "option_number": false,
    "option_simbol": false,
  };

  Password? password;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        sectionOne(),
        sectionTwo(),
        Column(
          children: [
            addOptionsCheckBox("Mayúsculas", passwordValues, "option_mayus",
                "Minúsculas", "option_minus"),
            addOptionsCheckBox("Números", passwordValues, "option_number",
                "Símbolos", "option_simbol")
          ],
        ),
        Column(
          children: [
            addRadioListTile(
                "Fácil de decir", "easy", passwordValues, "option"),
            addRadioListTile(
                "Todos los caracteres", "all", passwordValues, "option"),
          ],
        ),
      ],
    );
  }

  Column sectionTwo() {
    //contine 4 row:
    return Column(
      children: [
        const Text(
          "Longitud de la contraseña",
        ),
        //row con 2 elementos (label y  row [TextFormField, Slider])
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 50,
              child: TextFormField(
                keyboardType: TextInputType.number,
                initialValue: passwordValues["size"].round().toString(),
                maxLength: 2,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: passwordValues["minLength"].round().toString(),
                ),
                onChanged: (value) {
                  passwordValues["size"] = int.parse(value);
                  setState(() {});
                },
              ),
            ),
            Slider(
              value: _maxnumberValidator(passwordValues, "size"),
              min: passwordValues["minLength"].toDouble(),
              max: passwordValues["maxLength"].toDouble(),
              label: passwordValues["size"].round().toString(),
              onChanged: (double value) {
                passwordValues["size"] = value.round();
                setState(() {});
              },
            ),
          ],
        )
      ],
    );
  }

  Column sectionOne() {
    return Column(
      children: [
        TextField(
            onChanged: (value) {
              passwordValues["password"] = value;
              setState(() {});
            },
            maxLength: passwordValues["size"],
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), hintText: "Password")),
        const Text("Personalice su contraseña",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ],
    );
  }

  void validatorRadio(Object? newValue, Map<String, dynamic> map) {
    setState(() {
      if (newValue == "easy") {
        map["option_mayus"] = true;
        map["option_minus"] = true;
        map["option_number"] = false;
        map["option_simbol"] = false;
        password = crea
      if (newValue == "all") {
        map["option_mayus"] = true;
        map["option_minus"] = true;
        map["option_number"] = true;
        map["option_simbol"] = true;
      }
    });
  }

  addOptionsCheckBox(String textone, Map<String, dynamic> map, String keyone,
      String texttwo, String keytwo) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          children: [
            Text(textone),
            addCheckBox(map, keyone),
          ],
        ),
        Row(
          children: [
            Text(texttwo),
            addCheckBox(map, keytwo),
          ],
        ),
      ],
    );
  }

  addRadioListTile(
      String text, String value, Map<String, dynamic> map, String key) {
    return RadioListTile(
      title: Text(text),
      value: value,
      groupValue: map[key],
      onChanged: (newValue) {
        map[key] = newValue;
        validatorRadio(newValue, map);
      },
    );
  }

  addCheckBox(Map<String, dynamic> map, String key) {
    return Checkbox(
      key: Key(key),
      value: map[key],
      onChanged: (newValue) {
        map[key] = newValue;
        setState(() {});
      },
    );
  }

  _maxnumberValidator(Map<String, dynamic> map, String key) {
    return map[key].toDouble();
  }
}
