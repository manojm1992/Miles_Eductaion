import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:miles_education/section_widget.dart';

import 'models.dart';

class BottomNavBar extends StatefulWidget {
  final Home_Page_Model homePageModel;

  const BottomNavBar({super.key, required this.homePageModel});

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  // Pages for each tab
  List<Widget> get _pages => [
        HomeScreen(homePageModel: widget.homePageModel), // Home page
        const Center(child: Text('Videos', style: TextStyle(fontSize: 24))),
        const Center(child: Text('Trending', style: TextStyle(fontSize: 24))),
        const Center(child: Text('Events', style: TextStyle(fontSize: 24))),
        const Center(child: Text('Profile', style: TextStyle(fontSize: 24))),
      ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // Display selected page
      bottomNavigationBar: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // Semi-circular background
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 70,
              decoration: const BoxDecoration(
                color: Color(0xFF0B1226), // Dark background color
                borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
              ),
            ),
          ),

          // Bottom Navigation Bar with Image Assets
          BottomNavigationBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.white54,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            onTap: _onItemTapped,
            currentIndex: _selectedIndex,
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/Navbar/home.png',
                  color: _selectedIndex == 0 ? Colors.blue : Colors.white54,
                  width: 24,
                  height: 24,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/Navbar/Reels.png',
                  color: _selectedIndex == 1 ? Colors.blue : Colors.white54,
                  width: 24,
                  height: 24,
                ),
                label: 'Reels',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/Navbar/USP.png',
                  color: _selectedIndex == 2 ? Colors.blue : Colors.white54,
                  width: 24,
                  height: 24,
                ),
                label: 'USP',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/Navbar/event.png',
                  color: _selectedIndex == 3 ? Colors.blue : Colors.white54,
                  width: 24,
                  height: 24,
                ),
                label: 'Events',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/Navbar/profile.png',
                  color: _selectedIndex == 4 ? Colors.blue : Colors.white54,
                  width: 24,
                  height: 24,
                ),
                label: 'Profile',
              ),
            ],
            type: BottomNavigationBarType.fixed,
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final Home_Page_Model homePageModel;

  void _showTalkToUsSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Makes the bottom sheet full screen
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: Colors.white,
      builder: (BuildContext context) {
        return TalkToUsBottomSheet();
      },
    );
  }

  const HomeScreen({super.key, required this.homePageModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/New Logos 2024-01 4.png',
              fit: BoxFit.cover,
              height: 35,
              width: 120,
            ),
            IconButton(
              icon: const Icon(Icons.notifications_active_outlined,
                  color: Colors.white, size: 30),
              onPressed: () {
                // Add your notification icon action here
              },
            ),
          ],
        ),
        backgroundColor: Colors.black87,
      ),
      body: ListView(
        children: [
          // Stories Row
          Container(
            height: 102,
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: homePageModel.data?.length ?? 0,
              itemBuilder: (context, index) {
                final user = homePageModel.data![index];
                final profileImage = user.posts != null &&
                        user.posts!.isNotEmpty &&
                        user.posts![0].files != null &&
                        user.posts![0].files!.isNotEmpty
                    ? user.posts![0].files![0].imagePath
                    : null;

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: profileImage != null
                            ? NetworkImage(profileImage)
                            : const AssetImage('assets/Call 1.png')
                                as ImageProvider,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        user.name ?? 'Unknown',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 12),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 10),

          Row(
            children: [
              const SizedBox(
                child: Text(
                  ' Good Morning!\n Shivam',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.normal),
                ),
              ),
              const SizedBox(
                width: 150,
              ),
              GestureDetector(
                onTap: () => _showTalkToUsSheet(context),
                child: Container(
                  width: 80, // Adjust width based on your design
                  height: 40, // Adjust height based on your design
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30), // Rounded edges
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF283593), // Custom colors for gradient
                        Color(0xFF1E88E5),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    border: Border.all(
                      color: Colors.white, // White outline
                      width: 2,
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Talk to us!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Dynamic "LIVE YOUR AMERICAN DREAM" Section
          if (homePageModel.data != null && homePageModel.data!.isNotEmpty)
            Stack(
              children: [
                // Displaying the first entry in the data list as the featured section
                Image.network(
                  homePageModel.data![0].posts?[0].files?[0].imagePath ??
                      'assets/Frame 1261158473.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 200,
                ),
                Positioned(
                  left: 16,
                  bottom: 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        homePageModel.data![0].heading ?? 'LIVE YOUR',
                        style: const TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        homePageModel.data![0].name ?? 'AMERICAN DREAM',
                        style: const TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // ElevatedButton(
                      //   onPressed: () {},
                      //   style: ElevatedButton.styleFrom(
                      //     backgroundColor: Colors.orangeAccent,
                      //     shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(8),
                      //     ),
                      //   ),
                      //   child: const Text(
                      //     'Learn More',
                      //     style: TextStyle(color: Colors.white),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          const SizedBox(height: 20),

          // ListView of Sections
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: homePageModel.data?.length ?? 0,
            itemBuilder: (context, index) {
              final section = homePageModel.data![index];
              return SectionWidget(section: section);
            },
          ),
        ],
      ),
    );
  }
}

class TalkToUsBottomSheet extends StatelessWidget {
  const TalkToUsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.23, // Makes the bottom sheet almost full screen
      padding: const EdgeInsets.all(16.0),
      child: Column(
        // mainAxisSize: MainAxisSize.min,
         crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(), // For alignment purposes
              IconButton(
                icon: Icon(Icons.close, color: Colors.black87),
                onPressed: () => Navigator.pop(context), // Closes the bottom sheet
              ),
            ],
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Thank you for showing interest in us!!',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Our SPOC will be connecting with you \n shortly on your provided contact details.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black54),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
