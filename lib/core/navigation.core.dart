import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/presentation/widgets/pop_redirect.widget.dart';
import 'package:movies_app/service/navigation.service.dart';

/// simple getter for navigation state object
GoRouterState state(BuildContext context) => GoRouterState.of(context);

/// navigate to this route
/// if you pass context then it will take all path parameters and query parameters
/// and pass it to the new route
void go(
  R route,
  BuildContext context, {
  Map<String, String> pathParameters = const <String, String>{},
  Map<String, dynamic> queryParameters = const <String, dynamic>{},
  Object? extra,
  BuildContext? returnToMe,
}) {
  context.goNamed(
    route.name,
    pathParameters: pathParameters,
    queryParameters: queryParameters,
    extra: extra,
  );
}

/// pushing a screen to stack
void push(
  R route,
  BuildContext context, {
  Map<String, String> pathParameters = const <String, String>{},
  Map<String, dynamic> queryParameters = const <String, dynamic>{},
  Object? extra,
}) =>
    context.pushNamed(
      route.name,
      pathParameters: pathParameters,
      queryParameters: queryParameters,
      extra: extra,
    );

/// pop current screen from stack then adding screen to stack
void pushReplacement(
  R route,
  BuildContext context, {
  Map<String, String> pathParameters = const <String, String>{},
  Map<String, dynamic> queryParameters = const <String, dynamic>{},
  Object? extra,
}) =>
    context.pushReplacementNamed(
      route.name,
      pathParameters: pathParameters,
      queryParameters: queryParameters,
      extra: extra,
    );

/// removing current screen from stack
/// if you pass version with one it's mean that you will pop as an old way {}
Future<void> pop<T>({int version = 2, BuildContext? context, T? data}) async {
  assert([1, 2].contains(version), 'version can\'t be anything but 1 or 2');
  if (version == 1) return Navigator.pop(NavigationService.context!, data);
  if (context == null && version == 2) return NavigationService.context?.pop();
  if (context != null && version == 2) {
    final result = await PopRedirect.can(context);
    if (result) return NavigationService.context?.pop();
  }
}
