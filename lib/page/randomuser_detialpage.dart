import 'package:flutter/material.dart';
import 'package:homework_day3_app/model/randomuser_model.dart';



class RandomUserDetailPage extends StatefulWidget{
  final Result item;
  RandomUserDetailPage({this.item});
  @override
  _RandomUserDetailPageState createState() => _RandomUserDetailPageState();

}
class _RandomUserDetailPageState extends State<RandomUserDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar,
      body: _buildBody);
  }
  get _buildBody{
    return Container(
      width: 400.0,
      color: Colors.black12,
      child: Column(
        children: <Widget>[
          SizedBox(height: 20.0),
          Container(
              width: 150.0,
              height: 150.0,
              decoration: BoxDecoration(
                  color: Colors.red,
                  image: DecorationImage(
                      image: NetworkImage(widget.item.picture.medium),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.all(Radius.circular(75.0)),
                  boxShadow: [
                    BoxShadow(blurRadius: 7.0, color: Colors.black)
                  ])),
          SizedBox(height: 30.0),
          Text(
            "${widget.item.name.first} ${widget.item.name.last}",
            style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat'),
          ),
          SizedBox(height: 10.0),
          Text(
            "${widget.item.gender}",
            style: TextStyle(
                fontSize: 17.0,
                fontStyle: FontStyle.italic,
                fontFamily: 'Montserrat'),
          ),
          SizedBox(height: 10.0),
          Text(
            "${widget.item.id.value}",
            style: TextStyle(
                fontSize: 17.0,
                fontStyle: FontStyle.italic,
                fontFamily: 'Montserrat'),
          ),
          SizedBox(height: 25.0),
          Card(
            child: InkWell(
              splashColor: Colors.blue.withAlpha(30),
              onTap: () {
                print('Card tapped.');
              },
              child: Container(
                width: 350,
                height: 35,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.black26,
                  border: Border.all(width: 2, color: Colors.blueAccent),

                ),
                child: Text("     ${widget.item.dob.date } "
                  , style: TextStyle(
                      fontSize: 20.0,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'Montserrat'),),
              ),
            ),
          ),
          SizedBox(height: 5.0),
          Card(
            child: InkWell(
              splashColor: Colors.blue.withAlpha(30),
              onTap: () {
                print('Card tapped.');
              },
              child: Container(
                width: 350,
                height: 35,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.black26,
                  border: Border.all(width: 2, color: Colors.blueAccent),

                ),
                child: Text("    ${widget.item.email}", style: TextStyle(
                    fontSize: 20.0,
                    fontStyle: FontStyle.italic,
                    fontFamily: 'Montserrat'),),
              ),
            ),
          ),
          SizedBox(height: 5.0),
          Card(
            child: InkWell(
              splashColor: Colors.blue.withAlpha(30),
              onTap: () {
                print('Card tapped.');
              },
              child: Container(
                width: 350,
                height: 35,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.black26,
                  border: Border.all(width: 2, color: Colors.blueAccent),

                ),
                child: Text("     ${widget.item.location.city} ${widget.item.location.country}"
                  , style: TextStyle(
                    fontSize: 20.0,
                    fontStyle: FontStyle.italic,
                    fontFamily: 'Montserrat'),),
              ),
            ),
          ),
          SizedBox(height: 5.0),
          Card(
            child: InkWell(
              splashColor: Colors.blue.withAlpha(30),
              onTap: () {
                print('Card tapped.');
              },
              child: Container(
                width: 350,
                height: 35,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.black26,
                  border: Border.all(width: 2, color: Colors.blueAccent),

                ),
                child: Text("     ${widget.item.registered.date}"
                  , style: TextStyle(
                      fontSize: 20.0,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'Montserrat'),),
              ),
            ),
          ),
          SizedBox(height: 5.0),
          Card(
            child: InkWell(
              splashColor: Colors.blue.withAlpha(30),
              onTap: () {
                print('Card tapped.');
              },
              child: Container(
                width: 350,
                height: 35,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.black26,
                  border: Border.all(width: 2, color: Colors.blueAccent),

                ),
                child: Text("     ${widget.item.phone}"
                  , style: TextStyle(
                      fontSize: 20.0,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'Montserrat'),),
              ),
            ),
          ),
          SizedBox(height: 5.0),
          Card(
            child: InkWell(
              splashColor: Colors.blue.withAlpha(30),
              onTap: () {
                print('Card tapped.');
              },
              child: Container(
                width: 350,
                height: 35,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.black26,
                  border: Border.all(width: 2, color: Colors.blueAccent),

                ),
                child: Text("     ${widget.item.nat}"
                  , style: TextStyle(
                      fontSize: 20.0,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'Montserrat'),),
              ),
            ),
          ),
          SizedBox(height: 25.0),
          Container(
              height: 30.0,
              width: 95.0,
              child: Material(
                borderRadius: BorderRadius.circular(20.0),
                shadowColor: Colors.redAccent,
                color: Colors.red,
                elevation: 7.0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Center(
                    child: Text(
                      'Log out',
                      style: TextStyle(color: Colors.white, fontFamily: 'Montserrat'),
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
  get _buildAppBar{
    return AppBar(
      title: Text("User Profile"),
      backgroundColor: Colors.black,
      centerTitle: true,
    );
  }
}





