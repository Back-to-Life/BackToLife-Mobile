import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomConfirmDialog extends StatelessWidget {
  final String jsonPath;
  final String title;
  final String description;

  const CustomConfirmDialog(
      {Key? key,
      required this.jsonPath,
      required this.title,
      required this.description})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: _buildChild(context),
    );
  }

  Widget _buildChild(BuildContext context) => Container(
        height: 350,
        decoration: BoxDecoration(
            color: Colors.redAccent,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Lottie.asset(jsonPath),
                ),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12))),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Text(
              title,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16, left: 16),
              child: Text(
                description,
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    return Navigator.of(context).pop(true);
                  },
                  child: Text('Tamam'),
                  style: ElevatedButton.styleFrom(
                      onPrimary: Colors.redAccent,
                      primary: Colors.white,
                      textStyle: TextStyle(fontWeight: FontWeight.bold)),
                )
              ],
            )
          ],
        ),
      );
}
