import 'package:flutter/material.dart';
import 'package:webtool_rep/UI/utils/api.dart';
import '../../../../../core/getter_setter.dart';
import '../../../../utils/constant.dart';
import '../../../../utils/edge_insect.dart';
import '../../../../utils/spacing.dart';
import '../../../../utils/text_styles.dart';
import '../../../../widgets/dropdown.dart';
import '../../../../widgets/textfield.dart';

class AddProductCategory extends StatefulWidget {
  const AddProductCategory({Key? key}) : super(key: key);

  @override
  State<AddProductCategory> createState() => _AddProductCategoryState();
}

class _AddProductCategoryState extends State<AddProductCategory> {
  TextEditingController categoryId = TextEditingController();
  TextEditingController categoryName = TextEditingController();
  List<String> res = [];
  String init = '';
  ProductCategory_ProductType_Api dropdownStatus =
      ProductCategory_ProductType_Api();
  List<String> res1 = [];
  String init1 = '';
  Partner_Api dropdownFunction = Partner_Api();
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
    getCategory();
    getList();
  }

  getCategory() async {
    List<dynamic> dlist = await dropdownStatus.getUserstatus();
    for (var i in dlist) {
      setState(() {
        res.add(i['get_pc_producttype_dropdown']);
      });
    }
    setState(() {
      init = res[0];
    });
    print("safgsdgsdgsdfgde $res");
  }

  getList() async {
    List<dynamic> dlist = await dropdownFunction.getUserstatus();
    for (var i in dlist) {
      setState(() {
        res1.add(i['get_p_status_dropdown']);
      });
    }
    setState(() {
      init1 = res1[0];
    });
    print("safgsdgsdgsdfgde $res1");
  }

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
                        Text(' Create Product Category',
                            style: kTinyBoldTextStyle),
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
                          DropdownButton(
                            value: init,
                            items: res.map((e) {
                              return DropdownMenuItem(
                                value: e,
                                child: Text(e,
                                    style: TextStyle(color: Colors.black)),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                init = value.toString();
                                SaveData.setProductType(init);
                              });
                            },
                          ),
                          verticalSpaceTiny,
                          Text("Product Category ID :",
                              style: kHeading2TextStyle),
                          textfield(
                            hintext: "",
                            controller: categoryId,
                            onChange: (data){
                              SaveData.setCategoryId(data);
                            },
                          ),
                          verticalSpaceTiny,
                          Text("Product Category Name :",
                              style: kHeading2TextStyle),
                          textfield(
                            hintext: "",
                            controller: categoryName,
                            onChange: (data){
                              SaveData.setCategoryName(data);
                            },
                          ),
                          verticalSpaceTiny,
                          DropdownButton(
                            value: init1,
                            items: res1.map((e) {
                              return DropdownMenuItem(
                                value: e,
                                child: Text(e,
                                    style: TextStyle(color: Colors.black)),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                init1 = value.toString();
                                SaveData.setStatus(init1);
                              });
                            },
                          ),
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
