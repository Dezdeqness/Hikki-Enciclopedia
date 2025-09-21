import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:hikki_enciclopedia/domain/model/personal_list_type.dart';
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
  PersonalListType selectedType = PersonalListType.tv;

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
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(selectedType == PersonalListType.tv ? 'TV' : 'Movie', style: const TextStyle(fontWeight: FontWeight.bold)),
                  Switch(
                    value: selectedType == PersonalListType.movie,
                    onChanged: (val) {
                      setState(() {
                        selectedType = val ? PersonalListType.movie : PersonalListType.tv;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
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
          toolbarHeight: 70,
        ),
        body: TabBarView(
          controller: tabController,
          children: [
            PersonalTab(type: PersonalPageType.rated, listType: selectedType),
            PersonalTab(type: PersonalPageType.watched, listType: selectedType),
          ],
        ),
      ),
    );
  }
}
