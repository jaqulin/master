import 'package:flutter/material.dart';
import 'package:lab2/models/assessment.dart';

import 'package:lab2/models/groupmember.dart';

import '../constants.dart';

class SummaryScreen extends StatelessWidget {
  final GroupMember _evaluator;
  // ignore: prefer_typing_uninitialized_variables
  final _data;

  // ignore: use_key_in_widget_constructors
  const SummaryScreen(this._evaluator, this._data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: <Widget>[
            const Text(
              'My To Do List',
              style: TextStyle(fontSize: 15),
            ),
            Text(
              _evaluator.fullName,
              style: const TextStyle(fontSize: 25),
            ),
          ],
        ),
      ),
      body: ListView.separated(
        itemCount: _data.length,
        itemBuilder: (context, index) => _ListTile(
          index: index,
          assessement: _data,
        ),
        separatorBuilder: (context, index) => const Divider(
          color: Colors.grey,
        ),
      ),
    );
  }

  List<dynamic> string() => _data;
}

class _ListTile extends StatefulWidget {
  final int index;
  final List<Assessment> assessement;
  const _ListTile({required this.index, required this.assessement});

  @override
  __ListTileState createState() => __ListTileState();
}

class __ListTileState extends State<_ListTile> {
  void _navigate() async {
    dynamic result = await Navigator.pushNamed(context, detailsRoute,
        arguments: Assessment.copy(widget.assessement[widget.index]));

    if (result != null) {
      setState(() => widget.assessement[widget.index] = result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.assessement[widget.index].member.shortName),
      subtitle: Text(widget.assessement[widget.index].member.fullName),
      trailing: CircleAvatar(
        child: Text(
          widget.assessement[widget.index].percent.round().toString(),
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: widget.assessement[widget.index].percent < 50
            ? Colors.red
            : Colors.green,
      ),
      onTap: () => _navigate(),
    );
  }
}
