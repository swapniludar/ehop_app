import "package:ehop_app/models/mybenefits.dart";
import "package:ehop_app/widgets/widgetshelper.dart";
import "package:ehop_app/utils/constants.dart";
import "package:flutter/material.dart";

import "../dal/dao.dart";
import "../models/Service.dart";

class GridHelper extends StatefulWidget {
  const GridHelper({super.key});

  @override
  State<GridHelper> createState() => _GridHelperState();

//final List<MyBenefit> listObjects;
}
class _GridHelperState extends State<GridHelper> {

  @override
  Widget build(BuildContext context) {

    List<Service> getBenefitList() {
      List<Service> serList = [];
      Future<List<MyBenefit>> listFuture;
      listFuture = Dao.getBenefits();
      listFuture.then((value) {
        for (var item in value) {
          print(item.title);
          print(item.imagePath);
          //listProducts.add(item);
          serList.add(
            Service(imagepath: item.imagePath, label: item.title)
          );
        }
      });
      return serList;
    }

    final List<Service> services = getBenefitList();


    /*

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
            (listObjects.length / Constants.service_columns_per_row).ceil(), (rowIndex) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(Constants.service_columns_per_row, (colIndex) {
                  int index = rowIndex * Constants.service_columns_per_row + colIndex;
                  if (index < listObjects.length) {
                    return ServiceHelper(imageName: listObjects[index].imagePath, label: listObjects[index].title);
                  } else {
                    return SizedBox(width: 70); // Empty space for alignment
                  }
                },
            ),
          );
        }
        ),
      ),
    );
    */
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
                return ServiceHelper(imageName: services[index].imagepath, label: services[index].label);
              } else {
                return SizedBox(width: 70); // Empty space for alignment
              }
            },
            ),
          );
        }
        ),
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

