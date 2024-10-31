import 'package:flutter/material.dart';
import 'package:miles_education/post_card.dart';
import 'home_Page.dart';
import 'models.dart';

class SectionWidget extends StatelessWidget {
  final Data section;

  const SectionWidget({required this.section, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (section.heading != null)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              section.heading!,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: section.posts?.length ?? 0,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            final post = section.posts![index];
            final imageUrl = post.files?.first.imagePath ?? '';
            return PostCard(post: post);
          },
        ),
      ],
    );
  }
}
