import 'package:flutter/material.dart';

showSnackbar(
    {required BuildContext context, bool? isError, required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            isError == null || isError == false ? 'Success' : 'Error',
            style: TextStyle(
                color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Text(message, style: TextStyle(color: Colors.white, fontSize: 12)),
        ],
      ),
      backgroundColor:
          isError == null || isError == false ? Colors.green : Colors.red,
      padding: EdgeInsets.all(15),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
      showCloseIcon: true,
      actionOverflowThreshold: 1,
    ),
  );
}
