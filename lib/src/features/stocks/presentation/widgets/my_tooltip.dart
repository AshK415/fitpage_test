import 'package:flutter/material.dart';

class MyTooltip extends StatelessWidget {
  const MyTooltip({
    super.key,
    required this.child,
    required this.message,
  });
  final String message;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<State<Tooltip>>();
    return Tooltip(
      key: key,
      message: message,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => _onTap(key),
        child: child,
      ),
    );
  }

  void _onTap(GlobalKey key) {
    final dynamic tooltip = key.currentState;
    tooltip?.ensureTooltipVisible();
  }
}
