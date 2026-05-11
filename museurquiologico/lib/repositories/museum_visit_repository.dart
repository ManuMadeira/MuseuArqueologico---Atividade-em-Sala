import '../models/entities/museum_exhibition_entity.dart';
import '../models/entities/museum_visit_group_entity.dart';
import '../models/entities/museum_visit_status.dart';

final List<MuseumVisitGroupEntity> museumVisitMock = [
  MuseumVisitGroupEntity(
    id: 1,
    exhibition: MuseumExhibitionEntity(name: 'Dinossauros', sector: 'Pré-história'),
    responsible: 'João Silva',
    quantity: 5,
    scheduledTime: DateTime(2026, 5, 11, 10, 0),
    status: MuseumVisitStatus.waiting,
  ),
  MuseumVisitGroupEntity(
    id: 2,
    exhibition: MuseumExhibitionEntity(name: 'Egípcios', sector: 'Antigo Egito'),
    responsible: 'Maria Santos',
    quantity: 8,
    scheduledTime: DateTime(2026, 5, 11, 11, 30),
    status: MuseumVisitStatus.inside,
  ),
  MuseumVisitGroupEntity(
    id: 3,
    exhibition: MuseumExhibitionEntity(name: 'Romanos', sector: 'Império Romano'),
    responsible: 'Pedro Oliveira',
    quantity: 6,
    scheduledTime: DateTime(2026, 5, 11, 14, 0),
    status: MuseumVisitStatus.waiting,
  ),
  MuseumVisitGroupEntity(
    id: 4,
    exhibition: MuseumExhibitionEntity(name: 'Dinossauros', sector: 'Pré-história'),
    responsible: 'Ana Costa',
    quantity: 4,
    scheduledTime: DateTime(2026, 5, 11, 15, 30),
    status: MuseumVisitStatus.completed,
  ),
  MuseumVisitGroupEntity(
    id: 5,
    exhibition: MuseumExhibitionEntity(name: 'Egípcios', sector: 'Antigo Egito'),
    responsible: 'Carlos Pereira',
    quantity: 7,
    scheduledTime: DateTime(2026, 5, 11, 16, 0),
    status: MuseumVisitStatus.waiting,
  ),
];