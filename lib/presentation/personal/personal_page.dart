import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:hikki_enciclopedia/domain/model/personal_page_type.dart';
import 'package:hikki_enciclopedia/presentation/personal/personal_tab.dart';
import 'package:hikki_localization/hikki_localization.dart';

@RoutePage()
class PersonalPage extends StatefulWidget {
  const PersonalPage({
    super.key,
  });

  @override
  State<PersonalPage> createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            dividerHeight: 0,
            indicatorSize: TabBarIndicatorSize.tab,
            labelColor: Colors.teal.shade900,
            unselectedLabelColor: Theme.of(context).colorScheme.onSurface,
            labelStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
            labelPadding: EdgeInsets.symmetric(horizontal: 16),
            indicatorPadding: EdgeInsets.symmetric(horizontal: 16),
            controller: tabController,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(
                colors: [
                  Color(0xFFB2DFDB),
                  Color(0xFFE0F7FA),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
            tabs: [
              Tab(
                text: LocaleKeys.personalRated.tr(),
              ),
              Tab(
                text: LocaleKeys.personalWatched.tr(),
              )
            ],
          ),
          toolbarHeight: 4,
        ),
        body: TabBarView(
          controller: tabController,
          children: [
            PersonalTab(type: PersonalPageType.rated),
            PersonalTab(type: PersonalPageType.watched),
          ],
        ),
      ),
    );
  }
}
