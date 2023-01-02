import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/colors/constants.dart';
import 'package:netflix/presentation/new_and_hot/widgets/coming_soon_widget.dart';
import 'package:netflix/presentation/new_and_hot/widgets/everyones_watching_widget.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "New & Hot",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
          actions: [
            const Icon(
              Icons.cast,
              color: Colors.white,
            ),
            kWidth,
            Container(
              width: 30,
              height: 30,
              color: Colors.blue,
            ),
            kWidth,
          ],
          bottom: TabBar(
              unselectedLabelColor: whiteColor,
              isScrollable: true,
              labelColor: backgroundColor,
              labelStyle:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              indicator:
                  BoxDecoration(color: whiteColor, borderRadius: kRadius30),
              tabs: const [
                Tab(
                  text: "🍿 Coming Soon",
                ),
                Tab(
                  text: "👀 Everyone's Watching",
                )
              ]),
        ),
        body: TabBarView(
          children: [
            _buildComingSoon(),
            _buildEveryoneWatching(),
          ],
        ),
      ),
    );
  }

  Widget _buildComingSoon() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, index) => const ComingSoonWidget(),
    );
  }

  Widget _buildEveryoneWatching() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) => const EveryonesWatchingWidget(),
    );
  }
}
