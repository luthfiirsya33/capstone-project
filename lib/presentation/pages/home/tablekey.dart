import 'package:flutter/material.dart';
import 'package:capstone_project_sib_kwi/common/constants.dart';

class TableChatBotKey extends StatelessWidget {
  const TableChatBotKey({Key? key}) : super(key: key);
    static const routeName = '/keyword_chatbot';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      appBar: AppBar(
        title: const Text('Table Key'),
        backgroundColor: primaryColor,
        elevation: 0,
      ),
      body: Center(
        child: ListView( children: [
            DataTable(
                  columns: const [
                    DataColumn(
                      label: Center(child: Text('Topic',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Colors.purple
                      ),),),
                    ),
                    DataColumn(
                        label: Text('Keywords',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              color: Colors.purple
                          ),)
                    ),
                    DataColumn(
                        label: Text('Answer',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              color: Colors.purple
                          ),)
                    ),
                  ],
                  rows: const [
                    DataRow(cells: [
                      DataCell(
                        Text(
                          '1. INFO CHATBOT',
                          style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)
                        )
                      ),
                      DataCell(Text('Chatbot KWI')
                      ),
                      DataCell(Text('Informasi Chatbot KWI')
                      ),
                    ]),
                    DataRow(cells: [
                      DataCell(
                        Text('', style: TextStyle(fontSize: 15,))
                      ),
                      DataCell(Text('apa itu chatbot KWI?')
                      ),
                      DataCell(Text('Informasi Chatbot KWI')
                      ),
                    ]),
                  ]),
          ],
        )
        ),
        );
  }
}