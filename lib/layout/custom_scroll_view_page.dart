import 'package:flutter/material.dart';

class CustomScrollViewPage extends StatefulWidget {
  const CustomScrollViewPage({super.key});

  @override
  State<CustomScrollViewPage> createState() => _CustomScrollViewPageState();
}

class _CustomScrollViewPageState extends State<CustomScrollViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 250,
            backgroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text("AppBar",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w700),),
              background: Image.asset(
                "images/ic_water_dolphin.webp.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 2,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(5),
                    child: Text(
                      "$index",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        height: 1.0,
                      ),
                    ),
                  );
                },
                childCount: 20,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              width: double.infinity,
              height: 200,
              child: PageView.builder(
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(25)
                    ),
                    margin: const EdgeInsets.all(20),
                    alignment: Alignment.center,
                    child: Text(
                      "$index",
                      style: const TextStyle(color: Colors.black,fontSize: 20,height: 1.0,fontWeight: FontWeight.w900,),
                    ),
                  );
                },
              ),
            ),
          ),
          SliverPersistentHeader(
            delegate: TestSliverPersistentHeaderDelegate(
              maxHeight: 100,
              minHeight: 80,
              child: const Text(
                "悬浮标题",
                style: TextStyle(color: Colors.white, fontSize: 30,fontWeight: FontWeight.w800,height: 1.0),
              )
            ),
            pinned: true,
            // floating: true,
          ),
          SliverFixedExtentList(
            itemExtent: 80,
            delegate: SliverChildBuilderDelegate(
              (ctx, index) {
                return Container(
                  width: double.infinity,
                  height: double.infinity,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.deepOrangeAccent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "$index",
                    style: const TextStyle(
                        color: Colors.black, fontSize: 10, height: 1.0),
                  ),
                );
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}


class TestSliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double maxHeight;
  final double minHeight;
  final Widget child;
  TestSliverPersistentHeaderDelegate({required this.maxHeight, required this.minHeight,required this.child});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    debugPrint("hhb shrinkOffset:$shrinkOffset");
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.black,
      alignment: Alignment.center,
      child: child,
    );
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }

}