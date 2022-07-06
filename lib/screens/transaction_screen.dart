import 'package:flutter/material.dart';
import 'package:hotel_booking_app/screens/data_home.dart';
import 'package:hotel_booking_app/screens/details_screen.dart';
import 'package:hotel_booking_app/screens/menu_screen.dart';
import 'package:hotel_booking_app/screens/home_screen.dart';

class Halaman extends StatelessWidget {
  @override
  static const String _title = 'Transaction';
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title), backgroundColor: Color.fromARGB(255, 195, 202, 252), titleTextStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)), ),
        body: const MyStatelessWidget(),
        backgroundColor: Color.fromARGB(255, 195, 202, 252),
      ),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const <DataColumn>[
        DataColumn(
          label: Text(
            'No',
            style: TextStyle(fontStyle: FontStyle.italic, color: Color.fromARGB(255, 0, 0, 0)),
          ),
        ),
        DataColumn(
          label: Text(
            'Nama Tempat Penginapan',
            style: TextStyle(fontStyle: FontStyle.italic, color: Color.fromARGB(255, 0, 0, 0)),
          ),
        ),
        DataColumn(
          label: Text(
            'Harga',
            style: TextStyle(fontStyle: FontStyle.italic, color: Color.fromARGB(255, 0, 0, 0)),
          ),
        ),
        DataColumn(
          label: Text(
            'Approve',
            style: TextStyle(fontStyle: FontStyle.italic, color: Color.fromARGB(255, 0, 0, 0)),
          ),
        ),
      ],
      rows: const <DataRow>[
        DataRow(
          cells: <DataCell>[
            DataCell(Text(
              '1',
              style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
            )),
            DataCell(Text(
              'Bali',
              style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
            )),
            DataCell(Text(
              'Rp 400.000',
              style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
            )),
            DataCell(Text('')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text(
              '2',
              style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
            )),
            DataCell(Text(
              'Jakarta',
              style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
            )),
            DataCell(Text(
              'Rp 450.000',
              style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
            )),
            DataCell(Text('')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text(
              '3',
              style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
            )),
            DataCell(Text(
              'Canggu',
              style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
            )),
            DataCell(Text(
              'Rp 700.000',
              style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
            )),
            DataCell(Text('')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text(
              '4',
              style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
            )),
            DataCell(Text(
              'Nihi',
              style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
            )),
            DataCell(Text(
              'Rp 900.000',
              style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
            )),
            DataCell(Text('')),
          ],
        ),
      ],
    );
  }
}
