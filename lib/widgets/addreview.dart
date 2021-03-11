import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:restaurant_app/models/reviewClassPost.dart';
import 'reviewList.dart';

class AddReviewPage extends StatefulWidget {
  @override
  _AddReviewPageState createState() => _AddReviewPageState();
}

class _AddReviewPageState extends State<AddReviewPage> {
  var commentController = TextEditingController();
  var starsController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add a Review"),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text("Please give our app your honest feedback!"),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                    controller: commentController,
                  decoration:
                  InputDecoration(
                      hintText: "Enter Review",
                      border: OutlineInputBorder())
                ),
              ),
              Text("How many stars would you give us out of 5?"),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: starsController,
                    decoration:
                    InputDecoration(
                        hintText: "How many stars?",
                        border: OutlineInputBorder())
                ),
              ),
              FlatButton(
                  color:Colors.blue,
                  onPressed: (){
                    createReview(
                        commentController.text,
                        starsController.text).then((value) => {
                      if(value != null){
                        print("successfully added"),
                      }

                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ReviewListPage()));
                  }, child: Text("Add Review"))
            ],
          ),
        ),
      ),
    );
  }
  Future<Review> createReview(String comments, String stars) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.get("token");
    final response = await http.post(
      'https://api.sheety.co/4c6bb17d336393ff30fe266e46159b5e/reviewFoodApp/sheet1',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer '+token
      },
      body: jsonEncode(<String, dynamic>{
        'sheet1': {
          'comments': comments,
          'stars': stars
        }
      }),
    );
    if (response.statusCode == 200) {
      return Review.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Hotel');
    }
  }
}
