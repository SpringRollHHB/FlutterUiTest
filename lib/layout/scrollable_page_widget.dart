
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutteruitest/layout/page_view_widget.dart';
import 'package:flutteruitest/layout/single_children_scrollview_page_widget.dart';
import 'package:flutteruitest/layout/template/list_page_widget.dart';

import 'grid_view_page_widget.dart';
import 'home_page_widget.dart';
import 'list_view_page_widget.dart';

class ScrollablePageWidget extends ListPageWidget {

  ScrollablePageWidget({super.key, required super.backColor, required super.itemBackColor, required super.fontColor, required super.fontSize});

  @override
  setList(BuildContext context) {
    list.add(HomeItem(title: "SingleChildScrollView", onTap: () {  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const SingleChildrenScrollViewWidget()));  }));
    list.add(HomeItem(title: "ListView", onTap: () {  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const ListViewPageWidget()));  }));
    list.add(HomeItem(title: "GridView", onTap: () {  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const GridViewPageWidget()));  }));
    list.add(HomeItem(title: "PageView", onTap: () {  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const PageViewWidget()));  }));
  }


}