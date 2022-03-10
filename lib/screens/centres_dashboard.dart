import 'package:flutter/material.dart';
import 'package:isro_quiz/constants.dart';
import 'package:isro_quiz/models/centres.dart';
import 'package:isro_quiz/services/endpoints.dart';
import 'package:isro_quiz/widgets/data_widgets.dart';

class CentresDashboard extends StatefulWidget {
  static const String id = "centres_dashboard";
  const CentresDashboard({Key? key}) : super(key: key);

  @override
  _CentresDashboardState createState() => _CentresDashboardState();
}

class _CentresDashboardState extends State<CentresDashboard> {
  Future<CentreList>? centreListFuture;
  @override
  void initState() {
    super.initState();
    checkConnectivity().then((value) {
      if (value) {
        if (mounted) {
          setState(() {
            centreListFuture = getCentreList();
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
          "Centres",
          style: kAppBarTextStyle,
        ),
      ),
      body: FutureBuilder<CentreList>(
        future: centreListFuture,
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
                if (snapshot.data!.centres != null) {
                  if (snapshot.data!.centres!.length > 0) {
                    return ListView.separated(
                      itemBuilder: (context, index) {
                        return CentreWidget(
                            item: snapshot.data!.centres![index]);
                      },
                      separatorBuilder: (context, index) => Divider(
                        color: Colors.black,
                      ),
                      itemCount: snapshot.data!.centres!.length,
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

class CentreWidget extends StatelessWidget {
  final Centres item;
  CentreWidget({required this.item});

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
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
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
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "Name:",
                        style: TextStyle(
                          color: kColorSecondary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 220,
                        child: Text(
                          item.name.toString(),
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
                        "Place:",
                        style: TextStyle(
                          color: kColorSecondary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(item.place.toString()),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "State:",
                        style: TextStyle(
                          color: kColorPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        child: Text(
                          item.state.toString(),
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
