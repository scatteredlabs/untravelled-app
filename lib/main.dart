import 'package:flutter/material.dart';
import 'package:untravelled_app/core/untravelled_design.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
            theme:
                ThemeData.light().copyWith(extensions: <ThemeExtension<dynamic>>[UntravelledTheme(tokens: UntravelledTokens.light)]),
            darkTheme:
                ThemeData.dark().copyWith(extensions: <ThemeExtension<dynamic>>[UntravelledTheme(tokens: UntravelledTokens.dark)]),
            home: const Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    UntravelledAvatar(showBadge: true, backgroundColor: Colors.black12,),
                    UntravelledButton(buttonSize: UntravelledButtonSize.xl,label: Text("Untravelled begins"),),
                  ],
                ),
              ),
            ),
          );
  }
}

