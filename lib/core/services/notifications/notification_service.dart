import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:tsh_soft/config/routes/app_routes.dart';
import 'package:tsh_soft/config/routes/navigator_observer.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await NotificationService.instance.setupFlutterNotifications();
  await NotificationService.instance.showNotification(message);
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final AppNavigatorObserver routeObserver = AppNavigatorObserver();

class NotificationService {
  NotificationService._();
  static final NotificationService instance = NotificationService._();

  final _messaging = FirebaseMessaging.instance;
  final _localNotifications = FlutterLocalNotificationsPlugin();
  bool _isFlutterLocalNotificationsInitialized = false;

  Future<void> initialize() async {
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    // Request permission
    await _requestPermission();

    // Setup message handlers
    await _setupMessageHandlers();

    await setupFlutterNotifications();

    // Get FCM token
    // final token = await _messaging.getToken();
    // print('FCM Token: $token');
  }

  Future<void> _requestPermission() async {
    // ignore: unused_local_variable
    final settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      provisional: false,
      announcement: false,
      carPlay: false,
      criticalAlert: false,
    );
  }

  Future<void> setupFlutterNotifications() async {
    if (_isFlutterLocalNotificationsInitialized) {
      return;
    }

    // android setup
    const channel = AndroidNotificationChannel(
      'high_importance_channel',
      'High Importance Notifications',
      description: 'This channel is used for important notifications.',
      importance: Importance.high,
    );

    await _localNotifications
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    const initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    // ios setup
    // ignore: prefer_const_constructors
    final initializationSettingsDarwin = DarwinInitializationSettings();

    final initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDarwin,
    );

    // flutter notification setup
    await _localNotifications.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse details) {
        navigatorKey.currentState?.pushNamed(Routes.notificationScreenRoute);
      },
    );

    _isFlutterLocalNotificationsInitialized = true;
  }

  Future<void> showNotification(RemoteMessage message) async {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;
    if (notification != null && android != null) {
      await _localNotifications.show(
        notification.hashCode,
        notification.title,
        notification.body,
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'high_importance_channel',
            'High Importance Notifications',
            channelDescription:
                'This channel is used for important notifications.',
            importance: Importance.high,
            priority: Priority.high,
            icon: '@mipmap/ic_launcher',
          ),
          iOS: DarwinNotificationDetails(
            presentAlert: true,
            presentBadge: true,
            presentSound: true,
          ),
        ),
        payload: json.encode(message.data),
      );
    }
  }

  Future<void> _setupMessageHandlers() async {
    //foreground message
    FirebaseMessaging.onMessage.listen((message) {
      // if (routeObserver.currentRoute != Routes.messageScreenRoute) {
      //   showNotification(message);
      // }
    });

    // background message
    FirebaseMessaging.onMessageOpenedApp.listen(_handleBackgroundMessage);

    // opened app
    final initialMessage = await _messaging.getInitialMessage();
    if (initialMessage != null) {
      _handleBackgroundMessage(initialMessage);
    }
  }

  void _handleBackgroundMessage(RemoteMessage message) {
    log(message.data.toString());
    navigatorKey.currentState?.pushNamed(Routes.notificationScreenRoute);
  }

  // _onSelect(String? type, int? typeId, {ChatMessage? message}) {
  //   try {
  //     if (type != null) {
  //       if (type == "task") {
  //         navigatorKey.currentState?.pushNamed(
  //           Routes.taskDetailsScreenRoute,
  //           arguments: TaskEntity(id: typeId),
  //         );
  //       } else if (type == 'hot_deal') {
  //         navigatorKey.currentState?.pushNamed(Routes.myBookingsScreenRoute);
  //       } else if (type == 'chat') {
  //         navigatorKey.currentState?.pushNamed(
  //           Routes.messagesRoute,
  //           arguments: ChatParams(
  //             conversationId: "$typeId",
  //             receiverId: int.parse(message?.senderId ?? '0'),
  //           ),
  //         );
  //       } else {
  //         navigatorKey.currentState?.pushNamed(Routes.notificationsScreenRoute);
  //       }
  //     } else {
  //       navigatorKey.currentState?.pushNamed(Routes.notificationsScreenRoute);
  //     }
  //   } catch (e) {
  //     Log.e("Navigator ${e.toString()}");
  //   }
  // }
}
