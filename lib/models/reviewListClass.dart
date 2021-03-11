class ReviewFetch {
  final int id;
  final String comments;
  final int stars;

  ReviewFetch({this.id, this.comments, this.stars});

  factory ReviewFetch.fromJson(Map<String,dynamic> json){
    return ReviewFetch(
      comments: json["comments"],
      stars: json["stars"],
    );
  }
  static List<ReviewFetch> reviewFromJson(dynamic json){
    var searchResult = json["sheet1"];
    if(searchResult != null){
      var results = new List<ReviewFetch>();
      searchResult.forEach((v){
        results.add(ReviewFetch.fromJson(v));
      });
      return results;
    }
    return List<ReviewFetch>();
  }

}