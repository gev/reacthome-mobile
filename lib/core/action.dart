typedef ActionHandler<A> = void Function(A);

class Action {
  final String type;
  const Action({required this.type});
}
