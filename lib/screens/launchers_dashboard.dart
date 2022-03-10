import 'package:flutter/material.dart';
import 'package:isro_quiz/constants.dart';
import 'package:isro_quiz/models/launchers.dart';
import 'package:isro_quiz/services/endpoints.dart';
import 'package:isro_quiz/widgets/data_widgets.dart';

class LaunchersDashboard extends StatefulWidget {
  static const String id = "launchers_dashboard";

  @override
  _LauncherDashboardState createState() => _LauncherDashboardState();
}

class _LauncherDashboardState extends State<LaunchersDashboard> {
  Future<LaunchersList>? launcherListFuture;
  @override
  void initState() {
    super.initState();
    checkConnectivity().then((value) {
      if (value) {
        if (mounted) {
          setState(() {
            launcherListFuture = getLaunchersList();
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
          "Launchers",
          style: kAppBarTextStyle,
        ),
      ),
      body: FutureBuilder<LaunchersList>(
        future: launcherListFuture,
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
                if (snapshot.data!.launchers != null) {
                  if (snapshot.data!.launchers!.length > 0) {
                    return ListView.separated(
                      itemBuilder: (context, index) {
                        return LauncherWidget(
                            item: snapshot.data!.launchers![index]);
                      },
                      separatorBuilder: (context, index) => Divider(
                        color: Colors.black,
                      ),
                      itemCount: snapshot.data!.launchers!.length,
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

class LauncherWidget extends StatelessWidget {
  final Launchers item;
  LauncherWidget({required this.item});

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
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
        ),
      ),
    );
  }
}
