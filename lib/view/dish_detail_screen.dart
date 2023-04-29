import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/get_dishes_detail_controller.dart';

class DishDetailScreen extends StatefulWidget {
  String? name;
  String? discription;
  DishDetailScreen({Key? key, this.name, this.discription}) : super(key: key);

  @override
  State<DishDetailScreen> createState() => _DishDetailScreenState();
}

class _DishDetailScreenState extends State<DishDetailScreen> {
  DishesDetailController dishesDetailController = Get.put(DishesDetailController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dishesDetailController.getdishesdetaildata(refresh: true);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,),
            onPressed: (){
              Get.back();
            },
          ),
        ),
        body: Obx(()=>
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: Get.height*0.99999,
                    child: Stack(
                      children: [
                        Positioned(
                            top: 10,
                            left: Get.width*0.4,
                            child: CircleAvatar(
                              radius: 150,
                              backgroundColor: Color(0xffFFF9F2),
                            )),
                        Positioned(
                            top: 130,
                            left: Get.width*0.67,
                            child: Image.asset("assets/images/pngtree-herbal-ingredients.png")),
                        Positioned(
                            top: 179,
                            left: Get.width*0.4,
                            child: Image.asset("assets/images/Mask Group 17.png")),
                        Positioned(
                          top: 310,
                          //left: Get.width*0.4,
                          child: SizedBox(
                            height: Get.height*0.99,
                            child: SingleChildScrollView(
                              child: Padding(
                                padding:  EdgeInsets.only(left: Get.width*0.065,right: Get.width*0.05),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Ingredients",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold, fontSize: 19, color: Colors.black
                                      ),),
                                    SizedBox(height: 4,),
                                    Text("For 2 people",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold, fontSize: 12, color: Color(0xff8A8A8A)
                                      ),),
                                    SizedBox(height: Get.height*0.02,),
                                    Padding(
                                      padding:  EdgeInsets.only(left: Get.width*0.0,right: Get.width*0.05),
                                      child: Container(
                                        height: Get.height*0.003,
                                        width: Get.width*0.84,
                                        color: Colors.grey,
                                      ),
                                    ),


                                    // for vegetables
                                    SizedBox(height: Get.height*0.02,),
                                    Text("Vegetables (${dishesDetailController.dishesdetaildata.value.ingredients?.vegetables?.length})",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold, fontSize: 17, color: Colors.black
                                      ),),
                                    SizedBox(height: Get.height*0.02,),
                                    SizedBox(
                                      height: Get.height*0.1,
                                      width: Get.width*0.8,
                                      child: ListView.separated(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount: dishesDetailController.dishesdetaildata.value.ingredients?.vegetables?.length??0,
                                        itemBuilder: (context, vegindex) {
                                          return Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("${dishesDetailController.dishesdetaildata.value.ingredients?.vegetables?[vegindex].name}"),
                                              Text("${dishesDetailController.dishesdetaildata.value.ingredients?.vegetables?[vegindex].quantity}")
                                            ],
                                          );
                                        }, separatorBuilder: (BuildContext context, int index) =>
                                          SizedBox(height: Get.height*0.01,),),
                                    ),

                                    // for spices
                                    SizedBox(height: Get.height*0.02,),
                                    Text("Spices (${dishesDetailController.dishesdetaildata.value.ingredients?.spices?.length})",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold, fontSize: 17, color: Colors.black
                                      ),),
                                    SizedBox(height: Get.height*0.02,),
                                    SizedBox(
                                      height: Get.height*0.1,
                                      width: Get.width*0.8,
                                      child: ListView.separated(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount: dishesDetailController.dishesdetaildata.value.ingredients?.spices?.length??0,
                                        itemBuilder: (context, speindex) {
                                          return Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("${dishesDetailController.dishesdetaildata.value.ingredients?.spices?[speindex].name}"),
                                              Text("${dishesDetailController.dishesdetaildata.value.ingredients?.spices?[speindex].quantity}")
                                            ],
                                          );
                                        }, separatorBuilder: (BuildContext context, int index) =>
                                          SizedBox(height: Get.height*0.01,),),
                                    ),


                                    // for appliances
                                    SizedBox(height: Get.height*0.02,),
                                    Text("Appliances",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold, fontSize: 17, color: Colors.black
                                      ),),
                                    SizedBox(height: Get.height*0.02,),
                                    Container(
                                      height: Get.height*0.12,
                                      width: Get.width*0.89,
                                      child: ListView.separated(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount: dishesDetailController.dishesdetaildata.value.ingredients?.appliances?.length??0,
                                        itemBuilder: (context, aplindex) {
                                          return Container(
                                            width: Get.width*0.18,
                                            padding: EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                                color: Color(0xffF5F5F5),
                                                borderRadius: BorderRadius.circular(10)
                                            ),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Image.asset("assets/images/Mask Group 20.png"),
                                                Text("${dishesDetailController.dishesdetaildata.value.ingredients?.appliances?[aplindex].name}",
                                                  style: TextStyle(
                                                      fontSize: 10, color: Colors.black
                                                  ),)
                                              ],
                                            ),
                                          );
                                        }, separatorBuilder: (BuildContext context, int index) =>
                                          SizedBox(width: Get.width*0.04,),),
                                    ),

                                    SizedBox(height: Get.height*0.02,),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),

                        Positioned(
                            top: 10,
                            left: Get.width*0.05,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text("${dishesDetailController.dishesdetaildata.value.name}",
                                      style: TextStyle(
                                          fontSize: 27, fontWeight: FontWeight.bold, color: Colors.black
                                      ),),
                                    SizedBox(width: Get.width*0.014,),
                                    Container(
                                      height: Get.height*0.02,
                                      width: Get.width*0.08,
                                      decoration: BoxDecoration(
                                          color: Color(0xff51C452),
                                          borderRadius: BorderRadius.circular(4)
                                      ),
                                      child: Center(
                                        child: Text("4.2",
                                          style: TextStyle(color: Colors.white,fontSize: 13),),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: Get.height*0.01,),
                                SizedBox(
                                  width: Get.width*0.77,
                                  child: Text("Mughlai Masala is a style of cookery developed"
                                      "\nin the Indian Subcontinent by "
                                      "\nthe imperial kitchens of the Mughal Empire.",
                                    style: TextStyle(fontSize: 13,height: 1.5, color: Color(0xffA3A3A3)),),
                                ),
                                SizedBox(height: Get.height*0.05,),
                                Row(
                                  children: [
                                    Image.asset("assets/images/Group 393.png"),
                                    SizedBox(width: 5),
                                    Text("${dishesDetailController.dishesdetaildata.value.timeToPrepare}",
                                      style: TextStyle(fontWeight: FontWeight.bold),)
                                  ],
                                ),
                                SizedBox(height: Get.height*0.05,),

                              ],
                            )),
                        Positioned(
                          top: 260,
                          child: Container(
                            height: Get.height*0.005,
                            width: Get.width*0.42,
                            color: Colors.grey,
                          ),
                        ),

                      ],
                    ),
                  )
                ],
              ),
            ))
    );
  }
}
