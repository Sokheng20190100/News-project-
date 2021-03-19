import 'package:flutter/material.dart';
import 'package:homework_day3_app/model/item.dart';


class DetailPage extends StatefulWidget{
  final Item item;
  DetailPage({this.item});
  @override
  _DetailPageState createState() => _DetailPageState();

}
class _DetailPageState extends State<DetailPage> {
  double _widthOfScreen;
  double _heightOfScreen;
  @override
  Widget build(BuildContext context) {
    _widthOfScreen = MediaQuery.of(context).size.width;
    _heightOfScreen = MediaQuery.of(context).size.height;
    return Scaffold( body: _buildBody,);
  }

  get _buildBody{
    return Container(
      child: Container(
        width: _widthOfScreen,
        child: Stack(
          children: <Widget>[
            Container(
              height: _heightOfScreen * 0.55,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(widget.item.img),
                      fit: BoxFit.cover)),
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Colors.black.withOpacity(0.9),
                      Colors.black.withOpacity(0.5),
                      Colors.black.withOpacity(0.0),
                      Colors.black.withOpacity(0.0),
                      Colors.black.withOpacity(0.5),
                      Colors.black.withOpacity(0.9),
                    ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
              ),
            ),
            Container(
              width: _widthOfScreen,
              margin: EdgeInsets.only(top: _heightOfScreen * 0.5),
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "${widget.item.title}",
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Description",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w900),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "${widget.item.des}",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        letterSpacing: 0.5,
                        wordSpacing: 1.5),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
            Positioned(
              left: 30,
              top: _heightOfScreen * 0.05,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.keyboard_backspace,
                  size: 42,
                  color: Colors.white,
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}