import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

/**
 * @ClassName: textShow
 * @Description:
 * @Author: yuhua
 * @CreateDate: 2021/6/21 7:43 PM
 */

class ShowView extends StatelessWidget {
  String data;
  String title;
  ShowView({@required this.data, @required this.title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SafeArea(child: Markdown(data: data,)),
    );
  }
}
