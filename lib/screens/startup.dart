import 'package:flutter/material.dart';
import 'package:flutter_yoga_app/screens/BreakTimeScreen.dart';

class CustomSliverAppbar extends StatefulWidget {
  const CustomSliverAppbar({Key? key}) : super(key: key);

  @override
  State<CustomSliverAppbar> createState() => _CustomSliverAppbarState();
}

class _CustomSliverAppbarState extends State<CustomSliverAppbar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const BreakTimeScreen()),
          );
        },
        child: const Text("START"),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.teal,
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              centerTitle: true,
              title: const Text(
                "Yoga For Beginners",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              background: Image.asset(
                "assets/yoga1.jpeg",
                fit: BoxFit.cover,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.thumb_up),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const Text(
                    "16 Minutes || 26 Workouts",
                    style: TextStyle(fontWeight: FontWeight.w400),
                  ),
                  const Divider(
                    thickness: 2,
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => ListTile(
                      leading: Container(
                        margin: const EdgeInsets.only(right: 3),
                        child: Image.asset(
                          "assets/yoga3.jpeg",
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(
                        "Yoga Name $index",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text((index % 2 == 0) ? "00:20" : "x20"),
                    ),
                    separatorBuilder: (context, index) => const Divider(
                      thickness: 1,
                    ),
                    itemCount: 3,
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
