import 'package:flutter/material.dart';
import 'package:superprocure_app/services/constants.dart';

class InBoard extends StatelessWidget {
  const InBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Incoming Board',
          style: TextStyle(
            color: indigo,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset('assets/icons/icon_filter.png'),
          ),
        ],
      ),
      backgroundColor: Colors.grey.shade100,
      body: Center(
        child: Container(
          child: const Text('Incoming Board Details'),
        ),
      ),
    );
  }
}
