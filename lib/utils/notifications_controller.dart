import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:pheobe/main.dart';

class NotificationsController {
  @pragma("vm:entry-point")
  static Future<void> onActionReceivedMethod(
      ReceivedAction receivedAction) async {
    if (receivedAction.payload != null) {
      switch (receivedAction.payload!['target']) {
        case 'home':
          navigatorKey.currentState?.pushNamed(
            "/home",
            arguments: {
              'showDialog': true,
              "data": {
                "title": receivedAction.title,
                "body": receivedAction.body
              }
            },
          );
          break;
      }
    }
  }
}
