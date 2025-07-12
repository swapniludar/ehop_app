import 'package:ehop_app/models/benefit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/benefits_provider.dart';
import '../utils/constants.dart';
import '../widgets/widgetshelper.dart';

class HomeBody extends ConsumerWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final benefitsAsync = ref.watch(benefitsProvider);

    final Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width > 600 ? 800 : screenSize.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "e-hop",
          /*style: TextStyle(
            color: Colors.black,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,

          ),*/
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Image.asset(
              'assets/images/ehop_logo_1.jpg',
              height: 50,
              width: 50,
            ),
          ),
        ],
        centerTitle: false,
        //backgroundColor: Colors.pink.shade900,
        backgroundColor: Colors.blue.shade600,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(0.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  //width: MediaQuery.of(context).size.width,
                  width: screenWidth,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.blue.shade50,
                        Colors.white,
                      ],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      Text(
                        "Hello, Jane",
                        style: Theme.of(context).textTheme.titleMedium,
                        /*style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),*/
                      ),
                      SizedBox(height: 30.0),
                      //GridHelper(),
                      benefitsAsync.when(
                        data: (services) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: List.generate(
                                (services.length / Constants.service_columns_per_row).ceil(), (rowIndex) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: List.generate(
                                  Constants.service_columns_per_row, (colIndex) {
                                  int index = rowIndex * Constants.service_columns_per_row + colIndex;
                                  if (index < services.length) {
                                    return ServiceHelper(
                                      benefit: services[index],
                                      onTap: () => _navigateToBenefitDetail(context, services[index]),
                                    );
                                    /*return ServiceHelper(
                                        imageName: services[index].icon,
                                        label: services[index].name
                                    );//.replaceFirst(" ", "\n"));*/
                                  } else {
                                    return SizedBox(width: 55); // Empty space for alignment
                                  }
                                },
                                ),
                              );
                            }
                            ),
                          );
                        },
                        loading: () => const Center(child: CircularProgressIndicator()),
                        error: (e, _) => Center(child: Text("Error: $e")),
                      ),
                    ],
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
    /*
    return Scaffold(
      appBar: AppBar(title: const Text("Health Check Services")),
      body: benefitsAsync.when(
        data: (services) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
                (services.length / Constants.service_columns_per_row).ceil(), (rowIndex) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  Constants.service_columns_per_row, (colIndex) {
                  int index = rowIndex * Constants.service_columns_per_row + colIndex;
                  if (index < services.length) {
                    return ServiceHelper(
                        imageName: services[index].icon,
                        label: services[index].name
                    );                  //.replaceFirst(" ", "\n"));
                  } else {
                    return SizedBox(width: 55); // Empty space for alignment
                  }
                },
                ),
              );
            }
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text("Error: $e")),
      ),
    );*/
  }

  void _navigateToBenefitDetail(BuildContext context, MyBenefit benefit) {
    /*Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BenefitDetailScreen(benefit: benefit),
      ),
    );*/
  }
}