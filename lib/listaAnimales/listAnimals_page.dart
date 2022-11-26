import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../environment/db/db_arca.dart';
import '../models/Mascota.dart';
import 'invite_list.dart';

class ListAnimals extends StatefulWidget {
  const ListAnimals({super.key});

  @override
  State<ListAnimals> createState() => _ListAnimalsState();
}

class _ListAnimalsState extends State<ListAnimals>
    with TickerProviderStateMixin {
  List<InviteFriend> inviteFriend = InviteFriend.inviteFriend;
  AnimationController? animationController;
  bool multiple = true;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    super.initState();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 0));
    return true;
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: FutureBuilder(
        future: DBArca.db.getMascotaFavourites(),
        builder: (BuildContext context, AsyncSnapshot snap) {
          if (snap.hasData) {
            List<MascotaModel> mascotas = snap.data;
            return GridView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 1.7),
              ),
              itemCount: mascotas.length,
              itemBuilder: (BuildContext ctx, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 6.0, vertical: 10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: shadowList,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                height: 70,
                                width: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                    NetworkImage(mascotas[index].imagen1),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 25,
                              height: 25,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.white38,
                                borderRadius: BorderRadius.circular(6.0),
                              ),
                              child: IconButton(
                                onPressed: () {
                                  //infoAnimalController.addOrNotFavorite2();
                                },
                                padding: EdgeInsets.zero,
                                icon: Icon(
                                  Icons.favorite,
                                  size: 15,
                                  color: mascotas[index].favorito == "true"
                                      ? Color(0XFF4760FF)
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              mascotas[index]
                                  .tamanio
                                  .toUpperCase()
                                  .toUpperCase(),
                              style: GoogleFonts.openSans(
                                  color: Color(0XFF000000),
                                  fontWeight: FontWeight.bold),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              mascotas[index].raza.toUpperCase(),
                              style: GoogleFonts.openSans(
                                  color: Color(0XFFBCBABE)),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        Center(
                          child: Container(
                            width: 120,
                            height: 3.5,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget appBar() {
    return SizedBox(
      height: AppBar().preferredSize.height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 8),
            child: Container(
              width: AppBar().preferredSize.height - 8,
              height: AppBar().preferredSize.height - 8,
            ),
          ),
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  'FAVORITOS',
                  style: TextStyle(
                    fontSize: 22,
                    color: Color(0xFF17262A),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, right: 8),
            child: Container(
              width: AppBar().preferredSize.height - 8,
              height: AppBar().preferredSize.height - 8,
              color: Colors.white,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius:
                      BorderRadius.circular(AppBar().preferredSize.height),
                  child: Icon(
                    multiple ? Icons.dashboard : Icons.view_agenda,
                    color: Color(0xFF313A44),
                  ),
                  onTap: () {},
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List<BoxShadow> shadowList = [
  BoxShadow(
      color: Color.fromARGB(255, 226, 226, 226),
      blurRadius: 30,
      offset: Offset(0, 10))
];


class InviteFriendView extends StatelessWidget {
  const InviteFriendView(
      {Key? key,
      this.listData,
      this.callBack,
      this.animationController,
      this.animation})
      : super(key: key);

  final InviteFriend? listData;
  final VoidCallback? callBack;
  final AnimationController? animationController;
  final Animation<double>? animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: animation!,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 50 * (1.0 - animation!.value), 0.0),
            child: AspectRatio(
              aspectRatio: 1.5,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: <Widget>[
                    Positioned.fill(
                      child: Image.asset(
                        listData!.imagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        splashColor: Colors.grey.withOpacity(0.2),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(4.0)),
                        onTap: callBack,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
