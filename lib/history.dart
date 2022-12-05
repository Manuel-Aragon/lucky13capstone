import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryState();
}

//This class builds the formatting for how the list will look and take in information
class MyHistoryBox extends StatelessWidget {

  final String blockText;
  final Image blockImage;
  final String blockColor;

  MyHistoryBox({required this.blockText, required this.blockImage, required this.blockColor});

  @override
  Widget build(BuildContext context) {
    return Padding( //spacing between list objects
      padding: const EdgeInsets.all(10.0),
      child: ClipRRect( //rounding edges of list object
        borderRadius: BorderRadius.circular(20),
        child: Container( //the list object
          height: 300,
          color: Colors.grey,
          child: Column(  //the values inside the list object
            children: [
              blockImage,
              Text(blockText, style: TextStyle(fontSize: 30.0)),
              Text(blockColor, style: TextStyle(fontSize: 30.0)),
            ]
          ),
        ),
      )
    );
  }
}

class _HistoryState extends State<HistoryPage> {
  
  //The text here is obviously hard coded in,
  //later the text will be gathered from saved
  //scan results from some array
  final List _block = [
    '2x2 Brick',
    '2x4 Plate',
    '2x4 Slope',
    'Stud',
    '1x1 Brick',
    '1x2 Plate',
  ];

  //The text here is obviously hard coded in,
  //later the text will be gathered from saved
  //scan results from some array
  final List _color = [
    'Red',
    'Blue',
    'Black',
    'White',
    'Yellow',
    'Green',
  ];

  //The imnages here are obviously hard coded in,
  //later the images will be gather from saved
  //scan results from some array
  final List _image = [
      Image.asset('assets/images/2x2BrickRed.PNG', width: 200.0, height: 200.0, fit: BoxFit.contain,),
      Image.asset('assets/images/2x4PlateBlue.PNG', width: 200.0, height: 200.0, fit: BoxFit.contain,),
      Image.asset('assets/images/2x4SlopeBlack.PNG', width: 200.0, height: 200.0, fit: BoxFit.contain,),
      Image.asset('assets/images/StudWhite.PNG', width: 200.0, height: 200.0, fit: BoxFit.contain,),
      Image.asset('assets/images/1x1BrickYellow.PNG', width: 200.0, height: 200.0, fit: BoxFit.contain,),
      Image.asset('assets/images/1x2PlateGreen.PNG', width: 200.0, height: 200.0, fit: BoxFit.contain,),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("LEGO Scan History"),
        backgroundColor: Colors.black,
      ),

      body: ListView.builder(
        itemCount: _block.length,      //the ListView builder will make a number of list items equal to the number of elements in the _text object
        itemBuilder: ((context, index) {
          return MyHistoryBox(
            blockText: _block[index],  //create a MyHistoryBox object with the text input as the _block with the current index
            blockImage: _image[index],
            blockColor: _color[index],
          );
        }),
      ),
    );
  }
}