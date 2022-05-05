import 'package:cargo_admin/app/shared_components/responsive_builder.dart';
import 'package:cargo_admin/constants.dart';
import 'package:cargo_admin/helpers/lists.dart';
import 'package:cargo_admin/widgets/logo.dart';
import 'package:cargo_admin/widgets/my_dropdown.dart';
import 'package:cargo_admin/widgets/my_search_button.dart';
import 'package:cargo_admin/widgets/my_table.dart';
import 'package:cargo_admin/widgets/my_text_field.dart';
import 'package:flutter/material.dart';

class TrackingScreen extends StatefulWidget {
  const TrackingScreen({Key? key}) : super(key: key);

  @override
  State<TrackingScreen> createState() => _TrackingScreenState();
}

class _TrackingScreenState extends State<TrackingScreen> {
  String? exportType;
  String? trackingNumber;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: ResponsiveBuilder.isMobile(context)
          ? AppBar(
              title: Row(
                children: const [
                  Icon(Icons.local_shipping),
                  SizedBox(width: 10),
                  Text('Tracking'),
                ],
              ),
              automaticallyImplyLeading: false,
            )
          : null,
      body: Column(
        children: [
          // const Logo(),
          SizedBox(
            height: size.height * 0.08,
          ),
          const Center(
            child: Text(
              'Booked Shipments',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          Container(
            margin: const EdgeInsets.all(15),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              // border: Border.all(color: kSecondaryColor, width: 2),
            ),
            child: Column(
              children: [
                ResponsiveBuilder.isMobile(context)
                    ? Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                      child: SizedBox(
                                    height: 40,
                                    child: myTextField(
                                        hint: 'Tracking No',
                                        onChanged: (val) {
                                          setState(() {
                                            trackingNumber = val;
                                          });
                                        }),
                                  )),
                                  const SizedBox(width: 10),
                                  const MySearchButton()
                                ],
                              ),
                              MyDropDown(
                                selectedOption: (value) {
                                  setState(() {
                                    exportType = value;
                                  });
                                },
                                hintText: 'Select',
                                options: exportTypes,
                              ),
                            ],
                          ),
                        ),
                      )
                    : Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.2),
                        child: SizedBox(
                          width: double.infinity,
                          child: Row(
                            children: [
                              MyDropDown(
                                selectedOption: (value) {
                                  setState(() {
                                    exportType = value;
                                  });
                                },
                                hintText: 'Select',
                                options: exportTypes,
                              ),
                              Expanded(
                                  child: SizedBox(
                                height: 40,
                                child: myTextField(
                                    hint: 'Tracking No',
                                    onChanged: (val) {
                                      setState(() {
                                        trackingNumber = val;
                                      });
                                    }),
                              )),
                              const SizedBox(width: 10),
                              const MySearchButton()
                            ],
                          ),
                        ),
                      ),
                Expanded(
                  child: SizedBox(
                      // margin: const EdgeInsets.only(top: 15),
                      width: size.width - 30,
                      child: MyTable(
                        columnNumber: tableColumns.length,
                        rowNumber: tableRows.length,
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
