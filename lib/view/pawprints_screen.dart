import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import 'package:flutter_svg/flutter_svg.dart';
import "package:pet_sitter/view/customers_sceen.dart";
import "package:pet_sitter/view/services_screen.dart";

class PawprintsScreen extends StatefulWidget {
  const PawprintsScreen({super.key});

  @override
  State<PawprintsScreen> createState() => _PawprintsScreenState();
}

class _PawprintsScreenState extends State<PawprintsScreen> {
  int _currentIndex = 1; 

  Widget navItem(String asset, String label, int index) {
    final isSelected = _currentIndex == index;

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (isSelected)
          Container(
            height: 6,
            width: 6,
            decoration: const BoxDecoration(
              color: Colors.yellow,
              shape: BoxShape.circle,
            ),
          )
        else
          const SizedBox(height: 6),
        const SizedBox(height: 4),
        asset.endsWith(".svg")
            ? SvgPicture.asset(
                asset,
                height: 30,
              )
            : Image.asset(
                asset,
                height: 30,
              ),
        const SizedBox(height: 4),
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 11,
            color: isSelected
                ? Colors.black
                : const Color.fromRGBO(157, 178, 206, 1),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: const Color.fromRGBO(90, 148, 236, 1),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 0),
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 60),
            Row(
              children: [
                const SizedBox(width: 160),
                Expanded(
                  child: Text("Pet Sitter",
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600)),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: SvgPicture.asset("assets/svg/Edit Button.svg",
                      height: 30, width: 30),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              height: 48,
              width: 353,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(255, 255, 255, 1),
                  borderRadius: BorderRadius.circular(30)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 5),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(25)),
                    child: Text("PawPrints",
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.black)),
                  ),
                  
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ServicesScreen()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Text(
                        "Services",
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey),
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CustomersScreen()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Text(
                        "Customers",
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 353,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 31,
                    width: 82,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 9, vertical: 6),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18)),
                    child: Text(
                      "This Week",
                      style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ),
                  Container(
                    height: 31,
                    width: 82,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18)),
                    child: Text(
                      "This Month",
                      style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ),
                  Container(
                    height: 31,
                    width: 82,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 11, vertical: 6),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18)),
                    child: Text(
                      "This Year",
                      style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ),
                  Container(
                    height: 31,
                    width: 82,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18)),
                    child: Text(
                      "All Time",
                      style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),

            Container(
              width: 420,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(26),
                      topRight: Radius.circular(26))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  Text("Your Pet Sitting Performance",
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black)),
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    childAspectRatio: 167 / 119,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    padding: const EdgeInsets.all(16),
                    children: [
                      gridItem1(),
                      gridItem2(),
                      gridItem3(),
                      gridItem4(),
                    ],
                  ),
                  const SizedBox(height: 5),
                  SvgPicture.asset("assets/svg/Group 19865.svg",
                      height: 12, width: 26),
                  const SizedBox(height: 5),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            "Overall Ratings",
                            style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ))),
                  const SizedBox(height: 10),
                  Container(
                    height: 100,
                    width: 352,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(13),
                          topRight: Radius.circular(13)),
                      color: Color.fromRGBO(249, 249, 249, 1),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(width: 25),
                        Text(
                          "4.8",
                          style: GoogleFonts.poppins(
                              fontSize: 32, fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(width: 150),
                        SvgPicture.asset("assets/svg/DIV.svg",
                            height: 23, width: 107),
                      ],
                    ),
                  ),
                  Container(
                    height: 24,
                    width: 352,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(13),
                          bottomRight: Radius.circular(13)),
                      color: Color.fromRGBO(243, 243, 243, 1),
                    ),
                    child: Image.asset(
                      "assets/images/Icon (1).png",
                      height: 6,
                      width: 22,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            "Recent Reviews",
                            style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ))),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 350,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(13),
                              color: const Color.fromRGBO(249, 249, 249, 1)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15, top: 15),
                                    child: SvgPicture.asset(
                                        "assets/svg/Ellipse 1198.svg",
                                        height: 45,
                                        width: 45),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 15, right: 15),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Avantika Agarwal",
                                                style: GoogleFonts.poppins(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              Text(
                                                "2 Days ago",
                                                style: GoogleFonts.poppins(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.grey),
                                              ),
                                            ],
                                          ),
                                          SvgPicture.asset(
                                              "assets/svg/yellowStars.svg",
                                              height: 12,
                                              width: 80),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15),
                                child: Text(
                                  "Michael is amazing with pets! He took exceptional care of my two cats while I was away. He took exceptional care of my two cats while I was away.",
                                  style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      color:
                                          const Color.fromRGBO(75, 85, 99, 1)),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Padding(
                          padding: const EdgeInsets.only(top: 60),
                          child: SvgPicture.asset("assets/svg/Group 19866.svg",
                              height: 30, width: 30),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 120),
                ],
              ),
            )
          ],
        ),
      ),

      bottomNavigationBar: Container(
        height: 120, 
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12, 
              blurRadius: 10,
              spreadRadius: 2, 
              offset: Offset(0, -2), 
            )
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          child: BottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              elevation: 0,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedFontSize: 0.0,
              unselectedFontSize: 0.0,
              items: [
                BottomNavigationBarItem(
                  icon: navItem("assets/svg/Icon container.svg", "Home", 0),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: navItem("assets/images/Frame 35158.jpg", "Sitter", 1),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: navItem(
                      "assets/svg/Icon container (1).svg", "Agenda", 2),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: navItem("assets/svg/State layer.svg", "Earning", 3),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: navItem("assets/svg/State layer (1).svg", "Chats", 4),
                  label: "",
                ),
              ]),
        ),
      ),
    );
  }
}


Widget gridItem1() {
  return Container(
    padding: const EdgeInsets.only(left: 20),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: const [
        BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(0, 0))
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Text("Views",
                  style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromRGBO(90, 148, 236, 1))),
            ),
            Text("999,000",
                style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black)),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Image.asset("assets/images/viewsIcon.png",
                      height: 52, width: 52),
                )
              ],
            )
          ],
        )
      ],
    ),
  );
}

Widget gridItem2() {
  return Container(
    padding: const EdgeInsets.only(left: 20),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: const [
        BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(0, 0))
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Text("Likes",
                  style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromRGBO(255, 0, 0, 1))),
            ),
            Text("999,000",
                style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black)),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Image.asset("assets/images/heartIcon.jpg",
                      height: 52, width: 52),
                )
              ],
            )
          ],
        )
      ],
    ),
  );
}

Widget gridItem3() {
  return Container(
    padding: const EdgeInsets.only(left: 20),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: const [
        BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(0, 0))
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Text("Bookings",
                  style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromRGBO(90, 148, 236, 1))),
            ),
            Text("999,000",
                style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black)),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Image.asset("assets/images/bookingIcon.png",
                      height: 52, width: 52),
                )
              ],
            )
          ],
        )
      ],
    ),
  );
}

Widget gridItem4() {
  return Container(
    padding: const EdgeInsets.only(left: 20),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: const [
        BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(0, 0))
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Text("Earnings",
                  style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromRGBO(8, 148, 114, 1))),
            ),
            Text("999,000",
                style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black)),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset("assets/images/image 283.png",
                          width: 43, height: 43, fit: BoxFit.cover),
                      Image.asset("assets/images/Ellipse 3132.png",
                          width: 22, height: 22),
                    ],
                  ),
                )
              ],
            )
          ],
        )
      ],
    ),
  );
}
