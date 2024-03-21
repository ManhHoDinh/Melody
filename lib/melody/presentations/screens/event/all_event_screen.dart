import 'package:flutter/material.dart';
import 'package:melody/melody/core/helper/text_styles.dart';
import 'package:melody/melody/core/models/event/event.dart';

import '../../../core/constants/color_palatte.dart';
import '../../../core/helper/assets_helper.dart';
import 'widgets/event_item.dart';

class AllEventScreen extends StatefulWidget {
  const AllEventScreen({super.key});

  @override
  State<AllEventScreen> createState() => _AllEventScreenState();
}

class _AllEventScreenState extends State<AllEventScreen> {
  TextEditingController searchController = TextEditingController();
  String searchValue = '';
  List<Event> events = [
    Event(
        id: 1,
        image: AssetHelper.test,
        description: 'goodd',
        name: 'binh',
        startAt: DateTime.now(),
        endAt: DateTime.now(),
        location: 'QN'),
    Event(
        id: 1,
        image: AssetHelper.test,
        description: 'goodd',
        name: 'binh',
        startAt: DateTime.now(),
        endAt: DateTime.now(),
        location: 'QN')
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: Gradients.defaultGradientBackground),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text(
              'All Events',
              style: TextStyle(fontSize: 20).whiteTextColor,
            ),
            leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_back,
                color: ColorPalette.secondColor,
              ),
            )),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              TextField(
                onChanged: (value) {
                  setState(() {
                    searchValue = value;
                  });
                },
                controller: searchController,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                decoration: InputDecoration(
                    filled: true,
                    hintStyle: TextStyle(color: Color(0xffFFFFFF)),
                    fillColor: Color(0xff656565),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20)),
                    hintText: 'Search event...',
                    prefixIconColor: Color(0xffffffff),
                    prefixIcon: Icon(Icons.search)),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    itemBuilder: ((context, index) {
                      return EventItem(
                        event: events[index],
                      );
                    }),
                    separatorBuilder: ((context, index) {
                      return SizedBox(
                        height: 10,
                      );
                    }),
                    itemCount: events.length),
              )
            ],
          ),
        ),
      ),
    );
  }

  List<Event> searchEvents(List<Event> events, String value) {
    return events.where((element) => element.name.contains(value)).toList();
  }
}
