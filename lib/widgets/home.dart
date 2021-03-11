import 'package:flutter/material.dart';
import 'details.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List itemList = [
    {
      "name": "KGB",
      "cuisine": "Western",
      "type": "Burgers",
      "poster":
          "https://thegardensmall.com.my/wp-content/uploads/2016/06/Store-Logo_KGB.jpg",
      "menu": [
        {
          "foodName": "Shack",
          "image":
              "https://upload.wikimedia.org/wikipedia/commons/f/f7/McDonald%27s_Filet-O-Fish_sandwich_%281%29.jpg",
          "price": "RM10.50",
        }
      ]
    },
    {
      "name": "MCD",
      "cuisine": "Western",
      "type": "Fast Food",
      "poster":
          "https://www.bestdesigns.co/uploads/inspiration_images/4531/990__1511456189_555_McDonald's.png",
      "menu": [
        {
          "foodName": "Fish Fillet",
          "image":
              "https://upload.wikimedia.org/wikipedia/commons/f/f7/McDonald%27s_Filet-O-Fish_sandwich_%281%29.jpg",
          "price": "RM10.50",
        }
      ]
    },
    {
      "name": "Din Tai Fung",
      "cuisine": "Chinese",
      "type": "Dim Sum",
      "poster":
          "https://thegardensmall.com.my/wp-content/uploads/2016/06/logo-DTF-05.jpg",
      "menu": [
        {
          "foodName": "Pao",
          "image":
              "https://upload.wikimedia.org/wikipedia/commons/f/f7/McDonald%27s_Filet-O-Fish_sandwich_%281%29.jpg",
          "price": "RM10.50",
        }
      ]
    },
    {
      "name": "Uncle Rahmat",
      "cuisine": "Indian",
      "type": "Mamak",
      "poster":
          "https://s3-ap-southeast-1.amazonaws.com/v3-live.image.oddle.me/logo/menu_logo_unclerahmat4214cf.jpg",
      "menu": [
        {
          "foodName": "Roti",
          "image":
              "https://upload.wikimedia.org/wikipedia/commons/f/f7/McDonald%27s_Filet-O-Fish_sandwich_%281%29.jpg",
          "price": "RM10.50",
        },
        {
          "foodName": "Soup",
          "image":
              "https://upload.wikimedia.org/wikipedia/commons/f/f7/McDonald%27s_Filet-O-Fish_sandwich_%281%29.jpg",
          "price": "RM10.50",
        }
      ]
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Restaurant App")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(children: [
              Expanded(
                child: TextField(
                  decoration:
                      InputDecoration(hintText: "Enter Restaurant Name"),
                ),
              ),
              FlatButton(
                onPressed: null,
                child: Text("Search"),
                color: Colors.blue,
              ),
            ]),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                  itemCount: itemList.length,
                  itemBuilder: (BuildContext context, int position) {
                    return Card(
                      child: ListTile(
                        title: Text(itemList[position]["name"]),
                        trailing: Icon(Icons.chevron_right),
                        leading: Image.network(itemList[position]["poster"],),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DetailPage(item: itemList[position])));
                        },
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
