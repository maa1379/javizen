import 'package:bybit/Controllers/LoginAndRegisterController.dart';
import 'package:bybit/Controllers/MainController.dart';
import 'package:bybit/Controllers/MarketController.dart';
import 'package:bybit/Helpers/ColorHelpers.dart';
import 'package:bybit/Models/CoinModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class MarketScreen extends StatelessWidget {
  MarketScreen({Key? key}) : super(key: key);
  MarketController controller = Get.put(MarketController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorHelpers.backGroundColor,
        body: SizedBox(
          height: Get.height,
          width: Get.width,
          child: Column(
            children: [
              SizedBox(
                height: Get.height * .05,
                width: Get.width,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(top: Get.height * .015),
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: Get.width * .05),
                      child: Text("sample1",style: TextStyle(color: Colors.grey,fontSize: 18),),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: Get.width * .05),
                      child: Text("sample2",style: TextStyle(color: Colors.grey,fontSize: 18),),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: Get.width * .05),
                      child: Text("sample3",style: TextStyle(color: Colors.grey,fontSize: 18),),
                    ),
                    Icon(Icons.sticky_note_2_outlined,color: Colors.white,),
                    SizedBox(width:  Get.width * .025,),
                    Icon(Icons.search,color: Colors.white,),
                  ],
                ),
              ),
              _buildTabBar(),
              _buildTabBarView(),
            ],
          ),
        ),
      ),
    );
  }

  _buildTabBar() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: SizedBox(
        height: Get.height * .05,
        width: Get.width * .55,
        child: TabBar(
          indicatorSize: TabBarIndicatorSize.label,
          controller: controller.tabController,
          indicatorColor: Colors.orange,
          unselectedLabelColor: Colors.white,
          unselectedLabelStyle: const TextStyle(color: Colors.white),
          tabs: const [
            Text(
              "Derivatives",
              style: TextStyle(color: Colors.orange),
            ),
            Text(
              "Spot",
              style: TextStyle(color: Colors.orange),
            ),
          ],
        ),
      ),
    );
  }


  _buildTabBarView() {
    return Expanded(
      child: TabBarView(
        controller: controller.tabController,
        children: [
          _buildSubTabBar(),
          _buildSubTabBar(),
        ],
      ),
    );
  }

  _buildSubTabBar() {
    return Column(
      children: [
        // _buildSubCategory(),
        const Divider(
          color: Colors.white,
        ),
        Expanded(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: 15,
            itemBuilder: itemBuilder,
          ),
        ),
      ],
    );
  }

  Widget itemBuilder(BuildContext context, int index) {
    return Container(
      height: Get.height * .05,
      width: Get.width,
      margin: EdgeInsets.symmetric(vertical: Get.height * .005),
      padding: EdgeInsets.symmetric(horizontal: Get.width * .05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.star,color: Colors.orange,),
              SizedBox(width: Get.width * .05,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "BTC/USDT",
                    style: const TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  const Text(
                    "spot",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "38,296.57",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  Text(
                    "127.92M USDT",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
              SizedBox(
                width: Get.width * .08,
              ),
              Container(
                height: Get.height * .04,
                width: Get.width * .15,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Center(
                    child: Text(
                      "-3.32%",
                      style: TextStyle(color: Colors.white),
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }

}
