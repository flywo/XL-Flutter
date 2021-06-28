import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xl/data.dart';

/**
 * @ClassName: detail
 * @Description:
 * @Author: yuhua
 * @CreateDate: 2021/6/21 4:54 PM
 */

class DetailView extends StatelessWidget {
  int number;
  String imageName;
  XLData data;
  DetailView({
    @required this.number,
    @required this.imageName,
    @required this.data
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 250,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(data.name),
                  background: Hero(
                    tag: 'image$number',
                    child: Image.asset(
                      imageName,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )
            ];
          },
          body: SingleChildScrollView(
            child: Column(
              children: [
                _buildText('名称', data.name),
                _buildText('别名', data.alias),
                _buildText('特征', data.feature),
                _buildText('产地', data.place),
                _buildText('用法', data.usage),
                _buildText('挑选', data.choose),
                _buildText('属性', data.property),
                _buildText('药用', data.medication),
                _buildText('提示', data.tips),
              ],
            ),
          )
      ),
    );
  }

  Widget _buildText(String title, String content) {
    if (content.isEmpty) {
      return Container();
    }
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                content,
                softWrap: true,
                style: TextStyle(
                  fontSize: 18
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
