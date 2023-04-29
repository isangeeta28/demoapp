
import 'package:demoapp/view/dish_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/get_dishes_data_controller.dart';

class SelectDishesScreen extends StatefulWidget {
  const SelectDishesScreen({Key? key}) : super(key: key);

  @override
  State<SelectDishesScreen> createState() => _SelectDishesScreenState();
}

class _SelectDishesScreenState extends State<SelectDishesScreen> {
  DishesDataController dishesDataController = Get.put(DishesDataController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dishesDataController.getdishesdata(refresh: true);
  }
  var estateRooms = [
    EstateRoom(isSelected:  false,name: "Italian", ),
    EstateRoom(isSelected:  false,name: "Indian",),
    EstateRoom(isSelected:  false,name: "Indian",),
    EstateRoom(isSelected:  false,name: "Indian", ),
    EstateRoom(isSelected:  false,name: "Indian", ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        title: SizedBox(
          child: Text(
            "Select Dish",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: Obx(()=>
          Stack(
        children: [
          Container(
            height: Get.height*0.08,
            width: Get.width,
            color: Colors.black,
          ),
          Padding(
            padding: EdgeInsets.only(top: Get.height*0.04, left: Get.width*0.06, right: Get.width*0.06),
            child: Container(
              height: Get.height*0.09,
              width: Get.width*0.98,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [new BoxShadow(
                  color: Colors.black,
                  blurRadius: 6.0,
                ),],
              ),
              padding: EdgeInsets.only(left: Get.width*0.043, right: Get.width*0.043),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset("assets/images/Select_date-01@2x.png",
                        scale: 1.6,),
                      SizedBox(width: Get.width*0.03,),
                      Text("21 May 2021",
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                    ],
                  ),
                  SizedBox(
                    height: Get.height*0.05,
                    child: VerticalDivider(
                      thickness: 2,
                      color: Color(0xFFD6D6D6CE),
                    ),
                  ),
                  Row(
                    children: [
                      Image.asset("assets/images/Set_time-01@2x.png",
                        scale: 1.6,),
                      SizedBox(width: Get.width*0.02,),
                      Text("10:30 Pm-12:30 Pm",
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),)
                    ],
                  )


                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only( top: Get.height*0.15),
            child: SizedBox(
              height: Get.height,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // for show the different cousions
                    Padding(
                      padding:  EdgeInsets.only(left: Get.width*0.065,),
                      child: SizedBox(
                        height: Get.height*0.04,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: estateRooms.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: (){
                                setState(() {
                                  var lastVal = estateRooms[index].isSelected;
                                  for (var element in estateRooms) {element.isSelected = false;}
                                  estateRooms[index].isSelected = !lastVal;
                                });
                              },
                              child: Container(
                                width: Get.width*0.2,
                                decoration: BoxDecoration(
                                    color: estateRooms[index].isSelected?Color(0xffFFF9F2):Colors.white,
                                    borderRadius: BorderRadius.circular(23),
                                    border: Border.all(color: estateRooms[index].isSelected?Color(0xffFF941A):Color(0xffBDBDBD))
                                ),
                                child: Center(
                                  child: Text(
                                    estateRooms[index].name,
                                    style: TextStyle(color: estateRooms[index].isSelected?Color(0xffFF941A):Color(0xff8A8A8A),fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                            );
                          }, separatorBuilder: (BuildContext context, int index) => SizedBox(width: Get.width*0.05,),),
                      ),
                    ),

                    // for show the popular dishes
                    SizedBox(height: Get.height*0.02,),
                    Padding(
                      padding:  EdgeInsets.only(left: Get.width*0.065,),
                      child: Text("Popular Dishes",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17, color: Colors.black
                        ),),
                    ),
                    SizedBox(height: Get.height*0.02,),
                    Padding(
                      padding:  EdgeInsets.only(left: Get.width*0.065,),
                      child: SizedBox(
                        height: Get.height*0.1,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: dishesDataController.dishesdata.value.popularDishes?.length??0,
                          itemBuilder: (context, index) {
                            return CircleAvatar(
                              radius: 30,
                              backgroundImage: NetworkImage(dishesDataController.dishesdata.value.popularDishes?[index].image??""),
                              child: Center(
                                child: Text("${dishesDataController.dishesdata.value.popularDishes?[index].name}",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),),
                              ),
                            );
                          }, separatorBuilder: (BuildContext context, int index) => SizedBox(width: Get.width*0.04,),),
                      ),
                    ),

                    SizedBox(height: Get.height*0.02,),

                    Divider(
                      thickness: 5,
                      color: Color(0xffF2F2F2),
                    ),
                    SizedBox(height: Get.height*0.02,),
                    Padding(
                      padding:  EdgeInsets.only(left: Get.width*0.065,right: Get.width*0.065),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Recommended",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17, color: Colors.black
                            ),),
                          Container(
                            height: Get.height*0.03,
                            width: Get.width*0.15,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(7)
                            ),
                            child: Center(
                              child: Text("Menu",
                                style: TextStyle(color: Colors.white),),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: Get.height*0.02,),
                    Padding(
                      padding:  EdgeInsets.only(left: Get.width*0.06,right: Get.width*0.045),
                      child: ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: dishesDataController.dishesdata.value.dishes?.length??0,
                        itemBuilder: (context, intindex) {
                          return InkWell(
                            onTap: (){
                              Get.to(()=>  DishDetailScreen(
                                name: dishesDataController.dishesdata.value.dishes?[intindex].name,
                                discription : dishesDataController.dishesdata.value.dishes?[intindex].description
                              ));
                            },
                            child: Container(
                              //height: Get.height*0.1,
                                width: Get.width*0.23,
                                decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.grey, width: 1)),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text("${dishesDataController.dishesdata.value.dishes?[intindex].name??""}",
                                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,
                                                  color: Colors.black),),
                                            SizedBox(width: Get.width*0.014,),
                                            Image.asset("assets/images/Group 359.png",scale: 0.7,),
                                            SizedBox(width: Get.width*0.014,),
                                            Container(
                                              height: Get.height*0.02,
                                              width: Get.width*0.08,
                                              decoration: BoxDecoration(
                                                  color: Color(0xff51C452),
                                                  borderRadius: BorderRadius.circular(4)
                                              ),
                                              child: Center(
                                                child: Text("${dishesDataController.dishesdata.value.dishes?[intindex].rating}",
                                                  style: TextStyle(color: Colors.white,fontSize: 13),),
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(height: Get.height*0.02,),
                                        Row(
                                          children: [
                                            // Column(
                                            //   crossAxisAlignment: CrossAxisAlignment.start,
                                            //   children: [
                                            //     Image.asset("assets/images/Mask Group 20.png"),
                                            //     Text("Refrigerator",
                                            //       style: TextStyle(fontSize: 9),)
                                            //   ],
                                            // ),
                                            // SizedBox(width: Get.width*0.01,),
                                            // Column(
                                            //   crossAxisAlignment: CrossAxisAlignment.start,
                                            //   children: [
                                            //     Image.asset("assets/images/Mask Group 20.png"),
                                            //     Text("Refrigerator",
                                            //       style: TextStyle(fontSize: 9),)
                                            //   ],
                                            // ),
                                            Container(
                                              height: Get.height*0.083,
                                              width: Get.width*0.2,
                                              child: ListView.separated(
                                                shrinkWrap: true,
                                                scrollDirection: Axis.horizontal,
                                                physics: NeverScrollableScrollPhysics(),
                                                itemCount: dishesDataController.dishesdata.value.dishes?[intindex].equipments?.length??0,
                                                itemBuilder: (context, eqindex) {
                                                  return Container(
                                                    width: Get.width*0.08,
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Image.asset("assets/images/Mask Group 20.png"),
                                                        Text("${dishesDataController.dishesdata.value.dishes?[intindex].equipments?[eqindex]}",
                                                          style: TextStyle(
                                                              fontSize: 5, color: Colors.black, fontWeight: FontWeight.w700
                                                          ),)
                                                      ],
                                                    ),
                                                  );
                                                }, separatorBuilder: (BuildContext context, int index) =>
                                                  SizedBox(width: Get.width*0.04,),),
                                            ),
                                            SizedBox(width: Get.width*0.01,),
                                            SizedBox(
                                              height: Get.height*0.065,
                                              child: VerticalDivider(
                                                thickness: 2,
                                                color: Color(0xFFD6D6D6CE),
                                              ),
                                            ),
                                            SizedBox(width: Get.width*0.01,),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("Ingredients",
                                                  style: TextStyle(
                                                      fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold
                                                  ),),
                                                Text("View list",
                                                  style: TextStyle(
                                                      fontSize: 12, color: Color(0xffFF8800), fontWeight: FontWeight.bold
                                                  ),),

                                              ],
                                            )
                                          ],
                                        ),
                                        SizedBox(height: Get.height*0.01,),
                                        SizedBox(
                                          width: Get.width*0.58,
                                          child: Text("${dishesDataController.dishesdata.value.dishes?[intindex].description}",
                                            style: TextStyle(color: Color(0xff707070),fontSize: 14),),
                                        ),
                                        SizedBox(height: Get.height*0.02,),
                                      ],
                                    ),
                                    Container(
                                      height: Get.height*0.12,
                                      width: Get.width*0.3,
                                      padding: EdgeInsets.only(top: Get.height*0.065),
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                dishesDataController.dishesdata.value.dishes?[intindex].image??"",
                                              ),fit: BoxFit.fill
                                          )
                                      ),
                                      child: Center(
                                        child: Container(
                                          height: Get.height*0.033,
                                          width: Get.width*0.13,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(4),
                                              border: Border.all(color: Color(0xffFF8800))
                                          ),
                                          child: Center(
                                            child: Text("Add",
                                              style: TextStyle(color: Color(0xffFF8800),fontWeight: FontWeight.bold),),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                            ),
                          );
                        }, separatorBuilder: (BuildContext context, int index) => SizedBox(height: Get.height*0.03,),),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      )
      ),
    );
  }
}
class EstateRoom {
  bool isSelected;
  String name;

  EstateRoom({required this.isSelected,required this.name,});
}

