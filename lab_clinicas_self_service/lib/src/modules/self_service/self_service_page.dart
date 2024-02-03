import 'package:flutter/material.dart';

class SelfServicePage extends StatelessWidget {

  const SelfServicePage({ super.key });

   @override
   Widget build(BuildContext context) {
       return const Scaffold(
           body: Center(
            child: CircularProgressIndicator(),
           ),
       );
  }
}