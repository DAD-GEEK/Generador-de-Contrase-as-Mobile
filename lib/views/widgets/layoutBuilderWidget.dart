import 'package:create_password_app/views/widgets/form_fields.dart';
import 'package:flutter/material.dart';

class LayoutBuilderWidget extends StatelessWidget {
  const LayoutBuilderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth;
        double height = constraints.maxHeight;
        return Container(
          color: Colors.lightBlueAccent,
          width: width,
          height: height,
          child: Center(
            child: Container(
              color: Colors.white,
              width: width * 0.95,
              height: height * 0.95,
              child: FormFieldsWidget(),
            ),
          )
          );
      },
    );
  }
}
