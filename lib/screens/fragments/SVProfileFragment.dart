import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_socialmini/main.dart';
import 'package:prokit_socialmini/screens/SVPurchaseMoreScreen.dart';
import 'package:prokit_socialmini/utils/SVCommon.dart';

import '../../utils/SVColors.dart';

class SVProfileFragment extends StatefulWidget {
  const SVProfileFragment({Key? key}) : super(key: key);

  @override
  State<SVProfileFragment> createState() => _SVProfileFragmentState();
}

class _SVProfileFragmentState extends State<SVProfileFragment> {
  @override
  void initState() {
    setStatusBarColor(Colors.transparent);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Scaffold(
        backgroundColor: svGetScaffoldColor(),
        appBar: AppBar(
          backgroundColor: svGetScaffoldColor(),
          title: Text('Profile', style: boldTextStyle(size: 20)),
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(color: context.iconColor),
          actions: [
            Switch(
              onChanged: (val) {
                appStore.toggleDarkMode(value: val);
              },
              value: appStore.isDarkMode,
              activeColor: SVAppColorPrimary,
            ),
            //IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz)),
          ],
        ),
        body: PurchaseMoreScreen(),
      ),
    );
  }
}
