import 'package:flutter/material.dart';

class ReadMoreText extends StatefulWidget {
  final String text;
  final int maxLines;

  const ReadMoreText({
    required this.text,
    required this.maxLines,
    Key? key,
  }) : super(key: key);

  @override
  _ReadMoreTextState createState() => _ReadMoreTextState();
}

class _ReadMoreTextState extends State<ReadMoreText> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
          maxLines: _expanded ? 100 : widget.maxLines,
          overflow: TextOverflow.ellipsis,
        ),
        if (!_expanded && _isTextOverflowed())
          GestureDetector(
            onTap: () {
              setState(() {
                _expanded = true;
              });
            },
            child: Text(
              'Read More',
              style: TextStyle(color: Colors.blue, fontSize: 14),
            ),
          ),
        if (_expanded && _isTextOverflowed())
          GestureDetector(
            onTap: () {
              setState(() {
                _expanded = false;
              });
            },
            child: Text(
              'Show Less',
              style: TextStyle(color: Colors.blue, fontSize: 14),
            ),
          )
      ],
    );
  }

  bool _isTextOverflowed() {
    final textPainter = TextPainter(
      text: TextSpan(
        text: widget.text,
      ),
      maxLines: widget.maxLines,
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: 369);
    return textPainter.didExceedMaxLines;
  }
}
