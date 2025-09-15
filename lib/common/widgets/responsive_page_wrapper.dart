import 'package:flutter/material.dart';
import '../utils/responsive.dart';

class ResponsivePageWrapper extends StatelessWidget {
  final String? title;
  final bool resizeToAvoidBottomInset;
  final bool? centerTitle;
  final List<Widget>? actions;
  final Widget? leading;
  final Widget Function(BuildContext context) builder;

  const ResponsivePageWrapper({
    super.key,
    required this.builder,
    this.title,
    this.resizeToAvoidBottomInset = true,
    this.actions,
    this.leading,
    this.centerTitle,
  });

  @override
  Widget build(BuildContext context) {
    final isLargeDevice = Responsive.isLgUp(context);
    final content = builder(context);

    if (isLargeDevice) {
      // On large screens, content is displayed in the shell's sideWidget
      return content;
    } else {
      // On small screens, wrap with Scaffold and AppBar
      return Scaffold(
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        appBar: title != null ? AppBar(
          title: Text(title!),
          actions: actions,
          leading: leading,
          centerTitle: centerTitle,
        ) : null,
        body: content,
      );
    }
  }
}