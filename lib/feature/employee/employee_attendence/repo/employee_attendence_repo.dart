import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:employeemanager/core/repository/firestore_repo.dart';
import 'package:employeemanager/models/employee_attendence.dart';

class EmployeeAttendenceFirebaseRepository {
  final FirebaseReference firebaseReference;

  EmployeeAttendenceFirebaseRepository(this.firebaseReference);

  Future<void> updateAttendenceEmployee(
      String userId, EmployeeAttendence employeeAttendence) async {
    try {
      await firebaseReference.employee.doc(userId).update({
        'employeeAttendence':
            FieldValue.arrayUnion([employeeAttendence.toJson()]),
      }).catchError((err) {
        print(err);
      }).then((value) {
        print("Employee Attendence Updated");
      });
    } catch (e) {
      print(e);
    }
  }
}
