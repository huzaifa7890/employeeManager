import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:employeemanager/models/employee_manager_user.dart';

class FirebaseReference {
  FirebaseReference();
  final firestore = FirebaseFirestore.instance;

  DocumentReference get database =>
      firestore.collection("Production").doc("EmployeeManager");

  CollectionReference<EmployeeManagerUser> get users =>
      database.collection("Users").withConverter<EmployeeManagerUser>(
            fromFirestore: (snapshot, _) => EmployeeManagerUser.fromJson(
              snapshot.data() ?? {},
            ),
            toFirestore: (user, _) => user.toJson(),
          );
}
