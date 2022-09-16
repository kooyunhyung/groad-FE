import 'package:flutter/material.dart';
import 'package:gload_app/models/popular_food_store.dart';

class FoodStoreItem extends StatelessWidget {
  final PopularFoodStore popularFoodStore;

  const FoodStoreItem({Key? key, required this.popularFoodStore}) : super(key: key);

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
                  popularFoodStore.imageUrl,
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
            padding: const EdgeInsets.only(right: 70.0, top: 5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${popularFoodStore.storeName}',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[700]),
                ),
                Text(
                  '${popularFoodStore.foodCase}',
                  style:
                  TextStyle(fontSize: 15.0, color: Colors.grey),
                ),
                Text(
                  '${popularFoodStore.distance}''km',
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
