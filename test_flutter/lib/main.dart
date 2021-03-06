import 'package:flutter/material.dart';
import 'package:test_flutter/WOW/AnimatedIconWidget.dart';
import 'package:test_flutter/WOW/AnimatedListWidget.dart';
import 'package:test_flutter/WOW/DismissibleWidget.dart';
import 'package:test_flutter/dio/request.dart';
import 'package:test_flutter/listview/views/refresh_list_view_demo.dart';
import 'package:test_flutter/login/Home.dart';
import 'package:test_flutter/login/constantParam.dart';
import 'package:test_flutter/login/login.dart';
import 'package:test_flutter/ui/FrameLayout.dart';
import 'package:test_flutter/ui/LinearLayout.dart';
import 'package:test_flutter/ui/activity/CActivity.dart';
import 'package:test_flutter/viewpager/view_pager_demo.dart';

import 'animation/animated_container_app.dart';
import 'animation/animated_list/animated_list_sample.dart';
import 'animation/explicit_animation/explicit_animation_page.dart';
import 'animation/fade_in_and_out_box.dart';
import 'animation/hero/hero_animation.dart';
import 'animation/hero/hero_animation_page2.dart';
import 'animation/hero/radial/radial_hero_animation.dart';
import 'customPaintView/draggable_widget_page.dart';
import 'methodChannel/method_channel_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: defaultTheme,
        home: MyHomePage(title: 'Flutter Demo Home Page'),
        debugShowCheckedModeBanner: false,
        routes: <String, WidgetBuilder>{
          '/refreshList': (BuildContext context) => new RefreshListViewDemo(),
          //list列表页
          '/viewPager': (BuildContext context) => new ViewPagerDemo(),
          //viewpager
          '/request': (BuildContext context) => new RequestRoute(),
          //Draggable
          '/draggable': (BuildContext context) => new DraggableWidgetPage(),
          //animation
          '/animation': (BuildContext context) => new AnimatedContainerApp(),
          //fadeInAndOutAnimation
          '/fadeInAndOutAnim': (BuildContext context) => new FadeInAndOutBoxPage(),
          //explicitAnimation 显式动画，更多的实现自己的效果
          '/explicitAnimation': (BuildContext context) => new ExplicitAnimationPage(),
          //AnimatedList
          '/animatedList': (BuildContext context) => new AnimatedListSample(),
          //HeroAnimation
          '/heroAnimation': (BuildContext context) => new HeroAnimation(),
          //HeroAnimationPage2
          '/heroAnimationPage2': (BuildContext context) => new HeroAnimationPage(),
          //RadialHeroAnimation
          '/radialHeroAnimation': (BuildContext context) => new RadialExpansionDemo(),
          //Native方法
          '/methodChannelPage': (BuildContext context) => new MethodChannelPage(),
          //仿写Activity
          '/CAvtivity': (BuildContext context) => new CActivity(),
          //仿写LinearLayout
          '/LinearLayout': (BuildContext context) => new LinearLayoutWidget(),
          //仿写FrameLayout
          '/FrameLayout': (BuildContext context) => new FrameLayout(),
          //Login
          '/Login': (BuildContext context) => new Login(),
          //Home
          '/Home': (BuildContext context) => new Home(),
          //DismissibleWidget
          '/DismissibleWidget': (BuildContext context) => new DismissibleWidget(),
          //AnimatedListWidget
          '/AnimatedListWidget': (BuildContext context) => new AnimatedListWidget(),
          '/AnimatedIconWidget': (BuildContext context) => new AnimatedIconWidget(),
        });
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  Map<String, String> routMap = {
    '/refreshList': '列表页',
    '/viewPager': 'Viewpager',
    '/request': 'Request',
    '/draggable': 'Draggable',
    '/animation': 'Animation',
    '/fadeInAndOutAnim': 'FadeInAndOut',
    '/explicitAnimation': 'ExplicitAnimation',
    '/animatedList': 'AnimatedList',
    '/heroAnimation': 'HeroAnimation',
    '/radialHeroAnimation': 'RadialHeroAnimation',
    '/methodChannelPage': 'MethodChannel',
    '/CAvtivity': 'CActivity',
    '/LinearLayout': 'LinearLayout',
    '/FrameLayout': 'FrameLayout',
    '/Login': 'Login',
    '/DismissibleWidget': 'DismissibleWidget',
    '/AnimatedListWidget': 'AnimatedListWidget',
    '/AnimatedIconWidget': 'AnimatedIconWidget'
  };

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  _toNewNamedPage(routeName) {
    Navigator.pushNamed(context, routeName);
  }

  List<Widget> widgetItems = [];

  _generateWidgetItems() {
    routMap.forEach((key, value) => {widgetItems.add(_buildItem(key, value))});
  }

  Widget _buildItem(String routeName, String pageName) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
      ),
      child: RaisedButton(
        onPressed: () {
          _toNewNamedPage(routeName);
        },
        child: Text(pageName),
      ),
    );
  }

  Widget _itemBuilder(int index) {
    return widgetItems[index];
  }

  @override
  void initState() {
    super.initState();
    _generateWidgetItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title + 'times:$_counter'),
      ),
      body: GridView.builder(
          itemCount: widgetItems.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 2,
          ),
          itemBuilder: (BuildContext context, int index) => _itemBuilder(index)),
      floatingActionButton: new Theme(
        data: ThemeData(
          accentColor: Colors.red,
        ),
        child: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
