import "package:ehop_app/models/mybenefits.dart";
import "package:ehop_app/widgets/widgetshelper.dart";
import "package:ehop_app/utils/constants.dart";
import "package:flutter/material.dart";

import "../dal/dao.dart";
import "../models/Service.dart";

class MyWidget extends StatelessWidget {
  final Future<List<String>> futureList;

  MyWidget({required this.futureList});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: futureList,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // Loading indicator
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}'); // Error message
        } else if (snapshot.hasData) {
          final items = snapshot.data!;
          return ListView(
            children: List.generate(
              items.length,
                  (index) => ListTile(title: Text(items[index])),
            ),
          );
        } else {
          return Text('No data available');
        }
      },
    );
  }
}

class GridHelper extends StatefulWidget {
  GridHelper({super.key});



  @override
  State<GridHelper> createState() => _GridHelperState();

//final List<MyBenefit> listObjects;
}
class _GridHelperState extends State<GridHelper> {
  List<Service> services = [];
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    try {
      final result = await Dao.getBenefits(); // Your async function returning Future<List<String>>
      setState(() {
        for (var item in result) {
          print(item.title);
          print(item.imagePath);
          //listProducts.add(item);
          services.add(
              Service(imagepath: item.imagePath, label: item.title)
          );
        }
        isLoading = false;
      });
    } catch (e) {
      // Handle error
      setState(() {
        isLoading = false;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return CircularProgressIndicator(); // Loading indicator
    }
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
            (services.length / Constants.service_columns_per_row).ceil(), (rowIndex) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(Constants.service_columns_per_row, (colIndex) {
              int index = rowIndex * Constants.service_columns_per_row + colIndex;
              if (index < services.length) {
                return ServiceHelper(
                    imageName: services[index].imagepath,
                    label: services[index].label);//.replaceFirst(" ", "\n"));
              } else {
                return SizedBox(width: 55); // Empty space for alignment
              }
            },
            ),
          );
        }
        ),
      ),
    );
  }
}

