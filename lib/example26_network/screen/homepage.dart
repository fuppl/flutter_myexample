import 'package:flutter/material.dart';
import 'package:fluttermyexample/example26_network/model/githubmodel.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  GithubModel github;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () => github.loadUser(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 260,
                primary: true,
                pinned: true,
                floating: true,
                snap: false,
                flexibleSpace: FlexBar(),
              )
            ];
          },
          body: ListView(
            children: <Widget>[Text('info')],
          )),
    );
  }
}

class FlexBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      background: Consumer<GithubModel>(builder: (context, github, c) {
        User user = github.getUser();
        return Ink(
          color: Colors.black,
          child: ListView(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 5),
                height: 120,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: user.avatar_url == ''
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : CircleAvatar(
                          backgroundImage: NetworkImage('${user.avatar_url}'),
                          radius: 100,
                        ),
                ),
              ),
              Center(
                child: Text(
                  '${user.login}',
                  style: TextStyle(fontSize: 36, color: Colors.white),
                ),
              ),
              Center(
                child: Text(
                  '${user.email}',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed('/repository');
                        },
                        child: Column(
                          children: <Widget>[
                            Text(
                              '${user.public_repos}',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              'Ropositories',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                  )),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Text('${user.followers}',
                            style: TextStyle(color: Colors.white)),
                        Text(
                          'Followers',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Text('${user.following}',
                            style: TextStyle(color: Colors.white)),
                        Text(
                          'Following',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      }),
    );
  }
}
