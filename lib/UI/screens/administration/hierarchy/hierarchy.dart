import 'package:flutter/material.dart';
import '../../../utils/edge_insect.dart';
import '../../../widgets/containers.dart';

class Hierarchy extends StatefulWidget {
  const Hierarchy({Key? key}) : super(key: key);

  @override
  State<Hierarchy> createState() => _HierarchyState();
}

class _HierarchyState extends State<Hierarchy> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: kEdgeInsetsVerticalSmall,
      child: Containers(),
    );
  }
}
