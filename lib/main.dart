import 'package:flutter/material.dart';

void main() {
  runApp(const CollegeEventApp());
}

class Event {
  final String id, title, date, location, description, imagePath;
  bool isRegistered;

  Event({
    required this.id,
    required this.title,
    required this.date,
    required this.location,
    required this.description,
    required this.imagePath, // Path to your local folder
    this.isRegistered = false,
  });
}

class CollegeEventApp extends StatelessWidget {
  const CollegeEventApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF3F51B5),
      ),
      home: const EventDashboard(),
    );
  }
}

class EventDashboard extends StatefulWidget {
  const EventDashboard({super.key});
  @override
  State<EventDashboard> createState() => _EventDashboardState();
}

class _EventDashboardState extends State<EventDashboard> {
  // Update these paths to match your actual file names in assets/images/
  final List<Event> _allEvents = [
    Event(
      id: '1',
      title: 'Tech Symposium 2025',
      date: 'Jan 15, 2025',
      location: 'Main Auditorium',
      description: 'A grand gathering of tech enthusiasts and guest speakers.',
      imagePath: 'assets/images/event1.jpg', 
    ),
    Event(
      id: '2',
      title: 'Annual Cultural Fest',
      date: 'Feb 10, 2025',
      location: 'Open Air Theatre',
      description: 'Showcasing talent in dance, music, and art.',
      imagePath: 'assets/images/event2.jpg',
    ),
    Event(
      id: '3',
      title: 'National Level Hackathon',
      date: 'Dec 10, 2025',
      location: 'TP2 516',
      description: 'Building innovative solutions through collaborative coding.',
      imagePath: 'assets/images/event3.jpg',
    ),
    Event(
      id: '4',
      title: 'Pongal Celebration',
      date: 'Jan 10, 2026',
      location: 'Open Air Theatre',
      description: 'Celebrating the harvest festival with traditional dances and food.',
      imagePath: 'assets/images/event4.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        title: const Text('X College Events', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _allEvents.length,
        itemBuilder: (context, index) {
          final event = _allEvents[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 20),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                // USING LOCAL ASSET IMAGE
                Image.asset(
                  event.imagePath,
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  // This errorBuilder shows a placeholder if you haven't added the image yet
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 180,
                    color: Colors.grey[300],
                    child: const Icon(Icons.image_not_supported, size: 50),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(event.title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 4),
                      Text(event.location, style: TextStyle(color: Colors.grey.shade600)),
                      const SizedBox(height: 12),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo, foregroundColor: Colors.white),
                          child: const Text('Register Now'),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}