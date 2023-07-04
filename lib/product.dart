import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:no_token_api/product_deatils.dart';
import 'package:no_token_api/values/strings.dart';
import 'bottom_navigation/bottom_navigation.dart';
import 'contactus.dart';
import 'manage/static_method.dart';

class ProductPage extends StatefulWidget {
  //step 1 : make constructor
  final Map<String, dynamic> data;
  const ProductPage({
    super.key,
    required this.data,
  });

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  late BuildContext ctx;

  dynamic mapData;
  bool mapisload = false;

  List<dynamic> resultList = [];
  // dynamic resultMap;

  Map<String, dynamic> resultData = {};
  getSessionData() async {
    // SharedPreferences sp = await SharedPreferences.getInstance();
    // setState(() {
    //   sUserid = sp.getString('user_id');
    // });
    STM().checkInternet(context, widget).then((value) {
      if (value) {
        setState(() {
          resultData = widget.data;
          resultList = widget.data['products'];
          postApi();
          // print(resultList);
        });
      }
    });
  }

  @override
  void initState() {
    // call in initState
    getSessionData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ctx = context;

    return Scaffold(
      bottomNavigationBar: bottomBarLayout(ctx, 0, b: true),
      appBar: AppBar(
        title: const Text('Product Page'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: mapisload == false
            ? Container()
            : Column(
                children: [
                  Container(
                    height: 150,
                    width: double.infinity,
                    child: Card(
                      elevation: 10,
                      color: Colors.redAccent,
                      child: Column(
                        children: [
                          Text('0'),
                          Text(
                              '${mapData['view_biography'][0]['title'].toString()}'),
                          Text('${mapData['success'].toString()}'),
                          // Text('${mapData['success']}'),
                          // Text('${mapData['success']}'),
                        ],
                      ),
                    ),
                  ),
                  ListView.builder(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: resultList.length, //resultList.length,
                      // padding: EdgeInsets.only(top: 2,bottom: 12),
                      itemBuilder: (ctx, index) {
                        var v = resultList;
                        return GestureDetector(
                          onTap: () {
                            STM().redirect2page(
                                context,
                                ProductDetails(
                                  data: v[index],
                                ));
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 8),
                            height: 200,
                            width: 100,
                            color: Colors.orange[100],
                            child: Column(
                              children: [
                                Text("${v[index]['title']}"),
                                Text("${v[index]['id']}"),
                                Image.network("${v[index]['thumbnail']}",
                                    height: 40, width: 40),

                                InkWell(
                                    onTap: () {
                                      STM().redirect2page(context, Contact());
                                    },
                                    child: Text(
                                      'Contact Us page',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20),
                                    )),
                                // Text("${resultData['total']}"),
                              ],
                            ),
                          ),
                        );
                      }),
                ],
              ),
      ),
    );
  }

  void postApi() async {
    FormData body = FormData.fromMap({'id': 7});
    var result = await STM().post(
      ctx,
      Str().loading,
      "view_biography",
      body,
    );
    setState(() {
      mapisload = true;
      mapData = result;
      print(result);
    });
  }
}
