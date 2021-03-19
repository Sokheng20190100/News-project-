import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:homework_day3_app/model/item.dart';

class MyListView extends StatefulWidget{
  @override
  _MyListViewState createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar,
      body: _buildBody,
    );
  }

  get _buildAppBar{
    return AppBar(
      backgroundColor: Colors.black,
      centerTitle: true,
      title: Text("My ListView"),
    );
}

  get _buildBody{
  return Container(
    alignment: Alignment.center,
    child: _buildListView,
  );
  }
  get _buildListView{
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: itemList.length,
      itemBuilder: (context,index){
        return _buildItem(itemList[index]);
      },
    );
  }
  _buildItem(Item item){
    return ListTile(
      title: Container(
        alignment: Alignment.centerLeft,
        height: 50,
        child: Text(
          "${item.title}",
        ),
      ),
      subtitle: Container(
        height: 300,
        child: Image.network(
          item.img,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
