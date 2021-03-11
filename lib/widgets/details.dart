import 'package:flutter/material.dart';
import 'package:restaurant_app/widgets/checkout.dart';
import './cart.dart';
import './favourite.dart';

class DetailPage extends StatefulWidget {
  final Map<String, dynamic> item;
  DetailPage({this.item});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  List<Food> food_list = [];

  void showList() {
    for (int i = 0; i < food_list.length; i++) {
      print(food_list[i].name);
      print(food_list[i].count);
      print(food_list[i].price);
    }
  }

  void addElementToList(foodElem) {
    setState(() {
      food_list.add(foodElem);
    });
  }

  void decElement(name) {
    if (food_list.length != 0) { //if list not empty
      for (int i = 0; i < food_list.length; i++) { //loops through list
        if (food_list[i].name == name) { // if there is a match of the name
          food_list[i].updateDecrement(); // - the count by 1
          if (food_list[i].count == 0) { // - removes the element from the list
            food_list.removeAt(i);
          }
          break;
        }
      }
    }
    showList();
  }

  void makeElement(name, image, price) {
    if (food_list.length == 0) {
      var newFood = new Food();
      newFood.name = name;
      newFood.image = image;
      newFood.count = 1;
      newFood.price = price;
      addElementToList(newFood);
    } else {
      bool EXISTS = false;
      for (int i = 0; i < food_list.length; i++) {
        if (food_list[i].name == name) {
          food_list[i].updateIncrement();
          print("found");
          EXISTS = true;
          break;
        }
      }
      if (!EXISTS) {
        var newFood = new Food();
        newFood.name = name;
        newFood.image = image;
        newFood.count = 1;
        newFood.price = price;
        addElementToList(newFood);
      }
    }

    showList();
  }
  void addToFavourites (item){
    setState(() {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  Favourites(item: item)));
    });
  }




  @override
  Widget build(BuildContext context) {
    // print(item["menu"].length);
    return Scaffold(
      appBar: AppBar(
        title: Text("Order"),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  addToFavourites(widget.item);
                },
                child: Icon(
                  Icons.favorite_outline,
                  size: 26.0,
                ),
              )
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
              child: Image.network(widget.item["poster"]),
              width: 200,
              height: 200),
          Text("Restaurant: " + widget.item["name"],
              style: TextStyle(fontSize: 20, color: Colors.red)),
          Text(widget.item["cuisine"]+" food"),
          Expanded(
            child: ListView.builder(
                itemCount: widget.item["menu"].length,
                itemBuilder: (BuildContext context, index) {
                  return Container(
                      child: ListTile(
                    title: Text(widget.item["menu"][index]["foodName"]),
                    subtitle: Text(widget.item["menu"][index]["price"]),
                    leading: Image.network(widget.item["menu"][index]["image"]),
                    trailing: Wrap(
                      spacing: 12,
                      children: [
                        IconButton(
                          padding: EdgeInsets.zero,
                          constraints: BoxConstraints(),
                          icon: Icon(
                            Icons.add,
                            size: 20,
                          ),
                          onPressed: () {
                            makeElement(
                                widget.item["menu"][index]["foodName"],
                                widget.item["menu"][index]["image"],
                                widget.item["menu"][index]["price"]);
                          },
                        ),
                        IconButton(
                          padding: EdgeInsets.zero,
                          constraints: BoxConstraints(),
                          icon: Icon(
                            Icons.cancel_outlined,
                            size: 20,
                          ),
                          onPressed: () {
                            decElement(
                              widget.item["menu"][index]["foodName"],
                            );
                          },
                        ),
                      ],
                    ),
                    //
                  )
                  );
                }),
          ),


          // Text(item["menu1"][0]["menu"])
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.shopping_cart),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Checkout(
                          food_list: food_list,
                        )));
          }),
    );
  }
}
