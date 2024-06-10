import 'dart:math';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pheobe/utils/daily_advices_notifications.dart';

Future<void> scheduleFiveHourNotification(String petName) async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: Random().nextInt(1000),
      channelKey: "scheduled_channel",
      title: "Rappel de Nourriture",
      body:
          "N'oubliez pas de donner à $petName sa portion de nourriture équilibrée aujourd'hui!",
      notificationLayout: NotificationLayout.Default,
      wakeUpScreen: true,
      category: NotificationCategory.Reminder,
      payload: {'target': 'home'},
    ),
    schedule: NotificationInterval(
      interval: 5 * 60 * 60, // 5 hours in seconds
      timeZone: await AwesomeNotifications().getLocalTimeZoneIdentifier(),
      repeats: true,
    ),
  );
}

Future<void> scheduleDailyNotification(String title, String description) async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: Random().nextInt(1000),
      channelKey: 'daily_channel',
      title: title,
      body: description,
      notificationLayout: NotificationLayout.Default,
      wakeUpScreen: true,
      category: NotificationCategory.Reminder,
      payload: {'target': 'home'},
    ),
    schedule: NotificationCalendar(
      hour: 10, // Set the hour you want the notification to appear
      minute: 0,
      second: 0,
      millisecond: 0,
      timeZone: await AwesomeNotifications().getLocalTimeZoneIdentifier(),
      repeats: true,
    ),
  );
}

Future<void> scheduleQuarterlyNotification() async {
  DateTime now = DateTime.now();
  DateTime nextNotificationDate = DateTime(now.year, now.month + 3, now.day, 8);

  if (nextNotificationDate.month > 12) {
    int yearAdjustment = nextNotificationDate.month ~/ 12;
    int newMonth = nextNotificationDate.month % 12;
    nextNotificationDate = DateTime(
      now.year + yearAdjustment,
      newMonth,
      now.day,
      8,
    );
  }

  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: Random().nextInt(1000),
      channelKey: 'quarterly_channel',
      title: 'Rappels de vaccins',
      body: "N'oubliez pas la vaccination de votre(vos) animal(s)",
      notificationLayout: NotificationLayout.Default,
      wakeUpScreen: true,
      category: NotificationCategory.Reminder,
      payload: {'target': 'home'},
    ),
    schedule: NotificationCalendar(
      year: nextNotificationDate.year,
      month: nextNotificationDate.month,
      day: nextNotificationDate.day,
      hour: nextNotificationDate.hour,
      minute: 0,
      second: 0,
      millisecond: 0,
      timeZone: await AwesomeNotifications().getLocalTimeZoneIdentifier(),
      repeats: true,
    ),
  );
}

// initialize notifications
Future<void> initializeNotifications() async {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final authUser = firebaseAuth.currentUser;
  final Random random = Random();

  await AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(
        channelKey: "scheduled_channel",
        channelName: "Scheduled Notifications",
        channelDescription: "Channel for scheduled notifications",
      ),
      NotificationChannel(
        channelKey: 'daily_channel',
        channelName: 'Daily Notifications',
        channelDescription: 'Channel for daily notifications',
      ),
      NotificationChannel(
        channelKey: 'quarterly_channel',
        channelName: 'Quarterly Notifications',
        channelDescription: 'Channel for quarterly notifications',
      ),
    ],
  );

  final isAllowed = await AwesomeNotifications().isNotificationAllowed();
  if (!isAllowed) {
    await AwesomeNotifications().requestPermissionToSendNotifications();
  }

  if (authUser != null) {
    final userDoc = await FirebaseFirestore.instance
        .collection("users")
        .doc(authUser.uid)
        .get();

    if (userDoc.exists && userDoc.data() != null) {
      final pets = userDoc["pets"];
      if (pets.length > 0) {
        for (final pet in pets) {
          await scheduleFiveHourNotification(pet["name"]);
        }
      }

      if (userDoc["petTypes"].length > 0) {
        for (final petType in userDoc["petTypes"]) {
          if (petType == "Chien") {
            final posDog = random.nextInt(dogCareTips.length - 1);
            await scheduleDailyNotification(
                dogCareTips[posDog].title, dogCareTips[posDog].description);
          }

          if (petType == "Poisson") {
            final posFish = random.nextInt(fishCareTips.length - 1);
            await scheduleDailyNotification(
                fishCareTips[posFish].title, fishCareTips[posFish].description);
          }

          if (petType == "Chat") {
            final posCat = random.nextInt(catCareTips.length - 1);
            await scheduleDailyNotification(
                catCareTips[posCat].title, catCareTips[posCat].description);
          }
        }
      }

      await scheduleQuarterlyNotification();
    }
  }
}
