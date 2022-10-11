import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reserved4u/Reviews/GiveFeedBack/GiveFeedBackController.dart';

import '../../Helper/NotificatiokKeys.dart';

// ignore: must_be_immutable
class SelectEmployee extends StatelessWidget {
  GiveFeedBackController _giveFeedBackController =
      Get.put(GiveFeedBackController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appbar(),
      bottomNavigationBar: bottomNavBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            searchEmploye(),
            Obx(
              () => listContainerForEmplyoee(),
            ),
          ],
        ),
      ),
    );
  }

  Widget appbar() {
    return AppBar(
      backgroundColor: Color(0xFFfef4ee),
      elevation: 0,
      title: Text(
        'selectEmployee'.tr,
        style: TextStyle(
          color: Color(0xFFdc8d8d),
          fontSize: 18,
          fontFamily: AppFont.bold,
        ),
      ),
      actions: [
        InkWell(
          onTap: () {
            _giveFeedBackController.selecedIndexForEmp.value = "";
            _giveFeedBackController.selectedEmployeeName.value =
                'selectEmployee'.tr;
          },
          child: Center(
            child: Container(
              padding: EdgeInsets.only(right: 10),
              child: Text(
                'clear'.tr,
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: AppFont.medium,
                    decoration: TextDecoration.underline),
              ),
            ),
          ),
        )
      ],
      leading: Container(
          margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
          height: 35,
          width: 35,
          decoration: BoxDecoration(boxShadow: [
            const BoxShadow(
                color: Colors.black12,
                spreadRadius: 1,
                offset: Offset(1, 1),
                blurRadius: 7)
          ], color: Colors.white, borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_outlined,
              color: Colors.black,
              size: 15,
            ),
            onPressed: () {
              Get.back();
            },
          )),
    );
  }

  Widget searchEmploye() {
    return Container(
      margin: EdgeInsets.all(10),
      height: 55,
      decoration: BoxDecoration(
          color: Color(AppColor.textFieldBg),
          borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          SizedBox(
            width: 20.0,
          ),
          Image.asset(
            AssestPath.homeView + 'SearchWhite.png',
            fit: BoxFit.fill,
            height: 20,
            width: 20,
            color: Colors.black,
          ),
          SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: TextFormField(
              //controller: textEditingController,
              autocorrect: false,
              style: TextStyle(
                fontFamily: AppFont.medium,
                fontSize: 15,
              ),
              onChanged: (str) {
                _giveFeedBackController.getEmployeesFromServer(str);
              },
              decoration: InputDecoration(
                hintText: 'findByEmployeeNameShort'.tr,
                hintStyle: TextStyle(
                    color: Color(AppColor.textFieldtextColor),
                    fontFamily: AppFont.medium,
                    fontSize: 15),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(AppColor.textFieldBg),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget listContainerForEmplyoee() {
    return Container(
      margin: EdgeInsets.all(10),
      height: Get.height - 260,
      child: ListView.builder(
        itemCount: _giveFeedBackController.arrAvailbleEmplloyee.length,
        itemBuilder: (context, ind) {
          var currentObj = _giveFeedBackController.arrAvailbleEmplloyee[ind];
          return InkWell(
            onTap: () {
              _giveFeedBackController.selecedIndexForEmp.value = ind.toString();
              _giveFeedBackController.selectedEmployeeName.value =
                  currentObj.empName;
            },
            child: Container(
              height: 60,
              child: Row(
                children: [
                  employeImage(currentObj.empImagePath, currentObj.empName),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    currentObj.empName,
                    style: TextStyle(
                        fontFamily: AppFont.medium,
                        fontSize: 15,
                        color: Colors.black),
                  ),
                  Spacer(),
                  Obx(
                    () => Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage(
                            _giveFeedBackController.selecedIndexForEmp.value ==
                                    ind.toString()
                                ? AssestPath.detailScreen + "selectEmp.png"
                                : AssestPath.detailScreen + "nonSelectEmp.png",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget employeImage(String url, String eName) {
    List<String> nameList = eName.split(' ');
    String name = '';
    if (nameList.length == 2) {
      name = nameList.first[0].toUpperCase() + nameList.last[0].toUpperCase();
    } else {
      name = nameList.first[0].toUpperCase() + nameList.first[1].toUpperCase();
    }
    return Container(
      height: 50,
      width: 50,
      child:
          url == 'https://www.reserved4you.de/storage/app/public/default/default-user.png' ||
                  url == null ||
                  url == ''
              ? Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Text(
                      name,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFdb8a8a),
                      ),
                    ),
                  ),
                )
              : CachedNetworkImage(
                  imageUrl:
                      "https://delemontstudio.com/reserved4younew/storage/default/logo-03.png",
                  placeholder: (context, url) => Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF101928),
                      borderRadius: BorderRadius.circular(60),
                      border: Border.all(color: Colors.white, width: 2),
                      image: DecorationImage(
                        image: AssetImage(
                          "assets/images/defaultuser.png",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        border:
                            Border.all(color: Color(0xFFdb8a8a), width: 0.3)),
                    child: Center(
                      child: Text(
                        name,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFdb8a8a),
                        ),
                      ),
                    ),
                  ),
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF101928),
                      borderRadius: BorderRadius.circular(60),
                      border: Border.all(color: Colors.white, width: 2),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
    );
  }

  InkWell bottomNavBar() {
    return InkWell(
      onTap: () {
        Get.back();
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
        height: 80,
        width: Get.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          color: Color(0xFFdb8a8a),
        ),
        child: Container(
          margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: Center(
            child: Text(
              'done'.tr,
              style: TextStyle(
                  color: Color(AppColor.scaffoldbgcolor),
                  fontFamily: AppFont.semiBold,
                  fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
