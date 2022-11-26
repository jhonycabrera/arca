import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../environment/db/db_arca.dart';
import '../../models/Categoria.dart';
import '../../models/Mascota.dart';
import '../../models/Raza.dart';
import '../../x/adoptar_provider.dart';
import '../../x/animal_provider.dart';
import '../../x/categoria_provider.dart';
import '../../widgets/dropdown_button2.dart';
import '../InfoAnimal/InfoAnimal_page.dart';
import '../InfoAnimal/infoAnimal_controller.dart';
import '../navegation/navegationDrawer_page.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;

  bool isDrawerOpen = false;
  HomeController homeController = Get.put(HomeController());
  InfoAnimalController infoAnimalController = Get.put(InfoAnimalController());
  GlobalKey<FormFieldState> keyRaza = GlobalKey<FormFieldState>();
  List<RazaModel> razas = [];
  List<RazaModel> razasAux = [];

  CategoriaProvider categoriaProvider = CategoriaProvider();
  AnimalsProvider animalsProvider = AnimalsProvider();
  AdoptarProvider adoptarProvider = AdoptarProvider();

  List<MascotaModel> mascotasA = [];
  List<MascotaModel> mascotasAux = [];
  List<MascotaModel> mascotasAuxDB = [];
  List<CategoriaModel> listacategoria = [];
  String idRazaValue = "0";
  String idCategoriaValue = "0";

  listAllRazas() async {
    razas = await adoptarProvider.getListarRaza();
    RazaModel razaModel = RazaModel(
        idRaza: "0",
        nombre: "TODOS",
        descripcion: "",
        origen: "",
        usuarioCreacion: "",
        estado: "1",
        nombres: "",
        apellidos: "");
    razas.add(razaModel);
    razas.sort((a, b) => a.idRaza.compareTo(b.idRaza));
    setState(() {});
  }

  listAllCategories() async {
    listacategoria = await categoriaProvider.getListarCategoria();
    CategoriaModel categoriaModel = CategoriaModel(
        idCategoria: "0",
        descripcion: "Todos",
        nombres: "Todos",
        apellidos: "",
        imagen:
            "https://cdn0.iconfinder.com/data/icons/google-material-design-3-0/48/ic_clear_all_48px-512.png");
    listacategoria.add(categoriaModel);
    listacategoria.sort((a, b) => a.idCategoria.compareTo(b.idCategoria));
    setState(() {});
  }

  bool isLoading = false;

  listAllAnimals() async {
    mascotasAux = await animalsProvider.getListarMascotas();
    mascotasAuxDB = await DBArca.db.getMascotas();
    for (var element in mascotasAux) {
      if (mascotasAuxDB.isEmpty) {
        DBArca.db.insertAllMascotaRaw(element);
      } else {
        DBArca.db.updateMascota(element);
      }

      //DBArca.db.updateMascota(element);
    }

    setState(() {});
  }

  /*
  changedRazaCategoria(String idRaza, String idCategoria) async {
    if (idRaza.isNotEmpty && idCategoria.isNotEmpty) {
      /*
      if (idRaza == "0" && idCategoria == "0") {
        mascotasA = await animalsProvider.getListarMascotas();
        setState(() {});
      }

      if (idRaza != "0" && idCategoria != "0") {
        mascotasA = await animalsProvider.getListarMascotas();
        mascotasA = mascotasA
            .where((element) =>
                element.idRaza == idRaza && element.idCategoria == idCategoria)
            .toList();
        setState(() {});
      }

       */

      if (idRaza != "0" && idCategoria == "0") {
        mascotasA = await animalsProvider.getListarMascotas();
        setState(() {});
        mascotasA =
            mascotasA.where((element) => element.idRaza == idRaza).toList();
        setState(() {});
      }
      if (idRaza == "0" && idCategoria != "0") {
        mascotasA = await animalsProvider.getListarMascotas();
        setState(() {});
        mascotasA = mascotasA
            .where((element) => element.idCategoria == idCategoria)
            .toList();
        setState(() {});
      }
    }
    setState(() {});
  }


   */

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DBArca.db.initDB();
    idRazaValue = "0";
    idCategoriaValue = "0";
    listAllCategories();
    listAllRazas();
    listAllAnimals();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const NavegationDrawerPage(),
          AnimatedContainer(
            transform: Matrix4.translationValues(xOffset, yOffset, 0)
              ..scale(scaleFactor)
              ..rotateY(isDrawerOpen ? -0.5 : 0),
            duration: const Duration(milliseconds: 250),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(isDrawerOpen ? 40 : 0.0),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        isDrawerOpen
                            ? IconButton(
                                icon: const Icon(Icons.arrow_back_ios),
                                onPressed: () {
                                  setState(() {
                                    xOffset = 0;
                                    yOffset = 0;
                                    scaleFactor = 1;
                                    isDrawerOpen = false;
                                  });
                                },
                              )
                            : IconButton(
                                icon: const Icon(Icons.menu),
                                onPressed: () {
                                  setState(() {
                                    xOffset = 230;
                                    yOffset = 150;
                                    scaleFactor = 0.6;
                                    isDrawerOpen = true;
                                  });
                                }),
                        Column(
                          children: [
                            const Text('Localización'),
                            Row(
                              children: const [
                                Icon(
                                  Icons.location_on,
                                  color: Color(0xff416d6d),
                                ),
                                Text('La Libertada, Trujillo'),
                              ],
                            )
                          ],
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.black,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: const Icon(Icons.person),
                          ),
                        )
                      ],
                    ),
                  ),
                  /*
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    child: SearchText(
                      hintText: "Buscar mascota por raza",
                      active: false,
                      icons: Icons.search,
                    ),
                  ),

                   */
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    child: DropdownButtonFormField2(
                      key: homeController.keyRaza,
                      focusColor: Colors.white,
                      //value: con.color.isNotEmpty ? con.sexo : "MACHO",
                      selectedItemHighlightColor: Colors.white,
                      decoration: InputDecoration(
                        //Add isDense true and zero Padding.
                        //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                        filled: true,
                        hoverColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                              const BorderSide(color: Colors.white, width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          // width: 0.0 produces a thin "hairline" border
                          borderSide:
                              const BorderSide(color: Colors.white, width: 2.0),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: OutlineInputBorder(
                          // width: 0.0 produces a thin "hairline" border
                          borderSide:
                              const BorderSide(color: Colors.white, width: 2.0),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          // width: 0.0 produces a thin "hairline" border
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                              const BorderSide(color: Colors.white, width: 2.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          // width: 0.0 produces a thin "hairline" border
                          borderSide:
                              const BorderSide(color: Colors.white, width: 2.0),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusColor: Colors.red,
                        fillColor: Colors.white,
                        //Add more decoration as you want here
                        //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                      ),
                      isExpanded: true,
                      hint: const Text(
                        'Filtrar por Raza',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF3A4F83)),
                      ),
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black45,
                      ),
                      iconSize: 30,
                      buttonHeight: 60,
                      buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                      dropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color(0XFFF0F0F0)),
                      items: razas
                          .map(
                            (item) => DropdownMenuItem<String>(
                              value: item.idRaza,
                              child: Text(
                                item.nombre,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                      validator: (value) {
                        if (value == null) {
                          return 'Por favor selecciona la raza';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        idRazaValue = value!;
                        setState(() {});
                      },
                      onSaved: (value) {},
                    ),
                  ),
                  /*
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    margin: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.search),
                        Text('Buscar mascota para adoptar'),
                        Icon(Icons.settings)
                      ],
                    ),
                  ),

                   */
                  SizedBox(
                    height: 120,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: listacategoria.length,
                      itemBuilder: (context, index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            InkWell(
                              onTap: () {
                                idCategoriaValue =
                                    listacategoria[index].idCategoria;
                                setState(() {});
                              },
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                margin: const EdgeInsets.only(left: 20),
                                decoration: BoxDecoration(
                                    color: idCategoriaValue ==
                                            listacategoria[index].idCategoria
                                        ? Colors.blue
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Image.network(
                                      listacategoria[index].imagen,
                                      height: 70,
                                      width: 73,
                                    ),
                                    Text(listacategoria[index].descripcion)
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  /* SizedBox(
                    height: 120,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return Container(
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                margin: EdgeInsets.only(left: 20),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: shadowList,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Image.asset(
                                  categories[index]['iconPath'],
                                  height: 50,
                                  width: 50,
                                  color: Colors.grey[700],
                                ),
                              ),
                              Text(categories[index]['name'])
                            ],
                          ),
                        );
                      },
                    ),
                  ),

                  */
                  SizedBox(
                    height: 550,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        listaAnimales(context, idRazaValue, idCategoriaValue),
                      ],
                    ),
                  ),
                  /*
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => InfoAnimalPage()));
                    },
                    child: Container(
                      height: 240,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.blueGrey[300],
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: shadowList,
                                  ),
                                  margin: EdgeInsets.only(top: 50),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                              child: Container(
                            margin: EdgeInsets.only(top: 60, bottom: 20),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: shadowList,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20))),
                          ))
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Ejemplo()));
                    },
                    child: Container(
                      height: 240,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.blueGrey[300],
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: shadowList,
                                  ),
                                  margin: EdgeInsets.only(top: 50),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                              child: Container(
                            margin: EdgeInsets.only(top: 60, bottom: 20),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: shadowList,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20))),
                          ))
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => InfoAnimalPage()));
                    },
                    child: Container(
                      height: 240,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.blueGrey[300],
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: shadowList,
                                  ),
                                  margin: EdgeInsets.only(top: 50),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                              child: Container(
                            margin: EdgeInsets.only(top: 60, bottom: 20),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: shadowList,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20))),
                          ))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  )
                  */
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget listaAnimales(
      BuildContext context, String idRaza, String idCategoria) {
    HomeController homeController = Get.put(HomeController());
    Future<void> addORDeleteFavourite(String? idMascota, String result) async {
      result == "false" || result.isEmpty
          ? await DBArca.db.updateIsFavouriteMascota(idMascota)
          : await DBArca.db.updateIsNotFavouriteMascota(idMascota);

      setState(() {});
    }

    Widget child;
    if (idRaza != "0" && idCategoria != "0") {
      child = Expanded(
        flex: 3,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder(
            future: DBArca.db.getMascotaRazaCategoria(idRaza, idCategoria),
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
                                        image: NetworkImage(
                                            mascotas[index].imagen1),
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
                                      addORDeleteFavourite(
                                          mascotas[index].idMascota,
                                          mascotas[index].favorito!);
                                      //infoAnimalController.addOrNotFavorite2();
                                    },
                                    padding: EdgeInsets.zero,
                                    icon: Icon(
                                      Icons.favorite,
                                      size: 15,
                                      color: mascotas[index].favorito == "true"
                                          ? const Color(0XFF4760FF)
                                          : Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
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
                                      color: const Color(0XFF000000),
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
                                      color: const Color(0XFFBCBABE)),
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
                            const SizedBox(
                              height: 8,
                            ),
                            InkWell(
                              onTap: () {
                                homeController.eliminarMascota();
                                homeController
                                    .seleccionarMascota(mascotas[index]);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const InfoAnimalPage()));
                              },
                              child: Container(
                                height: 40,
                                decoration: BoxDecoration(
                                    color: const Color(0xFF3D4E80),
                                    borderRadius: BorderRadius.circular(24.0)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/images/perro.png",
                                        color: Colors.white,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      const Center(
                                        child: Text(
                                          "ADOPTAR",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
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
        ),
      );
    } else if (idRaza != "0" && idCategoria == "0") {
      child = Expanded(
        flex: 3,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder(
            future: DBArca.db.getMascotaRaza(idRaza),
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
                                        image: NetworkImage(
                                            mascotas[index].imagen1),
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
                                      addORDeleteFavourite(
                                          mascotas[index].idMascota,
                                          mascotas[index].favorito!);
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
                            const SizedBox(
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
                            InkWell(
                              onTap: () {
                                homeController.eliminarMascota();
                                homeController
                                    .seleccionarMascota(mascotas[index]);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            InfoAnimalPage()));
                              },
                              child: Container(
                                height: 40,
                                decoration: BoxDecoration(
                                    color: Color(0xFF3D4E80),
                                    borderRadius: BorderRadius.circular(24.0)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/images/perro.png",
                                        color: Colors.white,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      const Center(
                                        child: Text(
                                          "ADOPTAR",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
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
        ),
      );
    } else if (idRaza == "0" && idCategoria != "0") {
      child = Expanded(
        flex: 3,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder(
            future: DBArca.db.getMascotaCategoria(idCategoria),
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
                                        image: NetworkImage(
                                            mascotas[index].imagen1),
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
                                      addORDeleteFavourite(
                                          mascotas[index].idMascota,
                                          mascotas[index].favorito!);
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
                            InkWell(
                              onTap: () {
                                homeController.eliminarMascota();
                                homeController
                                    .seleccionarMascota(mascotas[index]);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            InfoAnimalPage()));
                              },
                              child: Container(
                                height: 40,
                                decoration: BoxDecoration(
                                    color: Color(0xFF3D4E80),
                                    borderRadius: BorderRadius.circular(24.0)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/images/perro.png",
                                        color: Colors.white,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      const Center(
                                        child: Text(
                                          "ADOPTAR",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
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
        ),
      );
    } else {
      child = Expanded(
        flex: 3,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder(
            future: DBArca.db.getMascotasActivos(),
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
                                        image: NetworkImage(
                                            mascotas[index].imagen1),
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
                                      addORDeleteFavourite(
                                          mascotas[index].idMascota,
                                          mascotas[index].favorito!);
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
                            InkWell(
                              onTap: () {
                                homeController.eliminarMascota();
                                homeController
                                    .seleccionarMascota(mascotas[index]);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            InfoAnimalPage()));
                              },
                              child: Container(
                                height: 40,
                                decoration: BoxDecoration(
                                    color: Color(0xFF3D4E80),
                                    borderRadius: BorderRadius.circular(24.0)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/images/perro.png",
                                        color: Colors.white,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      const Center(
                                        child: Text(
                                          "ADOPTAR",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
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
        ),
      );
    }
    return child;
  }
}

List<Map> categories = [
  {'name': 'Gato', 'iconPath': 'assets/images/cat.png'},
  {'name': 'Perro', 'iconPath': 'assets/images/dog.png'},
];

List<BoxShadow> shadowList = [
  BoxShadow(
      color: Color.fromARGB(255, 226, 226, 226),
      blurRadius: 30,
      offset: Offset(0, 10))
];
