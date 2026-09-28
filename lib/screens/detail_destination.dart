import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/app_theme.dart';

import '../destinationModels.dart';

class DetailDestination extends StatefulWidget {
  final int placeIndex;
  const DetailDestination({super.key, required this.placeIndex});

  @override
  State<DetailDestination> createState() => _DetailDestinationState();
}

// class _DetailDestinationLikeState extends State<DetailDestination> {
//   Set<int> _likedPlace = {};

//   void _toggleLike(int value) {
//     setState(() {
//       if (_likedPlace.contains(value)) {
//         _likedPlace.remove(value);
//       } else {
//         _likedPlace.add(value);
//       }
//     });
//   }
// }

class _DetailDestinationState extends State<DetailDestination> {
  Set<int> _likedPlace = {};

  // void _toggleLike(int index) {
  //   setState(() {
  //     if (_likedPlace.contains(index)) {
  //       _likedPlace.remove(index);
  //     } else {
  //       _likedPlace.add(index);
  //     }
  //   });
  //   // final _isLike = _likedPlace.contains(index);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          destinationList[widget.placeIndex].name,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Image.network(
              destinationList[widget.placeIndex].imageUrl,
              width: double.infinity,
              height: 300,

              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: double.infinity,
                  height: 300,
                  child: const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.image_not_supported,
                          size: 150,
                          color: AppTheme.secondary,
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Unable to load the image',
                          style: TextStyle(
                            fontSize: AppTheme.fontSizeBody,
                            color: AppTheme.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.favorite_border_outlined),
                  // IconButton(
                  //   icon: Icon(
                  //     _isLike ? Icons.favorite : Icons.favorite_border,
                  //     color: _isLike ? Colors.red : Colors.grey,
                  //   ),
                  //   onPressed: () => _toggleLike(index),
                  // ),
                  const SizedBox(height: 8),
                  SizedBox(height: 20),
                  Text(
                    destinationList[widget.placeIndex].category,
                    style: const TextStyle(
                      fontSize: 20,
                      color: AppTheme.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Location: ${destinationList[widget.placeIndex].location}',
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Opening Hours: ${destinationList[widget.placeIndex].openingHours}',
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Ticket: ${destinationList[widget.placeIndex].ticketInfo}',
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Destination Attraction: ${destinationList[widget.placeIndex].attraction}',
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Read on Wikipedia: ${destinationList[widget.placeIndex].wikipediaUrl}',
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Deskripsi:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    destinationList[widget.placeIndex].description,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
