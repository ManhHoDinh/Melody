import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melody/melody/core/models/firebase/Artist_request.dart';
import 'package:melody/melody/presentations/routes/app_router.dart';
import 'package:melody/melody/presentations/screens/Home/widgets/perfomer_item.dart';
import 'package:melody/melody/presentations/screens/playing/widgets/mini_playback.dart';
import 'package:melody/melody/core/models/artist/artist.dart';

class AllArtistScreen extends StatefulWidget {
  const AllArtistScreen({super.key, this.animationController});
  final AnimationController? animationController;

  @override
  State<AllArtistScreen> createState() => _AllArtistScreenState();
}

class _AllArtistScreenState extends State<AllArtistScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  TextEditingController searchController = TextEditingController();
  String searchValue = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: const TextSpan(
            text: 'Art',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xff6D0B14)),
            children: <TextSpan>[
              TextSpan(
                text: 'ist',
                style: TextStyle(fontSize: 20, color: Color(0xff4059F1)),
              ),
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
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
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 5),
                        filled: true,
                        hintStyle: TextStyle(color: Color(0xffFFFFFF)),
                        fillColor: Color(0xff198FB4),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        hintText: 'Search Artists...',
                        prefixIconColor: Color(0xffffffff),
                        prefixIcon: Icon(Icons.search),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    StreamBuilder<List<Artist>>(
                        stream: ArtistRequest.search(searchValue),
                        builder: ((context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            // While waiting for data, show a loading indicator
                            return CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            // If there's an error with the stream, display an error message
                            return Text('Error: ${snapshot.error}');
                          } else {
                            return GridView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: snapshot.data!.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 10,
                                        childAspectRatio: 0.8),
                                itemBuilder: ((context, index) {
                                  return GestureDetector(
                                      onTap: () {
                                        Get.toNamed(Routes.artistPage,
                                            arguments:
                                                snapshot.data![index].artistId);
                                      },
                                      child: PerfomerItem.PerformerItem(
                                        perfomer: snapshot.data![index],
                                      ));
                                }));
                          }
                        })),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 50,),
          MiniPlaybackBar()
        ],
      ),
    );
  }
}
