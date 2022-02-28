import 'package:flutter/material.dart';

class PendingCard1 extends StatelessWidget {
  const PendingCard1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
      // margin: EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 1.0,
            // blurStyle: BlurStyle.outer,
            spreadRadius: 2,
            color: Colors.grey.shade200,
            offset: const Offset(
              -1.0,
              -1.0,
            ),
          ),
          BoxShadow(
            blurRadius: 1,
            // blurStyle: BlurStyle.outer,
            spreadRadius: 2,
            color: Colors.grey.shade200,
            offset: const Offset(
              1.0,
              1.0,
            ),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Image.asset(
                'assets/shapes/Shape4.png',
                height: 20,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/icons/approval_truck.png',
                height: 60,
              ),
              const SizedBox(
                width: 10,
              ),
              Image.asset(
                'assets/shapes/Shape1.png',
                height: 50,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Pending Approval',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              '4 TRUCKS',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue.shade50),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 10,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PendingCard2 extends StatelessWidget {
  const PendingCard2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
      // margin: EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 1.0,
            // blurStyle: BlurStyle.outer,
            spreadRadius: 2,
            color: Colors.grey.shade200,
            offset: const Offset(
              -1.0,
              -1.0,
            ),
          ),
          BoxShadow(
            blurRadius: 1,
            // blurStyle: BlurStyle.outer,
            spreadRadius: 2,
            color: Colors.grey.shade200,
            offset: const Offset(
              1.0,
              1.0,
            ),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Image.asset(
                'assets/shapes/Shape5.png',
                height: 20,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/icons/package.png',
                height: 60,
              ),
              const SizedBox(
                width: 10,
              ),
              Image.asset(
                'assets/shapes/Shape3.png',
                height: 50,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Allotment Pending',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              '5 TRUCKS',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.green),
              backgroundColor: MaterialStateProperty.all(Colors.green.shade50),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 10,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PendingCard3 extends StatelessWidget {
  const PendingCard3({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
      // margin: EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 1.0,
            // blurStyle: BlurStyle.outer,
            spreadRadius: 2,
            color: Colors.grey.shade200,
            offset: const Offset(
              -1.0,
              -1.0,
            ),
          ),
          BoxShadow(
            blurRadius: 1,
            // blurStyle: BlurStyle.outer,
            spreadRadius: 2,
            color: Colors.grey.shade200,
            offset: const Offset(
              1.0,
              1.0,
            ),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Image.asset(
                'assets/shapes/Shape4.png',
                height: 20,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/icons/blocked.png',
                height: 60,
              ),
              const SizedBox(
                width: 10,
              ),
              Image.asset(
                'assets/shapes/Shape2.png',
                height: 50,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Delivery Pending',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              '4 ITEMS',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.purple),
              backgroundColor: MaterialStateProperty.all(Colors.purple.shade50),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 10,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
