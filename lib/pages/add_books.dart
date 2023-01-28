import 'package:crud_app/api/repository.dart';
import 'package:flutter/material.dart';

class AddBooks extends StatefulWidget {
  const AddBooks({super.key});

  @override
  State<AddBooks> createState() => _AddBooksState();
}

class _AddBooksState extends State<AddBooks> {
  Repository repository = Repository();
  final _userIdController = TextEditingController();
  final _idController = TextEditingController();
  final _titleController = TextEditingController();
  final _bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final args = ModalRoute.of(context)!.settings.arguments as List<String>;
    // if (args[1].isNotEmpty) {
    //   _userIdController.text = args[1];
    // }
    // if (args[2].isNotEmpty) {
    //   _titleController.text = args[2];
    // }
    // if (args[3].isNotEmpty) {
    //   _bodyController.text = args[3];
    // }

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Books'),
      ),
      body: Container(
        color: Colors.blueGrey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: [
            TextField(
              controller: _userIdController,
              decoration: InputDecoration(hintText: 'User Id..'),
            ),
            TextField(
              controller: _idController,
              decoration: InputDecoration(hintText: 'Id..'),
            ),
            TextField(
              controller: _titleController,
              decoration: InputDecoration(hintText: 'Title..'),
            ),
            TextField(
              controller: _bodyController,
              decoration: InputDecoration(hintText: 'Body..'),
            ),
            SizedBox(
              height: 18,
            ),
            ElevatedButton(
                onPressed: () async {
                  bool response = await repository.postData(
                      _userIdController.hashCode,
                      _idController.hashCode,
                      _titleController.text,
                      _bodyController.text);

                  if (response) {
                    Navigator.of(context).popAndPushNamed('/home');
                  } else {
                    print('Post data gagal');
                  }
                },
                child: Text('Submit'))
          ]),
        ),
      ),
    );
  }
}
