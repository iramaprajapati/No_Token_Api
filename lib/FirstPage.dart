import 'package:flutter/material.dart';
import 'package:no_token_api/values/strings.dart';

import 'bottom_navigation/bottom_navigation.dart';
import 'manage/static_method.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({
    super.key,
  });

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  late BuildContext ctx;

  List<dynamic> resultList = [];

  @override
  void initState() {
    // Future.delayed(Duration.zero,(){
    //   getData();
    // });
    STM().checkInternet(context, widget).then((value) {
      if (value) {
        getData();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ctx = context;

    return Scaffold(
      bottomNavigationBar: bottomBarLayout(ctx, 1),
      appBar: AppBar(
        title: const Text('Read More'),
      ),
      body: ListView.builder(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: resultList.length,
          // padding: EdgeInsets.only(top: 2,bottom: 12),
          itemBuilder: (ctx, index) {
            var v = resultList;
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              height: 200,
              width: 100,
              color: Colors.red[100],
              child: Column(
                children: [
                  Text("${v[index]['name']}"),
                  Text("${v[index]['id']}"),
                  // Image.network("${v[index]['thumbnail']}",height: 40,width: 40),
                  Text('name'),
                  Text('name'),
                ],
              ),
            );
          }),
    );
  }

  // Api call List data
  void getData() async {
    var result = await STM().get2(ctx, Str().loading, 'users');
    setState(() {
      resultList = result;
      debugPrint(result.toString());
    });
  }
}
