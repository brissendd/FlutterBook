import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'notes_db_worker.dart';
import 'notes_model.dart' show Note, NotesModel, notesModel;

class NotesList extends StatelessWidget {
  const NotesList({super.key});

  @override
  Widget build(BuildContext context) {
    return ScopedModel<NotesModel>(
      model: notesModel,
      child: ScopedModelDescendant<NotesModel>(builder:
          (BuildContext inContext, Widget? inChild, NotesModel inModel) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add, color: Colors.white),
              onPressed: () {
                notesModel.entityBeingEdited = Note();
                notesModel.setColor(null);
                notesModel.setStackIndex(1);
              }),
          body: ListView.builder(
              itemBuilder: (BuildContext inBuildContext, int inIndex) {
            Note note = notesModel.entityList[inIndex];
            Color color = Colors.white;
            switch (note.color) {
              case "red":
                color = Colors.red;
                break;
              case "green":
                color = Colors.green;
                break;
              case "blue":
                color = Colors.blue;
                break;
              case "yellow":
                color = Colors.yellow;
                break;
              case "grey":
                color = Colors.grey;
                break;
              case "purple":
                color = Colors.purple;
                break;
            }
            return Container(padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Slidable(
              startActionPane:  ActionPane(motion: const ScrollMotion(), children: [],), child: Card(),
            ),
            );
          }),
        );
      }),
    );
  }
}
