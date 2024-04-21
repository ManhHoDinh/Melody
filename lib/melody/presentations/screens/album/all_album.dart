import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melody/melody/core/constants/color_palatte.dart';
import 'package:melody/melody/core/helper/text_styles.dart';
import 'package:melody/melody/core/helper/assets_helper.dart';
import 'package:melody/melody/core/models/firebase/album_request.dart';
import 'package:melody/melody/core/models/user/user.dart';
import 'package:melody/melody/presentations/screens/album/detail_album.dart';
import 'package:melody/melody/presentations/screens/album/modify_album.dart';
import '../../../core/models/album/album.dart';
import 'widgets/album_item.dart';

class AllAlbumScreen extends StatefulWidget {
  const AllAlbumScreen({super.key, this.animationController});
  final AnimationController? animationController;

  @override
  State<AllAlbumScreen> createState() => _AllAlbumScreenState();
}

class _AllAlbumScreenState extends State<AllAlbumScreen>
    with TickerProviderStateMixin {
  AnimationController? animationController;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    animationController!.dispose();
    super.dispose();
  }

  TextEditingController searchController = TextEditingController();
  String searchValue = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: Gradients.defaultGradientBackground),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(
              'All Albums',
            ),
            centerTitle: true,
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
                                    childAspectRatio: 0.8),
                            itemBuilder: ((context, index) {
                              return AlbumItem(
                                album: snapshot.data![index],
                              );
                            }));
                      }
                    })),
                Spacer(),
                Container(
                  alignment: Alignment.bottomRight,
                  child: FloatingActionButton(
                    onPressed: () async {
                      Album? result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ModifyAlbum(), // Your existing Album if you're editing
                        ),
                      );

                      if (result != null) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => AlbumDetailScreen(album: result)));
                      }
                    },
                    child: Text(
                      "+",
                      style: TextStyle(fontSize: 28),
                    ),
                  ),
                ),
                SizedBox(
                  height: 80,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
