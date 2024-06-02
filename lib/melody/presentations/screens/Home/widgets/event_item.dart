import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:melody/melody/core/constants/color_palatte.dart';
import 'package:melody/melody/core/helper/image_helper.dart';
import 'package:melody/melody/core/models/event/event.dart';
import 'package:intl/intl.dart';

class EventItem extends StatelessWidget {
  final Event event;
  const EventItem({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    final format = new DateFormat('MMM dd, hh:mm a');
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey
                  .withOpacity(0.5), // Change the color of the shadow
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            )
          ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 100,
            height: 100,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: ImageHelper.loadFromNetwork(
                  event.image,
                  fit: BoxFit.cover,
                )),
          ),
          Flexible(
            child: Container(
              padding: EdgeInsets.only(left: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    format.format(DateTime.parse(event.startAt)),
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    event.name,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 18,
                        color: ColorPalette.secondColor,
                      ),
                      Text(
                        event.location,
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
