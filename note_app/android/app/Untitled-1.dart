import '../../constants/notes.dart';

class NoteDetails extends StatefulWidget {
  NoteDetails({
    Key? key,
  }) : super(key: key);

  @override
  _NoteDetailsState createState() => _NoteDetailsState();
}

class _NoteDetailsState extends State<NoteDetails> {
  final List<Note> noteList = [
    // Your list of notes here
    // ...
  ];

  void _deleteNote(int index) {
    setState(() {
      noteList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(20.0),
      itemCount: noteList.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Dismissible(
          key: UniqueKey(),
          onDismissed: (direction) {
            _deleteNote(index);
          },
          child: GestureDetector(
            onTap: () {
              print("My Detail Screen");
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(
                    note: noteList[index], // Pass the note from the list
                  ),
                ),
              );
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: Color(int.parse(noteList[index].color)),
              child: ListTile(
                contentPadding: const EdgeInsets.all(30.0),
                title: Text(
                  noteList[index].title,
                  style: Theme.of(context).textTheme.headline6?.merge(
                        const TextStyle(color: Colors.black),
                      ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
