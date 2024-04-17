import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:melody/melody/core/helper/text_styles.dart';
import 'package:melody/melody/core/models/event/event.dart';
import 'package:melody/melody/core/models/firebase/event_request.dart';
import 'package:melody/melody/presentations/screens/artist/edit_artist_profile.dart';
import 'package:melody/melody/presentations/screens/event/add_event.dart';

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
            ),
            actions: [
          IconButton(
            onPressed: () {
                 Get.to(() => AddEventSrceen());
            },
            icon: Icon(
              Icons.add,
              color: ColorPalette.secondColor,
              size: 40,
            ),
          ),
        ],
            
            ),
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
                child: StreamBuilder<List<Event>>(
                    stream: EventRequest.search(searchValue),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        // While waiting for data, show a loading indicator
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        // If there's an error with the stream, display an error message
                        return Text('Error: ${snapshot.error}');
                      } else {
                        return ListView.separated(
                            scrollDirection: Axis.vertical,
                            itemBuilder: ((context, index) {
                              return EventItem(
                                event: snapshot.data![index],
                              );
                            }),
                            separatorBuilder: ((context, index) {
                              return SizedBox(
                                height: 10,
                              );
                            }),
                            itemCount: snapshot.data!.length);
                      }
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
