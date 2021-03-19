import 'package:flutter/material.dart';

class MainPage extends StatefulWidget{
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar,
      body: _buildBody,
      bottomNavigationBar: _buildBottom,
    );
  }

  get _buildBottom{
    return BottomAppBar(
      color: Colors.pinkAccent,
      child: Row(
        mainAxisAlignment:  MainAxisAlignment.spaceAround,
        children: [
          IconButton(
              icon: Icon(Icons.home),
              onPressed: (){
                print("home clicked");
          }),
          IconButton(
              icon: Icon(Icons.person),
              onPressed: (){
                print("home clicked");
              }),
          IconButton(
              icon: Icon(Icons.more_horiz),
              onPressed: (){
                print("home clicked");
              }),
        ],
      ),
    );
  }
  get _buildAppBar{
    return AppBar(
      backgroundColor: Colors.pinkAccent,
      leading: Icon(Icons.face),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text("ចុងក្រោយ",style: TextStyle(fontFamily: "Khmer Bokor"),),
          Text("ល្បី",style: TextStyle(fontFamily: "Khmer Bokor"),),
          Text("ពេញនិយម",style: TextStyle(fontFamily: "Khmer Bokor"),),
        ],
      ),
    );
  }

  get _buildBody{
    return Container(
      alignment: Alignment.center,
      color: Colors.black12,
      child: _buildColumn,
    );
  }

  String _imgNet11 = "asset/Image/L3v.gif";
  String _imgNet13 = "asset/Image/L3v.jpg";
  String _imgNet12 = "asset/Image/lkl.jpg";
  String _img15 = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSrCCjKOGzWaoSjO9l5mS3IiBjv_fTeJWC5Cg&usqp=CAU";
  String _img14 = "https://images.cinemaexpress.com/uploads/user/imagelibrary/2019/5/15/original/BabaYagaJohnWick3.jpg";
  String _img16 = "https://images.cinemaexpress.com/uploads/user/imagelibrary/2019/5/15/original/BabaYagaJohnWick3.jpg";

  get _buildColumn{
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildImage(_imgNet11),
          _buildImageNetwork(_img15),
          _buildImage(_imgNet13),
          _buildImage(_imgNet12),
          _buildImageNetwork(_img14),
          _buildImage(_imgNet11),
          _buildImageNetwork(_img16),

        ],
      ),
    );
  }

  _buildImage(String img){
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      width: 385,
      height: 400,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        image: DecorationImage(
          image: AssetImage(img),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  _buildImageNetwork(String img){
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      width: 385,
      height: 400,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        image: DecorationImage(
          image: NetworkImage(img),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}