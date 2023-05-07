import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({required this.title, super.key});

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      padding: EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(color: Colors.blueGrey),
      child: Row(
        children: [
          const IconButton(
            icon: Icon(Icons.menu),
            tooltip: 'Navigation menu',
            onPressed: null,
          ),
          Expanded(child: title),
          Expanded(
            child: Text('Title-2',
                style: Theme.of(context).primaryTextTheme.titleLarge),
          ),
          Expanded(
              child: IconButton(
            icon: Icon(Icons.accessibility),
            onPressed: null,
            tooltip: 'Checking',
          )),
          const IconButton(
              onPressed: null, icon: Icon(Icons.account_circle_sharp)),
          const IconButton(
            onPressed: null,
            icon: Icon(Icons.search),
            tooltip: 'Search',
          ),
        ],
      ),
    );
  }
}

class MyAppFooter extends StatelessWidget {
  const MyAppFooter({required this.title, super.key});

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: const [
          IconButton(
            icon: Icon(Icons.arrow_back_ios_new_outlined),
            tooltip: 'previous',
            onPressed: null,
          ),
          IconButton(
            onPressed: null,
            icon: Icon(Icons.arrow_forward_ios_sharp),
            tooltip: 'next',
          ),
        ],
      ),
    );
  }
}

class CounterDisplay extends StatelessWidget {
  const CounterDisplay({required this.count, super.key});

  final int count;

  @override
  Widget build(BuildContext context) {
    return Text('Count: $count');
  }
}

class MyButton extends StatelessWidget {
  const MyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // ignore: avoid_print
        print('MyButton was tapped!!');
      },
      child: Container(
          height: 50.6,
          padding: const EdgeInsets.all(8.0),
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: Colors.green.shade300,
          ),
          child: const Center(
            child: Text('Engage'),
          )),
    );
  }
}

void main(List<String> args) {
  runApp(const MaterialApp(
    title: 'My first App',
    // home: SafeArea(child: MyScaffold())));
    home: TutorialHome(),
  ));
}

class Controller extends StatefulWidget {
  const Controller({super.key});
  @override
  State<Controller> createState() => _ChangeState();
}

class _ChangeState extends State<Controller> {
  int _idx = 0;
  List<String> images = [
    "https://picsum.photos/250?image=9",
    "https://images.unsplash.com/photo-1532012197267-da84d127e765?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80",
    "https://images.unsplash.com/photo-1543002588-bfa74002ed7e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
  ];

  void _nextImage() {
    setState(() {
      int temp = _idx;
      // print('temp $temp');
      if (++temp >= images.length) {
        _idx = (0 + _idx - images.length + 1);
      } else {
        ++_idx;
      }
    });
  }

  void _previousImage() {
    setState(() {
      int temp = _idx;
      if (--temp < 0) {
        _idx = images.length - _idx - 1;
      } else {
        --_idx;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // print('idx: ${images[_idx]}');
    return Column(
      children: [
        Image.network(
          images[_idx],
          width: 200.0,
          height: 200.0,
        ),
        SizedBox(height: 50),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Expanded(
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              tooltip: 'Prev',
              onPressed: _previousImage,
            ),
          ),
          Expanded(
            child: IconButton(
              icon: Icon(Icons.arrow_forward_ios),
              tooltip: 'Next',
              onPressed: _nextImage,
            ),
          )
        ]),
      ],
    );
  }
}

class TutorialHome extends StatelessWidget {
  const TutorialHome({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('APP BAR'),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Controller(),
          ],
        )));
  }
}

class CounterM {
  int? a;
  int? b;
  CounterM({this.a, this.b});
}
