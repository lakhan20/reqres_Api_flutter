import 'package:flutter/material.dart';
import 'package:reqresapi/model/data.dart';
import 'package:reqresapi/service/apiService.dart';

void main()
{
  runApp(MyApp());

}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: MyHomePage(),

    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Api"),
      ),
      body: FutureBuilder(
        future: ApiService().getData(),
        builder: (BuildContext context,AsyncSnapshot<List<Data>> snapshot){
          if(snapshot.hasData)
            {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context,index){

                    return  Expanded(
                      child: Row(
                        children: [
                          Column(
                              children: [
                                Card(
                                  semanticContainer: true,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: Image.network('${snapshot.data![index].avatar}',
                                  fit: BoxFit.fill,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  elevation: 5,
                                  margin: EdgeInsets.all(10),

                                ),

                              ],

                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text('Id : ${snapshot.data![index].email}')
                                ],
                              ),
                              Row(
                              children: [
                                Text('First Name : ${snapshot.data![index].first_name}')
                              ],
                              ),
                              Row(
                                children: [
                                  Text('Last Name : ${snapshot.data![index].last_name}')
                                ],
                              ),
                              Row(
                                children: [
                                  Text('Email : ${snapshot.data![index].email}')
                                ],
                              )


                            ],
                          )
                        ],
                      ),
                  
                    );


                  }
              );
            }
          return Center(child: CircularProgressIndicator());
        },

      ),

    );
  }
}

