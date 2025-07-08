import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tsh_soft/core/services/notifications/notification_service.dart';
import 'package:tsh_soft/firebase_options.dart';

import 'app.dart';
import 'core/services/bloc_observer/bloc_observer.dart';
import 'injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ServiceLocator.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//  await FirebaseMessaging.instance.getToken().then((value) => print("fcm_token $value"));

  await NotificationService.instance.initialize();
  Bloc.observer = AppBlocObserver();
  runApp(const ProviderScope(child: TSHSoftApp()));
}
