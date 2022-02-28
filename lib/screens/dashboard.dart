import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:superprocure_app/services/constants.dart';
import 'package:superprocure_app/screens/location_tracking.dart';
import 'package:superprocure_app/widgets/pending_cards.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  final List<String> imagesList = [
    'https://cdn.pixabay.com/photo/2016/11/21/13/20/port-1845350_960_720.jpg',
    'https://cdn.pixabay.com/photo/2017/09/04/18/51/ikea-2714998_960_720.jpg',
    'https://cdn.pixabay.com/photo/2019/08/15/17/56/production-4408573_960_720.jpg',
    'https://cdn.pixabay.com/photo/2021/12/06/10/55/hamburg-6849995_960_720.jpg',
    'https://cdn.pixabay.com/photo/2018/12/06/12/02/container-3859710_960_720.jpg',
  ];

  final List<Widget> pendingCardList = [
    const PendingCard1(),
    const PendingCard2(),
    const PendingCard3(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: 20,
            ),
            Row(
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'HELP',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(orange),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(
                        // vertical: 5,
                        horizontal: 15,
                      ),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset('assets/icons/settings.png'),
                ),
              ],
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  height: 200,
                ),
                items: imagesList
                    .map(
                      (item) => Center(
                        child: Image.network(
                          item,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: const [
                    Text(
                      'Pending Tasks',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                color: Colors.grey.shade100,
                height: 245,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  // children: pendingCardList,
                  children: [
                    Expanded(
                      child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,

                        padding: const EdgeInsets.all(10),
                        // children: pendingCardList,
                        itemBuilder: ((context, index) {
                          return pendingCardList[index];
                        }),
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            width: 10,
                          );
                        },
                        itemCount: pendingCardList.length,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: const [
                    Text(
                      'Boards',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                color: Colors.grey.shade100,
                // height: 250,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BoardCard(cardText: 'Incoming'),
                    BoardCard(cardText: 'Outgoing'),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LocationTracking(),
                            ),
                          );
                        },
                        child: BoardCard(cardText: 'Tracking')),
                  ],
                ),
              ),
              Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 30),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 15),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.orange, width: 1),
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.orange.shade50,
                    ),
                    child: const Text(
                      'You can now track all your vehicles real - time along with their speed limits and path taken. Learn More',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 14,
                    top: 26,
                    child: Image.asset(
                      'assets/icons/new.png',
                      height: 50,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Center(
                      child: Text(
                        'version : 13.2.1',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BoardCard extends StatelessWidget {
  String cardText;
  BoardCard({required this.cardText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
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
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/icons/delivery_truck.png',
            height: 50,
          ),
          Text(
            cardText,
            style: TextStyle(
              color: lightBlue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
