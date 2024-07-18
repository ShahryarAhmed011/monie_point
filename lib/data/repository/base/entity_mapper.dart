
import '../../../domain/base/entity.dart';
import 'dto.dart';
abstract class EntityMapper<E extends Entity,D extends Dto> {
  const EntityMapper();
  E mapToEntity(D dto);
}