import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universe/app_colors.dart';
import 'package:universe/classes/planet.dart';
import 'package:universe/providers/main_provider.dart';
import 'package:universe/screens/planet_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> planetsList = [
    "assets/images/planets/1.png",
    "assets/images/planets/22.png",
    "assets/images/planets/33.png",
    "assets/images/planets/44.png",
    "assets/images/planets/55.png",
    "assets/images/planets/66.png",
    "assets/images/planets/77.png",
    "assets/images/planets/88.png"
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<MainProvider>(context, listen: false).getPlanets();
    });
  }

  @override
  Widget build(BuildContext context) {
    final mainProvider = Provider.of<MainProvider>(context);
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/images/background.jpg',
                ),
                fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 100,
                decoration: BoxDecoration(color: Colors.black),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Explore',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.arrow_drop_down_circle_outlined,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'News & Update',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Contact Us',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Google Earth',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset(
                              'assets/images/logo.jpg',
                              width: 70,
                              height: 70,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CarouselSlider(
                  items: planetsList.map((item) {
                    return Container(
                      height: 400,
                      child: ClipRRect(
                        child: Image.asset(item),
                      ),
                    );
                  }).toList(),
                  options: CarouselOptions(
                    height: 400,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.8,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.3,
                    //onPageChanged: callbackFunction,
                    scrollDirection: Axis.horizontal,
                  )),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "About Solar System",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'The solar system has eight planets: Mercury, Venus, Earth, Mars, Jupiter, Saturn, Uranus, and Neptune. There are five officially recognized dwarf planets in our solar system: Ceres, Pluto, Haumea, Makemake, and Eris.',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
              mainProvider.isLoading
                  ? CircularProgressIndicator()
                  : Container(
                      width: double.infinity,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  color: AppColors.accentBlue,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "What is a planet?",
                                  style: TextStyle(fontSize: 20),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Inner Planets',
                              style: TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "The first four planets from the Sun are Mercury, Venus, Earth, and Mars. These inner planets also are known as terrestrial planets because they have solid surfaces. ",
                              style: TextStyle(
                                  color: AppColors.borderGray, fontSize: 14),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: 400,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: List.generate(4, (index) {
                                    return planetBox(
                                        mainProvider.planets[index]);
                                  }),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Outer Planets ',
                              style: TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "The giant planets in our outer solar system don't have hard surfaces and instead have swirling gases above a core. Jupiter and Saturn are gas giants. Uranus and Neptune are ice giants. ",
                              style: TextStyle(
                                  color: AppColors.borderGray, fontSize: 14),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: 400,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 4,
                                  itemBuilder: (BuildContext context, index) {
                                    return planetBox(
                                        mainProvider.planets[index + 4]);
                                  }),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Dwarf Planets ',
                              style: TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Beyond Neptune, a newer class of smaller worlds called dwarf planets reign, including longtime favorite Pluto. The other dwarf planets are Ceres, Makemake, Haumea, and Eris. Ceres is the only dwarf planet in the inner solar system. It's located in the main asteroid belt between Mars and Jupiter.",
                              style: TextStyle(
                                  color: AppColors.borderGray, fontSize: 14),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: 400,
                              child: GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4, // Number of columns
                                  childAspectRatio:
                                      0.75, // Adjust as needed to fit your design
                                  crossAxisSpacing:
                                      10.0, // Spacing between columns
                                  mainAxisSpacing: 10.0, // Spacing between rows
                                ),
                                itemCount: 5,
                                itemBuilder: (BuildContext context, index) {
                                  return planetBox(
                                      mainProvider.planets[index + 8]);
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }

  Widget planetBox(Planet myPlanet) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      width: 350,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
                color: myPlanet.imageUrl.contains("dwarfs")
                    ? Colors.black
                    : Colors.transparent,
                image: myPlanet.imageUrl.contains("dwarfs")
                    ? null
                    : DecorationImage(
                        image: AssetImage(
                          'assets/images/background.jpg',
                        ),
                        fit: BoxFit.cover)),
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Image.asset(
                myPlanet.imageUrl,
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "${myPlanet.name} Facts",
            textAlign: TextAlign.start,
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Text("${myPlanet.shortDescription}"),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Text(
                "Explore ${myPlanet.name}",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 20,
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PlanetDetailPage(planet: myPlanet),
                    ),
                  );
                },
                icon: Icon(
                  Icons.arrow_circle_right_outlined,
                  color: AppColors.accentPurple,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
