import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'models.dart';

class PostCard extends StatelessWidget {
  final Posts post;

  PostCard({required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey,
      ),
      child: Stack(
        children: [
          // Network image with fallback handling
      post.files != null && post.files!.isNotEmpty && post.files![0].imagePath != null && post.files![0].imagePath!.isNotEmpty
      ? Image.network(
      post.files![0].imagePath!,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
        errorBuilder: (context, error, stackTrace) {
          debugPrint('Failed to load image from URL: ${post.files![0].imagePath}');
          debugPrint('Error: $error');
          return Image.asset(
            'assets/Miles App-09 1.png', // Local fallback image
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          );
        },
      )
          : Image.asset(
      'assets/Call 1.png', // Local fallback image if no URL is provided
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
    ),


    // Title and description at the bottom
          Positioned(
            bottom: 8,
            left: 8,
            right: 8,
            child: Container(
              color: Colors.black54,
              padding: EdgeInsets.all(4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    post.title ?? 'Untitled',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Text(
                    post.description ?? 'No Description',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
