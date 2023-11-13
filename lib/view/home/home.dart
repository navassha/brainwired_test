import 'dart:ui';

import 'package:brain_wired_mechine_test/Widgets/styled_text.dart';
import 'package:brain_wired_mechine_test/extensions/responsive.dart';
import 'package:brain_wired_mechine_test/provider/api_provider.dart';
import 'package:brain_wired_mechine_test/view/mapview/mapview.dart';
import 'package:brain_wired_mechine_test/view/web/webview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg1.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(context.width(15)),
          // there is the working of API when api is gettting the ui will show
          // othervise nothing will show
          child: _apigetting(ref),
        ),
      ),
    );
  }

  Widget? _apigetting(WidgetRef ref) {
    return ref.watch(apiGetting).when(
          data: (data) {
            if (data == null) {
              return const Text("somthing went wrong");
            }
            return ListView.separated(
              itemBuilder: (context, index) => ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: context.width(440),
                    decoration: BoxDecoration(
                      color: const Color(0x2CFFFFFF),
                      borderRadius: BorderRadius.circular(
                        context.width(20),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(context.width(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          StyledText(
                            text: "Username  :  ${data[index].username}",
                            size: 18,
                            color: Colors.white,
                          ),
                          _szdBox(context),
                          StyledText(
                            text: "Name  :  ${data[index].name}",
                            size: 18,
                            color: Colors.white,
                          ),
                          _szdBox(context),
                          StyledText(
                            text: "Email  :  ${data[index].email}",
                            size: 18,
                            color: Colors.white,
                          ),
                          _szdBox(context),
                          StyledText(
                            text: "Number  :  ${data[index].phone}",
                            size: 18,
                            color: Colors.white,
                          ),
                          _szdBox(context),
                          StyledText(
                            text: "Company  :  ${data[index].company.name}",
                            size: 18,
                            color: Colors.white,
                          ),
                          _szdBox(context),
                          StyledText(
                            text: "Type  :  ${data[index].company.bs}",
                            size: 18,
                            color: Colors.white,
                          ),
                          _szdBox(context),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const StyledText(
                                text: "Address  :  ",
                                size: 18,
                                color: Colors.white,
                              ),
                              StyledText(
                                text:
                                    "${data[index].address.city},\n${data[index].address.street}\n${data[index].address.suite}\n${data[index].address.zipcode}",
                                size: 18,
                                color: Colors.white,
                              )
                            ],
                          ),
                          SizedBox(
                            height: context.width(30),
                          ),
                          Center(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => WebView(
                                        // there the link is invalid is the link is valid we can show the web
                                        uri: data[index].website,
                                        name: data[index].name),
                                  ),
                                );
                              },
                              child: Container(
                                width: context.width(170),
                                height: context.width(48),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                  color: Colors.white,
                                ),
                                child: const Center(
                                  child: StyledText(
                                    text: "Website",
                                    size: 19,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          _szdBox(context),
                          Center(
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MAPViewOFuser(
                                      lang: data[index].address.geo.lng,
                                      lat: data[index].address.geo.lng,
                                      name: data[index].name,
                                    ),
                                  ),
                                );
                              },
                              child: const StyledText(
                                text: "See Location",
                                size: 18,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              separatorBuilder: (context, index) => SizedBox(
                height: context.width(20),
              ),
              itemCount: data.length,
            );
          },
          error: (error, stackTrace) => const Center(
            child: Text("Somthing Went Wrong"),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        );
  }

  SizedBox _szdBox(BuildContext context) {
    return SizedBox(
      height: context.width(10),
    );
  }
}
