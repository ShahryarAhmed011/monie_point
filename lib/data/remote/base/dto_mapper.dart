
import '../../repository/base/dto.dart';

abstract class RemoteMapper<D> {
  const RemoteMapper();
  D mapToData(dynamic result);
}

abstract class DtoMapper<D extends Dto> extends RemoteMapper<D> {
  const DtoMapper();
  D mapDtoToData(Map<String, dynamic> result);

  @override
  D mapToData(dynamic result) {
    return mapDtoToData(result);
  }
}

abstract class ListDtoMapper<D extends Dto> extends RemoteMapper<List<D>> {
  const ListDtoMapper();
  @override
  List<D> mapToData(dynamic result) {
    return (result as List<dynamic>)
        .map((e) => mapDtoToData(e))
        .toList(growable: false);
  }

  D mapDtoToData(Map<String, dynamic> result);
}
