import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TicketUploadScreen extends StatefulWidget {
  @override
  _TicketUploadScreenState createState() => _TicketUploadScreenState();
}

class _TicketUploadScreenState extends State<TicketUploadScreen> {
  List<File> _image = []..length = 0;
  List<String> _pathList = List<String>();
  initState() {
    super.initState();
    debugPrint("INIT STATE ÇALIŞTI ");
  }

  File image;

  final imgPicker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Tickets"),
          actions: [
            IconButton(
                icon: Icon(
                  Icons.photo_library_outlined,
                  size: MediaQuery.of(context).size.height * 0.05,
                ),
                onPressed: () {
                  pickImage(ImageSource.gallery);
                }),
            IconButton(
                icon: Icon(
                  Icons.camera_alt_outlined,
                  size: MediaQuery.of(context).size.height * 0.05,
                ),
                onPressed: () {
                  pickImage(ImageSource.camera);
                }),
            IconButton(
                icon: Icon(
                  Icons.refresh_outlined,
                  size: MediaQuery.of(context).size.height * 0.05,
                ),
                onPressed: () async {
                  _pathList = await _getPathList();
                  setState(() {
                     
                  });
                 
                  
                 
                })
          ],
        ),
        body: SafeArea(
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, crossAxisSpacing: 20.0, mainAxisSpacing: 20.0),
            itemCount : _pathList.length,
          itemBuilder: (context, index) {
            return ( Image.file(File("${_pathList[index]}"))
                // ,

                );
          }))
          
          );
  }

  Future pickImage(ImageSource source) async {
    final imageFile = await imgPicker.getImage(source: source);
    File tmpFile = File(imageFile.path);
    final appDir = await getApplicationDocumentsDirectory();
    final fileName = basename(imageFile.path);
    tmpFile = await tmpFile.copy('${appDir.path}/$fileName');
    _pathList.add(tmpFile.path);
    debugPrint("_PATH LİST  :  $_pathList  !!!!!!!!!!!!!");
    _setPathList(_pathList);
    print('File path is :${tmpFile.path}');
    setState(() {
      if (imageFile != null) {
        _image.add(File(imageFile.path));
        image = tmpFile;
        debugPrint("İF ÇALIŞTI $imageFile");
      } else {
        debugPrint('ELSE ÇALIŞTI $_image');
      }
    });
  }

  _body() => SafeArea(
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, crossAxisSpacing: 20.0, mainAxisSpacing: 20.0),
          itemCount: _image.length == null ? 1 : _image.length,
          itemBuilder: (context, index) {
            return (Container(
              width: 100,
              height: 100,
              child: Text("CONTAİNER NERDE MK ")
                // Image.file(File("${_pathList[index]}")),

                ));
          }));

  _buildContainerWithImage(int index) => GestureDetector(
      onTap: () {
        debugPrint('INDEX  $index');
      },
      child: (Container(child: Text("CONTAİNER NERDE MK ")
          // Image.file(File("${_pathList[index]}")),

          )));

  _getPathList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getStringList("pathList");
  }

  void _setPathList(List<String> pathList) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    debugPrint("SET PATH LİST   : $_pathList");
    prefs.setStringList("pathList", pathList);
  }
}
