import 'package:rxdart/rxdart.dart';

import '/backend/schema/structs/index.dart';
import 'custom_auth_manager.dart';

class MDMSUIAutomateTestAuthUser {
  MDMSUIAutomateTestAuthUser({
    required this.loggedIn,
    this.uid,
    this.userData,
  });

  bool loggedIn;
  String? uid;
  GetProfileResponseModelStruct? userData;
}

/// Generates a stream of the authenticated user.
BehaviorSubject<MDMSUIAutomateTestAuthUser> mDMSUIAutomateTestAuthUserSubject =
    BehaviorSubject.seeded(MDMSUIAutomateTestAuthUser(loggedIn: false));
Stream<MDMSUIAutomateTestAuthUser> mDMSUIAutomateTestAuthUserStream() =>
    mDMSUIAutomateTestAuthUserSubject
        .asBroadcastStream()
        .map((user) => currentUser = user);
