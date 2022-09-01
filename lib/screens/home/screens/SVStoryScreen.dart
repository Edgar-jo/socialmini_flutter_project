import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_socialmini/models/SVStoryModel.dart';
import 'package:prokit_socialmini/screens/SVPurchaseMoreScreen.dart';
import 'package:prokit_socialmini/utils/SVCommon.dart';
import 'package:prokit_socialmini/utils/SVConstants.dart';
import 'package:story_view/story_view.dart';

class SVStoryScreen extends StatefulWidget {
  final SVStoryModel? story;

  SVStoryScreen({required this.story});

  @override
  State<SVStoryScreen> createState() => _SVStoryScreenState();
}

class _SVStoryScreenState extends State<SVStoryScreen>
    with TickerProviderStateMixin {
  List<String> imageList = [];
  StoryController storyController = StoryController();

  TextEditingController messageController = TextEditingController();

  @override
  void initState() {
    imageList = widget.story!.storyImages.validate();
    setStatusBarColor(Colors.transparent);
    super.initState();
    init();
  }

  void init() {
    //
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PurchaseMoreScreen(),
          Positioned(
            left: 16,
            top: 70,
            child: SizedBox(
              height: 48,
              child: Row(
                children: [
                  Image.asset(
                    widget.story!.profileImage.validate(),
                    height: 48,
                    width: 48,
                    fit: BoxFit.cover,
                  ).cornerRadiusWithClipRRect(8),
                  16.width,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.story!.name.validate(),
                          style: boldTextStyle()),
                      svRobotoText(
                          text: '${widget.story!.time.validate()} ago'),
                    ],
                  )
                ],
              ),
            ),
          ),
          Row(
            children: [
              Container(
                width: context.width() * 0.76,
                padding: EdgeInsets.only(left: 16, right: 4, bottom: 16),
                child: AppTextField(
                  controller: messageController,
                  textStyle: secondaryTextStyle(
                      fontFamily: svFontRoboto, color: Colors.white),
                  textFieldType: TextFieldType.OTHER,
                  decoration: InputDecoration(
                    hintText: 'Send Message',
                    hintStyle: secondaryTextStyle(
                        fontFamily: svFontRoboto, color: Colors.white),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide:
                            BorderSide(width: 1.0, color: Colors.white)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide:
                            BorderSide(width: 1.0, color: Colors.white)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide:
                            BorderSide(width: 1.0, color: Colors.white)),
                  ),
                ),
              ),
              Image.asset('images/socialmini/icons/ic_Send.png',
                      height: 24,
                      width: 24,
                      fit: BoxFit.cover,
                      color: Colors.white)
                  .onTap(() {
                messageController.clear();
              },
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent),
              IconButton(
                icon: widget.story!.like.validate()
                    ? Image.asset('images/socialmini/icons/ic_HeartFilled.png',
                        height: 20, width: 22, fit: BoxFit.fill)
                    : Image.asset('images/socialmini/icons/ic_Heart.png',
                        height: 24,
                        width: 24,
                        fit: BoxFit.cover,
                        color: Colors.white),
                onPressed: () {
                  widget.story!.like = !widget.story!.like.validate();
                  setState(() {});
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
