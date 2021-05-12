import 'package:flutter/material.dart';
import 'package:flutter_task/api/my_api.dart';
import 'package:flutter_task/model/my_model.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  Future<List<MyModel>> futureData;
  
  @override
  void initState() {
    super.initState();
    futureData = fetchData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<MyModel>>(
        future: futureData,
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            if(snapshot.hasData){
              List<MyModel> demo = snapshot.data;
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ListView.separated(
                        physics: ClampingScrollPhysics(),
                        separatorBuilder: (context, index){
                          return Divider();
                        },
                        shrinkWrap: true,
                        itemCount: demo.length,
                        itemBuilder: (context, index){
                          return ListTile(
                            title: Text(demo[index].company),
                            leading:(demo[index].companyLogo == null) ? FlutterLogo() : Image.network(
                              demo[index].companyLogo,
                              width: 150,
                              fit: BoxFit.cover,
                            ),
                          );
                        }
                    ),
                  ],
                ),
              );
            }
          }
          return Center(child: CircularProgressIndicator(),);
        },
      ),
    );
  }
}
