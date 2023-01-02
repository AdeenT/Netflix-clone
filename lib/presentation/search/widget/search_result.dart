import 'package:flutter/widgets.dart';
import 'package:netflix/core/colors/constants.dart';
import 'package:netflix/presentation/search/widget/search_title.dart';

const imageUrl =
    "https://www.themoviedb.org/t/p/w300_and_h450_bestv2/sv1xJUazXeYqALzczSZ3O6nkH75.jpg";

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(
          title: "Movies & TV",
        ),
        kHeight,
        Expanded(
          child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 3,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 1 / 1.4,
            children: List.generate(
              20,
              (index) {
                return const SearchCard();
              },
            ),
          ),
        ),
      ],
    );
  }
}

class SearchCard extends StatelessWidget {
  const SearchCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: const DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(7)),
    );
  }
}
