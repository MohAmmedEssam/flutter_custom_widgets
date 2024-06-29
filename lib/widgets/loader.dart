import 'package:flutter/cupertino.dart';
import '../ext/context_extension.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: CupertinoActivityIndicator(color: context.primaryColor));
  }
}
