import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class InputFormUi extends StatefulWidget {
  final String label;
  final String? type;
  final Color? textColor;
  final String? Function(String? va)? validator;
  final Function()? unfocused;
  final Function(String va)? onChanged;

  final Color? baseColor;
  final TextEditingController? controller;

  const InputFormUi({
    super.key,
    required this.label,
    this.type = 'text',
    this.textColor = Colors.white,
    this.validator,
    this.unfocused,
    this.onChanged,
    this.baseColor,
    this.controller,
  });

  @override
  State<InputFormUi> createState() => _InputFormUiState();
}

class _InputFormUiState extends State<InputFormUi> {
  bool _obscure = true;
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    if (widget.unfocused != null) {
      focusNode.addListener(() {
        if (!focusNode.hasFocus) {
          widget.unfocused!();
        }
      });
    }
  }

  @override
  void dispose() {
    if (widget.controller != null) {
      widget.controller!.dispose();
    }
    super.dispose();
  }

  _onTap() async {
    if (widget.type == 'date') {
      DateTime? pickedDate = await DatePicker.showDateTimePicker(
        context,
        theme: const DatePickerTheme(),
      );
      //  = await showDatePicker(
      //   context: context,
      //   initialDate: DateTime.now(),
      //   firstDate: DateTime(1950),
      //   lastDate: DateTime(2100),
      //   builder: (context, child) {
      //     return Theme(
      //       data: Theme.of(context).copyWith(
      //         colorScheme: ColorScheme.light(
      //           primary: Theme.of(context)
      //               .backgroundColor, // header background color
      //         ),
      //         textButtonTheme: TextButtonThemeData(
      //           style: TextButton.styleFrom(
      //             foregroundColor: Theme.of(context).backgroundColor,
      //           ),
      //         ),
      //       ),
      //       child: child!,
      //     );
      //   },
      // );

      if (pickedDate != null) {
        String formattedDate =
            DateFormat('dd/MM/yyyy hh:mm').format(pickedDate);

        if (widget.controller != null) {
          widget.controller!.text = formattedDate;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        TextFormField(
          keyboardType: widget.type == 'number' ? TextInputType.number : null,
          focusNode: focusNode,
          validator: widget.validator,
          cursorColor: widget.baseColor ?? const Color(0XFFE0E0E0),
          controller: widget.controller,
          style: TextStyle(
            color: widget.textColor ?? const Color(0XFFE0E0E0),
          ),
          obscureText: _obscure && widget.type == 'password',
          readOnly: widget.type == 'date',
          decoration: InputDecoration(
            labelText: widget.label,
            labelStyle: TextStyle(
              color: widget.baseColor ?? const Color(0XFFE0E0E0),
            ),
            focusColor: widget.baseColor ?? const Color(0XFFE0E0E0),
            floatingLabelStyle: TextStyle(
              color: widget.baseColor ?? const Color(0XFFE0E0E0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(
                width: 2,
                color: widget.baseColor ?? const Color(0XFFE0E0E0),
              ),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: widget.baseColor ?? const Color(0XFFE0E0E0),
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(
                width: 1,
                color: Colors.red,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: widget.baseColor ?? const Color(0XFFE0E0E0),
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          onTap: _onTap,
          onChanged: widget.onChanged,
        ),
        if (widget.type == 'password')
          InkWell(
            onTap: () {
              setState(() {
                _obscure = !_obscure;
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: FaIcon(
                  _obscure ? FontAwesomeIcons.solidEye : FontAwesomeIcons.eye),
            ),
          ),
      ],
    );
  }
}
