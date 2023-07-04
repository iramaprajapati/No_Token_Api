import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'bottom_navigation/bottom_navigation.dart';
import 'manage/static_method.dart';

class ProductDetails extends StatefulWidget {
  final Map<String, dynamic> data;
  const ProductDetails({
    super.key,
    required this.data,
  });

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  late BuildContext ctx;

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

          print(resultData);
          // log('data:"${resultList.toString()}dgdfgfhhfhffhffh"');
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

    var v = resultData;
    return Scaffold(
      bottomNavigationBar: bottomBarLayout(ctx, 0, b: true),
      appBar: AppBar(
        title: const Text('Product Details'),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("ID"),
          Text("${v['title']}"),
          STM().imageView(
            v['thumbnail'],
          ),
          CachedNetworkImage(
            imageUrl: '${v['thumbnail']}'.toString(),
            fit: BoxFit.fill,
            height: 170,
            width: double.infinity,
            // width: 1500.0,
            placeholder: (context, url) => const Icon(Icons.refresh),
          ),
        ],
      )),
    );
  }
}
