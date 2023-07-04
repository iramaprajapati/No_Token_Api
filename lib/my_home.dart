
import 'package:flutter/material.dart';
import 'package:no_token_api/product.dart';
import 'package:no_token_api/values/dimens.dart';
import 'package:no_token_api/values/strings.dart';
import 'bottom_navigation/bottom_navigation.dart';
import 'contactus.dart';
import 'manage/static_method.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key,});

  @override
  State<MyHome> createState() => _MyHomeState();
}
class _MyHomeState extends State<MyHome> {
  late BuildContext ctx;

  List<dynamic> resultList = [];
  dynamic resultMap;
  getSessionData() async {
    // SharedPreferences sp = await SharedPreferences.getInstance();
    // setState(() {
    //   sUserid = sp.getString('user_id');
    // });
    STM().checkInternet(context, widget).then((value) {
      if (value) {
        getData();
      }
    });
  }

  @override
  void initState() {
    // Future.delayed(Duration.zero,(){
    //   getData();
    // });
    getSessionData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ctx = context;

    return Scaffold(
      bottomNavigationBar: bottomBarLayout(ctx, 0,),
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body:  ListView.builder(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: resultList.length,
            // padding: EdgeInsets.only(top: 2,bottom: 12),
            itemBuilder: (ctx, index) {
              var v = resultList;
              return Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                height: 200,
             width: 100,
             color: Colors.green[100],
                child: Column(
                  children: [
                    Text("${v[index]['title']}"),
                    Image.network("${v[index]['thumbnail']}",height: 40,width: 40),

                    InkWell(
                        onTap: (){
                          STM().redirect2page(context, Contact());
                        },
                        child: Text('Contact Us page',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20),)),
                    SizedBox(height:Dim().d16),
                    InkWell(
                        onTap: (){
                          STM().redirect2page(context, ProductPage(data: resultMap,));
                        },
                        child: Text('ProductPage',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20),)),
                    Text("${resultMap['total']}"),

                  ],
                ),
              );
            }),

    );
  }


  // Api call Map data whiout Model class
  void getData() async {
    var result = await STM().get(ctx, Str().loading,'products');
    setState(() {
      resultList = result['products'];
      resultMap = result;
      debugPrint(result.toString());
    });
  }

}

