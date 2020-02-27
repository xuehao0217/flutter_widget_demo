import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/model/post.dart';

class ListViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: posts.length,
      itemBuilder: _itemBuilder,
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    return Card(
      elevation: 5,
      //Card 默认有margin  EdgeInsets.zero,去除
      child: Container(
        color: Colors.white,
        margin: EdgeInsets.all(8.0),
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child:
                      Image.network(posts[index].imageUrl, fit: BoxFit.cover),
                ),
                SizedBox(height: 16.0),
                Text(posts[index].title,
                    style: Theme.of(context).textTheme.title),
                Text(posts[index].author,
                    style: Theme.of(context).textTheme.subhead),
                SizedBox(height: 16.0),
              ],
            ),
            Positioned.fill(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                    splashColor: Colors.white.withOpacity(0.3),
                    highlightColor: Colors.white.withOpacity(0.1),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => PostShow(post: posts[index])));
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}





class PostShow extends StatelessWidget {
  final Post post;

  PostShow({
    @required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${post.title}'),
        elevation: 0.0,
      ),
      body: ListView(
        children: <Widget>[
          Image.network(
              post.imageUrl
          ),
          Container(
            padding: EdgeInsets.all(32.0),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('${post.title}', style: Theme.of(context).textTheme.title),
                Text('${post.author}', style: Theme.of(context).textTheme.subhead),
                SizedBox(height: 32.0),
                Text('${post.description}', style: Theme.of(context).textTheme.body1),
              ],
            ),
          ),
        ],
      ),
    );
  }
}