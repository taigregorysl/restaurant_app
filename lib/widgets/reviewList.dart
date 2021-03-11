import 'package:flutter/material.dart';
import 'package:restaurant_app/models/reviewListClass.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ReviewListPage extends StatefulWidget {
  @override
  _ReviewPageState createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewListPage> {

  ReviewFetch review;

  List<ReviewFetch> reviewList = [];

  @override
  void initState() {
    super.initState();
    fetchReview().then((value) => setState(() {
        reviewList = value;
      })
    );
  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reviews"),
      ),
      body: review == null ?
          Center(child: CircularProgressIndicator())
          :
      Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: reviewList.length,
                itemBuilder: (BuildContext context, int position) {
                  return Card(
                    child: ListTile(
                      title: Text(review.comments),
                      subtitle: Text("${review.stars}"),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }

  Future<List<ReviewFetch>> fetchReview() async {
    final response = await http.get('https://api.sheety.co/4c6bb17d336393ff30fe266e46159b5e/reviewFoodApp/sheet1');

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return ReviewFetch.reviewFromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}

//
// FlatButton(
// onPressed: (){
// fetchReview().then((value) => setState((){
// reviewList = value;
// }));
// }, child: Text("work )),