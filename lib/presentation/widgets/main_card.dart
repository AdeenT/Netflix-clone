import 'package:flutter/material.dart';
import 'package:netflix/core/colors/constants.dart';

class MainCard extends StatelessWidget {
  const MainCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 130,
      height: 250,
      decoration: BoxDecoration(
        borderRadius: kRadius10,
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
              "https://www.themoviedb.org/t/p/w300_and_h450_bestv2/lmf0zzR7ritjOL3qumRh3hfvOFK.jpg"),
        ),
      ),
    );
  }
}