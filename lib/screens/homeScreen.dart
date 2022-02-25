import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:file_picker_app/models/contaner_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FocusNode _node = FocusNode();
  @override
  void initState() {
    super.initState();
    _node.requestFocus();
  }
  Uint8List? bytes;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              focusNode: _node,
              onHover: (e){
                    if (e) {
                      ContainerColor.textColor=Colors.black;
                      ContainerColor.primaryColor=Colors.yellow;
                    } else {
                      ContainerColor.textColor=Colors.yellow;
                      ContainerColor.primaryColor=Colors.black;
                    }
                    setState(() {});
              },
              onTap: ()async{
                   FilePickerResult? result = await FilePicker.platform.pickFiles(
                    type: FileType.custom,
                    allowedExtensions: ['jpg', 'png'],
                  );
                  String? path=result != null ? result.files[0].path!:null;
                 
                    if (path != null) {
                      bytes=await  File(path).readAsBytes();
                    setState(() {});
                    }
                    _node.requestFocus();
                
              },
              borderRadius:const BorderRadius.all(Radius.circular(10)),
              child: Container(
                child: Text("Pick File",style: TextStyle(color: ContainerColor.textColor,fontWeight: FontWeight.bold,fontSize: 24),),
                padding:const EdgeInsets.symmetric(horizontal: 18,vertical: 15),
                decoration: BoxDecoration(
                  color: ContainerColor.primaryColor,
                  borderRadius:const BorderRadius.all(Radius.circular(10)),
                  boxShadow:const [
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(1.5, 1.5),
                      blurRadius: 1.5
                    )
                  ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            if(bytes !=null) Container(
              width: 300,
              height: 300,
               child: Image.memory(
                 bytes!,width: 300,height: 400,),
             ),
          ],
        ),
        ),
    );
  }
}