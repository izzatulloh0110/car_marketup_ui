import 'package:flutter/material.dart';

import 'keys.dart';
class Liked extends StatefulWidget {
  static const String id = "liked";
  final List<Car> cars;
  const Liked({required this.cars});

  @override
  _LikedState createState() => _LikedState();
}

class _LikedState extends State<Liked> {
  List<Car> _allLiked = [];
  List<Car> forCart(){
    for(Car product in widget.cars){
      if (product.isLiked )
        _allLiked.add(product);
      else
        continue;
    }
    return _allLiked;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    forCart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pop(context, widget.cars);
          },
        ),
        title: Text('Favorites'),
      ),
      body:
      GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
          ),
          itemCount: _allLiked.length,

          itemBuilder: (BuildContext context, int index){
            return _cardForCart(_allLiked[index]);
          }
      ),

    );
  }

  Card _cardForCart(Car car) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
      ),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                image: AssetImage(car.image),
                fit: BoxFit.cover
            )
        ),
        child: Container(
          padding: const EdgeInsets.only(left: 20, bottom: 20, top: 15, right: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.bottomRight,
                colors: [
                  Colors.black.withOpacity(0.5),
                  Colors.black.withOpacity(0.3),
                  Colors.black.withOpacity(0.1),
                ],
              )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(car.name, style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),),
                      SizedBox(height: 5,),
                      Text(car.type, style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),),
                    ],
                  ),
                  MaterialButton(
                      minWidth: 30,
                      height: 30,
                      padding: EdgeInsets.zero,
                      shape: CircleBorder(),
                      onPressed: (){
                        setState(() {
                          car.isLiked = false;
                          widget.cars[widget.cars.indexOf(car)].isLiked = false;
                          _allLiked.remove(car);
                        });
                      },
                      child: car.isLiked? const Icon(Icons.favorite, color: Colors.red,) : const Icon(Icons.favorite_border),
                      color: Colors.transparent)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Text(car.price, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),),
                  ),
                  // MaterialButton(
                  //     minWidth: 30,
                  //     height: 30,
                  //     padding: EdgeInsets.zero,
                  //     shape: CircleBorder(),
                  //     onPressed: (){
                  //       setState(() {
                  //         car.isInCard = false;
                  //         cart.remove(car);
                  //       });
                  //     },
                  //     child: car.isInCard? const Icon(Icons.shopping_cart) : const Icon(Icons.shopping_cart_outlined),
                  //     color: Colors.white)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
