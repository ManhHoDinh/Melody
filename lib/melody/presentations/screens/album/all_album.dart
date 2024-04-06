import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melody/melody/core/constants/color_palatte.dart';
import 'package:melody/melody/core/helper/text_styles.dart';
import 'package:melody/melody/core/helper/assets_helper.dart';
import 'package:melody/melody/core/models/firebase/album_request.dart';
import 'package:melody/melody/core/models/user/user.dart';
import '../../../core/models/album/album.dart';
import 'widgets/album_item.dart';

class AllAlbumScreen extends StatefulWidget {
  const AllAlbumScreen({super.key});

  @override
  State<AllAlbumScreen> createState() => _AllAlbumScreenState();
}

class _AllAlbumScreenState extends State<AllAlbumScreen> {
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
              'All Albums',
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
                    hintText: 'Search album...',
                    prefixIconColor: Color(0xffffffff),
                    prefixIcon: Icon(Icons.search)),
              ),
              SizedBox(
                height: 20,
              ),
              StreamBuilder<List<Album>>(
                  stream: AlbumRequest.search(searchValue),
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
                            return AlbumItem(
                              album: snapshot.data![index],
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
