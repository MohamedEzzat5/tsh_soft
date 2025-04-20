import 'package:flutter/material.dart';
import 'package:tsh_soft/config/locale/app_localizations.dart';
import 'package:tsh_soft/core/widgets/gaps.dart';
import 'package:tsh_soft/features/home/presentation/widgets/notification_item_widget.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('notifications'.tr(context)),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: 4,
        itemBuilder: (context, index) => NotificationItemWidget(),
        separatorBuilder: (context, index) => Gaps.vGap12,
      ),
    );
  }
}
