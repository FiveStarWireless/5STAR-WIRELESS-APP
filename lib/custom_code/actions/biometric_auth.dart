// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:local_auth/local_auth.dart';

Future<bool> biometricAuth() async {
  // name MUST match the action name
  final auth = LocalAuthentication();
  try {
    // Check capability (simple + compatible across versions)
    final canCheck = await auth.canCheckBiometrics;
    if (!canCheck) return false;

    final ok = await auth.authenticate(
      localizedReason:
          'Confirm it’s you to unlock your 5Star Wireless account.',
      options: const AuthenticationOptions(
        biometricOnly: true, // set to false if you want passcode fallback
        stickyAuth: true,
        useErrorDialogs: true,
      ),
    );
    return ok == true;
  } catch (_) {
    return false;
  }
}
