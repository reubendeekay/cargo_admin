import 'package:cargo_admin/app/shared_components/responsive_builder.dart';
import 'package:cargo_admin/constants.dart';
import 'package:cargo_admin/helpers/lists.dart';
import 'package:cargo_admin/screens/agent/widgets/date_widget.dart';
import 'package:cargo_admin/widgets/logo.dart';
import 'package:cargo_admin/widgets/my_dropdown.dart';
import 'package:cargo_admin/widgets/my_search_button.dart';
import 'package:cargo_admin/widgets/my_table.dart';
import 'package:flutter/material.dart';

class AlertsScreen extends StatefulWidget {
  const AlertsScreen({Key? key}) : super(key: key);

  @override
  State<AlertsScreen> createState() => _AlertsScreenState();
}

class _AlertsScreenState extends State<AlertsScreen> {
  String? alertType;

  String? alertVariable;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: ResponsiveBuilder.isMobile(context)
          ? AppBar(
              title: Row(
                children: const [
                  Icon(Icons.notifications),
                  SizedBox(width: 10),
                  Text('Alerts'),
                ],
              ),
              automaticallyImplyLeading: false,
            )
          : null,
      body: Column(
        children: [
          // const Center(
          //   child: Logo(),
          // ),
          if (!ResponsiveBuilder.isMobile(context))
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                kPrimaryColor.withOpacity(0.3),
                kPrimaryColor.withOpacity(0.6),
                kPrimaryColor,
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  const Text(
                    'Directory',
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: size.height * 0.08,
                  ),
                ],
              ),
            ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(15),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                // border: Border.all(color: kSecondaryColor, width: 2),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        SizedBox(
                          width: !ResponsiveBuilder.isMobile(context)
                              ? size.width * 0.7
                              : double.infinity,
                          child: Row(
                            children: [
                              Expanded(
                                child: MyDropDown(
                                  selectedOption: (value) {
                                    setState(() {
                                      alertVariable = value;
                                    });
                                  },
                                  hintText: 'Select',
                                  options: alertVariables,
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                child: MyDropDown(
                                  selectedOption: (value) {
                                    setState(() {
                                      alertType = value;
                                    });
                                  },
                                  hintText: 'Select',
                                  options: alertTypes,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: !ResponsiveBuilder.isMobile(context)
                              ? size.width * 0.7
                              : double.infinity,
                          child: Row(
                            children: [
                              const MyDateWidget(),
                              const Spacer(),
                              MySearchButton(
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Container(
                          margin: const EdgeInsets.only(top: 15),
                          width: ResponsiveBuilder.isDesktop(context)
                              ? size.width * 0.7
                              : size.width - 30,
                          child: MyTable(
                            columnNumber: tableColumns.length,
                            rowNumber: tableRows.length,
                          )),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
