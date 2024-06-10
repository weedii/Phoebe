import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class MySliverAppBar extends StatelessWidget {
  final String title;
  final double heightt;
  final Color? bgColor;
  final String pic;
  final bool picCoverContain;
  final bool showArrowBack;
  final bool showProfileIcon;

  const MySliverAppBar(
      {super.key,
      required this.title,
      required this.heightt,
      required this.pic,
      required this.bgColor,
      required this.picCoverContain,
      required this.showArrowBack,
      required this.showProfileIcon});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: bgColor,
      expandedHeight: heightt,
      collapsedHeight: 70,
      floating: false,
      pinned: true,
      leading: showArrowBack
          ? IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          : null,
      actions: showProfileIcon
          ? [
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/profile");
                  },
                  icon: const Icon(
                    Icons.account_circle_outlined,
                    size: 30,
                    color: Colors.black,
                  ))
            ]
          : null,
      title: Text(title),
      centerTitle: true,
      flexibleSpace: FlexibleSpaceBar(
        background: CachedNetworkImage(
          imageUrl: pic,
          fit: picCoverContain ? BoxFit.cover : BoxFit.contain,
          placeholder: (context, url) => Container(
            padding: const EdgeInsets.only(top: 80),
            color: Colors.yellow[100],
            child: Center(
              child: LoadingAnimationWidget.staggeredDotsWave(
                color: Colors.yellow[800]!,
                size: 50,
              ),
            ),
          ),
          errorWidget: (context, url, error) => Container(
            padding: const EdgeInsets.all(7),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.error,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
