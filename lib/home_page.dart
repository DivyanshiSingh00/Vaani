import 'package:flutter/material.dart';
import 'text_to_sign.dart'; // Make sure this import points to your TextToSignPage

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF9CB2E4).withOpacity(0.6),
                  Color(0xFF9CB2E4).withOpacity(0.1),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Column(
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: IconButton(
                  icon: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.menu, color: Color(0xFF3B4F7D)),
                  ),
                  onPressed: () {
                    // Add your drawer or navigation logic here
                  },
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Hello, Good Morning',
                        style: TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto',
                          color: Color(0xFF3B4F7D),
                        ),
                      ),
                      SizedBox(height: 20),
                      Expanded(
                        child: GridView.count(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          children: [
                            buildCard(
                              'TEXT TO SIGN',
                                  () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TextToSignPage(),
                                  ),
                                );
                              },
                            ),
                            buildCard(
                              'IMAGE TO SIGN',
                                  () {
                                // Add navigation for 'IMAGE TO SIGN'
                              },
                            ),
                            buildCard(
                              'VOICE TO SIGN',
                                  () {
                                // Add navigation for 'VOICE TO SIGN'
                              },
                            ),
                            buildCard(
                              'SIGN TO TEXT',
                                  () {
                                // Add navigation for 'SIGN TO TEXT'
                              },
                            ),
                            buildCard(
                              'OBJECT DETECTION',
                                  () {
                                // Add navigation for 'OBJECT DETECTION'
                              },
                            ),
                            buildCard(
                              'CHATBOT - ASK ME',
                                  () {
                                // Add navigation for 'CHATBOT - ASK ME'
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 8,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          iconSize: 28,
          selectedFontSize: 0,
          unselectedFontSize: 0,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: '',
            ),
          ],
        ),
      ),
    );
  }

  Card buildCard(String text, VoidCallback onTap) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              // Shadow for top and left edges
              BoxShadow(
                color: Colors.white.withOpacity(0.8),
                blurRadius: 10,
                spreadRadius: 2,
                offset: Offset(-3, -3),
              ),
              // Shadow for bottom and right edges
              BoxShadow(
                color: Color(0xFFBBC3CE).withOpacity(0.40),
                blurRadius: 8,
                spreadRadius: 2,
                offset: Offset(4, 4),
              ),
            ],
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF3B4F7D),
                  fontSize: 20,
                  fontFamily: 'IBMPlexMono',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
