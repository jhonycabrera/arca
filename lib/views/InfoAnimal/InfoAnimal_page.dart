import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyecto_veterinaria_arca/views/InfoAnimal/panoram_page.dart';
import '../home/mascota_controller.dart';
import '../requestAdoption/requestAdoption_page.dart';

class InfoAnimalPage extends StatefulWidget {
  const InfoAnimalPage({super.key});

  @override
  State<InfoAnimalPage> createState() => _InfoAnimalPageState();
}

class _InfoAnimalPageState extends State<InfoAnimalPage> {
  MascotaController conMascota = Get.put(MascotaController());
  int _currentIndex = 0;

  late List<String> imgList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imgList = [
      conMascota.mascotaModel.imagen1,
      conMascota.mascotaModel.imagen2,
      conMascota.mascotaModel.imagen3,
    ];
  }

  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: Stack(
            children: [
              Positioned.fill(
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        color: Colors.blueGrey[300],
                        child: Padding(
                          padding:
                              const EdgeInsets.only(top: 30, left: 8, right: 8),
                          child: Column(
                            children: [
                              const Text(
                                "ADOPCIONES",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25),
                              ),
                              const SizedBox(
                                height: 35,
                              ),
                              CarouselSlider.builder(
                                itemCount: imgList.length,
                                carouselController: _controller,
                                itemBuilder: (BuildContext context,
                                        int itemIndex, int pageViewIndex) =>
                                    InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => PanoramaPage(
                                                  image: imgList[itemIndex],
                                                )));
                                  },
                                  child: Container(
                                    width: 350,
                                    height: 350,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(24),
                                      image: DecorationImage(
                                          image:
                                              NetworkImage(imgList[itemIndex]),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                ),
                                options: CarouselOptions(
                                  autoPlay: true,
                                  height: 200,
                                  enlargeCenterPage: true,
                                  onPageChanged: (index, reason) {
                                    setState(
                                      () {
                                        _currentIndex = index;
                                      },
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: imgList.asMap().entries.map((entry) {
                                  return GestureDetector(
                                    onTap: () =>
                                        _controller.animateToPage(entry.key),
                                    child: Container(
                                      width: 12.0,
                                      height: 12.0,
                                      margin: EdgeInsets.symmetric(
                                          vertical: 8.0, horizontal: 4.0),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color:
                                              (Theme.of(context).brightness ==
                                                          Brightness.dark
                                                      ? Colors.white
                                                      : Colors.black)
                                                  .withOpacity(
                                                      _currentIndex == entry.key
                                                          ? 0.9
                                                          : 0.4)),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 25, right: 25, top: 70),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Text(
                                      "Categoria : ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    Text(
                                      conMascota.mascotaModel.categoria,
                                      style: const TextStyle(fontSize: 15),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      "Raza : ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    Text(
                                      conMascota.mascotaModel.raza,
                                      style: const TextStyle(fontSize: 15),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      "Color : ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    Text(
                                      conMascota.mascotaModel.color,
                                      style: const TextStyle(fontSize: 15),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      "Genero : ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    Text(
                                      conMascota.mascotaModel.genero,
                                      style: const TextStyle(fontSize: 15),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      "Edad : ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    Text(
                                      conMascota.mascotaModel.edad,
                                      style: const TextStyle(fontSize: 15),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      "Nro Vacunas : ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    Text(
                                      conMascota.mascotaModel.vacunas,
                                      style: const TextStyle(fontSize: 15),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      "Esterilizado : ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    Text(
                                      conMascota.mascotaModel.esterelizado ==
                                              "1"
                                          ? "SI"
                                          : "NO",
                                      style: const TextStyle(fontSize: 15),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 40),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          conMascota.goToHomePage();
                        },
                      ),
                      IconButton(
                          icon: const Icon(Icons.share), onPressed: () {})
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 100,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: shadowList,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(
                      conMascota.mascotaModel.descripcion.toUpperCase(),
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 60,
                        width: 70,
                        decoration: BoxDecoration(
                            color: const Color(0xff416d6d),
                            borderRadius: BorderRadius.circular(20)),
                        child: IconButton(
                          icon: const Icon(Icons.favorite_rounded),
                          color: conMascota.checkboxValue.isTrue
                              ? Colors.red
                              : Colors.white,
                          onPressed: () {
                            conMascota
                                .actualizarMascota(conMascota.mascotaModel);
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const RequestAdoption()));
                          },
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                                color: const Color(0xff416d6d),
                                borderRadius: BorderRadius.circular(20)),
                            child: const Center(
                              child: Text(
                                'Adoptar',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 24),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

List<BoxShadow> shadowList = [
  const BoxShadow(
      color: Color.fromARGB(255, 224, 224, 224),
      blurRadius: 30,
      offset: Offset(0, 10))
];
