import 'dart:ui';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}


class _ProfilePageState extends State<ProfilePage>
    with TickerProviderStateMixin {
  List images = [
    "lib\\Images\\masked.jpg",
    "lib\\Images\\masked.jpg",
    "lib\\Images\\masked.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A1E21),
        title: Image.asset('lib\\Images\\Typeface.png', height: 100),
        actions: const [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Icon(Icons.more_vert),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Icon(Icons.notifications),
          ),
        ],
      ),
      // backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xffffffff),
          gradient: LinearGradient(
            begin: Alignment(1.394, 1.16),
            end: Alignment(-0.773, -0.835),
            colors: <Color>[Color(0xff4c5baa), Color(0xff000000)],
            stops: <double>[0, 0.825],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Container(
            //   color: Colors.amber,
            //   padding: const EdgeInsets.only(
            //     left: 20,
            //     top: 70,
            //   ),
            //   child: Row(
            //     children: const [
            //       // const Icon(Icons.menu, size: 30, color: Colors.white),
            //       // Expanded(child: Container()),
            //       // Container(
            //       //   width: 30,
            //       //   height: 30,
            //       //   decoration: BoxDecoration(
            //       //     borderRadius: BorderRadius.circular(8),
            //       //     color: Colors.grey[500],
            //       //   ),
            //       // ),
            //       SizedBox(
            //         width: 20,
            //       )
            //     ],
            //   ),
            // ),
            // const SizedBox(
            //   height: 30,
            // ),
            Container(
              // color: Colors.amber,
              width: double.infinity,
              height: 300,
              child: Padding(
                padding: const EdgeInsets.only(top: 80.0),
                child: SingleChildScrollView(
                  child: Column(mainAxisSize: MainAxisSize.max, children: [
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: Material(
                        shadowColor: Colors.cyan,
                        elevation: 200,
                        borderRadius: BorderRadius.circular(300),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Image.asset(
                          'lib\\Images\\masked.jpg',
                          fit: BoxFit.fill,
                        ),
                        
                      ),
                    ),
                    SizedBox(
                      height: 150,
                      width: 400,
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: const TextSpan(
                          style: TextStyle(
                            //   fontSize: 30,
                            color: Colors.white70,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: "\nUNNAMED\n\n",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            TextSpan(
                              text: "UNNAMED ID\n",
                              style: TextStyle(
                                fontSize: 25,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              child: Align(
                alignment: Alignment.center,
                child: TabBar(
                  controller: _tabController,
                  isScrollable: true,
                  labelColor: Colors.green,
                  labelPadding: const EdgeInsets.only(left: 30, right: 30),
                  indicator: CircleTabIndicator(color: Colors.cyan, radius: 4),
                  unselectedLabelColor: Colors.grey,
                  tabs: const [
                    Tab(text: 'Profile'),
                    Tab(text: 'Registered Competetions'),
                    Tab(text: 'Registered Workshops')
                  ],
                ),
              ),
            ),
            Container(
              // color: Colors.red,
              width: double.maxFinite,
              height: 300,
              child: TabBarView(
                controller: _tabController,
                children: const [
                  Center(
                      child: Text('No registererd Profile',
                          style: TextStyle(fontSize: 30, color: Colors.white))),                
                  Center(
                      child: Text('No registererd Competetions',
                          style: TextStyle(fontSize: 30, color: Colors.white))),
                  Center(
                      child: Text('No Registered workshops',
                          style: TextStyle(fontSize: 30, color: Colors.white))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;

  CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final double radius;
  late Color color;
  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    late Paint _paint;
    _paint = Paint()..color = color;
    _paint = _paint..isAntiAlias = true;
    final Offset circleOffset =
        offset + Offset(cfg.size!.width / 2, cfg.size!.height - radius);
    canvas.drawCircle(circleOffset, radius, _paint);
  }
}
