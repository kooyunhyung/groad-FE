import 'package:flutter/material.dart';
import 'package:gload_app/models/popular_room.dart';

class RoomItem extends StatelessWidget {
  final PopularRoom popularRoom;

  const RoomItem({Key? key,required this.popularRoom}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  popularRoom.imageUrl,
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.only(left: 114.0, top: 10.0),
                child: Image.asset(
                  'assets/heart.png',
                  color: Colors.orange,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20.0, top: 5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${popularRoom.roomName}',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[700]),
                ),
                Text(
                  '${popularRoom.priceInfo}',
                  style:
                  TextStyle(fontSize: 15.0, color: Colors.grey),
                ),
                Text(
                  '${popularRoom.distance}''km',
                  style:
                  TextStyle(fontSize: 15.0, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
