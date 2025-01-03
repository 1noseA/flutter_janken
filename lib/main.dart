import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: JankenPage(),
    );
  }
}

class JankenPage extends StatefulWidget {
  const JankenPage({super.key});

  @override
  State<JankenPage> createState() => _JankenPageState();
}

class _JankenPageState extends State<JankenPage> {
  // 変数
  String myHand = '✊';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'じゃんけんゲーム',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              myHand,
              style: TextStyle(
                fontSize: 32,
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [   
                ElevatedButton(
                  onPressed: (){
                    myHand = '✊';
                    // ignore: avoid_print
                    print(myHand);
                    setState(() {});
                  },
                  child: Text('✊'),
                ),
                ElevatedButton(
                  onPressed: (){
                    myHand = '✌️';
                    // ignore: avoid_print
                    print(myHand);
                    setState(() {});
                  },
                  child: Text('✌️'),
                ),
                ElevatedButton(
                  onPressed: (){
                    myHand = '🖐️';
                    // ignore: avoid_print
                    print(myHand);
                    setState(() {});
                  },
                  child: Text('🖐️'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
