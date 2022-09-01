import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_socialmini/models/SVCommentModel.dart';
import 'package:prokit_socialmini/screens/SVPurchaseMoreScreen.dart';
import 'package:prokit_socialmini/screens/home/components/SVCommentReplyComponent.dart';
import 'package:prokit_socialmini/utils/SVColors.dart';

import '../../../../../main.dart';

class SVCommentScreen extends StatefulWidget {
  const SVCommentScreen({Key? key}) : super(key: key);

  @override
  State<SVCommentScreen> createState() => _SVCommentScreenState();
}

class _SVCommentScreenState extends State<SVCommentScreen> {
  List<SVCommentModel> commentList = [];

  @override
  void initState() {
    commentList = getComments();
    super.initState();
    afterBuildCreated(() {
      setStatusBarColor(context.cardColor);
    });
  }

  @override
  void dispose() {
    setStatusBarColor(
        appStore.isDarkMode ? appBackgroundColorDark : SVAppLayoutBackground);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.cardColor,
      appBar: AppBar(
        backgroundColor: context.cardColor,
        iconTheme: IconThemeData(color: context.iconColor),
        title: Text('Comments', style: boldTextStyle(size: 20)),
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz)),
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PurchaseMoreScreen(),
          SVCommentReplyComponent(),
        ],
      ),
    );
  }
}
