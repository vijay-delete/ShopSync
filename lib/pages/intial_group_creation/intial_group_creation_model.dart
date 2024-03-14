import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'intial_group_creation_widget.dart' show IntialGroupCreationWidget;
import 'package:flutter/material.dart';

class IntialGroupCreationModel
    extends FlutterFlowModel<IntialGroupCreationWidget> {
  ///  Local state fields for this page.

  List<UsersRecord> users = [];
  void addToUsers(UsersRecord item) => users.add(item);
  void removeFromUsers(UsersRecord item) => users.remove(item);
  void removeAtIndexFromUsers(int index) => users.removeAt(index);
  void insertAtIndexInUsers(int index, UsersRecord item) =>
      users.insert(index, item);
  void updateUsersAtIndex(int index, Function(UsersRecord) updateFn) =>
      users[index] = updateFn(users[index]);

  String? groupImage = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // Stores action output result for [Firestore Query - Query a collection] action in Icon widget.
  UsersRecord? queriedUser;
  // Stores action output result for [Custom Action - pickContactFromPhoneBook] action in Container widget.
  String? selectedPhoneNumber;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  UsersRecord? qeriedUserByContacts;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  GroupsRecord? group;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
