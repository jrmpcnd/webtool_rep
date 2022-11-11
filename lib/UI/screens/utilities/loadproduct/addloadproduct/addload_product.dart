import 'package:flutter/material.dart';
import '../../../../utils/constant.dart';
import '../../../../utils/edge_insect.dart';
import '../../../../utils/spacing.dart';
import '../../../../utils/text_styles.dart';
import '../../../../widgets/dropdown.dart';
import '../../../../widgets/textfield.dart';

class Addloadproduct extends StatefulWidget {
  const Addloadproduct({Key? key}) : super(key: key);

  @override
  State<Addloadproduct> createState() => _AddloadproductState();
}

class _AddloadproductState extends State<Addloadproduct> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: kEdgeInsetsAllNormal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: kTertiaryColor5,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3)),
                    ],
                  ),
                  alignment: Alignment.centerLeft,
                  height: 30.0,
                  width: 500.0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.lan_outlined, color: kBlackColor),
                        Text('Load Product', style: kTinyBoldTextStyle),
                      ],
                    ),
                  ),
                ),
                verticalSpaceTiny,
                Container(
                  padding: kEdgeInsetsAllLarge,
                  decoration: BoxDecoration(
                    color: kTertiaryColor5,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3)),
                    ],
                  ),
                  width: 500.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Product Category :", style: kHeading2TextStyle),
                          dropdowns(dropdown: "--Product Category--"),
                          verticalSpaceTiny,
                          Text("Load Product ID :", style: kHeading2TextStyle),
                          textfield(
                            hintext: "",
                          ),
                          verticalSpaceTiny,
                          Text("Load Product Name :",
                              style: kHeading2TextStyle),
                          textfield(
                            hintext: "",
                          ),
                          verticalSpaceTiny,
                          Text("Description :", style: kHeading2TextStyle),
                          textfield(
                            hintext: "",
                          ),
                          verticalSpaceTiny,
                          Text("Status :", style: kHeading2TextStyle),
                          dropdowns(dropdown: "--Status--"),
                          verticalSpaceXTiny,
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
