// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/core/navigation.core.dart';

class PopRedirect extends StatelessWidget {
  final Widget child;
  const PopRedirect({
    Key? key,
    required this.child,
  }) : super(key: key);

  static Future<bool> can(BuildContext context) async {
    final s = state(context);
    final from = s.queryParameters['from'];
    if (from == null || from.isEmpty) return true;
    context.go(from);
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: child,
      onWillPop: () => can(context),
    );
  }
}


// /estates/:id(5)

// go(viewEstate, path: {id: 5}, query: {from: '/home/searchResult'})
// menu/myEstates/5?from=/home/searchResult
