import 'package:flutter/material.dart';
import 'package:homework_day3_app/model/article_model.dart';
import 'package:homework_day3_app/page/my_localapi_page.dart';
import 'package:homework_day3_app/repos/my_localapi_repo.dart';

class InsertLocalAPIPage extends StatefulWidget {
  @override
  _InsertLocalAPIPageState createState() => _InsertLocalAPIPageState();
}

class _InsertLocalAPIPageState extends State<InsertLocalAPIPage>{

  var _titleCtrl = TextEditingController();
  var _bodyCtrl = TextEditingController();
  var _imgCtrl = TextEditingController();

  var _scaffoldKey = GlobalKey<ScaffoldState>();
  _showMessage(String text){
    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(text)));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: _buildAppBar,
      body: InkWell(

        child: _buildBody,
        onTap: (){
          FocusScope.of(context).requestFocus(FocusNode());
        },
      ),
    );
  }
  get _buildAppBar{
    return AppBar(
      title: Text("Insert"),
      actions: [
        IconButton(
            icon: Icon(Icons.cloud_upload_outlined),
            onPressed: (){
            if(_titleCtrl.text.trim().isNotEmpty || _bodyCtrl.text.trim().isNotEmpty || _imgCtrl.text.trim().isNotEmpty){
              Article article = Article(
                aid: "0",
                title: _titleCtrl.text.trim(),
                body: _bodyCtrl.text.trim(),
                img: _imgCtrl.text.trim(),
                date: DateTime.now().toIso8601String(),
            );
                insertData(article).then((value) {
                  print("value: $value");
                  if(value == "inserted"){
                    Navigator.of(context).pop();
                    _showMessage("Data inserted");
                  }
                  else{
                  _showMessage("Something went wrong");
                  }
                });
            }
            else{
              _showMessage("all fields are required");
            }
        }),
      ],
    );
  }

  get _buildBody{
    return Container(
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: Container(
          color: Colors.grey[200],
          width: 400,
          height: 800,
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Column(
                children: [
                  _buildTitleText,
                  _buildBodyText,
                  _buildImgText,
                ],
              ),

            ),

          ),
        ),
      ),
    );
  }
  get _buildTitleText{
    return TextField(
      controller: _titleCtrl,
      keyboardType: TextInputType.text,
      autocorrect: true,
      obscureText: false,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.text_fields),
          hintText: "Enter title",
          hintStyle: TextStyle(color: Colors.grey),
          labelText: "title",
        ),
      textCapitalization: TextCapitalization.words,
    );
  }
  get _buildBodyText{
    return TextField(
        controller: _bodyCtrl,
        keyboardType: TextInputType.text,
        autocorrect: true,
        obscureText: false,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.article),
          hintText: "Enter Body",
          hintStyle: TextStyle(color: Colors.grey),
          labelText: "title",
        ),
      textCapitalization: TextCapitalization.sentences,
    );
  }
  get _buildImgText{
    return TextField(
        controller: _imgCtrl,
        keyboardType: TextInputType.text,
        autocorrect: true,
        obscureText: false,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.image),
          hintText: "Enter url",
          hintStyle: TextStyle(color: Colors.grey),
          labelText: "title",
        ),
      maxLines: 3,
    );
  }
}