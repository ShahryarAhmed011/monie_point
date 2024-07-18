import '../../../domain/base/wrapper.dart';
import 'dto.dart';

abstract class WrapperMapper<W extends Wrapper,D extends Dto> {
  const WrapperMapper();
  W map(D dto);
}