import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class User {
  String lastName;
  String firstName;
  User({required this.lastName, required this.firstName});
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController num1controller = TextEditingController();
  TextEditingController num2controller = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController resultController = TextEditingController();
  int result_total = 0;

  final formKey = GlobalKey<FormState>();
  User userForm = User(firstName: "", lastName: "");
  String result = '1';

  void validateForm() {
    if (formKey.currentState != null) {
      if (formKey.currentState!.validate()) {
        print("tout est bon");
        print( int.parse(num2controller.text) ?? 0);
        print(int.parse(num1controller.text) ?? 0);
        print(int.parse(num1controller.text) ?? 0 + int.parse(num2controller.text) ?? 0);
      }
    } else {
      print("tous les validators ne sont pas rempli");
    }
  }

  void sommeDeuxNombres() {
    print("Bouton presser");
    setState(() {
      int sum = int.tryParse(num1controller.text) ?? 0 + int.parse(num2controller.text) ?? 0;
      int num1 = int.parse(num1controller.text);
      int num2 = int.parse(num2controller.text);

      result_total = num1 + num2;
      resultController.text = result_total.toString();

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Text(widget.title),
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(hintText: "Prénom"),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Required";
                }
              },
              controller: firstName,
              onSaved: (value) {
                userForm.lastName == value ?? '';
              },
            ),
            TextFormField(
              decoration: InputDecoration(hintText: "Nom"),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Required";
                }
              },
              controller: lastName,
            ),
            TextFormField(
              decoration: InputDecoration(hintText: "Saisir le premier nombre"),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Required";
                }
              },
              controller: num1controller,
            ),
            TextFormField(
              decoration: InputDecoration(hintText: "Saisir le deuxième nombre"),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Required";
                }
              },
              controller: num2controller,
            ),
            TextFormField(
              readOnly: true,
              controller: resultController,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: () {
              validateForm();
              sommeDeuxNombres();
            },
            child: Icon(Icons.check),
          ),
          ElevatedButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState?.reset();
                num1controller.clear();
                num2controller.clear();
                resultController.clear();
                firstName.clear();
                lastName.clear();
              }
            },
            child: Icon(Icons.replay_outlined),
          ),
        ],
      ),
    );
  }
}


