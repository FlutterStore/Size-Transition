import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>  with TickerProviderStateMixin {

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  )..repeat();
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  final Shader linearGradient = const LinearGradient(
  colors: <Color>[Color(0xffff9966), Color(0xffff5e62),],
).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('SizeTransition',style: TextStyle(fontSize: 15),),
      ),
      body: Center(
        child: SizeTransition(
        sizeFactor: _animation,
        axis: Axis.vertical,
        axisAlignment: 0,
        child:  Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black
              ),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Successoft Infotech",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,foreground: Paint()..shader = linearGradient),),
                  Text("Welcome",style: TextStyle(fontSize: 35,foreground: Paint()..shader = linearGradient),),
                ],
              ),
            ),
          ),
      ),
      ),
    ));
  }
}
