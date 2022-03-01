class ViewFeedFetchModel {
  String? profilePic;
  String? name;
  String? email;
  String? feedback;
  int? inAppRating;
  String? dateAndTime;
  String? currentTime;


  ViewFeedFetchModel({this.feedback, this.name, this.email, this.profilePic, this.inAppRating, this.dateAndTime, this.currentTime});

  factory ViewFeedFetchModel.fromJson(dynamic json) {
    return ViewFeedFetchModel(
      feedback: "${json['feedback']}",
      email: "${json['email']}",
      name: "${json['name']}",
      profilePic: "${json['profile_pic']}",
      inAppRating: int.parse("${json['rating']}"),
      dateAndTime: "${json['date_and_time']}",
      currentTime: "${json['only_time']}",
    );
  }

  Map toJson() => {
        "profile_pic": profilePic,
        "email": email,
        "name": name,
        "feedback": feedback,
        "rating": inAppRating,
        "date_and_time": dateAndTime,
        "only_time": currentTime,
      };
}
