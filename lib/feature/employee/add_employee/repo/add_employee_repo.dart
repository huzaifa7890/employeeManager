import 'package:employeemanager/core/repository/firestore_repo.dart';
import 'package:employeemanager/models/employee.dart';
import 'package:employeemanager/response/firebase_response/firebase_response_model.dart';

class EmployeeFirebaseRepository {
  final FirebaseReference firebaseReference;

  EmployeeFirebaseRepository(this.firebaseReference);

  Future<FirebaseResponse<void>> saveEmployee(Employee employee) async {
    try {
      await firebaseReference.employee.doc(employee.id).set(employee);
      return const FirebaseResponse<void>(errorMessage: '');
    } catch (e) {
      return FirebaseResponse(errorMessage: e.toString());
    }
  }

  Future<void> deleteEmployee(Employee employee) async {
    try {
      await firebaseReference.employee.doc(employee.id).delete();
    } catch (e) {
      print(e);
    }
  }

  Future<FirebaseResponse<List<Employee>>> fetchAllEmployees(
      String userId) async {
    try {
      // final querySnapshot = await firebaseReference.properties
      //     .where('sellerId', isEqualTo: userId)
      //     .get();
      final querySnapshot = await firebaseReference.employee.get();
      final List<Employee> properties = [];
      for (var doc in querySnapshot.docs) {
        final property = doc.data();
        properties.add(property);
      }

      return FirebaseResponse<List<Employee>>(
          data: properties, errorMessage: '');
    } catch (e) {
      return FirebaseResponse(errorMessage: e.toString());
    }
  }
}
