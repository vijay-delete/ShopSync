import 'dart:async';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';


final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({super.key, required this.child});

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: FlutterFlowTheme.of(context).info,
          child: Image.asset(
            'assets/images/Untitled_design.gif',
            fit: BoxFit.contain,
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => const ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'SignUpPage': ParameterData.none(),
  'EntryPage': ParameterData.none(),
  'OtpPage': (data) async => ParameterData(
        allParams: {
          'phoneNo': getParameter<String>(data, 'phoneNo'),
        },
      ),
  'AddItemPage': (data) async => ParameterData(
        allParams: {
          'groupRef': getParameter<DocumentReference>(data, 'groupRef'),
        },
      ),
  'AddGroup': ParameterData.none(),
  'HomePage': (data) async => ParameterData(
        allParams: {
          'selectedGroupRef':
              getParameter<DocumentReference>(data, 'selectedGroupRef'),
        },
      ),
  'EditItem': (data) async => ParameterData(
        allParams: {
          'item': await getDocumentParameter<ItemsRecord>(
              data, 'item', ItemsRecord.fromSnapshot),
        },
      ),
  'ItemView': (data) async => ParameterData(
        allParams: {
          'item': await getDocumentParameter<ItemsRecord>(
              data, 'item', ItemsRecord.fromSnapshot),
        },
      ),
  'IntialGroupCreation': ParameterData.none(),
  'EditGroup': (data) async => ParameterData(
        allParams: {
          'group': await getDocumentParameter<GroupsRecord>(
              data, 'group', GroupsRecord.fromSnapshot),
        },
      ),
  'HomePageAllItems': ParameterData.none(),
  'GroupView': (data) async => ParameterData(
        allParams: {
          'group': await getDocumentParameter<GroupsRecord>(
              data, 'group', GroupsRecord.fromSnapshot),
        },
      ),
  'JoinGroup': ParameterData.none(),
  'ProfileView': (data) async => ParameterData(
        allParams: {
          'selectedGroupRef':
              getParameter<DocumentReference>(data, 'selectedGroupRef'),
        },
      ),
  'EditProfile': (data) async => ParameterData(
        allParams: {
          'selectGroupRef':
              getParameter<DocumentReference>(data, 'selectGroupRef'),
        },
      ),
  'joinGrouByLink': (data) async => ParameterData(
        allParams: {
          'groupRef': getParameter<DocumentReference>(data, 'groupRef'),
        },
      ),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
