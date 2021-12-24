import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controllers/settings_controller.dart';
import 'package:quiz_app/db/dao/question_dao.dart';
import 'package:quiz_app/screens/settingsscreen/settings_screen.dart';

class Category extends StatelessWidget {

  final QuestionDao questionDao;
  final String categoryName;
  final MainAxisAlignment mainAxisAlignment;

  const Category({
    required this.questionDao, required this.categoryName, required this.mainAxisAlignment,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsController>(
      init: SettingsController(),
      builder: (settingsController) {
        return InkWell(
          onTap: () { 
            settingsController.setSelectedCategory(categoryName);
            settingsController.update();
            Get.to(() => SettingsScreen(questionDao));
          },
          child: Container(
            width: 250,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.25),
              borderRadius: BorderRadius.all(Radius.circular(40))
            ),
            child: MainAxisAlignment.start == mainAxisAlignment ?
            LeftCategory(categoryName: categoryName) : RightCategory(categoryName: categoryName),
          ),
        );
      }
    );
  }
}

class RightCategory extends StatelessWidget {
  const RightCategory({
    Key? key,
    required this.categoryName,
  }) : super(key: key);

  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                categoryName,
                style: Theme.of(context).textTheme.headline5,
              )
            ],
          ),
          SizedBox(width: 10,),
          SvgPicture.asset("assets/icons/${categoryName}.svg", height: 75, width: 75,),
        ],
      ),
    );
  }
}

class LeftCategory extends StatelessWidget {
  const LeftCategory({
    Key? key,
    required this.categoryName,
  }) : super(key: key);

  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SvgPicture.asset("assets/icons/${categoryName}.svg", height: 75, width: 75,),
          SizedBox(width: 10,),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 120,
                child: Text(
                  categoryName,
                  style: Theme.of(context).textTheme.headline5,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}