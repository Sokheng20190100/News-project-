import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:homework_day3_app/model/randomuser_model.dart';
import 'package:homework_day3_app/repos/randomuser_repo.dart';
import 'package:page_transition/page_transition.dart';
import 'package:homework_day3_app/page/randomuser_detialpage.dart';

class RandomUserPage extends StatefulWidget {
  @override
  _RandomUserPageState createState() => _RandomUserPageState();
}

class _RandomUserPageState extends State<RandomUserPage> {
  Future<RandomUser> _data;
  List<Result> _results;

  @override
  void initState() {
    super.initState();
    _data = readData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar,
      body: _buildBody,
    );
  }

  get _buildAppBar {
    return AppBar(
      title: InkWell(
        onLongPress: (){
          print("clicked");
        },
        child: Text("Random User"),
      ),
      backgroundColor: Colors.black,
      centerTitle: true,
    );
  }


  get _buildBody{
    return Container(
      color: Colors.grey[200],
      alignment: Alignment.center,
      child: FutureBuilder<RandomUser>(
        future: _data,
        builder: (context, snapshot){
          if(snapshot.hasError){
            print("Snapshot.error: ${snapshot.error}");
            return Text(snapshot.error);
          }
          if(snapshot.connectionState == ConnectionState.done){
            _results = snapshot.data.results;
            return _buildListView;
          }
          else{
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
  get _buildListView{
    return RefreshIndicator(
      onRefresh: () async{
        setState(() {
          _data = readData();
        });
      },
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: _results.length,
        itemBuilder: (context, index){
          return _buildItem(_results[index]);
        }
      ),
    );
  }
  _buildItem(Result item){
    return Card(
      child: Slidable(
        actionPane: SlidableDrawerActionPane(),
        actions: [
          IconSlideAction(
            icon: Icons.mic_off_rounded,
            color: Colors.green,
            caption: "Mute",
            onTap: () {},
          ),
        ],
        secondaryActions: [
          IconSlideAction(
            icon: Icons.more_horiz,
            color: Colors.grey[300],
            onTap: () {
              _showAlertDialog(item);
            },
          ),
          IconSlideAction(
            icon: Icons.delete,
            color: Colors.red,
            caption: "Delete",
            onTap: (){
              setState(() {
                _results.remove(item);
              });
            },
          ),
        ],
        child: ListTile(
          leading: Image.network(item.picture.medium),
          title: Text("${item.name.first} ${item.name.last}"),
          subtitle: Text("${item.email}"),
          trailing: Icon(Icons.navigate_next),
          onLongPress: (){
            _showAlertDialog(item);
          },
        ),
      )
    );
  }
  _showAlertDialog(Result item){
    showDialog(
      context: context,
      builder: (context){
        return AlertDialog(
          title: Text("Options"),
          content: Container(
            height: 150,
            width: 300,
            child: Column(
              children: [
                Card(
                  child: ListTile(
                    leading: Icon(Icons.folder_open_outlined),
                    title: Text("Detail Page"),
                    onTap: (){
                      Navigator.of(context).push(
                        PageTransition(
                            child: RandomUserDetailPage(item: item),
                            type: PageTransitionType.bottomToTop)
                      );
                    },
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Icon(Icons.delete),
                    title: Text("Delete"),
                    onTap: (){
                      setState(() {
                        _results.remove(item);
                      });
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: (){
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
          ],
        );
      }
    );
  }
}