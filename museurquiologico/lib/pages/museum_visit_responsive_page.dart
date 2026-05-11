import 'package:flutter/material.dart';
import '../models/entities/museum_visit_status.dart';
import '../repositories/museum_visit_repository.dart';
import '../components/museum_visit_status_section.dart';

class MuseumVisitResponsivePage extends StatelessWidget {
  const MuseumVisitResponsivePage({super.key});

  @override
  Widget build(BuildContext context) {
    final waitingGroups = museumVisitMock.where((g) => g.status == MuseumVisitStatus.waiting).toList();
    final insideGroups = museumVisitMock.where((g) => g.status == MuseumVisitStatus.inside).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Museu Arqueológico'),
        backgroundColor: const Color(0xFF4A5D23), // Moss green
      ),
      backgroundColor: const Color(0xFF2E2E2E), // Dark background
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 700) {
            // Vertical layout
            return Column(
              children: [
                MuseumVisitStatusSection(
                  title: 'Grupos Aguardando Entrada',
                  groups: waitingGroups,
                ),
                MuseumVisitStatusSection(
                  title: 'Grupos que Já Entraram',
                  groups: insideGroups,
                ),
              ],
            );
          } else {
            // Side by side
            return Row(
              children: [
                MuseumVisitStatusSection(
                  title: 'Grupos Aguardando Entrada',
                  groups: waitingGroups,
                ),
                MuseumVisitStatusSection(
                  title: 'Grupos que Já Entraram',
                  groups: insideGroups,
                ),
              ],
            );
          }
        },
      ),
    );
  }
}