import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:homework_day3_app/model/item.dart';
import 'package:homework_day3_app/page/detail_page.dart';
import 'package:page_transition/page_transition.dart';

class MyListViews extends StatefulWidget{
  @override
  _MyListViewsState createState() => _MyListViewsState();
}

class _MyListViewsState extends State<MyListViews> {
  double _widthOfScreen;
  @override
  Widget build(BuildContext context) {
    _widthOfScreen = MediaQuery.of(context).size.width;
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
      child: _buildParentListView,
    );
  }
  get _buildParentListView{
    return ListView(
      children: [
        _buildStoryListView,
        _buildListView,
        _buildStoryListView,
      ],
    );
  }
  get _buildStoryListView{
    return Container(
      height: 200,
      width: _widthOfScreen,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: itemStoryList.length,
        itemBuilder: (context,index){
          return _buildStoryItem(itemStoryList[index]);
        }
      ),
    );
  }
  _buildStoryItem(Item item){
    return InkWell(
      onTap: (){
        Navigator.of(context).push(
          PageTransition(child: DetailPage(item: item),
              type: PageTransitionType.bottomToTop,
          ),
        );
      },
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.yellow,
          image: DecorationImage(
            image: NetworkImage(item.img),
            fit: BoxFit.cover,
          ),
          border: Border.all(width: 5, color: Colors.blueAccent),
        ),
      ),
    );
  }
  get _buildListView{
    return ListView.builder(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemCount: itemList.length,
      itemBuilder: (context,index){
        return _buildItem(itemList[index]);
      },
    );
  }
  _buildItem(Item item){
    return Container(
      margin: EdgeInsets.all(10),
      width: _widthOfScreen,
      height: 400,
      child: Column(
        children: [
          _buildText(item.title),
          InkWell(
            onTap: (){
              Navigator.of(context).push(
                PageTransition(
                    child: DetailPage(item: item,),
                    type: PageTransitionType.bottomToTop,
                ),
              );
            },
            child: _buildImage(item.img),
          ),
          _buildButtomBorder,
        ],
      ),
    );
  }
  _buildText(String text){
    return Container(
      alignment: Alignment.centerLeft,
      height: 50,
      child: Text(
        text, style: TextStyle(fontSize: 20, color: Colors.white70),
      ),
    );
  }
  _buildImage(String img){
    return Container(
      height: 300,
      width: _widthOfScreen,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        image: DecorationImage(
          image: NetworkImage(img),
          fit: BoxFit.cover,
        )
      ),
    );
  }
  get _buildButtomBorder{
    return Container(
      height: 50,
      width: _widthOfScreen,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
      ),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Row(
                children: [
                  IconButton(icon: Icon(Icons.favorite_border), onPressed: () {}),
                  IconButton(icon: Icon(Icons.book_outlined), onPressed: () {}),
                ],
              ),
            ),
            IconButton(icon: Icon(Icons.comment_outlined), onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
