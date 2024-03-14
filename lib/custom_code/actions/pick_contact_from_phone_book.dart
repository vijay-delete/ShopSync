// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

//import '/backend/schema/structs/index.dart';
//import '/actions/actions.dart' as action_blocks;

import 'package:contacts_service/contacts_service.dart';

Future<String?> pickContactFromPhoneBook() async {
  // open native phonebook and return a json data for a contact selected
  // Use the contacts_service package to open the native phonebook
  final Contact? contact = await ContactsService.openDeviceContactPicker();

  // Check if a contact was selected
  if (contact != null) {
    // Extract the phone number from the contact
    final String? phoneNumber = contact.phones?.isNotEmpty ?? false
        ? contact.phones!.first.value ?? ''
        : null;

    // Remove spaces
    String cleanedPhoneNumber = phoneNumber?.replaceAll(' ', '') ?? '';

    // Add "+91" if not present
    if (!cleanedPhoneNumber.startsWith('+91')) {
      cleanedPhoneNumber = '+91$cleanedPhoneNumber';
    }

    // Check if the length is equal to 13
    if (cleanedPhoneNumber.length == 13) {
      return cleanedPhoneNumber;
    } else {
      return null; // Return null if length is not 13
    }
  }

  // If no contact was selected, return null
  return null;
}
