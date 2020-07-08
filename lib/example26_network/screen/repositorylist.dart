import 'package:flutter/material.dart';
import 'package:fluttermyexample/example26_network/model/githubmodel.dart';
import 'package:provider/provider.dart';

class Repos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    GithubModel github = Provider.of<GithubModel>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('${github.getUser().login} Repositories'),
      ),
      body: _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<GithubModel>(builder: (_, github, c) {
      return github.listRepositories() == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.separated(
              itemBuilder: (c, index) {
                return _Item(github.listRepositories()[index]);
              },
              separatorBuilder: (c, i) => Divider(),
              itemCount: github.listRepositories().length);
    });
  }
}

class _Item extends StatelessWidget {
  final Repository repos;

  _Item(this.repos);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, top: 10),
      child: Row(
        children: <Widget>[
          Icon(Icons.favorite),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '${repos.name}',
                  style: TextStyle(fontSize: 20),
                ),
                Text('${repos.language}'),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: <Widget>[
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(Icons.shuffle),
                        Text('${repos.fork_count}'),
                      ],
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(Icons.star),
                        Text('${repos.stargazers_count}'),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          Icon(Icons.keyboard_arrow_right),
        ],
      ),
    );
  }
}
