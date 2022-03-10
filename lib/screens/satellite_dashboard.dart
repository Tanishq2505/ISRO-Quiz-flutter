import 'package:flutter/material.dart';
import 'package:isro_quiz/constants.dart';
import 'package:isro_quiz/services/endpoints.dart';
import 'package:isro_quiz/widgets/data_widgets.dart';

import '../models/satellites.dart';

class SatelliteDashboard extends StatefulWidget {
  static const String id = "satellite_dashboard";
  const SatelliteDashboard({Key? key}) : super(key: key);

  @override
  _SatelliteDashboardState createState() => _SatelliteDashboardState();
}

class _SatelliteDashboardState extends State<SatelliteDashboard> {
  Future<SatelliteList>? satelliteListFuture;
  @override
  void initState() {
    super.initState();
    checkConnectivity().then((value) {
      if (value) {
        if (mounted) {
          setState(() {
            satelliteListFuture = getSatelliteList();
          });
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("No"
                " internet found."),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black87,
        elevation: 0,
        centerTitle: true,
        iconTheme: kAppBarIconTheme,
        title: const Text(
          "Launched Satellites",
          style: kAppBarTextStyle,
        ),
      ),
      body: FutureBuilder<SatelliteList>(
        future: satelliteListFuture,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return loadingView();
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              if (snapshot.hasData) {
                if (snapshot.data!.customerSatellites != null) {
                  if (snapshot.data!.customerSatellites!.length > 0) {
                    return ListView.separated(
                      itemBuilder: (context, index) {
                        return SatelliteWidget(
                            item: snapshot.data!.customerSatellites![index]);
                      },
                      separatorBuilder: (context, index) => Divider(
                        color: Colors.black,
                      ),
                      itemCount: snapshot.data!.customerSatellites!.length,
                    );
                  } else {
                    return noDataView("No data found.");
                  }
                } else {
                  return noDataView("No data found.");
                }
              } else if (snapshot.hasError) {
                return noDataView("Something went wrong.");
              } else {
                return noDataView("Something went wrong.");
              }
          }
          return noDataView("Something went wrong.");
        },
      ),
    );
  }
}

// SpacecraftWidget(id: '1',name: "Aryabhatta",)

class SatelliteWidget extends StatelessWidget {
  final CustomerSatellites item;
  SatelliteWidget({required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 16,
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
          foregroundColor: MaterialStateProperty.all(Colors.black87),
        ),
        onPressed: () {},
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "ID:",
                    style: TextStyle(
                      color: kColorPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(item.id.toString()),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "Country:",
                        style: TextStyle(
                          color: kColorSecondary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        child: Text(
                          item.country.toString(),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.visible,
                          softWrap: true,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "Launch Date:",
                        style: TextStyle(
                          color: kColorSecondary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        child: Text(
                          item.launchDate.toString(),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.visible,
                          softWrap: true,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "Mass:",
                        style: TextStyle(
                          color: kColorSecondary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        child: Text(
                          item.mass.toString(),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.visible,
                          softWrap: true,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "Launcher:",
                        style: TextStyle(
                          color: kColorSecondary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        child: Text(
                          item.launcher.toString(),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.visible,
                          softWrap: true,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
