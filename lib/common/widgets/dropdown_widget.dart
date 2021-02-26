import 'package:flutter/material.dart';
import 'package:food/themes/app_colors.dart';
import 'package:food/themes/styles_text.dart';

class DropdownWidget extends StatefulWidget {
  final List<String> items;
  const DropdownWidget({@required this.items});
  @override
  _DropdownWidgetState createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  String dropdownValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.neutral4),
        borderRadius: BorderRadius.circular(8),
      ),
      height: 60,
      child: DropdownButton<String>(
          isExpanded: true,
          value: dropdownValue ?? widget.items.first,
          icon: Icon(Icons.arrow_drop_down),
          iconSize: 42,
          underline: SizedBox(),
          onChanged: (String newValue) {
            setState(() {
              dropdownValue = newValue;
            });
          },
          items: widget.items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: StylesText.body1.copyWith(
                  color: AppColors.neutral1,
                ),
              ),
            );
          }).toList()),
    );
  }
}
