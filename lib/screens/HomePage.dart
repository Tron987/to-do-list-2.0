import 'package:flutter/material.dart';
import 'package:to_do_list/screens/AddProject.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.notifications),
                onPressed: () {
                  // Handle notifications button press
                },
                color: Colors.purple, // Purple color for icon
              ),
              Positioned(
                right: 0,
                child: Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.circle, size: 8, color: Colors.black),
                ),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
Container(
  margin: EdgeInsets.all(16),
  child: Card(
    elevation: 4,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    color: Colors.blue,
    child: Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: const Text(
                  'Your Today\'s Task \n Almost Done',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.more_vert),
                color: Colors.white,
                onPressed: () {
                  // Handle option icon press
                },
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                constraints: BoxConstraints(maxWidth: 120), // Adjust the max width as needed
                child: ElevatedButton(
                  onPressed: () {
                    // Handle view task button press
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8), // Adjust padding as needed
                    foregroundColor: Colors.blue,
                    backgroundColor: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'View Task',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 45),
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 80,
                    height: 80,
                    child: CircularProgressIndicator(
                      value: 0.85, // Set your progress value here
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      strokeWidth: 4,
                    ),
                  ),
                  Text(
                    '85%',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  ),
),



            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'In Progress ',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '6',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Container(
                    height: screenHeight * 0.2, // Adjust the height as needed
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        SizedBox(width: 16), // Padding at the start
                        MiniCard(
                          backgroundColor: Color.fromARGB(255, 137, 192, 139),
                          icon: Icons.work,
                          title: 'Office project',
                          subtitle: 'Grocery shopping app design',
                          progressPercent: 60,
                          width: screenWidth * 0.7,
                          iconColor: Color.fromARGB(255, 243, 117, 159),
                          progressColor: Color.fromARGB(255, 93, 155, 236),
                        ),
                        SizedBox(width: 8),
                        MiniCard(
                          backgroundColor: Color.fromARGB(255, 189, 138, 155),
                          icon: Icons.person,
                          title: 'Personal project',
                          subtitle: 'Custom project details',
                          progressPercent: 40,
                          width: screenWidth * 0.7,
                          iconColor: Colors.blue,
                          progressColor: Color.fromARGB(255, 238, 148, 74),
                        ),
                        SizedBox(width: 8),
                        MiniCard(
                          width: screenWidth * 0.7,
                          iconColor: Colors.orange,
                          progressColor: Colors.orange,
                        ),
                        SizedBox(width: 8),
                        MiniCard(
                          width: screenWidth * 0.7,
                          iconColor: Colors.orange,
                          progressColor: Colors.orange,
                        ),
                        SizedBox(width: 16), // Padding at the end
                      ],
                    ),
                  ),
                  SizedBox(height: 8), // Spacing between MiniCards and next text
                  Row(
                    children: [
                      Text(
                        'Taskgroups ',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '4',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      VeryMiniCard(
                        backgroundColor: Color.fromARGB(255, 120, 210, 233),
                        icon: Icons.work,
                        title: 'Office Project',
                        tasksCount: 25,
                        progressPercent: 50,
                        iconColor: const Color.fromARGB(255, 247, 119, 162),
                        progressColor: const Color.fromARGB(255, 247, 119, 162),
                      ),
                      SizedBox(height: 8),
                      VeryMiniCard(
                        backgroundColor: Color.fromARGB(255, 241, 243, 108),
                        icon: Icons.school,
                        title: 'Study Group',
                        tasksCount: 15,
                        progressPercent: 75,
                        iconColor: Colors.blue,
                        progressColor: Colors.blue,
                      ),
                      SizedBox(height: 8),
                      VeryMiniCard(
                        backgroundColor: Color.fromARGB(255, 57, 110, 81),
                        icon: Icons.family_restroom,
                        title: 'Family Tasks',
                        tasksCount: 10,
                        progressPercent: 30,
                        iconColor: Colors.orange,
                        progressColor: Colors.orange,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddProject()));
        },
        child: Icon(Icons.add, color: Colors.white),
        backgroundColor: Color.fromARGB(255, 97, 30, 219),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Colors.grey[300],
        child: Container(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  // Navigate to home page
                },
                color: Color.fromARGB(255, 97, 30, 219),
              ),
              IconButton(
                icon: Icon(Icons.calendar_today),
                onPressed: () {
                  // Navigate to calendar page
                },
                color: Color.fromARGB(255, 97, 30, 219),
              ),
              SizedBox(width: 48),
              IconButton(
                icon: Icon(Icons.description),
                onPressed: () {
                  // Navigate to document page
                },
                color: Color.fromARGB(255, 97, 30, 219),
              ),
              IconButton(
                icon: Icon(Icons.account_circle),
                onPressed: () {
                  // Navigate to account page
                },
                color: Color.fromARGB(255, 97, 30, 219),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MiniCard extends StatelessWidget {
  final Color backgroundColor;
  final IconData icon;
  final String title;
  final String subtitle;
  final int progressPercent;
  final double width;
  final Color iconColor;
  final Color progressColor;

  const MiniCard({
    Key? key,
    this.backgroundColor = Colors.white,
    this.icon = Icons.star,
    this.title = 'Title',
    this.subtitle = 'Subtitle',
    this.progressPercent = 0,
    this.width = 240, // Default width if not specified
    this.iconColor = Colors.grey,
    this.progressColor = Colors.blue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        width: width,
        height: 120,
        color: backgroundColor,
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 8),
                      Container(
                        height: 8,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: FractionallySizedBox(
                          alignment: Alignment.centerLeft,
                          widthFactor: progressPercent / 100,
                          child: Container(
                            color: progressColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  icon,
                  size: 24,
                  color: iconColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class VeryMiniCard extends StatelessWidget {
  final Color backgroundColor;
  final IconData icon;
  final String title;
  final int tasksCount;
  final int progressPercent;
  final Color iconColor;
  final Color progressColor;

  const VeryMiniCard({
    Key? key,
    required this.backgroundColor,
    required this.icon,
    required this.title,
    required this.tasksCount,
    required this.progressPercent,
    this.iconColor = Colors.grey,
    this.progressColor = Colors.blue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon, size: 30, color: iconColor),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '$tasksCount tasks',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                CircularProgressIndicator(
                  value: progressPercent / 100,
                  strokeWidth: 6,
                  backgroundColor: Colors.grey[200],
                  valueColor: AlwaysStoppedAnimation<Color>(progressColor),
                ),
                SizedBox(height: 4),
                Text('$progressPercent%'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
