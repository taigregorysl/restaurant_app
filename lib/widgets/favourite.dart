import 'package:flutter/material.dart';
import './details.dart';


class Favourites extends StatelessWidget {

  final Map<String, dynamic> item;
  Favourites({this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(title: Text("Favourites"),),
        body: Container(
          child: Card(
            child: ListTile(
              title: Text(item["name"]),
              trailing: Icon(Icons.arrow_forward_ios),
              leading: Image.network(item["poster"]),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            DetailPage(item: item)));
              },
            ),
          )
        ),
      )
    );
  }
}
