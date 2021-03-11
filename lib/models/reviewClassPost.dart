class Review {
final int id;
final String comments;
final int stars;

  Review({this.id, this.comments, this.stars});

factory Review.fromJson(Map<String,dynamic> json){
  var jsonToProcess = json;
  if(json["sheet1"]!= null){
    jsonToProcess = json["sheet1"];
  }
  return Review(
      id: jsonToProcess["id"],
      comments: jsonToProcess["comments"],
      stars: jsonToProcess["stars"],
  );
}

}