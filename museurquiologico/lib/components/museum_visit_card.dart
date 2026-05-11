import 'package:flutter/material.dart';
import '../models/entities/museum_visit_group_entity.dart';

class MuseumVisitCard extends StatelessWidget {
  final MuseumVisitGroupEntity group;

  const MuseumVisitCard({super.key, required this.group});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF4A5D23), // Moss green
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Exposição: ${group.exhibition.name}',
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Text(
              'Setor: ${group.exhibition.sector}',
              style: const TextStyle(color: Colors.white),
            ),
            Text(
              'Responsável: ${group.responsible}',
              style: const TextStyle(color: Colors.white),
            ),
            Text(
              'Quantidade: ${group.quantity} pessoas',
              style: const TextStyle(color: Colors.white),
            ),
            Text(
              'Horário: ${group.scheduledTime.hour}:${group.scheduledTime.minute.toString().padLeft(2, '0')}',
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}