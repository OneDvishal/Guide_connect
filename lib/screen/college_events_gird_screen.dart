import 'package:flutter/material.dart';

class CollegeEvent {
  final String title;
  final String description;
  final String date;
  final String imageUrl;

  CollegeEvent({
    required this.title,
    required this.description,
    required this.date,
    required this.imageUrl,
  });
}

class CollegeEventGrid extends StatelessWidget {
  final List<CollegeEvent> events = [
    CollegeEvent(
      title: 'Event 1',
      description: 'Description of Event 1',
      date: 'May 1, 2023',
      imageUrl: 'https://turnitupdance.com/wp-content/uploads/bb-plugin/cache/DanceBattleWinners-Full-1024x683-panorama.jpg',
    ),
    CollegeEvent(
      title: 'Event 2',
      description: 'Description of Event 2',
      date: 'May 5, 2023',
      imageUrl: 'https://turnitupdance.com/wp-content/uploads/bb-plugin/cache/DanceBattleWinners-Full-1024x683-panorama.jpg',
    ),
    CollegeEvent(
      title: 'Event 3',
      description: 'Description of Event 3',
      date: 'May 10, 2023',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/9/9e/CompetitiveDanceGroup.jpg',
    ),
    // Add more events here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        title: Text('College Events'),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.75,
        ),
        itemCount: events.length,
        itemBuilder: (context, index) {
          return EventCard(event: events[index]);
        },
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final CollegeEvent event;

  const EventCard({required this.event});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
              child: Image.network(
                event.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event.title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  event.date,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  event.description,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
