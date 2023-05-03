import 'package:flutter/material.dart';
import 'package:gazi_sales_app/sales/module/controller/cart_controller.dart';
import 'package:gazi_sales_app/sales/widget/small_text.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../../base/no_data_page.dart';
import '../../../constant/colors.dart';
import '../../../constant/dimensions.dart';
import '../../../widget/big_text.dart';

class CartAccessoriesScreen extends StatefulWidget {
  String productCode;
  CartAccessoriesScreen({
    required this.productCode,
    Key? key}) : super(key: key);

  @override
  State<CartAccessoriesScreen> createState() => _CartAccessoriesScreenState();
}

class _CartAccessoriesScreenState extends State<CartAccessoriesScreen> {
  CartController cartController = Get.find<CartController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cartController.getAccessoriesList(widget.productCode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.appBarColor,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back_outlined,
            size: 25,
          ),
        ),
        title: BigText(
          text: "Accessories",
          color: AppColor.defWhite,
          size: 25,
        ),
      ),
      body: Obx((){
        return cartController.isAccLoaded.value
            ? Center(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10.0),
                      child: CircularProgressIndicator(
                        color: AppColor.appBarColor,
                      ),
                    ),
                    Text('Loading...')
                  ],
                ),
              )
            : Container(
              child: cartController.cartAcc.isEmpty
                  ? const Center(
                child: NoDataPage(
                  text: 'No accessories found yet !',
                ),
              )
                  : ListView.builder(
                  itemCount: cartController.cartAcc.length,
                  itemBuilder: (BuildContext context, int index) {
                    // final itemName = controller.addedProducts[index][0];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Container(
                        height: Dimensions.height120,
                        padding: const EdgeInsets.only(top: 5, bottom: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          //color: Colors.green,
                          boxShadow: const [
                            BoxShadow(
                              // color: Colors.greenAccent[200],
                              offset: Offset(0.01,0.01,),
                              blurRadius: 1.10,
                              spreadRadius: .05,
                            ), //BoxShadow
                            BoxShadow(
                              color: Colors.white,
                              offset: Offset(0.0, 0.0),
                              blurRadius: 0.0,
                              spreadRadius: 0.0,
                            ), //BoxShadow
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.only(left: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      cartController.cartAcc[index]["accName"],
                                      style: TextStyle(fontFamily: GoogleFonts.poppins().fontFamily, fontWeight: FontWeight.bold, fontSize: 14),
                                    ),
                                    SmallText(text: cartController.cartAcc[index]["xitem"], color: Colors.redAccent),
                                    SmallText(text: cartController.cartAcc[index]["xunit"], color: Colors.redAccent),


                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                width: 150,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    IconButton(

                                      onPressed: (){
                                        //remove quantity
                                      },
                                      alignment: Alignment.center,
                                      icon: const Icon(
                                        MdiIcons.minusCircle,
                                        size: 35,
                                        color: AppColor.appBarColor,
                                      ),
                                    ),
                                    const SizedBox(width: 20,),
                                    Text(cartController.cartAcc[index]["xqty"].toString(),
                                      style: TextStyle(
                                          fontFamily: GoogleFonts.poppins().fontFamily,
                                          fontSize: 20),),
                                    const SizedBox(width: 20,),
                                    IconButton(
                                      onPressed: (){
                                        // add quantity
                                      },
                                      icon: const Icon(
                                        MdiIcons.plusCircle,
                                        size: 35,
                                        color: AppColor.appBarColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            );
      })
    );
  }
}