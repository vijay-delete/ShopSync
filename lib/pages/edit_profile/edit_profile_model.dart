import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'edit_profile_widget.dart' show EditProfileWidget;
import 'package:flutter/material.dart';

class EditProfileModel extends FlutterFlowModel<EditProfileWidget> {
  ///  Local state fields for this page.

  String? profileImage = '';

  List<GroupsRecord> groups = [];
  void addToGroups(GroupsRecord item) => groups.add(item);
  void removeFromGroups(GroupsRecord item) => groups.remove(item);
  void removeAtIndexFromGroups(int index) => groups.removeAt(index);
  void insertAtIndexInGroups(int index, GroupsRecord item) =>
      groups.insert(index, item);
  void updateGroupsAtIndex(int index, Function(GroupsRecord) updateFn) =>
      groups[index] = updateFn(groups[index]);

  List<GroupsRecord> removedGroups = [];
  void addToRemovedGroups(GroupsRecord item) => removedGroups.add(item);
  void removeFromRemovedGroups(GroupsRecord item) => removedGroups.remove(item);
  void removeAtIndexFromRemovedGroups(int index) =>
      removedGroups.removeAt(index);
  void insertAtIndexInRemovedGroups(int index, GroupsRecord item) =>
      removedGroups.insert(index, item);
  void updateRemovedGroupsAtIndex(int index, Function(GroupsRecord) updateFn) =>
      removedGroups[index] = updateFn(removedGroups[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in EditProfile widget.
  List<GroupsRecord>? userGroups;
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
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  UsersRecord? updatedUser;

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
