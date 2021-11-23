class PopularRoom {
  final String roomName;
  final String priceInfo;
  final int distance;
  final String imageUrl;

  PopularRoom(
      {required this.roomName,
      required this.priceInfo,
      required this.distance,
      required this.imageUrl});
}

List<PopularRoom> PopularRoomList = [
  PopularRoom(roomName: '어바웃플로우', priceInfo: '1박 30-36 만원', distance: 476, imageUrl: 'assets/aboutflow.jpg'),
  PopularRoom(roomName: '썸원 스페이지 숲', priceInfo: '1박 10-25 만원', distance: 476, imageUrl: 'assets/someone.jpeg'),
  PopularRoom(roomName: '헤이', priceInfo: '1박 5-12 만원', distance: 476, imageUrl: 'assets/heyy.jpg'),
  PopularRoom(roomName: '상상마당 스테이', priceInfo: '1박 5-9 만원대', distance: 476, imageUrl: 'assets/sangsang.jpg'),
  PopularRoom(roomName: '봄 스테이', priceInfo: '1박 4 만원대', distance: 476, imageUrl: 'assets/bom.jpg'),
];
