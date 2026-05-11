import 'package:flutter/material.dart';
import '../models/entities/museum_visit_group_entity.dart';
import 'museum_visit_card.dart';

class MuseumVisitStatusSection extends StatelessWidget {
  final String title;
  final List<MuseumVisitGroupEntity> groups;
  final void Function(MuseumVisitGroupEntity) onGroupDropped;

  const MuseumVisitStatusSection({
    super.key,
    required this.title,
    required this.groups,
    required this.onGroupDropped,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DragTarget<MuseumVisitGroupEntity>(
        onAcceptWithDetails: (details) {
          onGroupDropped(details.data);
        },
        builder: (context, candidateData, rejectedData) {
          return Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: candidateData.isNotEmpty ? Colors.grey.withValues(alpha: 0.5) : Colors.transparent,
              border: candidateData.isNotEmpty ? Border.all(color: const Color(0xFFD4AF37), width: 2) : null,
            ),
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
                        final group = groups[index];
                        return Draggable<MuseumVisitGroupEntity>(
                          data: group,
                          feedback: Opacity(
                            opacity: 0.5,
                            child: MuseumVisitCard(group: group),
                          ),
                          child: MuseumVisitCard(group: group),
                        );
                      },
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}