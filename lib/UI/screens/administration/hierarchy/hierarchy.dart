import 'package:flutter/material.dart';

class Hierarchy extends StatefulWidget {
  const Hierarchy({Key? key}) : super(key: key);

  @override
  State<Hierarchy> createState() => _HierarchyState();
}

class _HierarchyState extends State<Hierarchy> {
  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 10),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 150, //
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange[400]),
                        child: const Text('Upload'),
                        onPressed: () {
                          setState(() {});
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 170, //
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green[800]),
                        child: const Text('New Hierarchy'),
                        onPressed: () {
                          setState(() {});
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
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
                  alignment: Alignment.centerLeft,
                  width: double.infinity,
                  height: 30.0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(Icons.search),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
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
                  height: 180.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: 30,
                            width: 450,
                            child: DropdownButtonFormField(
                              decoration: const InputDecoration(
                                  labelStyle: TextStyle(
                                      fontSize: 12, color: Colors.black),
                                  contentPadding: EdgeInsets.only(left: 10),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.green)),
                                  hintText: '--Institution--'),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                              isDense: true,
                              isExpanded: true,
                              style: const TextStyle(fontSize: 16.5),
                              items: const [
                                DropdownMenuItem(
                                    value: "", child: Text("--Institution--")),
                                DropdownMenuItem(
                                    value: "Sample 1", child: Text("Sample 1")),
                                DropdownMenuItem(
                                    value: "Sample 2", child: Text("Sample 2")),
                              ],
                              onChanged: (newValue) {
                                setState(() {});
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            height: 30,
                            width: 450,
                            child: DropdownButtonFormField(
                              decoration: const InputDecoration(
                                  labelStyle: TextStyle(fontSize: 12),
                                  contentPadding: EdgeInsets.only(left: 10),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.green),
                                  ),
                                  hintText: '--Unit--'),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10.0)),
                              isDense: true,
                              isExpanded: true,
                              style: const TextStyle(fontSize: 16.5),
                              items: const [
                                DropdownMenuItem(
                                    value: "", child: Text("--Unit--")),
                                DropdownMenuItem(
                                    value: "Sample 1", child: Text("Sample 1")),
                                DropdownMenuItem(
                                    value: "Sample 2", child: Text("Sample 2")),
                              ],
                              onChanged: (newValue) {
                                setState(() {});
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: 100,
                            height: 45,
                            child: ElevatedButton.icon(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.red)),
                              onPressed: () {},
                              icon: const Icon(
                                Icons.search,
                                size: 20.0,
                              ),
                              label: const Text(
                                'Search',
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 60,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 30,
                                width: 450,
                                child: DropdownButtonFormField(
                                  decoration: const InputDecoration(
                                      labelStyle: TextStyle(fontSize: 12),
                                      contentPadding: EdgeInsets.only(left: 10),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.green)),
                                      hintText: '--Branch--'),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10.0)),
                                  isDense: true,
                                  isExpanded: true,
                                  style: const TextStyle(fontSize: 16.5),
                                  items: const [
                                    DropdownMenuItem(
                                        value: "", child: Text("--Branch--")),
                                    DropdownMenuItem(
                                        value: "Sample 1",
                                        child: Text("Sample 1")),
                                    DropdownMenuItem(
                                        value: "Sample 2",
                                        child: Text("Sample 2")),
                                  ],
                                  onChanged: (newValue) {
                                    setState(() {});
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                height: 30,
                                width: 450,
                                child: DropdownButtonFormField(
                                  decoration: const InputDecoration(
                                      labelStyle: TextStyle(fontSize: 12),
                                      contentPadding: EdgeInsets.only(left: 10),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.green)),
                                      hintText: '--Center--'),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10.0)),
                                  isDense: true,
                                  isExpanded: true,
                                  style: const TextStyle(fontSize: 16.5),
                                  items: const [
                                    DropdownMenuItem(
                                        value: "", child: Text("--Center--")),
                                    DropdownMenuItem(
                                        value: "Sample 1",
                                        child: Text("Sample 1")),
                                    DropdownMenuItem(
                                        value: "Sample 2",
                                        child: Text("Sample 2")),
                                  ],
                                  onChanged: (newValue) {
                                    setState(() {});
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                width: 100, //
                                height: 45,
                                child: ElevatedButton.icon(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.grey)),
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.refresh,
                                    size: 19.0,
                                  ),
                                  label: const Text(
                                    'Reset',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 100, //
                            height: 45,
                            child: ElevatedButton.icon(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.red)),
                              onPressed: () {},
                              icon: const Icon(
                                Icons.delete,
                                size: 25.0,
                              ),
                              label: const Text(
                                'Delete',
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
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
                  width: double.infinity,
                  height: 50.0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.calendar_month),
                        const Text(
                          ' List of Parameter Configuration',
                          style: TextStyle(color: Colors.black),
                        ),
                        const SizedBox(
                          width: 100,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
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
                          color: Colors.grey,
                          child: Column(children: const [
                            Text('Branch Code',
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white))
                          ]),
                        ),
                        Container(
                          width: double.infinity,
                          color: Colors.grey,
                          child: Column(children: const [
                            Text('Branch Name',
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white))
                          ]),
                        ),
                        Container(
                          width: double.infinity,
                          color: Colors.grey,
                          child: Column(children: const [
                            Text('Unit Code',
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white))
                          ]),
                        ),
                        Container(
                          width: double.infinity,
                          color: Colors.grey,
                          child: Column(children: const [
                            Text('Unit Name',
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white))
                          ]),
                        ),
                        Container(
                          width: double.infinity,
                          color: Colors.grey,
                          child: Column(children: const [
                            Text('Center Code',
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white))
                          ]),
                        ),
                        Container(
                          width: double.infinity,
                          color: Colors.grey,
                          child: Column(children: const [
                            Text('Center Name',
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white))
                          ]),
                        ),
                        Container(
                          width: double.infinity,
                          color: Colors.grey,
                          child: Column(children: const [
                            Text('Action',
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white))
                          ]),
                        ),
                        Container(
                          width: double.infinity,
                          color: Colors.grey,
                          child: Column(children: const [
                            Text('CheckBox',
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white))
                          ]),
                        ),
                      ]),
                      TableRow(children: [
                        Column(children: const [
                          Text(
                            'Sample 1',
                            style: TextStyle(color: Colors.black),
                          )
                        ]),
                        Column(children: const [
                          Text(
                            'Sample',
                            style: TextStyle(color: Colors.black),
                          )
                        ]),
                        Column(children: const [
                          Text(
                            'Sample',
                            style: TextStyle(color: Colors.black),
                          )
                        ]),
                        Column(children: const [
                          Text(
                            'Sample',
                            style: TextStyle(color: Colors.black),
                          )
                        ]),
                        Column(children: const [
                          Text(
                            'Sample',
                            style: TextStyle(color: Colors.black),
                          )
                        ]),
                        Column(children: const [
                          Text(
                            'Sample',
                            style: TextStyle(color: Colors.black),
                          )
                        ]),
                        Column(children: [
                          IconButton(
                            icon: Icon(
                              Icons.edit,
                              size: 20.0,
                              color: Colors.orange[500],
                            ),
                            onPressed: () {},
                          ),
                        ]),
                        Column(children: const [
                          // Checkbox(
                          //   checkColor: Colors.white,
                          //   fillColor:
                          //   MaterialStateProperty.resolveWith(getColor),
                          //   value: isChecked1,
                          //   onChanged: (bool value) {
                          //     setState(() {
                          //       isChecked1 = value;
                          //     });
                          //   },
                          // )
                        ]),
                      ]),
                      TableRow(children: [
                        Column(children: const [
                          Text(
                            'Sample 2',
                            style: TextStyle(color: Colors.black),
                          )
                        ]),
                        Column(children: const [
                          Text(
                            'Sample',
                            style: TextStyle(color: Colors.black),
                          )
                        ]),
                        Column(children: const [
                          Text(
                            'Sample',
                            style: TextStyle(color: Colors.black),
                          )
                        ]),
                        Column(children: const [
                          Text(
                            'sample',
                            style: TextStyle(color: Colors.black),
                          )
                        ]),
                        Column(children: const [
                          Text(
                            'Sample',
                            style: TextStyle(color: Colors.black),
                          )
                        ]),
                        Column(children: const [
                          Text(
                            'Sample',
                            style: TextStyle(color: Colors.black),
                          )
                        ]),
                        Column(children: [
                          IconButton(
                            icon: Icon(
                              Icons.edit,
                              size: 20.0,
                              color: Colors.orange[500],
                            ),
                            onPressed: () {},
                          ),
                        ]),
                        Column(children: const [
                          // Checkbox(
                          //   checkColor: Colors.white,
                          //   fillColor:
                          //       MaterialStateProperty.resolveWith(getColor),
                          //   value: isChecked2,
                          //   onChanged: (bool value) {
                          //     setState(() {
                          //       isChecked2 = value;
                          //     });
                          //   },
                          // )
                        ]),
                      ]),
                      TableRow(children: [
                        Column(children: const [
                          Text(
                            'Sample',
                            style: TextStyle(color: Colors.black),
                          )
                        ]),
                        Column(children: const [
                          Text(
                            'Sample',
                            style: TextStyle(color: Colors.black),
                          )
                        ]),
                        Column(children: const [
                          Text(
                            'Sample',
                            style: TextStyle(color: Colors.black),
                          )
                        ]),
                        Column(children: const [
                          Text(
                            'Sample',
                            style: TextStyle(color: Colors.black),
                          )
                        ]),
                        Column(children: const [
                          Text(
                            'Sample',
                            style: TextStyle(color: Colors.black),
                          )
                        ]),
                        Column(children: const [
                          Text(
                            'Sample',
                            style: TextStyle(color: Colors.black),
                          )
                        ]),
                        Column(children: [
                          IconButton(
                            icon: Icon(
                              Icons.edit,
                              size: 20.0,
                              color: Colors.orange[500],
                            ),
                            onPressed: () {},
                          ),
                        ]),
                        Column(children: const [
                          // Checkbox(
                          //   checkColor: Colors.white,
                          //   fillColor:
                          //       MaterialStateProperty.resolveWith(getColor),
                          //   value: isChecked3,
                          //   onChanged: (bool value) {
                          //     setState(() {
                          //       isChecked3 = value;
                          //     });
                          //   },
                          // )
                        ]),
                      ]),
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
