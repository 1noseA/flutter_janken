import 'dart:math';

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
  // 自分の手
  String myHand = '✊';

  // コンピューターの手
  String computerHand = '✊';

  // 結果
  String result = '';

  // 関数
  void selectHand(String selectdHand) {
    myHand = selectdHand;
    // ignore: avoid_print
    print(myHand);
    generateComputerHand();
    judge();
    setState((){});
  }

  // コンピューターの手をランダムで生成
  void generateComputerHand() {
    // ignore: avoid_print
    final randomNumber = Random().nextInt(3);
    computerHand = randomNumberToHand(randomNumber);
  }

  // ランダムな数字を絵文字に変換する
  String randomNumberToHand(int randomNumber) {
    switch (randomNumber) {
      case 0:
        return '✊';
      case 1:
        return '✌️';
      case 2:
        return '🖐';
      default:
        return '✊';
    }
  }

  // 勝敗判定
  void judge() {
    // 引き分けの場合
    if (myHand == computerHand) {
      result = '引き分け';
    } else if ((myHand == '✊' && computerHand == '✌️') ||
        (myHand == '✌️' && computerHand == '🖐') ||
        (myHand == '🖐' && computerHand == '✊')) {
      result = '勝ち';
    } else {
      result = '負け';
    }
  }

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
            // 勝敗
            Text(
              result,
              style: TextStyle(
                fontSize: 32,
              ),
            ),
            SizedBox(height: 48),

            // コンピューターの手
            Text(
              computerHand,
              style: TextStyle(
                fontSize: 32,
              ),
            ),
            SizedBox(height: 48),

            // 自分の手
            Text(
              myHand,
              style: TextStyle(
                fontSize: 32,
              ),
            ),
            SizedBox(height: 48),

            // 手を選ぶボタン
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [   
                ElevatedButton(
                  onPressed: (){
                    selectHand('✊');
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: Text(
                    '✊',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: (){
                    selectHand('✌️');
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: Text('✌️',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: (){
                    selectHand('🖐️');
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: Text('🖐️',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
