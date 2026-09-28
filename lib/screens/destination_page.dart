import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/app_theme.dart';

import '../destinationModels.dart';
import 'detail_destination.dart';

class DestinationPage extends StatelessWidget {
  const DestinationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Travel Destination',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppTheme.primary,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.only(top: 8, bottom: 8),
        itemCount: destinationList.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailDestination(placeIndex: index),
                  ),
                );
              },
              borderRadius: BorderRadius.circular(12),
              child: ListTile(
                title: Text(
                  destinationList[index].name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(destinationList[index].category),
                    Text(destinationList[index].location),
                  ],
                ),
                leading: LeadingImage(
                  imageUrl: destinationList[index].imageUrl,
                ),
                trailing: Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black54,
                    size: 16,
                  ),
                ),
                isThreeLine: true,
              ),
            ),
          );
        },
      ),
    );
  }
}

class LeadingImage extends StatefulWidget {
  final String imageUrl;
  const LeadingImage({super.key, required this.imageUrl});

  @override
  State<LeadingImage> createState() => _LeadingImageState();
}

class _LeadingImageState extends State<LeadingImage> {
  bool _hasError = false;

  @override
  Widget build(BuildContext context) {
    final imageWidget = ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        widget.imageUrl,
        width: 50,
        height: 50,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted && !_hasError) {
              setState(() => _hasError = true);
            }
          });

          return Container(
            width: 50,
            height: 50,
            color: AppTheme.grey,
            child: const Icon(
              Icons.image_not_supported,
              size: 30,
              color: Colors.white,
            ),
          );
        },
        frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
          if (wasSynchronouslyLoaded || frame != null) {
            if (_hasError) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (mounted) setState(() => _hasError = false);
              });
            }
          }
          return child;
        },
      ),
    );

    return _hasError
        ? Tooltip(message: 'Unable to load the image', child: imageWidget)
        : imageWidget;
  }
}
