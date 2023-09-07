import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String text = 'Starte den ersten Durchlauf';
  String text1 = 'Zweiter Durchlauf startet automatisch';
  Color text1Color = Colors.black; 

  void onButtonPressed() {
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        text = 'Erster Lauf Erfolgreich abgeschlossen';
      });
    });

    Future.delayed(const Duration(seconds: 8), () {
      setState(() {
        text1 = 'Zweiter Lauf Erfolgreich abgeschlossen';
        text1Color = Colors.green; 
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Asynchronität')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: const TextStyle(fontSize:18),
            ),
            const SizedBox(height: 20,),
            Text(
              text1,
              style: TextStyle(fontSize: 18, color: text1Color), 
            ),
            const SizedBox(height: 20,),
            Container(
              height: 50,
              width: 130,
              color: Colors.blue,
              child: MaterialButton(
                onPressed: () {
                  onButtonPressed();
                },
                child: const Center(child: Text('Click Button')),
              ),
            )
          ],
        ),
      ),
    );
  }
}
