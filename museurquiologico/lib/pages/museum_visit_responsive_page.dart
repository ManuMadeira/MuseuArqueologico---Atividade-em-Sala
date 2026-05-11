import 'package:flutter/material.dart';
import '../models/entities/museum_visit_group_entity.dart';
import '../models/entities/museum_visit_status.dart';
import '../repositories/museum_visit_repository.dart';
import '../components/museum_visit_status_section.dart';

class MuseumVisitResponsivePage extends StatefulWidget {
  const MuseumVisitResponsivePage({super.key});

  @override
  State<MuseumVisitResponsivePage> createState() => _MuseumVisitResponsivePageState();
}

class _MuseumVisitResponsivePageState extends State<MuseumVisitResponsivePage> {
  late List<MuseumVisitGroupEntity> groups;

  @override
  void initState() {
    super.initState();
    groups = List.from(museumVisitMock);
  }

  void _onGroupDropped(MuseumVisitGroupEntity group, MuseumVisitStatus newStatus) {
    final currentInsideGroups = groups.where((g) => g.status == MuseumVisitStatus.inside).toList();
    if (newStatus == MuseumVisitStatus.inside && currentInsideGroups.any((g) => g.exhibition.name == group.exhibition.name)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Já existe um grupo nesta exposição dentro do museu.')),
      );
      return;
    }
    setState(() {
      final index = groups.indexWhere((g) => g.id == group.id);
      if (index != -1) {
        groups[index] = MuseumVisitGroupEntity(
          id: group.id,
          exhibition: group.exhibition,
          responsible: group.responsible,
          quantity: group.quantity,
          scheduledTime: group.scheduledTime,
          status: newStatus,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final waitingGroups = groups.where((g) => g.status == MuseumVisitStatus.waiting).toList();
    final insideGroups = groups.where((g) => g.status == MuseumVisitStatus.inside).toList();
    final completedGroups = groups.where((g) => g.status == MuseumVisitStatus.completed).toList();

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
                  onGroupDropped: (group) => _onGroupDropped(group, MuseumVisitStatus.waiting),
                ),
                MuseumVisitStatusSection(
                  title: 'Grupos que Já Entraram',
                  groups: insideGroups,
                  onGroupDropped: (group) => _onGroupDropped(group, MuseumVisitStatus.inside),
                ),
                MuseumVisitStatusSection(
                  title: 'Grupos Concluídos',
                  groups: completedGroups,
                  onGroupDropped: (group) => _onGroupDropped(group, MuseumVisitStatus.completed),
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
                  onGroupDropped: (group) => _onGroupDropped(group, MuseumVisitStatus.waiting),
                ),
                MuseumVisitStatusSection(
                  title: 'Grupos que Já Entraram',
                  groups: insideGroups,
                  onGroupDropped: (group) => _onGroupDropped(group, MuseumVisitStatus.inside),
                ),
                MuseumVisitStatusSection(
                  title: 'Grupos Concluídos',
                  groups: completedGroups,
                  onGroupDropped: (group) => _onGroupDropped(group, MuseumVisitStatus.completed),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}