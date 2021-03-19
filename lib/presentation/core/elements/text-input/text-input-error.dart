import 'package:flow_go/presentation/pallette.dart';
import 'package:flutter/material.dart';

class TextInputError extends StatelessWidget {
  final String error;

  const TextInputError({
    required this.error,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 12),
      child: Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(color: WebflowPallette.error, width: 3),
            top: BorderSide(color: WebflowPallette.neutral[300]!),
            right: BorderSide(color: WebflowPallette.neutral[300]!),
            bottom: BorderSide(color: WebflowPallette.neutral[300]!),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage('assets/icons/error.png')),
            Flexible(
              child: Padding(
                padding: EdgeInsets.only(left: 8),
                child: Text(
                  error,
                  style: TextStyle(
                    color: WebflowPallette.error,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
