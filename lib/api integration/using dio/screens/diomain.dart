
import 'package:fake_store_api/api%20integration/using%20dio/controller/datacontrolller.dart';
import 'package:fake_store_api/api%20integration/using%20dio/utils/colors.dart';
import 'package:fake_store_api/api%20integration/using%20dio/utils/cost_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:lottie/lottie.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
void main(){
  runApp(GetMaterialApp(
    home: DioHome(),debugShowCheckedModeBanner: false,
  ));
}

class DioHome extends StatelessWidget {
DataController controller = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.bgColor,
      appBar: AppBar(
        title: Text('DioHome'),
        backgroundColor: MyColors.scColor,
      ),

      floatingActionButton: Obx(() => controller.isNetConnected.value ? bildFAB() : Container()),
      body: Obx(() => SizedBox(
    height: double.infinity,
    width: double.infinity,
    child: controller.isNetConnected.value
    ? (controller.isLoading.value
    ? Center(
    child:
    Lottie.asset("assets/animations/loadingg.json"))
        : getData())
        : noInternet(context),
    )
    ));
  }

 FloatingActionButton bildFAB() {
    return FloatingActionButton(onPressed: (){
      controller.isListDown.value ? controller.scrollToUp() : controller.scrollToDown();
    },

    child:  FaIcon(controller.isListDown.value ? FontAwesomeIcons.arrowUp: FontAwesomeIcons.arrowDown),
    );
 }

 RefreshIndicator getData()  {
    return RefreshIndicator(child: ScrollablePositionedList.builder(
      itemScrollController: controller.scrollController,
        itemCount: controller.datas.length, itemBuilder: (context,index){
      return Card(
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: MyColors.bgColor,
            child: Text(controller.datas[index].id.toString()),
          ),
          title: Text(controller.datas[index].title!),
          subtitle: Text(controller.datas[index].body!),
        ),
      );
    }),
        onRefresh: (){
      return controller.fetchData();
    });
 }


 Center noInternet(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset("assets/animations/no internet.json"),
          MaterialButton(onPressed: ()async{
            if(await InternetConnectionChecker().hasConnection){
              controller.fetchData();
            }else{
              showCustomSnackBar(context);
            }
          })
        ],
      )
    );
 }
}
