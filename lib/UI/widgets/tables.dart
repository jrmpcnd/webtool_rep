import 'package:flutter/material.dart';
import '../utils/constant.dart';
import '../utils/text_styles.dart';

class Tables extends StatefulWidget {
  const Tables({Key? key}) : super(key: key);

  @override
  State<Tables> createState() => _TablesState();
}

class _TablesState extends State<Tables> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kTertiaryColor5,
        borderRadius: const BorderRadius.only(
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
      width: double.infinity,
      alignment: Alignment.center,
      child: Table(
        children: [
          TableRow(children: [
            Container(
              width: double.infinity,
              color: kSecondaryColor3,
              child: Column(children: [
                Text('User Name', style: kSmallBoldTextStyle),
              ]),
            ),
            Container(
              width: double.infinity,
              color: kSecondaryColor3,
              child: Column(children: [
                Text('Given Name', style: kSmallBoldTextStyle),
              ]),
            ),
            Container(
              width: double.infinity,
              color: kSecondaryColor3,
              child: Column(children: [
                Text('Middle Name', style: kSmallBoldTextStyle),
              ]),
            ),
            Container(
              width: double.infinity,
              color: kSecondaryColor3,
              child: Column(children: [
                Text('Last Name', style: kSmallBoldTextStyle),
              ]),
            ),
            Container(
              width: double.infinity,
              color: kSecondaryColor3,
              child: Column(children: [
                Text('Branch', style: kSmallBoldTextStyle),
              ]),
            ),
            Container(
              width: double.infinity,
              color: kSecondaryColor3,
              child: Column(children: [
                Text('Role', style: kSmallBoldTextStyle),
              ]),
            ),
            Container(
              width: double.infinity,
              color: kSecondaryColor3,
              child: Column(children: [
                Text('Status', style: kSmallBoldTextStyle),
              ]),
            ),
            Container(
              width: double.infinity,
              color: kSecondaryColor3,
              child: Column(children: [
                Text('Action', style: kSmallBoldTextStyle),
              ]),
            ),
          ]),
          TableRow(children: [
            Column(children: [
              Text(
                'Sample 1',
                style: kBodyRegularTextStyle.copyWith(color: kBlackColor),
              )
            ]),
            Column(children: [
              Text(
                'Samplel',
                style: kBodyRegularTextStyle.copyWith(color: kBlackColor),
              )
            ]),
            Column(children: [
              Text(
                'Sample',
                style: kBodyRegularTextStyle.copyWith(color: kBlackColor),
              )
            ]),
            Column(children: [
              Text(
                'Sample',
                style: kBodyRegularTextStyle.copyWith(color: kBlackColor),
              )
            ]),
            Column(children: [
              Text(
                'Sample',
                style: kBodyRegularTextStyle.copyWith(color: kBlackColor),
              )
            ]),
            Column(children: [
              Text(
                'Sample',
                style: kBodyRegularTextStyle.copyWith(color: kBlackColor),
              )
            ]),
            Column(children: [
              IconButton(
                icon: const Icon(
                  Icons.check_circle_outline_outlined,
                  size: 15.0,
                  color: kOrangeColor1,
                ),
                onPressed: () {},
              ),
            ]),
            Column(children: [
              IconButton(
                icon: const Icon(
                  Icons.edit,
                  size: 15.0,
                  color: kOrangeColor1,
                ),
                onPressed: () {},
              ),
            ]),
          ]),
          TableRow(children: [
            Column(children: [
              Text(
                'Sample 2',
                style: kBodyRegularTextStyle.copyWith(color: kBlackColor),
              )
            ]),
            Column(children: [
              Text(
                'Sample',
                style: kBodyRegularTextStyle.copyWith(color: kBlackColor),
              )
            ]),
            Column(children: [
              Text(
                'Sample',
                style: kBodyRegularTextStyle.copyWith(color: kBlackColor),
              )
            ]),
            Column(children: [
              Text(
                'sample',
                style: kBodyRegularTextStyle.copyWith(color: kBlackColor),
              )
            ]),
            Column(children: [
              Text(
                'Sample',
                style: kBodyRegularTextStyle.copyWith(color: kBlackColor),
              )
            ]),
            Column(children: [
              Text(
                'Sample',
                style: kBodyRegularTextStyle.copyWith(color: kBlackColor),
              )
            ]),
            Column(children: [
              IconButton(
                icon: const Icon(
                  Icons.check_circle_outline_outlined,
                  size: 15.0,
                  color: kOrangeColor1,
                ),
                onPressed: () {},
              ),
            ]),
            Column(children: [
              IconButton(
                icon: const Icon(
                  Icons.edit,
                  size: 15.0,
                  color: kOrangeColor1,
                ),
                onPressed: () {},
              ),
            ]),
          ]),
        ],
      ),
    );
  }
}
