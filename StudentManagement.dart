import 'dart:io';

List<String> tasks = [];
void main() {
  print('=========/\/\ WELLCOME TO ABC UNIVERSITY LMS /\/\=========');

  while (true) {
    print('Login as a (Student , Teacher, Exit):');
    String command = stdin.readLineSync()!;

    if (command == 'Student') {
      StudentLogin();
    } else if (command == 'Exit') {
      break;
    } else {
      print('Invalid command!');
    }
  }

  print('Goodbye!');
}

/*else if (command == 'remove') {
      RemoveTask();
    } else if (command == 'view') {
      viewTask();
    */

String promptUser(String prompt) {
  stdout.write("$prompt ");
  return stdin.readLineSync()!;
}

StudentLogin() {
  List<Map<String, String>> userCredentials = [
    {"email": "Student1@gmail.com", "password": "1234"},
    {"email": "Student2@gmail.com", "password": "5678"},
    {"email": "Student3@gmail.com", "password": "1122"},
  ];
  bool Login = false;

  while (!Login) {
    String enteredEmail = promptUser("Enter your email:");
    String enteredPassword = promptUser("Enter your password:");

    if (userCredentials.any((credentials) =>
        credentials["email"] == enteredEmail &&
        credentials["password"] == enteredPassword)) {
      Login = true;
      print("User login successful.");
      print('Select an option to go at(StudentProfile,Result,Assignemnt,)');
      String stdoption = stdin.readLineSync()!;
      if (stdoption == 'StudentProfile') {
        List<Map<String, dynamic>> studentprofile = [
          {
            'Student Name': 'Student 1',
            'Student Roll#': 1001,
            'Semester': 'First',
            'Feculty': 'BSCS',
            'Student Email': 'Student1@gmail.com',
            'Student Contect': '+92-335-1234567',
            'Student Adress':
                'plot no 123, Block x, Falana gali, dhimkana nagar, Karachi',
          },
          {
            'Student Name': 'Student 2',
            'Student Roll#': 1002,
            'Semester': 'Fourth',
            'Feculty': 'BSCS',
            'Student Email': 'Student2@gmail.com',
            'Student Contect': '+92-335-1234567',
            'Student Adress':
                'plot no 121, Block x, Falana gali, dhimkana nagar, Karachi',
          },
          {
            'Student Name': 'Student 3',
            'Student Roll#': 1003,
            'Semester': 'Third',
            'Feculty': 'BBA',
            'Student Email': 'Student3@gmail.com',
            'Student Contect': '+92-335-1234567',
            'Student Adress':
                'plot no 122, Block x, Falana gali, dhimkana nagar, Karachi',
          }
        ];
        if (studentprofile[0]['Student Email'] == enteredEmail) {
          print(studentprofile[0]);
          print('====================================');
          print(stdoption);
        } else if (studentprofile[1]['Student Email'] == enteredEmail) {
          print(studentprofile[1]);
          print('====================================');
          print(stdoption);
        } else if (studentprofile[2]['Student Email'] == enteredEmail) {
          print(studentprofile[2]);
          print('====================================');
          print(stdoption);
        }
        ;
      }
    } else {
      print("Incorrect email or password. Please try again.");
    }
  }
}

RemoveTask() {
  print('Enter the index of the task to remove:');
  int index = int.parse(stdin.readLineSync()!);
  if (index >= 0 && index < tasks.length) {
    tasks.removeAt(index);
    print('Task removed!');
  } else {
    print('Invalid index!');
  }
}

viewTask() {
  print('Tasks:');
  for (int i = 0; i < tasks.length; i++) {
    print('$i. ${tasks[i]}');
  }
}
