import 'package:flow_go/presentation/pallette.dart';
import 'package:flutter/material.dart';
import 'package:string_ops/string_ops.dart';

class WebflowTable extends StatelessWidget {
  final List<String> columns;
  // final List<double>? columnWidths;
  final List<Map<String, String>> items;

  WebflowTable({required this.columns, required this.items});

  @override
  Widget build(BuildContext context) {
    TableCell headerCellBuilder(String value) {
      return TableCell(
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Text(
            value.convertCasing(CasingFormat.titleCase),
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
      );
    }

    TableRow headerRowBuilder() {
      return TableRow(
        decoration: BoxDecoration(
          color: WebflowPallette.neutral[300]?.withOpacity(0.4),
        ),
        children: [
          for (int i = 0; i < columns.length; i++)
            headerCellBuilder(columns[i]),
        ],
      );
    }

    TableCell cellBuilder(String? value) {
      return TableCell(
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Text(value ?? ''),
        ),
      );
    }

    TableRow rowBuilder(Map<String, String> item) {
      return TableRow(
        decoration: BoxDecoration(
          color: WebflowPallette.neutral,
          border: Border(
            top: BorderSide(
              color: WebflowPallette.neutral[300]!,
            ),
          ),
        ),
        children: [
          for (int i = 0; i < columns.length; i++)
            cellBuilder(item[columns[i]]),
        ],
      );
    }

    return Container(
      width: double.maxFinite,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Table(
        border: TableBorder.symmetric(
          outside: BorderSide(
            color: WebflowPallette.neutral[300]!,
          ),
        ),
        children: [
          headerRowBuilder(),
          for (int i = 0; i < items.length; i++) rowBuilder(items[i]),
        ],
      ),
    );
  }
}
