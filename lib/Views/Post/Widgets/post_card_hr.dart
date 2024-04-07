import 'package:flutter/material.dart';

class PostCardHr extends StatelessWidget {
  final String imageUrl;
  final String view;
  final String time;
  final String title;
  final String author;
  final VoidCallback ontap;
  const PostCardHr(
      {super.key,
      required this.imageUrl,
      required this.view,
      required this.time,
      required this.title,
      required this.author,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.all(5),
        // height: 300,
        width: 280,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
        child: Column(children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).colorScheme.background,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                "https://smas.official.biz.id/storage/$imageUrl",
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             
              Text.rich(
                TextSpan(
                  children: [
                   
                    const WidgetSpan(
                      child: Icon(
                        Icons.visibility,
                        size: 15,
                      ),
                    ),
                    TextSpan(
                      text: " $view",
                      style: Theme.of(context).textTheme.labelSmall,

                    ),
                  ],
                ),
              ),
              Text.rich(
                TextSpan(
                  children: [
                    const WidgetSpan(
                      child: Icon(
                        Icons.calendar_month,
                        size: 15,

                      ),
                    ),
                    TextSpan(
                      text: " $time",
                      style: Theme.of(context).textTheme.labelSmall,

                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  title,
                  maxLines: 1,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const SizedBox(width: 10),
              CircleAvatar(
                radius: 15,
                backgroundColor: Theme.of(context).colorScheme.primary,
                child: Text(
                  author[0],
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Flexible(
                  child: Text(
                author,
                maxLines: 1,
              ))
            ],
          ),
          const SizedBox(height: 10),
        ]),
      ),
    );
  }
}
