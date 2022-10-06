import 'package:flutter/material.dart';
import '../../../utils/edge_insect.dart';
import '../../../widgets/containers.dart';

class Usermanagement extends StatefulWidget {
  const Usermanagement({Key? key}) : super(key: key);

  @override
  State<Usermanagement> createState() => _UsermanagementState();
}

class _UsermanagementState extends State<Usermanagement> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: kEdgeInsetsVerticalSmall,
      child: Containers(),
    );
  }
}
