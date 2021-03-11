import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import './cart.dart';
import './addreview.dart';

class Checkout extends StatefulWidget {
  final List<Food> food_list;
  Checkout({this.food_list});

  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  double total = 0;

  void showList() {
    List<Food> food_list = widget.food_list;
    for (int i = 0; i < food_list.length; i++) {
      print(food_list[i].name);
      print(food_list[i].count);
      print(food_list[i].price);
    }
  }

  void calculateTotal() {
    total = 0;
    List<Food> food_list = widget.food_list;
    double unit_total = 0;
    double unit_price = 0;
    for (int i = 0; i < food_list.length; i++) {
      unit_price = 0;
      unit_total = 0;
      unit_price = double.parse(food_list[i].price.replaceAll('RM', ''));
      unit_total = unit_price * food_list[i].count;
      print(unit_total);
      total = total + unit_total;
    }
    print(total);
  }

  @override
  Widget build(BuildContext context) {
    //showList();
    calculateTotal();

    return Scaffold(
      appBar: AppBar(
        title: Text("Check Out"),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
              padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Total: ",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    "RM${total}",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: widget.food_list.length,
                  itemBuilder: (BuildContext context, index) {
                    return Container(
                      child: ListTile(
                        title: Text(
                          widget.food_list[index].name,
                        ),
                        subtitle: Text(
                          widget.food_list[index].price,
                        ),
                        leading: Image.network(widget.food_list[index].image),
                        //trailing: Text("${widget.food_list[index].count}"),
                        trailing: Wrap(
                          spacing: 12, // space between two icons
                          children: [
                            Text("${widget.food_list[index].count}"),
                            Text(
                                "${double.parse(widget.food_list[index].price.replaceAll('RM', '')) * widget.food_list[index].count}")
                          ],
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.check),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddReviewPage())
            );
          }
      ),
    );
  }
}
