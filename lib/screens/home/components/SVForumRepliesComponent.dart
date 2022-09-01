import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_socialmini/models/SVForumRepliesModel.dart';
import 'package:prokit_socialmini/screens/SVPurchaseMoreScreen.dart';

class SVForumRepliesComponent extends StatelessWidget {
  final List<SVForumRepliesModel> repliesList = getRepliesList();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: context.height() * 0.7, child: PurchaseMoreScreen());
  }
}
