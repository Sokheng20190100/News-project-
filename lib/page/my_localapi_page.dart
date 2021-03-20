import 'package:flutter/material.dart';
import 'package:homework_day3_app/model/article_model.dart';
import 'package:homework_day3_app/page/insert_localapi_page.dart';
import 'package:homework_day3_app/repos/my_localapi_repo.dart';

class MyLocalAPIPage extends StatefulWidget {
  @override
  _MyLocalAPIPageState createState() => _MyLocalAPIPageState();
}

class _MyLocalAPIPageState extends State<MyLocalAPIPage> {
  Future<ArticleModel> _articleData;
  List<Article> _article;

  @override
  void initState() {
    super.initState();
    _articleData = readData();
  }

  var _scaffoldKey = GlobalKey<ScaffoldState>();

  _showMessage(String text){
    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(text)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  _buildAppBar() {
    return AppBar(
      title: InkWell(
        onLongPress: (){
          print("clicked");
        },
        child: Text("Random User"),
      ),
      backgroundColor: Colors.black,
      centerTitle: true,
      actions: [
        _buildAddIcon,
        _buildUpdateIcon,
      ],
    );
  }
  get _buildAddIcon{
    return IconButton(
        icon: Icon(Icons.add),
        onPressed: () {
      // Article article = Article(
      //   aid: "9",
      //   title: "test title 5",
      //   body: "test body 5",
      //   date: DateTime.now().toIso8601String(),
      //   img: "https://i.ytimg.com/vi/1Ne1hqOXKKI/maxresdefault.jpg"
      // );
      // insertData(article).then((value) {
      //   print("value: $value");
      //   if(value == "inserted"){
      //     _showMessage("Data inserted");
      //   }
      //   else{
      //     _showMessage("Something went wrong");
      //   }
      // });

          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => InsertLocalAPIPage(),
          ),
          );
    });
  }
  get _buildUpdateIcon{
    return IconButton(icon: Icon(Icons.update), onPressed: (){
      Article article = Article(
        aid: "5",
        title: "new test title 6",
        body: "new test body 6",
        date: DateTime.now().toIso8601String(),
        img: "https://i.ytimg.com/vi/1Ne1hqOXKKI/maxresdefault.jpg"
      );
      updateData(article).then((value) {
        print("value: $value");
        if(value == "Updated"){
          _showMessage("Data updated");
        }
        else{
          _showMessage("Something went wrong");
        }
      });
    });
  }


  _buildBody() {
    return Container(
      color: Colors.grey[200],
      alignment: Alignment.center,
      child: _buildFutureAPI
    );
  }

  get _buildFutureAPI{
    return FutureBuilder<ArticleModel>(
      future: _articleData,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text(snapshot.error);
        }
        if (snapshot.connectionState == ConnectionState.done) {
          _article = snapshot.data.articles;
          return _buildListView;
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }

  get _buildListView {
    return RefreshIndicator(
      child: ListView.builder(
        itemCount: _article.length,
        itemBuilder: (context,index){
          return _buildItem(_article[index]);
        },
      ),
      onRefresh: () async {
        setState(() {
          _articleData = readData();
        });
      },
    );
  }
  _buildItem(Article item){
    return Card(
      child: Column(
        children: [
          ListTile(
            title: Text(item.title),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: (){
                deleteData(item).then((value){
                  print("value: $value");
                  if(value == "Deleted"){
                    _showMessage("Data Delete");
                    setState(() {
                      _article.remove(item);
                    });
                  }
                  else{
                    _showMessage("Something went wrong");
                  }
                });
              },
            ),
          ),
          ListTile(
            subtitle: item.img != null
                ? _buildArticleImage(item)
                : Text(item.body),
          ),
        ],

      ),
    );
  }
  Container _buildArticleImage(Article item) {
    return Container(
      height: 400,
      width: 400,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.black12,
          image: DecorationImage(
            image: NetworkImage(item.img),
            fit: BoxFit.cover,
          ),
          border: Border.all(width: 5, color: Colors.black12),
        ),
      ),
    );
  }
}
