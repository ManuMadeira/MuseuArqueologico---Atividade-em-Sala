import 'museum_exhibition_entity.dart';
import 'museum_visit_status.dart';

class MuseumVisitGroupEntity {
  final int? id;
  final MuseumExhibitionEntity exhibition;
  final String responsible;
  final int quantity;
  final DateTime scheduledTime;
  final MuseumVisitStatus status;

  const MuseumVisitGroupEntity({
    this.id,
    required this.exhibition,
    required this.responsible,
    required this.quantity,
    required this.scheduledTime,
    required this.status,
  });
}