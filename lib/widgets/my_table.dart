import 'package:cargo_admin/constants.dart';
import 'package:cargo_admin/helpers/lists.dart';
import 'package:cargo_admin/models/cargo_model.dart';
import 'package:flutter/material.dart';
import 'package:lazy_data_table/lazy_data_table.dart';

class MyTable extends StatefulWidget {
  const MyTable({Key? key, this.rowNumber, this.columnNumber, this.cargos})
      : super(key: key);
  final int? rowNumber;
  final int? columnNumber;
  final List<CargoModel>? cargos;

  @override
  State<MyTable> createState() => _MyTableState();
}

class _MyTableState extends State<MyTable> {
  @override
  Widget build(BuildContext context) {
    return LazyDataTable(
      rows: widget.rowNumber ?? 4,
      columns: widget.columnNumber ?? 6,
      tableDimensions: const LazyDataTableDimensions(
        cellHeight: 40,
        cellWidth: 150,
        topHeaderHeight: 40,
        leftHeaderWidth: 50,
      ),
      topHeaderBuilder: (i) => Container(
        color: kPrimaryColor,
        child: Center(
            child: Text(
          tableColumns[i],
          style:
              const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        )),
      ),
      leftHeaderBuilder: (i) => Container(
          color: kPrimaryColor,
          child: Center(
              child: Text(
            " ${i + 1}",
            style: const TextStyle(color: Colors.white),
          ))),
      dataCellBuilder: (i, j) => Center(child: Text(tableRows[i][j])),
      topLeftCornerWidget: Container(
          color: kPrimaryColor,
          child: const Center(
            child: Text(
              "S/No",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
          )),
    );
  }
}
