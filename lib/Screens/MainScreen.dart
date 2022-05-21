import 'package:bybit/Controllers/MainController.dart';
import 'package:bybit/Helpers/ColorHelpers.dart';
import 'package:bybit/Models/CoinModel.dart';
import 'package:bybit/Widgets/ChartWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import 'Login&RegisterScreen.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  MainController controller = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorHelpers.backGroundColor,
        body: AnimationLimiter(
          child: Stack(
            children: AnimationConfiguration.toStaggeredList(
              duration: const Duration(milliseconds: 275),
              childAnimationBuilder: (widget) => SlideAnimation(
                horizontalOffset: 50.0,
                child: FadeInAnimation(
                  child: widget,
                ),
              ),
              children: [_buildMainPage()],
            ),
          ),
        ),
      ),
    );
  }

  _buildAppBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Get.width * .025),
      height: Get.height * .05,
      width: Get.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage("assets/images/image.png"),
          ),
          _buildSearchField(),
          Icon(
            Icons.email,
            color: Colors.white12,
            size: Get.width * .08,
          ),
          Icon(
            Icons.headset_mic_outlined,
            color: Colors.white12,
            size: Get.width * .08,
          ),
        ],
      ),
    );
  }

  _buildSearchField() {
    return SizedBox(
      height: Get.height * .05,
      width: Get.width * .6,
      child: TextFormField(
        textAlign: TextAlign.center,
        decoration: InputDecoration(
            fillColor: Colors.white12,
            filled: true,
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.grey,
            ),
            hintText: "Search coin",
            hintStyle: const TextStyle(color: Colors.grey),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color: Colors.orange, width: 1),
            )),
      ),
    );
  }

  _buildBody() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(top: Get.height * .05),
        child: SizedBox(
          height: Get.height,
          width: double.maxFinite,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: Get.height * .03),
                height: Get.height * .25,
                width: Get.width,
                child: const LineChartSample7(),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(LoginAndRegisterScreen());
                },
                child: Container(
                  height: Get.height * .05,
                  width: Get.width,
                  margin: EdgeInsets.symmetric(
                      horizontal: Get.width * .05, vertical: Get.height * .015),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Register / Sing in to get bonus!"),
                      SizedBox(
                        width: Get.width * .03,
                      ),
                      const Icon(Icons.arrow_forward)
                    ],
                  ),
                ),
              ),
              _buildTabBarCoinList(),
              _buildTabBarView(),
            ],
          ),
        ),
      ),
    );
  }

  _buildTabBarCoinList() {
    return Container(
      height: Get.height * .05,
      width: Get.width,
      color: Colors.white12,
      child: TabBar(
        controller: controller.tabController,
        indicatorColor: Colors.orange,
        indicatorSize: TabBarIndicatorSize.label,
        tabs: const [
          Text(
            "Hot",
            style: TextStyle(color: Colors.white),
          ),
          Text(
            "Gainers",
            style: TextStyle(color: Colors.white),
          ),
          Text(
            "New",
            style: TextStyle(color: Colors.white),
          ),
        ],
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
          _buildSubTabBar(),
        ],
      ),
    );
  }

  _buildSubTabBar() {
    return Column(
      children: [
        _buildSubCategory(),
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

  _buildMainPage() {
    return Stack(
      children: [
        _buildAppBar(),
        _buildBody(),
      ],
    );
  }

  _buildSubCategory() {
    return SizedBox(
      height: Get.height * .05,
      width: Get.width,
      child: GetBuilder<MainController>(
        builder: (category) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: category.listOfCat.length,
            itemBuilder: (_, index) {
              CatModel item = category.listOfCat[index];
              return GestureDetector(
                onTap: () {
                  category.listOfCat.forEach((element) {
                    element.isSelected?.value = false;
                  });
                  item.isSelected?.value = true;
                  category.update();
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: Get.width * .05, vertical: 5),
                      child: Text(
                        item.title!,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                    item.isSelected?.value != true
                        ? Container()
                        : AnimatedContainer(
                            duration: const Duration(milliseconds: 275),
                            height: 2,
                            width: Get.width * .2,
                            color: Colors.orange,
                          ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
