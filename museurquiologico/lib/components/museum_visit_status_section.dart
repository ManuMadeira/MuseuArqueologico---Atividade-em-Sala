import 'package:flutter/material.dart';
import '../models/entities/museum_visit_group_entity.dart';
import 'museum_visit_card.dart';

class MuseumVisitStatusSection extends StatelessWidget {
  final String title;
  final List<MuseumVisitGroupEntity> groups;

  const MuseumVisitStatusSection({
    super.key,
    required this.title,
    required this.groups,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$title (${groups.length})',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFFD4AF37), // Gold
              ),
            ),
            const SizedBox(height: 16),
            if (groups.isEmpty)
              const Center(
                child: Text(
                  'Nenhum grupo neste status.',
                  style: TextStyle(color: Colors.white),
                ),
              )
            else
              Expanded(
                child: ListView.builder(
                  itemCount: groups.length,
                  itemBuilder: (context, index) {
                    return MuseumVisitCard(group: groups[index]);
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}