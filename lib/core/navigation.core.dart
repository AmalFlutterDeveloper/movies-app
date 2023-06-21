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
  R route, {
  Map<String, String> pathParameters = const <String, String>{},
  Map<String, dynamic> queryParameters = const <String, dynamic>{},
  Object? extra,
  BuildContext? context,
  BuildContext? returnToMe,
}) {
  NavigationService.context?.goNamed(
    route.name,
    pathParameters: {
      if (context != null) ...GoRouterState.of(context).pathParameters,
      ...pathParameters
    },
    queryParameters: {
      if (context != null) ...GoRouterState.of(context).queryParameters,
      if (returnToMe != null) 'from': GoRouterState.of(returnToMe).location,
      ...queryParameters
    },
    extra: extra,
  );
}

/// pushing a screen to stack
void push(
  R route, {
  Map<String, String> pathParameters = const <String, String>{},
  Map<String, dynamic> queryParameters = const <String, dynamic>{},
  Object? extra,
}) =>
    NavigationService.context?.pushNamed(
      route.name,
      pathParameters: pathParameters,
      queryParameters: queryParameters,
      extra: extra,
    );

/// pop current screen from stack then adding screen to stack
void pushReplacement(
  R route, {
  Map<String, String> pathParameters = const <String, String>{},
  Map<String, dynamic> queryParameters = const <String, dynamic>{},
  Object? extra,
}) =>
    NavigationService.context?.pushReplacementNamed(
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
