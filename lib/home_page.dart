import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const teal = Color(0xFF2BCAB0);

  List<Map<String, dynamic>> get items => List.generate(6, (i) => {
        'title': 'Help Lorem ipsum ${i + 1}',
        'subtitle':
            'Lorem ipsum dolor sit amet, adipiscing elit, sed diam nonummy nibh euismod',
      });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: Scaffold(
        backgroundColor: teal, // <<—— Body warna teal
        body: Column(
          children: [
            // ---------------- APP BAR CUSTOM ----------------
            Container(
              padding:
                  const EdgeInsets.only(top: 32, left: 12, right: 12, bottom: 12),
              decoration: const BoxDecoration(
                color: teal,
                boxShadow: [
                  BoxShadow(color: Colors.black26, blurRadius: 5),
                ],
              ),
              child: SafeArea(
                bottom: false,
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.maybePop(context),
                    ),
                    const Expanded(
                      child: Text(
                        'SEARCH FILTER',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.more_vert, color: Colors.white),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 10),

            // ---------------- CONTENT ----------------
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xFFF2F5F7), // background itu hanya di konten
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                child: TabBarView(
                  children: List.generate(3, (tab) {
                    return ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        final it = items[index];
                        return buildCard(it);
                      },
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ------------------- CARD ITEM -------------------
  Widget buildCard(Map<String, dynamic> it) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color(0x22000000),
            blurRadius: 6,
            offset: Offset(0, 3),
          )
        ],
      ),
      child: Row(
        children: [
          // ICON BOX
          Container(
            width: 65,
            height: 65,
            decoration: BoxDecoration(
              color: teal,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.photo_camera_outlined,
                color: Colors.white, size: 30),
          ),

          const SizedBox(width: 12),

          // TEXT CONTENT
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  it['title'],
                  style: const TextStyle(
                    color: teal,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  it['subtitle'],
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black54,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
