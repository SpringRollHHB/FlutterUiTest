import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class FileNetworkActionPage extends StatefulWidget {
  const FileNetworkActionPage({super.key});

  @override
  State<FileNetworkActionPage> createState() => _FileNetworkActionPageState();
}

class _FileNetworkActionPageState extends State<FileNetworkActionPage> {

  int _number = 0;

  String _baiduContent = "null";

  @override
  void dispose() {
    _saveNumberToFile(_number);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top,left: 20,right: 20),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      _number++;
                      setState(() {});
                    },
                    child: Container(
                      width: 60,
                      height: 60,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: const Text("加1",style: TextStyle(color: Colors.black,fontSize: 20,height: 1.0,),),
                    ),
                  ),
                  Expanded(child: Text(
                    "$_number",
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.black,fontSize: 20,height: 1.0),
                  )),
                  GestureDetector(
                    onTap: () async {
                      _readNumber().then((value) {
                        _number = value;
                        setState(() {});
                      });
                    },
                    child: Container(
                      width: 60,
                      height: 60,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text("读取",style: TextStyle(color: Colors.black,fontSize: 20,height: 1.0,),),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Container(
                height: 120,
                width: double.infinity,
                color: Colors.black,
                alignment: Alignment.center,
                child: SingleChildScrollView(
                  child: Text(
                    _baiduContent,
                    style: TextStyle(color: Colors.red,height: 1.1,fontSize: 10),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  _requestBaiduContent();
                },
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "获取百度资源",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  Future<File> _getFileDir() async {
    String dir = (await getApplicationDocumentsDirectory()).path;
    return File('$dir/counter_hhb.txt');
  }

  Future<int> _readNumber() async {
    try {
      File file = await _getFileDir();
      String content = file.readAsStringSync();
      return int.parse(content);
    } catch (exception) {
      return 0;
    }
  }

  Future<void> _saveNumberToFile(int value) async {
    (await _getFileDir()).writeAsString(value.toString());
  }

  Future<void> _requestBaiduContent() async {
    setState(() {
      _baiduContent = "加载中....";
    });
    try {
      HttpClient httpClient = HttpClient();
      HttpClientRequest httpClientRequest = await httpClient.getUrl(Uri.parse("https://www.baidu.com"));
      HttpClientResponse httpClientResponse = await httpClientRequest.close();
      _baiduContent = await httpClientResponse.transform(utf8.decoder).join();
      httpClient.close();
      setState(() {

      });
    } catch(e) {
      _baiduContent = "请求失败 ！";
      setState(() {

      });
    }
  }

}
