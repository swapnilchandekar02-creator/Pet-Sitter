import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import 'package:flutter_svg/flutter_svg.dart';
import "package:pet_sitter/view/customers_sceen.dart";
import "package:pet_sitter/view/pawprints_screen.dart";

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
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

                  
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 10),
                    decoration: BoxDecoration(
                        color: Colors.yellow, 
                        borderRadius: BorderRadius.circular(25)),
                    child: Text("Services",
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

            
            Container(
              width: 420,
              constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height - 200),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(26),
                      topRight: Radius.circular(26))),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  
                  
                  serviceCard(
                    title: "Day Care",
                    subtitle: "Pet day care facility\nShort stays up to 12 hrs.",
                    status: "Active",
                    isActive: true,
                  ),

                  const SizedBox(height: 20),

                  
                  serviceCard(
                    title: "Night Stay",
                    subtitle: "Pet night stay facility\nLonger overnight stays",
                    status: "Inactive",
                    isActive: false,
                  ),

                  const SizedBox(height: 150), 
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

                
                if (index == 0) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PawprintsScreen()),
                  );
                } 
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

 
  Widget serviceCard({
    required String title,
    required String subtitle,
    required String status,
    required bool isActive,
  }) {
    return Container(
      width: 353,
      height: 110,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color.fromRGBO(230, 230, 230, 1)),
          boxShadow: const [
            BoxShadow(
                color: Colors.black12, blurRadius: 4, offset: Offset(0, 2))
          ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Image.asset("assets/images/Frame 8963.png",
                width: 65, height: 69),
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                subtitle,
                style: GoogleFonts.poppins(
                  fontSize: 11,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: isActive
                  ? const Color.fromRGBO(10, 129, 106, 1)
                  : Colors.red,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              status,
              style: GoogleFonts.poppins(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}