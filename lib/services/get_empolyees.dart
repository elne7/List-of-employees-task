import 'package:dio/dio.dart';
import 'package:list_of_employees_task/models/employee_model.dart';

class GetAllEmployees {
  String endPoint = 'https://hub.dummyapis.com/employee';
  List<EmployeeModel> employees = [];

  Future<List<EmployeeModel>> getAllEmployees() async {
    final dio = Dio();
    try {
      final response = await dio.get(endPoint);
      var data = response.data;
      data.forEach(
        (json) {
          EmployeeModel employee = EmployeeModel.fromJson(json);
          employees.add(employee);
        },
      );
    } on Exception catch (e) {
      print(e.toString());
    }
    return employees;
  }
}
