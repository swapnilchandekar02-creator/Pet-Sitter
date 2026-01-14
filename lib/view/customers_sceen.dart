import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import 'package:flutter_svg/flutter_svg.dart';
import "package:pet_sitter/view/pawprints_screen.dart"; 
import "package:pet_sitter/view/services_screen.dart";

class CustomersScreen extends StatefulWidget {
  const CustomersScreen({super.key});

  @override
  State<CustomersScreen> createState() => _CustomersScreenState();
}

class _CustomersScreenState extends State<CustomersScreen> {
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
      extendBody: true, // Allows content to go behind the bottom nav
      backgroundColor: const Color.fromRGBO(90, 148, 236, 1),
      
      // SOLUTION: Use CustomScrollView with SliverFillRemaining
      body: CustomScrollView(
        slivers: [
          // 1. The Top Blue Section (Scrolls normally)
          SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(height: 60),
                Row(
                  children: [
                    const SizedBox(width: 180),
                    Expanded(
                      child: Text("Sitter",
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
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PawprintsScreen()),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Text(
                            "PawPrints",
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
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 10),
                        decoration: BoxDecoration(
                            color: Colors.yellow, 
                            borderRadius: BorderRadius.circular(25)),
                        child: Text("Customers",
                            style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.black)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 353,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 40,
                        width: 270, 
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.search, color: Colors.grey, size: 20),
                            const SizedBox(width: 10),
                            Text("Search..",
                                style: GoogleFonts.poppins(
                                    fontSize: 12, color: Colors.grey))
                          ],
                        ),
                      ),
                      Container(
                        child: Image.asset("assets/images/Frame 35184.png", height: 36, width: 36,),
                      ),
                      Container(
                        child: Image.asset("assets/images/Frame 35185.png", height: 36, width: 36,),),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),

          // 2. The White List Section (Fills ALL remaining space)
          SliverFillRemaining(
            hasScrollBody: false, // Ensures the container stretches if list is short
            child: Container(
              width: 420, 
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(26),
                      topRight: Radius.circular(26))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),

                  customerCard(
                    name: "Carlitta Pusso",
                    details: "Lara   |   Sheltie",
                    gender: "Female",
                    petType: "Guinea Pig",
                    petColor: const Color.fromRGBO(255, 105, 180, 1), 
                  ),
                  Container(
                    width: 353,
                    height: 1,
                    color: const Color.fromRGBO(240, 240, 240, 1),
                  ),
                  const SizedBox(height: 20),

                  customerCard(
                    name: "Carlitta Pusso",
                    details: "Lara   |   Sheltie",
                    gender: "Female",
                    petType: "Dog",
                    petColor: const Color.fromRGBO(139, 69, 19, 1), 
                  ),
                  Container(
                    width: 353,
                    height: 1,
                    color: const Color.fromRGBO(240, 240, 240, 1),
                  ),
                  const SizedBox(height: 20),

                  customerCard(
                    name: "Carlitta Pusso",
                    details: "Lara   |   Sheltie",
                    gender: "Female",
                    petType: "Hamster",
                    petColor: const Color.fromRGBO(255, 165, 0, 1), 
                  ),
                  Container(
                    width: 353,
                    height: 1,
                    color: const Color.fromRGBO(240, 240, 240, 1),
                  ),
                  const SizedBox(height: 20),

                  customerCard(
                    name: "Carlitta Pusso",
                    details: "Lara   |   Sheltie",
                    gender: "Female",
                    petType: "Cat",
                    petColor: Colors.black54, 
                  ),
                  Container(
                    width: 353,
                    height: 1,
                    color: const Color.fromRGBO(240, 240, 240, 1),
                  ),
                  const SizedBox(height: 20),

                  // Bottom padding to ensure content clears the floating nav bar
                  const SizedBox(height: 150),
                ],
              ),
            ),
          )
        ],
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

              if (index == 0) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PawprintsScreen(),
                  ),
                );
              } else if (index == 1) {
                // stay on sitter
              } else {
                Navigator.pop(context);
              }
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            elevation: 0,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedFontSize: 0,
            unselectedFontSize: 0,
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
                icon: navItem("assets/svg/Icon container (1).svg", "Agenda", 2),
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
            ],
          ),
        ),
      ),
    );
  }

  Widget customerCard({
    required String name,
    required String details,
    required String gender,
    required String petType,
    required Color petColor,
  }) {
    return Container(
      width: 353,
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage("assets/images/Ellipse 1199.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 15),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                details,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                gender,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: Colors.black,
                ),
              ),
            ],
          ),

          const Spacer(),

          Container(
            width: 110, 
            padding: const EdgeInsets.symmetric(vertical: 6),
            margin: const EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: petColor, width: 2), 
            ),
            alignment: Alignment.center, 
            child: Text(
              petType,
              style: GoogleFonts.poppins(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: Colors.black54,
              ),
            ),
          )
        ],
      ),
    );
  }
}