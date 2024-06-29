import 'package:flutter/material.dart';
import '../ext/context_extension.dart';

class ConnectionError extends StatelessWidget {
  const ConnectionError({
    super.key,
    required this.message,
    required this.retryAction,
    this.padding,
  });

  final String message;
  final Function() retryAction;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/nodata.png"),
            Text(
              message,
              style: context.font(HeaderStyle.h5),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: context.vSpace),
            SizedBox(
              child: ElevatedButton(
                onPressed: retryAction,
                child: const Text("Continue"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
