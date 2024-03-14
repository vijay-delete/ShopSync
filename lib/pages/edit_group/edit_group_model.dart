import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'edit_group_widget.dart' show EditGroupWidget;
import 'package:flutter/material.dart';

class EditGroupModel extends FlutterFlowModel<EditGroupWidget> {
  ///  Local state fields for this page.

  List<UsersRecord> users = [];
  void addToUsers(UsersRecord item) => users.add(item);
  void removeFromUsers(UsersRecord item) => users.remove(item);
  void removeAtIndexFromUsers(int index) => users.removeAt(index);
  void insertAtIndexInUsers(int index, UsersRecord item) =>
      users.insert(index, item);
  void updateUsersAtIndex(int index, Function(UsersRecord) updateFn) =>
      users[index] = updateFn(users[index]);

  List<UsersRecord> removedUsers = [];
  void addToRemovedUsers(UsersRecord item) => removedUsers.add(item);
  void removeFromRemovedUsers(UsersRecord item) => removedUsers.remove(item);
  void removeAtIndexFromRemovedUsers(int index) => removedUsers.removeAt(index);
  void insertAtIndexInRemovedUsers(int index, UsersRecord item) =>
      removedUsers.insert(index, item);
  void updateRemovedUsersAtIndex(int index, Function(UsersRecord) updateFn) =>
      removedUsers[index] = updateFn(removedUsers[index]);

  List<UsersRecord> addedUsers = [];
  void addToAddedUsers(UsersRecord item) => addedUsers.add(item);
  void removeFromAddedUsers(UsersRecord item) => addedUsers.remove(item);
  void removeAtIndexFromAddedUsers(int index) => addedUsers.removeAt(index);
  void insertAtIndexInAddedUsers(int index, UsersRecord item) =>
      addedUsers.insert(index, item);
  void updateAddedUsersAtIndex(int index, Function(UsersRecord) updateFn) =>
      addedUsers[index] = updateFn(addedUsers[index]);

  List<DocumentReference> helperCurrentUserGroups = [];
  void addToHelperCurrentUserGroups(DocumentReference item) =>
      helperCurrentUserGroups.add(item);
  void removeFromHelperCurrentUserGroups(DocumentReference item) =>
      helperCurrentUserGroups.remove(item);
  void removeAtIndexFromHelperCurrentUserGroups(int index) =>
      helperCurrentUserGroups.removeAt(index);
  void insertAtIndexInHelperCurrentUserGroups(
          int index, DocumentReference item) =>
      helperCurrentUserGroups.insert(index, item);
  void updateHelperCurrentUserGroupsAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      helperCurrentUserGroups[index] = updateFn(helperCurrentUserGroups[index]);

  List<DocumentReference> groupItems = [];
  void addToGroupItems(DocumentReference item) => groupItems.add(item);
  void removeFromGroupItems(DocumentReference item) => groupItems.remove(item);
  void removeAtIndexFromGroupItems(int index) => groupItems.removeAt(index);
  void insertAtIndexInGroupItems(int index, DocumentReference item) =>
      groupItems.insert(index, item);
  void updateGroupItemsAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      groupItems[index] = updateFn(groupItems[index]);

  String? groupImage = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in EditGroup widget.
  List<UsersRecord>? groupUsers;
  // Stores action output result for [Firestore Query - Query a collection] action in EditGroup widget.
  List<ItemsRecord>? itemsInGroup;
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
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // Stores action output result for [Firestore Query - Query a collection] action in Icon widget.
  UsersRecord? queriedUser;
  // Stores action output result for [Custom Action - pickContactFromPhoneBook] action in Container widget.
  String? selectedPhoneNumber;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  UsersRecord? qeriedUserByContacts;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  UsersRecord? currentUser;

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

    textFieldFocusNode3?.dispose();
    textController3?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
