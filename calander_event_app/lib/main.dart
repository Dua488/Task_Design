import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

void main() => runApp(EventSchedulerApp());

class EventSchedulerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Event Scheduler',
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.yellow,
        scaffoldBackgroundColor: Colors.black,
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white54),
        ),
      ),
      home: CreateEventScreen(),
    );
  }
}

class CreateEventScreen extends StatefulWidget {
  @override
  _CreateEventScreenState createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  DateTime focusedDate = DateTime.now();

  DateTime selectedDate = DateTime.now();
  String startTime = "10:00AM";
  String endTime = "12:00PM";
  String scheduleType = 'One time';
  String virtualLink = '';
  final TextEditingController linkController = TextEditingController();

  final List<String> availableTimes = [
    "10:00AM",
    "10:30AM",
    "11:00AM",
    "11:30AM",
    "12:00PM",
    "12:30PM",
    "1:00PM",
    "1:30PM",
    "2:00PM",
    "2:30PM",
  ];

  void addSchedule() {
    // Logic to add another schedule
    print("Add new schedule button clicked");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[700],
        title: Center(child: Text('Create event',style: TextStyle(fontWeight: FontWeight.bold),),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Virtual link*', style: TextStyle(fontSize: 18, color: Colors.white)),

              SizedBox(height: 10),
              Text('Add a link to let the participants join your', style: TextStyle(fontSize: 12)),
              SizedBox(height: 5),
              Text('virtual event', style: TextStyle(fontSize: 12)),
              SizedBox(height: 10),

              TextField(
                controller: linkController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Paste your link here',
                  hintStyle: TextStyle(color: Colors.white54),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10), // Rounded corners
                    borderSide: BorderSide(
                      color: Colors.grey, // Border color
                      width: 1.5, // Border width
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10), // Rounded corners for enabled state
                    borderSide: BorderSide(
                      color: Colors.grey, // Border color for enabled state
                      width: 1.5, // Border width for enabled state
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10), // Rounded corners for focused state
                    borderSide: BorderSide(
                      color: Colors.white, // Border color for focused state
                      width: 2.0, // Border width for focused state
                    ),
                  ),
                  filled: false,
                  fillColor: Colors.grey[800], // Background color of the TextField
                ),
                onChanged: (value) {
                  setState(() {
                    virtualLink = value;
                  });
                },
              ),

              SizedBox(height: 20),
              Divider(color: Colors.white54),
              SizedBox(height: 20),

              Text('Date and time*', style: TextStyle(fontSize: 18 ,color: Colors.white,fontWeight: FontWeight.bold)),
              SizedBox(height: 10),

              Text('Schedule 1', style: TextStyle(fontSize: 12, color: Colors.white54)),

              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${focusedDate.year}", // Display month and year
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                focusedDate = DateTime(
                                  focusedDate.year,
                                  focusedDate.month - 1,
                                );
                              });
                            },
                            icon: Icon(Icons.chevron_left, color: Colors.white),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                focusedDate = DateTime(
                                  focusedDate.year,
                                  focusedDate.month + 1,
                                );
                              });
                            },
                            icon: Icon(Icons.chevron_right, color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                  TableCalendar(
                    focusedDay: focusedDate,
                    firstDay: DateTime(2023),
                    lastDay: DateTime(2030),
                    calendarStyle: CalendarStyle(
                      todayDecoration: BoxDecoration(
                        color: Colors.yellow, // Highlight for today's date
                        shape: BoxShape.circle,
                      ),
                      defaultTextStyle: TextStyle(color: Colors.white), // Default text color
                      weekendTextStyle: TextStyle(color: Colors.white), // Weekend text color
                      selectedDecoration: BoxDecoration(
                        color: Colors.yellow, // Highlight for selected date
                        shape: BoxShape.circle,
                      ),
                      outsideDaysVisible: false, // Hide dates outside the current month
                    ),
                    daysOfWeekStyle: DaysOfWeekStyle(
                      weekendStyle: TextStyle(color: Colors.white), // Weekend text color
                      weekdayStyle: TextStyle(color: Colors.white), // Weekday text color
                    ),
                    headerVisible: false, // Hides the default header
                    selectedDayPredicate: (day) => isSameDay(selectedDate, day),
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        selectedDate = selectedDay;
                        focusedDate = focusedDay;
                      });
                    },
                  ),
                ],
              ),


              // Add underline after date
              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'Start time',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,

                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'End time',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,

                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),




              SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[700], // Silver background for the container
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return ListView(
                                  children: availableTimes.map((String time) {
                                    return ListTile(
                                      title: Text(
                                        time,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      onTap: () {
                                        setState(() {
                                          startTime = time;
                                        });
                                        Navigator.pop(context);
                                      },
                                    );
                                  }).toList(),
                                );
                              },
                              backgroundColor: Colors.grey[800],
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                            decoration: BoxDecoration(
                              color: Colors.grey[700], // Same silver color as the container
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              startTime,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(width: 10),
                
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[700], // Silver background for the container
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return ListView(
                                  children: availableTimes.map((String time) {
                                    return ListTile(
                                      title: Text(
                                        time,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      onTap: () {
                                        setState(() {
                                          endTime = time;
                                        });
                                        Navigator.pop(context);
                                      },
                                    );
                                  }).toList(),
                                );
                              },
                              backgroundColor: Colors.grey[800],
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                            decoration: BoxDecoration(
                              color: Colors.grey[700], // Same silver color as the container
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              endTime,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),


            SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[700], // Silver background for the container
                  borderRadius: BorderRadius.circular(10), // Circular border radius for the container
                ),
                padding: EdgeInsets.all(10),
                // Silver background for schedule options
                child: Column(
                  children: [


                    ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'One time',
                            style: TextStyle(color: Colors.white),
                          ),
                          Radio<String>(
                            value: 'One time',
                            groupValue: scheduleType,
                            onChanged: (value) {
                              setState(() {
                                scheduleType = value!;
                              });
                            },
                            activeColor: Colors.yellow,
                          ),
                        ],
                      ),
                    ),

                    ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Recurring',
                            style: TextStyle(color: Colors.white),
                          ),
                          Radio<String>(
                            value: 'Recurring',
                            groupValue: scheduleType,
                            onChanged: (value) {
                              setState(() {
                                scheduleType = value!;
                              });
                            },
                            activeColor: Colors.yellow,
                          ),
                        ],
                      ),
                    ),


                  ],
                    ),

                ),

              SizedBox(height: 20),

              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[700], // Silver background for the container
                  borderRadius: BorderRadius.circular(10), // Circular border radius for the container
                ),
                padding: EdgeInsets.all(10), // Padding around the button and text
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center, // Center-aligns text and button vertically
                  children: [
                    ElevatedButton(
                      onPressed: addSchedule,
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // Apply border radius to the button
                        ),
                        backgroundColor: Colors.yellow, // Button background color
                        padding: EdgeInsets.all(16), // Adjust padding to control button size
                      ),
                      child: Icon(
                        Icons.add,
                        color: Colors.black, // Icon color
                        size: 30, // Adjust icon size as needed
                      ),
                    ),
                    SizedBox(width: 30), // Space between button and text
                    Text(
                      'Add new schedule', // Text after the button
                      style: TextStyle(
                        color: Colors.white, // Text color is white
                        fontSize: 16, // Adjust the font size as needed
                      ),
                    ),
                  ],
                ),
              ),



              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Back'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                      foregroundColor: Colors.white,
                    ),
                  ),
                  Text('3 steps to submit', style: TextStyle(color: Colors.white)),
                  ElevatedButton(
                    onPressed: () {
                      // Handle navigate to the next step
                    },
                    child: Text('Next'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow,
                      foregroundColor: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
