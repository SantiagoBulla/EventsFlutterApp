import 'package:events/features/events/presentation/provider/events_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/custom_event_detail_modal.dart';
import '../widgets/event_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var events = Provider.of<EventsProvider>(context, listen: false);

    return Scaffold(
      extendBody: true,
      appBar: AppBar(
          elevation: 10,
          title: const Center(
            child: Text(
              'HOME PAGE',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          backgroundColor: const Color(0xff00abfe)),
      body: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Iterar sobre la lista de eventos
              ...events.eventsList?.map((event) {
                    return EventCard(event: event);
                  }) ??
                  [],
            ],
          ),
        ),
      ),
    );
  }
}
