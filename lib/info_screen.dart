import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Define a common text style for the table
    final TextStyle tableTextStyle = TextStyle(fontSize: 20);

    return Scaffold(
      appBar: AppBar(
        title: Text('Grade Conversion Table'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columnSpacing: 150, // Adjust spacing between columns
                columns: [
                  DataColumn(
                    label: Text(
                      'Grade Range',
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Letter Grade',
                    ),
                  ),
                ],
                rows: [
                  DataRow(cells: [
                    DataCell(Text('4.0 - 3.7', style: tableTextStyle)),
                    DataCell(Text('A', style: tableTextStyle)),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('3.7 - 3.3', style: tableTextStyle)),
                    DataCell(Text('B+', style: tableTextStyle)),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('3.3 - 3.0', style: tableTextStyle)),
                    DataCell(Text('B', style: tableTextStyle)),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('3.0 - 2.7', style: tableTextStyle)),
                    DataCell(Text('B-', style: tableTextStyle)),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('2.7 - 2.3', style: tableTextStyle)),
                    DataCell(Text('C+', style: tableTextStyle)),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('2.3 - 2.0', style: tableTextStyle)),
                    DataCell(Text('C', style: tableTextStyle)),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('2.0 - 1.7', style: tableTextStyle)),
                    DataCell(Text('C-', style: tableTextStyle)),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('1.7 - 1.3', style: tableTextStyle)),
                    DataCell(Text('D+', style: tableTextStyle)),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('1.3 - 1.0', style: tableTextStyle)),
                    DataCell(Text('D', style: tableTextStyle)),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Below 1.0', style: tableTextStyle)),
                    DataCell(Text('F', style: tableTextStyle)),
                  ]),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
