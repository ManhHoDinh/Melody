import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melody/melody/core/constants/color_palatte.dart';
import 'package:melody/melody/core/helper/text_styles.dart';
import 'package:melody/melody/core/helper/assets_helper.dart';
import 'package:melody/melody/core/models/firebase/perfomer_request.dart';
import 'package:melody/melody/core/models/music/music.dart';
import 'package:melody/melody/core/models/user/user.dart';
import 'package:melody/melody/presentations/screens/Home/home_screen.dart';
import 'package:melody/melody/presentations/screens/Home/widgets/perfomer_item.dart';
import '../../../core/models/perfomer/perfomer.dart';
import 'widgets/composer_item.dart';

class PerfomerScreen extends StatefulWidget {
  const PerfomerScreen(
      {super.key, this.animationController, required List<Music> albums});
  final AnimationController? animationController;

  @override
  State<PerfomerScreen> createState() => _PerfomerScreenState();
}

class _PerfomerScreenState extends State<PerfomerScreen>
    with TickerProviderStateMixin {
  AnimationController? animationController;
  @override
  void initState() {
    super.initState();
    animationController = widget.animationController;
  }

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
              'More Perfomer',
              style: TextStyle(fontSize: 20).whiteTextColor,
            ),
            leading: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ),
                );
              },
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
                    hintText: 'Search perfomer...',
                    prefixIconColor: Color(0xffffffff),
                    prefixIcon: Icon(Icons.search)),
              ),
              SizedBox(
                height: 20,
              ),
              StreamBuilder<List<Perfomer>>(
                  stream: PerfomerRequest.search(searchValue),
                  builder: ((context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      // While waiting for data, show a loading indicator
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      // If there's an error with the stream, display an error message
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return GridView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                  childAspectRatio: 5 / 6),
                          itemBuilder: ((context, index) {
                            return PerfomerItem(
                              perfomer: snapshot.data![index],
                            );
                          }));
                    }
                  }))
            ],
          ),
        ),
      ),
    );
  }
}
