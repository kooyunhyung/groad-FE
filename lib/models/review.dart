class ReviewInfo {
  final String name;
  final String place;
  final String comment;
  final String profileImg;
  final String contentImg;
  final int grade;
  final int commentCount;
  final int authCount;
  final DateTime date;

  ReviewInfo({
    this.name,
    this.place,
    this.comment,
    this.profileImg,
    this.contentImg,
    this.grade,
    this.commentCount,
    this.authCount,
    this.date,
  });
}

List<ReviewInfo> ReviewInfoList = [
  ReviewInfo(
      name: '구윤형',
      place: '소양로성당',
      comment: "너무 너무 좋았어요~~",
      profileImg: 'assets/reviewAvatar1.png',
      contentImg: 'assets/reviewImage2.jpg',
      grade: 4,
      commentCount: 11,
      authCount: 4,
      date: DateTime.now()),
  ReviewInfo(
      name: '조현웅',
      place: '소양강다리',
      comment: "환상적인 다리입니다~~",
      profileImg: 'assets/reviewAvatar2.png',
      contentImg: 'assets/reviewImage1.png',
      grade: 5,
      commentCount: 12,
      authCount: 8,
      date: DateTime.now()),
];
