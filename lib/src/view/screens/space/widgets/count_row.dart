import 'package:babysitter_v1/src/core/constant/app_color.dart';
import 'package:flutter/material.dart';


class CoutEnfantRow extends StatelessWidget {
  const CoutEnfantRow({
    Key? key,
    required this.title,
    this.controller,
    this.readOnly,
    this.isSecond,
    this.subTitle,
  }) : super(key: key);

  final String title;
  final TextEditingController? controller;
  final bool? readOnly;
  final String? subTitle;
  final bool? isSecond;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(
            title,
            style: TextStyle(
                fontSize: 16,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w600),
          ),
        ),
        Expanded(
          child: isSecond == null || isSecond == false
              ? TextFormField(
                  controller: controller,
                  readOnly:
                      readOnly == null || readOnly == false ? false : true,
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: "Poppins",
                    color: AppColor.blueGray900,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor:AppColor.blueGray300,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    hintText: "0.00",
                    hintStyle: TextStyle(
                      fontSize: 14,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: BorderSide.none,
                    ),
                  ),
                )
              : Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: Color(0xffFFCCD3),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "$subTitle",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Poppins",
                      color: AppColor.blueGray900,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
        ),
        SizedBox(width: 20),
        Text(
          "TND",
          style: TextStyle(
              fontSize: 16,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w600,
              color:AppColor.blueGray900),
        )
      ],
    );
  }
}
