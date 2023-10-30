import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:ui_sample/bottom_sheet.dart';

import 'contact_us.dart';
import 'email_us.dart';
import 'mobile_number.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: EmailUs(),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key? key, this.title}) : super(key: key);
//
//   final String? title;
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   late ScrollController _scrollController;
//   late double opacity = 1.0;
//   GlobalKey widgetKey = GlobalKey();
//   late Offset widgetOffset;
//   late double _currentPosition;
//
//   @override
//   void initState() {
//     _scrollController = ScrollController();
//     _scrollController.addListener(_scrollListener);
//     super.initState();
//   }
//
//   _scrollListener() {
//     print('scrolling');
//
//     RenderBox? textFieldRenderBox = widgetKey.currentContext!.findRenderObject() as RenderBox?;
//     widgetOffset = textFieldRenderBox!.localToGlobal(Offset.zero);
//     _currentPosition = widgetOffset.dy;
//
//     print("widget position: $_currentPosition against: 100");
//
//     if (100 > _currentPosition && _currentPosition > 1) {
//       setState(() {
//         opacity = _currentPosition / 100;
//       });
//     }
//     else if (_currentPosition > 100 && opacity != 1) {
//       opacity = 1;
//     }
//     else if (_currentPosition < 0 && opacity != 0) {
//       opacity = 0;
//     }
//     print("opacity is: $opacity");
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         controller: _scrollController,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Container(
//               margin: EdgeInsets.only(bottom: 50),
//               height: 100,
//               width: 100,
//               color: Colors.red,
//             ),
//             Container(
//               margin: EdgeInsets.only(bottom: 50),
//               height: 100,
//               width: 100,
//               color: Colors.red,
//             ),
//             AnimatedOpacity(
//               key: widgetKey,
//               duration: Duration(milliseconds: 1),
//               opacity: opacity,
//               child: Text(
//                 "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
//                 style: TextStyle(fontSize: 16),
//               ),
//             ),
//             Container(
//               margin: EdgeInsets.only(bottom: 50),
//               height: 100,
//               width: 100,
//               color: Colors.red,
//             ),
//             Container(
//               margin: EdgeInsets.only(bottom: 50),
//               height: 100,
//               width: 100,
//               color: Colors.red,
//             ),
//             Container(
//               margin: EdgeInsets.only(bottom: 50),
//               height: 100,
//               width: 100,
//               color: Colors.red,
//             ),
//             Container(
//               margin: EdgeInsets.only(bottom: 50),
//               height: 100,
//               width: 100,
//               color: Colors.teal,
//             ),
//             Container(
//               margin: EdgeInsets.only(bottom: 50),
//               height: 100,
//               width: 100,
//               color: Colors.teal,
//             ),
//             Container(
//               margin: EdgeInsets.only(bottom: 50),
//               height: 100,
//               width: 100,
//               color: Colors.teal,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

///

//import 'package:flutter/material.dart';
///
// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key? key, this.title}) : super(key: key);
//
//   final String? title;
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   late ScrollController _scrollController;
//   List<MyParagraph> paragraphs = [];
//
//   @override
//   void initState() {
//     _scrollController = ScrollController();
//     _scrollController.addListener(_scrollListener);
//
//     paragraphs = [
//       MyParagraph(
//         text:
//         "This is a long paragraph. It continues on multiple lines, and we want to change the opacity of all lines when any part of it touches the top of the screen while scrolling.",
//       ),
//       MyParagraph(
//         text:
//         "Another paragraph here. It can have different content, but we will apply the same behavior to all its lines when it touches the top of the screen.",
//       ),
//       // Add more paragraphs as needed...
//     ];
//
//     super.initState();
//   }
//
//   _scrollListener() {
//     double scrollPosition = _scrollController.position.pixels;
//
//     for (MyParagraph paragraph in paragraphs) {
//       double itemPosition = paragraph.getContext()!.localToGlobal(Offset.zero).dy;
//
//       if (scrollPosition > itemPosition) {
//         paragraph.setOpacity(1.0);
//       } else {
//         paragraph.setOpacity(0.5); // Change opacity as needed
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         controller: _scrollController,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: paragraphs,
//         ),
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     _scrollController.removeListener(_scrollListener);
//     super.dispose();
//   }
// }
//
// class MyParagraph extends StatefulWidget {
//   final String text;
//   late GlobalKey key;
//   double opacity = 1.0;
//
//   MyParagraph({required this.text, required this.key}) : super(key: key);
//
//   @override
//   _MyParagraphState createState() => _MyParagraphState();
//
//   RenderObject? getContext() {
//     return key.currentContext!.findRenderObject();
//   }
//
//   void setOpacity(double value) {
//     setState(() {
//       opacity = value;
//     });
//   }
// }
//
// class _MyParagraphState extends State<MyParagraph> {
//   @override
//   Widget build(BuildContext context) {
//     return Opacity(
//       opacity: widget.opacity,
//       child: Container(
//         margin: EdgeInsets.only(bottom: 20), // Adjust margin as needed
//         child: Text(
//           widget.text,
//           style: TextStyle(
//             fontSize: 16,
//           ),
//         ),
//       ),
//     );
//   }
// }


///


// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   late ScrollController _scrollController;
//   List<MyParagraph> paragraphs = [];
//
//   @override
//   void initState() {
//     super.initState();
//     _scrollController = ScrollController();
//     _scrollController.addListener(_scrollListener);
//
//     paragraphs = [
//       MyParagraph(
//         key: UniqueKey(), // Use UniqueKey for each paragraph to prevent initialization issues
//         text:
//         "This is a long paragraph. It continues on multiple lines, and we want to change the opacity of all lines when any part of it touches the top of the screen while scrolling.",
//       ),
//       MyParagraph(
//         key: UniqueKey(),
//         text:
//         "Another paragraph here. It can have different content, but we will apply the same behavior to all its lines when it touches the top of the screen.",
//       ),
//       // Add more paragraphs as needed...
//     ];
//   }
//
//   _scrollListener() {
//     double scrollPosition = _scrollController.position.pixels;
//
//     for (MyParagraph paragraph in paragraphs) {
//       RenderBox? renderBox = paragraph.context!.findRenderObject() as RenderBox?;
//
//       if (renderBox != null) {
//         double itemPosition = renderBox.localToGlobal(Offset.zero).dy;
//
//         if (scrollPosition > itemPosition) {
//           paragraph.updateOpacity(1.0);
//         } else {
//           paragraph.updateOpacity(0.5); // Change opacity as needed
//         }
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         controller: _scrollController,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: paragraphs,
//         ),
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     _scrollController.removeListener(_scrollListener);
//     super.dispose();
//   }
// }
//
// class MyParagraph extends StatefulWidget {
//   final String text;
//
//   MyParagraph({Key? key, required this.text}) : super(key: key);
//
//   @override
//   MyParagraphState createState() => MyParagraphState();
// }
//
// class MyParagraphState extends State<MyParagraph> {
//   double opacity = 1.0;
//
//   void updateOpacity(double newOpacity) {
//     setState(() {
//       opacity = newOpacity;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Opacity(
//       opacity: opacity,
//       child: Container(
//         margin: EdgeInsets.all(10), // Adjust margin as needed
//         child: Text(
//           widget.text,
//           style: TextStyle(
//             fontSize: 16,
//           ),
//         ),
//       ),
//     );
//   }
// }










// import 'package:example/lipsum.dart';
// import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
// import 'package:flutter/material.dart';
//
// const lipsumText = """Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse quis neque sed nunc condimentum dignissim. Fusce ultrices lacinia orci, ac pharetra ante. Mauris sit amet rutrum lorem, vitae posuere ante. Donec dignissim pharetra volutpat. Praesent sed laoreet sem. Nunc eu congue mi. Proin porttitor nibh elit, id ultricies sem ultrices non. Aliquam sit amet lorem erat.
//
// Ut eget urna sed metus ultricies fringilla. Suspendisse in ex nunc. Aenean vitae augue mauris. Nunc fringilla ligula non sem auctor, vitae venenatis elit imperdiet. Aenean at libero et velit semper cursus. Phasellus sed sem nec leo efficitur dictum. Nam id consequat eros. Pellentesque pretium facilisis nisl, luctus lobortis leo convallis in. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.
//
// Aliquam erat volutpat. Quisque arcu leo, ultrices et enim lacinia, gravida euismod elit. Nam metus mauris, consequat a nibh id, blandit molestie arcu. Nullam iaculis cursus hendrerit. Ut at lacinia mauris. Mauris porttitor ligula at massa vestibulum, non posuere metus ornare. Nullam placerat, lorem quis tempor sodales, tellus massa volutpat lectus, eu tristique tellus ligula sit amet est. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed eu dolor ac ante fermentum consectetur. Etiam laoreet tortor dictum lectus tincidunt pharetra. Fusce sodales fringilla purus, quis viverra quam placerat quis.
//
// Suspendisse finibus iaculis quam at suscipit. Cras id sodales dolor. Phasellus bibendum vitae est sit amet consectetur. Mauris iaculis consequat purus, eu tempus lectus posuere nec. Vestibulum dictum eros id justo bibendum ullamcorper. Fusce accumsan odio tincidunt, volutpat urna at, malesuada nisi. Aliquam ac metus gravida, egestas risus et, posuere odio. Sed eu libero dolor. Aenean a feugiat magna. Morbi a odio sed massa fringilla tempor. Morbi nec risus pellentesque turpis semper ornare. Nunc ac varius nisl, ac varius elit. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aliquam fringilla turpis mauris, vel finibus sapien varius quis. Cras ac elit quis nisi molestie gravida eget sit amet tellus.
//
// Donec ullamcorper posuere lorem eget sollicitudin. Sed molestie felis turpis, id molestie nisl ullamcorper a. Donec sodales orci in ipsum maximus sagittis. Donec vel ultrices justo. Nulla pretium mauris odio, vel malesuada metus dictum eget. Vivamus fringilla iaculis tristique. Nulla at enim finibus, sollicitudin mi eu, malesuada odio. Aenean euismod arcu ac nibh varius, et vulputate neque varius. Donec consequat rhoncus libero sit amet sodales. Mauris eget ante in metus vestibulum congue eget nec nisi. Nulla erat velit, porttitor sit amet quam ac, placerat scelerisque enim.
//
// Nam pretium augue nec semper ullamcorper. Ut porttitor leo ligula, ut interdum tortor varius ut. In et massa ac nibh facilisis faucibus sed at enim. Integer varius vestibulum nisi id eleifend. Praesent euismod finibus placerat. Mauris vehicula nibh eu libero ultricies pharetra. Maecenas hendrerit pellentesque elit, non tincidunt diam lacinia eu. Duis eu ex nulla. Phasellus eu lacus malesuada, ultricies leo eu, tristique dolor. Nam nec placerat dui, quis hendrerit neque. Ut tempus nec mi quis venenatis. Nunc id tellus velit. Donec at venenatis lorem, eget pulvinar lorem. Aenean vulputate volutpat dapibus. Pellentesque sed mauris vehicula, laoreet turpis non, pharetra est.
//
// Integer pulvinar tellus non diam iaculis tempor. Suspendisse lobortis, tortor at efficitur maximus, enim odio sodales lacus, at ultrices dolor nibh eu nisl. Aenean eu eros non turpis rutrum pellentesque. Donec ac velit semper, rhoncus sapien vitae, pharetra turpis. Praesent eu nulla nec sem tincidunt posuere at pharetra felis. Quisque et vulputate neque, commodo sollicitudin libero. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam lobortis non odio id fringilla. Duis ac sagittis ex, ac pharetra massa. Suspendisse placerat id massa at vulputate.
//
// Proin consectetur tortor id magna malesuada venenatis. Curabitur congue dolor id justo consequat tempor. Donec iaculis magna non eleifend tincidunt. Morbi malesuada lectus magna. In tristique dui eget urna ornare, at tempus ante ornare. Nulla facilisi. Etiam luctus suscipit massa, vel posuere tellus posuere vitae. Suspendisse faucibus, est nec accumsan sodales, felis risus viverra urna, eu suscipit ante dolor ac neque. Cras mollis metus vitae ipsum ultrices, id volutpat ante scelerisque. Nunc vestibulum lectus a sem fermentum rhoncus. Morbi fermentum, purus vitae mollis luctus, velit sapien congue urna, at ornare leo metus ut elit. Suspendisse imperdiet suscipit auctor. Nulla aliquet ligula non viverra convallis. Ut non fringilla enim.
//
// Fusce lacinia nisl eget enim molestie, vitae sollicitudin ex aliquam. Ut eu turpis vitae arcu dapibus interdum vitae sit amet velit. Quisque et erat varius, facilisis ante id, congue sem. Etiam tincidunt neque nec lacus scelerisque suscipit. Curabitur ut eros a nulla posuere rhoncus sed quis diam. Ut vulputate non diam sit amet accumsan. Nunc eu ante eu purus pulvinar eleifend. Aenean et aliquam turpis, tempus auctor metus. Duis sed nisl consequat, efficitur velit nec, pharetra enim. Donec lacus risus, hendrerit eget faucibus eu, blandit non magna. Integer malesuada sit amet ipsum sit amet pretium. Pellentesque vitae augue vel magna rhoncus interdum sit amet at est. Etiam rutrum ante nec eleifend imperdiet. Maecenas cursus sem libero, eget egestas dui sollicitudin at.
//
// Suspendisse potenti. Nullam rhoncus porttitor neque id ullamcorper. Curabitur sit amet suscipit ligula, nec porttitor quam. Nulla tellus justo, imperdiet sit amet laoreet non, accumsan quis erat. Cras viverra commodo tincidunt. Nulla elementum ultrices nisi, quis vestibulum libero viverra imperdiet. Nam finibus lectus arcu, eu semper libero pulvinar id. Donec eu tortor id libero feugiat egestas. Fusce maximus turpis et sem luctus blandit. Phasellus suscipit tempus orci, nec placerat nulla consectetur sit amet. Pellentesque et tristique leo. Mauris et dui purus. Mauris malesuada venenatis lorem non gravida. Mauris vel nisi et ipsum semper sollicitudin.
// """;
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Fading Edge ScrollView Example',
//       theme: ThemeData(
//         primarySwatch: Colors.deepOrange,
//       ),
//       home: ExamplesList(),
//     );
//   }
// }
//
// class ExamplesList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('FadingEdgeScrollView examples'),
//       ),
//       body: ListView(
//         children: <Widget>[
//           NavigatorButton(
//             text: 'ListView',
//             builder: (_) => ListViewScreen(),
//           ),
//           NavigatorButton(
//             text: 'PageView (LTR)',
//             builder: (_) => PageViewScreen(textDirection: TextDirection.ltr),
//           ),
//           NavigatorButton(
//             text: 'PageView (RTL)',
//             builder: (_) => PageViewScreen(textDirection: TextDirection.rtl),
//           ),
//           NavigatorButton(
//             text: 'Long text',
//             builder: (_) => LongTextScreen(),
//           ),
//           NavigatorButton(
//             text: 'Cities images',
//             builder: (_) => CitiesListView(),
//           ),
//           NavigatorButton(
//             text: "ListWheelScrollView",
//             builder: (_) => ListWheelScrollViewScreen(),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class NavigatorButton extends StatelessWidget {
//   final String text;
//   final WidgetBuilder builder;
//
//   NavigatorButton({
//     required this.text,
//     required this.builder,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       title: Text(text),
//       onTap: () {
//         Navigator.of(context).push(MaterialPageRoute(builder: builder));
//       },
//     );
//   }
// }
//
// class ListViewScreen extends StatelessWidget {
//   final _controller = ScrollController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Example with ListView'),
//       ),
//       body: Container(
//         color: Colors.greenAccent,
//         child: FadingEdgeScrollView.fromScrollView(
//           child: ListView.builder(
//             controller: _controller,
//             itemBuilder: (context, index) => ListTile(
//                 title: Text('Item #$index'),
//                 leading: CircleAvatar(
//                   backgroundImage: NetworkImage(
//                       'https://images.freeimages.com/images/large-previews/848/a-cat-1313470.jpg'),
//                 )),
//             itemCount: 30,
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class PageViewScreen extends StatelessWidget {
//   final TextDirection textDirection;
//
//   const PageViewScreen({
//     required this.textDirection,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Example with PageView'),
//       ),
//       body: Directionality(
//         textDirection: textDirection,
//         child: Padding(
//           padding: const EdgeInsets.all(12.0),
//           child: FadingEdgeScrollView.fromPageView(
//             child: PageView(
//               children: <Widget>[
//                 Card(color: Colors.red),
//                 Card(color: Colors.green),
//                 Card(color: Colors.blue),
//               ],
//             ),
//             gradientFractionOnStart: 0.1,
//             gradientFractionOnEnd: 0.1,
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class LongTextScreen extends StatelessWidget {
//   final controller = ScrollController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Example with long text'),
//       ),
//       body: FadingEdgeScrollView.fromSingleChildScrollView(
//         gradientFractionOnStart: 0.5,
//         child: SingleChildScrollView(
//           controller: controller,
//           child: Padding(padding: EdgeInsets.all(5), child: Text(lipsumText)),
//         ),
//       ),
//     );
//   }
// }
//
// class CitiesListView extends StatelessWidget {
//   final _scrollController = ScrollController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Example with cities images'),
//       ),
//       body: Stack(
//         children: <Widget>[
//           Image.asset(
//             'assets/world.jpeg',
//             fit: BoxFit.fitHeight,
//             height: MediaQuery.of(context).size.height,
//           ),
//           Center(
//             child: Container(
//               height: 400,
//               child: FadingEdgeScrollView.fromScrollView(
//                 child: ListView(
//                   controller: _scrollController,
//                   children: [
//                     'paris',
//                     'rome',
//                     'moscow',
//                     'tokyo',
//                   ]
//                       .map((city) => Padding(
//                     padding: EdgeInsets.all(12),
//                     child: ClipRRect(
//                       borderRadius: new BorderRadius.circular(20.0),
//                       child: Image.asset('assets/$city.jpeg'),
//                     ),
//                   ))
//                       .toList(),
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
//
// class ListWheelScrollViewScreen extends StatelessWidget {
//   final _controller = ScrollController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Example with ListWheelScrollView"),
//       ),
//       body: Container(
//         color: Colors.greenAccent,
//         child: FadingEdgeScrollView.fromListWheelScrollView(
//           gradientFractionOnStart: 0.3,
//           gradientFractionOnEnd: 0.3,
//           child: ListWheelScrollView(
//             itemExtent: 60,
//             perspective: 0.0001,
//             controller: _controller,
//             children: lipsumText.split(" ").sublist(0, 20).map((e) {
//               return ListTile(
//                   title: Text("Item #$e"),
//                   leading: CircleAvatar(
//                     backgroundImage: NetworkImage(
//                         "https://images.freeimages.com/images/large-previews/848/a-cat-1313470.jpg"),
//                   ));
//             }).toList(),
//           ),
//         ),
//       ),
//     );
//   }
// }