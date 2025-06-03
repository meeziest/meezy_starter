import 'package:flutter/cupertino.dart';

abstract class DefinedHeightStatefulWidget extends StatefulWidget implements DefinedHeightWidget {
  const DefinedHeightStatefulWidget({super.key});
}

abstract class DefinedHeightStatelessWidget extends StatelessWidget implements DefinedHeightWidget {
  const DefinedHeightStatelessWidget({super.key});
}

abstract class DefinedHeightWidget extends Widget {
  const DefinedHeightWidget({super.key});

  /// Высота виджета.
  double get height;
}
