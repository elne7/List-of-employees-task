class EmployeeModel {
  final String firstName;
  final String lastName;
  final double salary;

  EmployeeModel({
    required this.firstName,
    required this.lastName,
    required this.salary,
  });

  factory EmployeeModel.fromJson(jsonData) {
    return EmployeeModel(
      firstName: jsonData['firstName'],
      lastName: jsonData['lastName'],
      salary: jsonData['salary'],
    );
  }
}
