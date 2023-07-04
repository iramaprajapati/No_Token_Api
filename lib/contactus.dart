
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:no_token_api/values/colors.dart';
import 'package:no_token_api/values/dimens.dart';
import 'package:no_token_api/values/styles.dart';
import 'package:url_launcher/url_launcher.dart';

import 'manage/static_method.dart';

class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  late BuildContext ctx;
  @override
  Widget build(BuildContext context) {
    ctx = context;
    return Scaffold(
      backgroundColor: Clr().white,
      appBar: AppBar(

        leading: InkWell(
          onTap: () {
            STM().back2Previous(ctx);
          },
          child: Icon(
            Icons.arrow_back_rounded,
            color: Clr().white,
          ),
        ),
        centerTitle: true,
        title: Text(
          'Contact Us',
          style: Sty().largeText.copyWith(
              color: Clr().white, fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: Dim().d24,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: Dim().d12),
              child: Icon(Icons.contact_support,size: 100)
              ,
            ),
            SizedBox(height: Dim().d20,),
            Center(child: Text('Contact us',style: Sty().mediumText,)),
            SizedBox(height: Dim().d28,),
            Text('==Mobile==',style: Sty().mediumBoldText.copyWith(fontFamily: 'roboto'),),
            // Text('9323224172',style: Sty().mediumBoldText.copyWith(fontFamily: 'roboto'),),
            Text('Deepak Furia',style: Sty().mediumBoldText.copyWith(fontFamily: 'roboto',fontWeight: FontWeight.w400),),
            InkWell(
              onTap: () async {
                await launchUrl(
                Uri.parse('tel:8828820908')
                );
              },
                child: Text('8828820908',style: Sty().mediumBoldText.copyWith(fontFamily: 'roboto',height: 1.5),)),
            InkWell(
                onTap: () async {
                  await launchUrl(
                      Uri.parse('tel:9130000800')
                  );
                },
                child: Text('9130000800',style: Sty().mediumBoldText.copyWith(fontFamily: 'roboto',height: 1.5),)),
            SizedBox(height: Dim().d28,),
            InkWell(
                onTap: () async {
                  await launchUrl(
                      Uri.parse('https:arhamparivar.org/terms_conditions')
                  );
                },
                child: Text('https://arhamparivar.org/terms_conditions',style: Sty().mediumBoldText.copyWith(fontFamily: 'roboto',height: 1.5),)),
            SizedBox(height: Dim().d28,),
            Text('==Email Id==',style: Sty().mediumBoldText,),
            InkWell(
                onTap: () async {
                  await launchUrl(
                      Uri.parse('mailto:arhamparivar@gmail.com'));
                },
                child: Text('arhamparivar@gmail.com',style: Sty().mediumBoldText,)),

            Container(
              margin: const EdgeInsets.only(right: 20, left: 20),
              // decoration: BoxDecoration(color: Color(0xffFAB400)),
              child: ListTile(
                leading: Icon(Icons.terminal_rounded),
                title: Text(
                  'Terms & Conditions',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
                onTap: () {
                  STM().openWeb('https://arhamparivar.org/terms_conditions');
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 20, left: 20),
              // decoration: BoxDecoration(color: Color(0xffE683F0)),
              child: ListTile(
                leading: Icon(Icons.share),
                title: const Text(
                  'Share App',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
                onTap: () {
                  // STM().openWeb('https://play.google.com/store/apps/details?id=com.app.arham');
                  var message =
                      'Download The Arham App from below link\n\n https://play.google.com/store/apps/details?id=com.app.arham';
                  Share.share(message);
                },
              ),
            ),
            // SizedBox(height: Dim().d28,),
            // Text('==Address==',style: Sty().mediumBoldText,),
            // Text('successrunway.com',style: Sty().mediumBoldText,),
          ],
        ),
      ),
    );
  }
}
