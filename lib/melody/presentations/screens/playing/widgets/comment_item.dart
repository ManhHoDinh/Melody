import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:melody/melody/core/models/comment/comment.dart';

class CommentItem extends StatelessWidget {
  final Comment comment;
  const CommentItem({Key? key, required this.comment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only( top: 10.0,),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: AssetImage('assets/images/avatar.png')),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  comment.name,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: Colors.white),
                ),
                SizedBox(height: 5),
                Text(
                  comment.comment,
                  softWrap: true,
                  style: TextStyle(
                      fontWeight: FontWeight.w400, 
                      fontSize: 14,
                      color: Colors.white),
                ),
                SizedBox(height: 5), 
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      DateFormat('d MMMM yyyy').format(DateTime.parse(comment.day)),
                      style: const TextStyle(fontSize: 12, color: Colors.white),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Text(
                        DateFormat('HH:mm').format(DateTime.parse(comment.time)),
                        style: const TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
