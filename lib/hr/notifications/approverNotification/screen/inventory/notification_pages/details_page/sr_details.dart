import 'dart:convert';
import '../../../../../../../conts_api_link.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import '../../notification_models/details/sr_details_model.dart';
import '../../../../../../../sales/constant/app_constants.dart';
import '../../../approver_notification.dart';

class SR_details_notification extends StatefulWidget {
  SR_details_notification(
      {required this.xtornum,
      required this.zid,
      required this.xposition,
      required this.xstatustor,
      required this.zemail,
      required this.xstaff});

  String xtornum;
  String zid;
  String xposition;
  String xstatustor;
  String xstaff;
  String zemail;

  @override
  State<SR_details_notification> createState() =>
      _SR_details_notificationState();
}

class _SR_details_notificationState extends State<SR_details_notification> {
  Future<List<SrDetailsModel>>? futurePost;

  //String rejectNote = " ";
  TextEditingController rejectNote = TextEditingController();

  Future<List<SrDetailsModel>> fetchPostdetails() async {
    var response = await http.post(
        Uri.parse(
            'http://${AppConstants.baseurl}/gazi/notification/inventory/sr/srDetails.php'),
        body: jsonEncode(
            <String, String>{"zid": widget.zid, "xtornum": widget.xtornum}));

    if (response.statusCode == 200) {
      print('sr details: ${response.body}');
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

      return parsed
          .map<SrDetailsModel>((json) => SrDetailsModel.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  void initState() {
    super.initState();
    futurePost = fetchPostdetails();
    fetchPostdetails().whenComplete(() => futurePost);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Color(0xff064A76),
          onPressed: () {
            Navigator.pop(context);
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => AdminNotificationList(
                          xposition: widget.xposition,
                          zemail: widget.zemail,
                          zid: widget.zid,
                          xstaff: widget.xstaff,
                        )));
          },
        ),
        title: Center(
          child: Text(
            "Pending SR Details",
            style: GoogleFonts.bakbakOne(
              fontSize: 20,
              color: Color(0xff074974),
            ),
          ),
        ),
        actions: [
          SizedBox(
            width: 20,
          )
        ],
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: FutureBuilder<List<SrDetailsModel>>(
          future: futurePost,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) => Card(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 6.0, left: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Text(
                                    //   "Item:" +
                                    //       " ${DateFormat("dd-MM-yyyy").format(DateTime.parse((snapshot.data![index].xdate.date).toString()))}",
                                    //   textAlign: TextAlign.center,
                                    //   style: GoogleFonts.bakbakOne(
                                    //     fontSize: 18,
                                    //     //color: Color(0xff074974),
                                    //   ),
                                    // ),
                                    // Text(
                                    //   "Required By Date:" +
                                    //       " ${DateFormat("dd-MM-yyyy").format(DateTime.parse((snapshot.data![index].xdatereq.date).toString()))}",
                                    //   textAlign: TextAlign.center,
                                    //   style: GoogleFonts.bakbakOne(
                                    //     fontSize: 18,
                                    //     //color: Color(0xff074974),
                                    //   ),
                                    // ),
                                    Text(
                                      "Item: " + snapshot.data![index].xitem,
                                      style: GoogleFonts.bakbakOne(
                                        fontSize: 18,
                                        //color: Color(0xff074974),
                                      ),
                                    ),
                                    //
                                    Text(
                                      "Unit: "
                                      "${snapshot.data![index].xunit}",
                                      style: GoogleFonts.bakbakOne(
                                        fontSize: 18,
                                        //color: Color(0xff074974),
                                      ),
                                    ),
                                    Text(
                                      "Description: "
                                      "${snapshot.data![index].xdesc}",
                                      style: GoogleFonts.bakbakOne(
                                        fontSize: 18,
                                        //color: Color(0xff074974),
                                      ),
                                    ),
                                    //
                                    Text(
                                      "Quantity Required: " +
                                          snapshot.data![index].xqtyreq,
                                      style: GoogleFonts.bakbakOne(
                                        fontSize: 18,
                                        //color: Color(0xff074974),
                                      ),
                                    ),
                                    //
                                    Text(
                                      "Available Qty: " +
                                          snapshot.data![index].xdphqty,
                                      style: GoogleFonts.bakbakOne(
                                        fontSize: 18,
                                        //color: Color(0xff074974),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.green,
                        ),
                        // color: Colors.green,
                        onPressed: () async {
                          var response = await http.post(
                              Uri.parse(
                                  'http://${AppConstants.baseurl}/gazi/notification/inventory/sr/srApprove.php'),
                              body: jsonEncode(<String, String>{
                                "zid": widget.zid,
                                "user": widget.zemail,
                                "xposition": widget.xposition,
                                "xtornum": widget.xtornum,
                                "ypd": "0",
                                " xstatustor": widget.xstatustor
                              }));

                          Get.snackbar('Message', 'Approved',
                              backgroundColor: Color(0XFF8CA6DB),
                              colorText: Colors.white,
                              snackPosition: SnackPosition.TOP);

                          Navigator.pop(context, "approval");
                          print(response.statusCode);
                        },
                        child: Text(
                          "Approve",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        //color: Colors.red,
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text("Reject Note"),
                                  content: Column(
                                    children: [
                                      Container(
                                        //height: MediaQuery.of(context).size.height/6,
                                        child: TextFormField(
                                          style: GoogleFonts.bakbakOne(
                                            //fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            color: Colors.black,
                                          ),
                                          onChanged: (input) {
                                            rejectNote.text = input;
                                          },
                                          validator: (input) {
                                            if (input!.isEmpty) {
                                              return "Please Write Reject Note";
                                            }
                                          },
                                          scrollPadding: EdgeInsets.all(20),
                                          decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.only(left: 20),
                                            // add padding to adjust text
                                            isDense: false,

                                            hintStyle: GoogleFonts.bakbakOne(
                                              //fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                              color: Colors.black,
                                            ),
                                            labelText: "Reject Note",
                                            labelStyle: GoogleFonts.bakbakOne(
                                              fontSize: 18,
                                              color: Colors.black,
                                            ),
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  actions: [
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        backgroundColor: Color(0xff064A76),
                                      ),
                                      //color: Color(0xff064A76),
                                      onPressed: () async {
                                        //http://172.20.20.69/adminapprove/poreject.php
                                        if (rejectNote.text.isEmpty) {
                                          Navigator.pop(context);
                                          print('response code: Empty field');
                                          Get.snackbar('Warning!',
                                              'Please enter reject note',
                                              backgroundColor: Colors.redAccent,
                                              colorText: Colors.white,
                                              snackPosition: SnackPosition.TOP);
                                        } else {
                                          var response = await http.post(
                                              Uri.parse(
                                                  'http://${AppConstants.baseurl}/gazi/notification/inventory/sr/srReject.php'),
                                              body: jsonEncode(<String, String>{
                                                "zid": widget.zid,
                                                "user": widget.zemail,
                                                "xposition": widget.xposition,
                                                "wh": "0",
                                                "xtornum": widget.xtornum,
                                                "xnote": rejectNote.text
                                              }));
                                          print(response.statusCode);
                                          print(response.body);
                                          Get.snackbar('Message', 'Rejected',
                                              backgroundColor:
                                                  Color(0XFF8CA6DB),
                                              colorText: Colors.white,
                                              snackPosition: SnackPosition.TOP);

                                          //ager page a back korbo
                                          Navigator.pop(context);
                                          Navigator.pop(context, "approval");
                                        }
                                        //   setState(() {
                                        //     snapshot.data!.removeAt(index);
                                        //   });
                                      },
                                      child: Text(
                                        "Reject",
                                        style: GoogleFonts.bakbakOne(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                  scrollable: true,
                                );
                              });
                        },
                        child: Text(
                          "Reject",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  )
                ],
              );
            } else {
              return Center(
                child: Image(image: AssetImage("assets/images/loading.gif")),
              );
            }
          },
        ),
      ),
    );
  }
}
