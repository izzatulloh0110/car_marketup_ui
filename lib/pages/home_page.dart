import 'package:flutter/material.dart';
import 'package:marketup_ui/pages/liked.dart';

import 'keys.dart';

class HomePage extends StatefulWidget {
  static const String id = "home_page";

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Car> cars = [
    Car(
        type: 'Electric',
        price: '80 000\$',
        image: 'assets/images/white_tesla.jpeg',
        name: '3 model',
        category: 'white'),
    Car(
        type: 'Electric',
        price: '110 000\$',
        image: 'assets/images/blue_tesla.jpeg',
        name: 'Y model',
        category: 'blue'),
    Car(
        type: 'Electric',
        price: '150 000\$',
        image: 'assets/images/yellow_tesla.jpeg',
        name: 'S model',
        category: 'yellow'),
    Car(
        type: 'Electric',
        price: '50 000\$',
        image: 'assets/images/Pink-Teslas-1.jpeg',
        name: 'X model',
        category: 'pink'),
    Car(
        type: 'Electric',
        price: '120 000\$',
        image: 'assets/images/green_tesla.jpeg',
        name: 'Z model',
        category: 'green'),
  ];

  Future<void> _navigate() async{
    List<Car> newList = await Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Liked(cars: cars)));
    if(newList.isNotEmpty){
      setState(() {
        cars = newList;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(
          "Cars",
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_outlined,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: _navigate,
            icon: Icon(
              Icons.shopping_cart_sharp,
              color: Colors.white,
            ),
          )
        ],
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              // #categories
              Container(
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    singleTab(true, "all"),
                    singleTab(false, "white"),
                    singleTab(false, "blue"),
                    singleTab(false, "yellow"),
                    singleTab(false, "pink"),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  itemCount: cars.length,
                  itemBuilder: (context, index){
                    return makeItem(cars[index]);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget singleTab(bool type, String text) {
    return AspectRatio(
      aspectRatio: 2.5 / 1,
      child: Container(
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
            color: type ? Colors.white : Colors.grey.shade800,
            borderRadius: BorderRadius.circular(20),
            boxShadow: type
                ? [
                    BoxShadow(
                        color: Colors.white,
                        blurRadius: 15,
                        offset: Offset(0, 0))
                  ]
                : null),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                color: type ? Colors.black : Colors.white,
                fontSize: type ? 24 : 18),
          ),
        ),
      ),
    );
  }

  Widget makeItem(Car car) {
    return Container(
      height: 250,
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade800,
                blurRadius: 10,
                offset: Offset(0, 10))
          ],
          image:
              DecorationImage(image: AssetImage(car.image), fit: BoxFit.cover)),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
              Colors.black.withOpacity(0.9),
              Colors.black.withOpacity(0.4),
              Colors.black.withOpacity(0.1),
            ])),
        child: Container(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          car.name,
                          style: TextStyle(fontSize: 40, color: Colors.white),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          car.type,
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        )
                      ],
                    )),
                    Container(
                      margin: EdgeInsets.only(top: 170),
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(13)),
                      height: 40,
                      width: 40,
                      child: Center(
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              cars[cars.indexOf(car)].isLiked =
                              !cars[cars.indexOf(car)].isLiked;
                            });
                          },
                          icon: Icon(cars[cars.indexOf(car)].isLiked
                              ? Icons.favorite
                              : Icons.favorite_border_outlined,
                            color: cars[cars.indexOf(car)].isLiked
                              ? Colors.red
                              : Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}
