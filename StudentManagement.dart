import 'dart:io';

List<String> tasks = [];
List<Map<String, String>> userCredentials = [
  {"email": "Student1@gmail.com", "password": "1234"},
  {"email": "Student2@gmail.com", "password": "5678"},
  {"email": "Student3@gmail.com", "password": "1122"},
  {"email": "Teacher1@gmail.com", "password": "1234"},
  {"email": "Teacher2@gmail.com", "password": "5678"},
  {"email": "Teacher3@gmail.com", "password": "1122"},
];
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
    'Student Result': 'A Grade',
    'Student Assignemnt': '5 Out of 6 submited',
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
    'Student Result': 'B Grade',
    'Student Assignemnt': '4 Out of 6 submited',
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
    'Student Result': 'C Grade',
    'Student Assignemnt': '3 Out of 6 submited',
  }
];
void main() {
  print('=========/\/\ WELLCOME TO ABC UNIVERSITY LMS /\/\=========');

  while (true) {
    print('Login as a (Student , Teacher, Exit):');
    String command = stdin.readLineSync()!;

    if (command == 'Student') {
      StudentLogin();
    } else if (command == 'Teacher') {
      TeacherLogin();
    } else if (command == 'Exit') {
      break;
    } else {
      print('Invalid command!');
    }
  }

  print('Goodbye!');
}

String promptUser(String prompt) {
  stdout.write("$prompt ");
  return stdin.readLineSync()!;
}

TeacherLogin() {
  bool Login = false;
  while (!Login) {
    String enteredEmail = promptUser("Enter your email:");
    String enteredPassword = promptUser("Enter your password:");

    if (userCredentials.any((credentials) =>
        credentials["email"] == enteredEmail &&
        credentials["password"] == enteredPassword)) {
      Login = true;
      print("User login successful.");
      while (true) {
        print('============================');
        print(
            'Select an option to go at(StudentProfile,AddStudent,RemoveStudent,Return)');
        String tchoption = stdin.readLineSync()!;
        if (tchoption == 'StudentProfile') {
          print('Enter Roll no:');
          var rollNo = int.parse(stdin.readLineSync()!);

          for (var i = 0; i < studentprofile.length; i++) {
            if (studentprofile[i]['Student Roll#'] == rollNo) {
              print(studentprofile[i]);
            }
          }
        } else if (tchoption == 'AddStudent') {
          print('Enter Student Name:');
          var newStdname = stdin.readLineSync()!;
          print('Enter Student Roll Number:');
          var newStdRollno = int.parse(stdin.readLineSync()!);
          print('Enter Student Semister:');
          var newStdSmister = stdin.readLineSync()!;
          print('Enter Student Faculty:');
          var newStdFaculty = stdin.readLineSync()!;
          print('Enter Student Email Adress:');
          var newStdEmail = stdin.readLineSync()!;
          print('Enter Student Contact No.:');
          var newStdContactno = stdin.readLineSync()!;
          print('Enter Student Adress:');
          var newStdAddress = stdin.readLineSync()!;
          print('Enter Student Result:');
          var newStdResult = stdin.readLineSync()!;
          print('Enter Student Assignements completed:');
          var newStdAssignement = stdin.readLineSync()!;
          print('Enter Student Passwor:');
          var newStdPass = stdin.readLineSync()!;
          Map<String, String> newusercredentials = {
            "email": newStdEmail,
            "password": newStdPass,
          };
          Map<String, dynamic> newustudentprofile = {
            'Student Name': newStdname,
            'Student Roll#': newStdRollno,
            'Semester': newStdSmister,
            'Feculty': newStdFaculty,
            'Student Email': newStdEmail,
            'Student Contect': newStdContactno,
            'Student Adress': newStdAddress,
            'Student Result': newStdResult,
            'Student Assignemnt': newStdAssignement,
          };
          userCredentials.add(newusercredentials);
          studentprofile.add(newustudentprofile);
          print(userCredentials[userCredentials.length - 1]);
          print('New Student Credential has been added');
          print('============================');
          print(studentprofile[studentprofile.length - 1]);
          print('New Student Profile has been added');
          print('============================');
        } else if (tchoption == 'RemoveStudent') {
          print('Enter Student Email Adress');
          var removeStdEmail = stdin.readLineSync()!;
          for (var i = 0; i < userCredentials.length; i++) {
            if (removeStdEmail == userCredentials[i]["email"]) {
              userCredentials.removeAt(i);
              print('============================');
              print(userCredentials);
              print('============================');
              print('User Credentials has been Deleted');
              print('============================');
              studentprofile.removeAt(i);
              print(studentprofile);
              print('============================');
              print('Student Profile has been Deleted');
              print('============================');
            }
          }
        } else if (tchoption == 'Return') {
          break;
        }
      }
    }
  }
}

StudentLogin() {
  bool Login = false;

  while (!Login) {
    String enteredEmail = promptUser("Enter your email:");
    String enteredPassword = promptUser("Enter your password:");

    if (userCredentials.any((credentials) =>
        credentials["email"] == enteredEmail &&
        credentials["password"] == enteredPassword)) {
      Login = true;
      print('============================');
      print("User login successful.");
      print('============================');
      while (true) {
        print('============================');
        print(
            'Select an option to go at(StudentProfile,Result,Assignemnt,Return)');
        String stdoption = stdin.readLineSync()!;
        if (stdoption == 'StudentProfile') {
          for (var i = 0; i < studentprofile.length; i++) {
            if (studentprofile[i]['Student Email'] == enteredEmail) {
              print('============================');
              print(studentprofile[i]);
            }
          }
        } else if (stdoption == 'Assignemnt') {
          for (var i = 0; i < studentprofile.length; i++) {
            if (studentprofile[i]['Student Email'] == enteredEmail) {
              print('============================');
              print(studentprofile[i]['Student Assignemnt']);
            }
          }
        } else if (stdoption == 'Result') {
          for (var i = 0; i < studentprofile.length; i++) {
            if (studentprofile[i]['Student Email'] == enteredEmail) {
              print('============================');
              print(studentprofile[i]['Student Result']);
            }
          }
        } else if (stdoption == 'Return') {
          break;
        }
      }
    } else {
      print('============================');
      print("Incorrect email or password. Please try again.");
    }
  }
}
