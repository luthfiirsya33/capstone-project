import 'package:flutter/material.dart';
import 'package:capstone_project_sib_kwi/common/constants.dart';

class TableChatBotKey extends StatelessWidget {
  const TableChatBotKey({Key? key}) : super(key: key);
  static const routeName = '/keyword_chatbot';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Table Key'),
        backgroundColor: primaryColor,
        elevation: 0,
      ),
      body: Center(
          child: ListView(
        children: [
          DataTable(columns: const [
            DataColumn(
              label: Center(
                child: Text(
                  'Topic',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: darkPurpleColor,
                  ),
                ),
              ),
            ),
            DataColumn(
                label: Text(
              'Question',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: darkPurpleColor,
              ),
            )),
            DataColumn(
                label: Text(
              'Answer',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: darkPurpleColor,
              ),
            )),
          ], rows: const [
            DataRow(cells: [
              DataCell(Text('1. INFO CHATBOT',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold))),
              DataCell(Text('apa itu chatbot kwi?')),
              DataCell(Text('Informasi Chatbot')),
            ]),
            DataRow(cells: [
              DataCell(Text('',
                  style: TextStyle(
                    fontSize: 15,
                  ))),
              DataCell(Text('info chatbot kwi?')),
              DataCell(Text('Informasi Chatbot')),
            ]),
            DataRow(cells: [
              DataCell(Text('2. WISATA POPULER',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold))),
              DataCell(Text('wisata terpopuler?')),
              DataCell(Text('Wisata Populer')),
            ]),
            DataRow(cells: [
              DataCell(Text('',
                  style: TextStyle(
                    fontSize: 15,
                  ))),
              DataCell(Text('rating tertinggi?')),
              DataCell(Text('Wisata Populer')),
            ]),
            DataRow(cells: [
              DataCell(Text('3. WISATA TERENDAH',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold))),
              DataCell(Text('wisata terburuknya?')),
              DataCell(Text('Wisata Terendah')),
            ]),
            DataRow(cells: [
              DataCell(Text('',
                  style: TextStyle(
                    fontSize: 15,
                  ))),
              DataCell(Text('rating terburuknya?')),
              DataCell(Text('Wisata Terendah')),
            ]),
            DataRow(cells: [
              DataCell(Text('4. KULINER TERBAIK',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold))),
              DataCell(Text('kuliner favorit?')),
              DataCell(Text('Kuliner Terbaik')),
            ]),
            DataRow(cells: [
              DataCell(Text('',
                  style: TextStyle(
                    fontSize: 15,
                  ))),
              DataCell(Text('kuliner terpopuler?')),
              DataCell(Text('Kuliner Terbaik')),
            ]),
             DataRow(cells: [
              DataCell(Text('5. KULINER TERBURUK',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold))),
              DataCell(Text('kuliner terburuk?')),
              DataCell(Text('Kuliner Terburuk')),
            ]),
            DataRow(cells: [
              DataCell(Text('',
                  style: TextStyle(
                    fontSize: 15,
                  ))),
              DataCell(Text('kuliner rating terendah?')),
              DataCell(Text('Kuliner Terburuk')),
            ]),

          ]),
        ],
      )),
    );
  }
}
