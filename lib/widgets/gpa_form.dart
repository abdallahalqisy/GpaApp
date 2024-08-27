import 'package:flutter/material.dart';
import 'package:gpa_calculator/widgets/custom_app_bar.dart';

class GPAForm extends StatefulWidget {
  @override
  _GPAFormState createState() => _GPAFormState();
}

class _GPAFormState extends State<GPAForm> {
  final _formKey = GlobalKey<FormState>();
  final _courses = <Course>[];
  final _courseController = TextEditingController();
  final _creditController = TextEditingController();
  final _gradeController = TextEditingController();

  void _addCourse() {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _courses.add(
          Course(
            name: _courseController.text.isNotEmpty
                ? _courseController.text
                : 'Unnamed Course',
            credit: double.tryParse(_creditController.text) ?? 0,
            grade: double.tryParse(_gradeController.text) ?? 0,
          ),
        );
        _courseController.clear();
        _creditController.clear();
        _gradeController.clear();
      });
    }
  }

  void _removeCourse(int index) {
    setState(() {
      _courses.removeAt(index);
    });
  }

  String _getLetterGrade(double grade) {
    if (grade >= 4.0) return 'A+';
    if (grade >= 4.0) return 'A';
    if (grade >= 3.7) return 'A-';
    if (grade >= 3.3) return 'B+';
    if (grade >= 3.0) return 'B';
    if (grade >= 2.7) return 'B-';
    if (grade >= 2.3) return 'C+';
    if (grade >= 1) return 'C';
    if (grade >= 1.7) return 'C-';
    if (grade >= 1.3) return 'D+';
    if (grade >= 1.0) return 'D';
    return 'F';
  }

  double _calculateGPA() {
    double totalPoints = 0;
    double totalCredits = 0;

    for (var course in _courses) {
      totalPoints += course.grade * course.credit;
      totalCredits += course.credit;
    }

    return totalCredits > 0 ? totalPoints / totalCredits : 0;
  }

  @override
  Widget build(BuildContext context) {
    final double finalGPA = _calculateGPA();
    final String finalLetterGrade = _getLetterGrade(finalGPA);

    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: _courseController,
                    decoration:
                        InputDecoration(labelText: 'Course Name (Optional)'),
                  ),
                  TextFormField(
                    controller: _creditController,
                    decoration: InputDecoration(labelText: 'Credits'),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter credits';
                      }
                      if (double.tryParse(value) == null) {
                        return 'Please enter a valid number';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _gradeController,
                    decoration: InputDecoration(labelText: 'Grade'),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter grade';
                      }
                      if (double.tryParse(value) == null) {
                        return 'Please enter a valid number';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _addCourse,
                      child: Text('Add Course'),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
            Text(
              'Courses:',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _courses.length,
                itemBuilder: (context, index) {
                  final course = _courses[index];
                  return ListTile(
                    title: Text(course.name),
                    subtitle: Text(
                        'Credits: ${course.credit}, Grade: ${course.grade} (${_getLetterGrade(course.grade)})'),
                    trailing: IconButton(
                      icon: Icon(Icons.cancel, color: Colors.red),
                      onPressed: () => _removeCourse(index),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                'GPA: ${finalGPA.toStringAsFixed(2)} ($finalLetterGrade)',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Course {
  final String name;
  final double credit;
  final double grade;

  Course({
    required this.name,
    required this.credit,
    required this.grade,
  });
}
