import 'package:flutter/material.dart';

void main() => runApp(EventSchedulerApp());

class EventSchedulerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        title: Center(child: Text('Create Event')),
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
              Text('Virtual link*', style: TextStyle(fontSize: 18)),

              SizedBox(height: 10),
              Text('Add a link to let the participants join your virtual event', style: TextStyle(fontSize: 12)),
              SizedBox(height: 10),
              TextField(
                controller: linkController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'paste your link here',
                  hintStyle: TextStyle(color: Colors.white54),
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.grey[800],
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

              Text('Date and time*', style: TextStyle(fontSize: 18)),
              SizedBox(height: 10),

              Text('Schedule 1', style: TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.bold)),
              CalendarDatePicker(

                initialDate: selectedDate,
                firstDate: DateTime(2023),
                lastDate: DateTime(2030),
                onDateChanged: (date) {
                  setState(() {
                    selectedDate = date;
                  });
                },
              ),
              // Add underline after date
              SizedBox(height: 10),

Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Text('Start time', style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold)),
    SizedBox(width: 10),
    Text('End time', style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold)),
  ],
),

              SizedBox(height: 10),

                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [


                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[700], // Silver background for the container
                        borderRadius: BorderRadius.circular(10), // Circular border radius for the container
                      ),
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          DropdownButton<String>(
                            value: startTime,
                            dropdownColor: Colors.grey[800],
                            items: availableTimes.map((String time) {
                              return DropdownMenuItem<String>(
                                value: time,
                                child: Text(time, style: TextStyle(color: Colors.white)),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                startTime = newValue!;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(

                      decoration: BoxDecoration(
                        color: Colors.grey[700], // Silver background for the container
                        borderRadius: BorderRadius.circular(10), // Circular border radius for the container
                      ),
                      padding: EdgeInsets.all(10),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          DropdownButton<String>(
                            value: endTime,
                            dropdownColor: Colors.grey[800],
                            items: availableTimes.map((String time) {
                              return DropdownMenuItem<String>(
                                value: time,
                                child: Text(time, style: TextStyle(color: Colors.white)),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                endTime = newValue!;
                              });
                            },
                          ),
                        ],
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
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                  Text('3 steps to submit', style: TextStyle(color: Colors.white54)),
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
