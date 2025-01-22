import 'package:flutter/material.dart';
import 'package:list_of_employees_task/models/employee_model.dart';
import 'package:list_of_employees_task/services/get_empolyees.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<EmployeeModel> employees = [];
  bool isLoading = true;

  getEmployees() async {
    employees = await GetAllEmployees().getAllEmployees();
  }

  @override
  void initState() {
    super.initState();
    getEmployees();
  }

  display() {
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              display();
              setState(() {});
            },
            child: Text('Display'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: employees.length,
              itemBuilder: (context, index) {
                return isLoading
                    ? Center(child: CircularProgressIndicator())
                    : ListTile(
                        leading: Icon(Icons.person),
                        title: Text(
                          '${employees[index].firstName} ${employees[index].lastName}',
                        ),
                        trailing: Text(
                          '${employees[index].salary}00 \$',
                        ),
                      );
              },
            ),
          )
        ],
      ),
    );
  }
}
