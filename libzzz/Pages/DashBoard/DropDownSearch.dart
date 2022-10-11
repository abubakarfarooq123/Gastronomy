import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:reserved4u/Helper/NotificatiokKeys.dart';
import 'package:reserved4u/Pages/DashBoard/DashBoardController.dart';
import 'package:reserved4u/Pages/DashBoard/DropDownAddress.dart';

// ignore: must_be_immutable
class DropDownSearch extends StatelessWidget {
  DashBoardController _iconController = Get.put(DashBoardController());

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: () {
            _iconController.fabIconNumber.value =
                !_iconController.fabIconNumber.value;
          },
          child: Center(
              child: Container(
            margin: EdgeInsets.only(
              top: 215,
            ),
            height: 50,
            width: Get.width * 0.90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color(AppColor.red),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 20,
                ),
                Image.asset(
                  AssestPath.homeView + "Search.png",
                  height: 20,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'advanceSearch'.tr,
                  style: TextStyle(
                      color: Color(
                        AppColor.logoBgColor,
                      ),
                      fontFamily: AppFont.regular,
                      fontSize: 16),
                ),
                Spacer(),
                Obx(
                  () => _iconController.fabIconNumber.value == true
                      ? Icon(Icons.keyboard_arrow_up,
                          color: Color(AppColor.logoBgColor), size: 35)
                      : Icon(Icons.keyboard_arrow_down,
                          color: Color(AppColor.logoBgColor), size: 35),
                ),
                SizedBox(
                  width: 6,
                )
              ],
            ),
          )),
        ),
        Obx(
          () => Visibility(
              visible: _iconController.fabIconNumber.value,
              child: _iconController.fabIconNumber2.value
                  ? dropDownContainer(context)
                  : dropDownContainer2(context)),
        ),
      ],
    );
  }

// IconButton
  Container iconButton() {
    return Container(
      child: IconButton(
          icon: _iconController.fabIconNumber.value == true
              ? Icon(Icons.keyboard_arrow_up,
                  color: Color(AppColor.logoBgColor), size: 35)
              : Icon(Icons.keyboard_arrow_down,
                  color: Color(AppColor.logoBgColor), size: 35),
          onPressed: () {}),
    );
  }

// DropDown Menu
  Center dropDownContainer(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 265),
            padding: EdgeInsets.only(top: 0, bottom: 0, left: 20, right: 20),
            width: Get.width * 0.90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                    blurRadius: 200,
                    color: Colors.grey[300],
                    offset: Offset(0, 20))
              ],
              color: Color(0xFFffffff),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(height: 20),
                Obx(
                  () => dropdownfieldForSuggestion(
                      img: "Search.png",
                      enabled: true,
                      hinttext: "Search a category",
                      controller: _iconController.searchStr.value,
                      focus: _iconController.myFocusNode3),
                ),
                SizedBox(height: 5),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Center dropDownContainer2(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 265),
            padding: EdgeInsets.only(top: 0, bottom: 0, left: 20, right: 20),
            width: Get.width * 0.90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                    blurRadius: 200,
                    color: Colors.grey[300],
                    offset: Offset(0, 20))
              ],
              color: Color(0xFFffffff),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 10,
                ),
                Obx(
                  () => InkWell(
                    onTap: () {
                      // _iconController.openPlacePicker(context);
                      _iconController.isAddressPopUpOpen.value = true;
                      // _iconController.myFocusNode = FocusNode();

                      Get.to(DropDownAddress());
                    },
                    child: dropdownfieldForSuggestion(
                      img: "hash.png",
                      enabled: false,
                      hinttext: _iconController.selectedAddress.value,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Obx(
                  () => dropdownfieldForSuggestion(
                      img: "fork.png",
                      enabled: true,
                      hinttext: "Restaurant",
                      controller: _iconController.suggestionStr.value,
                      focus: _iconController.myFocusNode2),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    height: 126,
                    padding: EdgeInsets.symmetric(vertical: 10),
                    width: double.infinity,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Container(
                            width: MediaQuery.of(context).size.width / 5.7,
                            margin: EdgeInsets.all(4),
                            child: index == 0
                                ? Obx(() => GestureDetector(
                                    onTap: () {
                                      _iconController.category_id.value = 0;
                                    },
                                    child: menuSelection(
                                        "assets/images/HomeView/showAll.png",
                                        "Show All",
                                        false,
                                        0)))
                                : index == 4
                                    ? GestureDetector(
                                        onTap: () {
                                          showBottomSheetForSearchOptions(
                                              context);
                                        },
                                        child: menuSelection(
                                            "assets/images/HomeView/arrow.png",
                                            "Show More",
                                            false,
                                            0))
                                    : Obx(() => _iconController
                                                .categoryArray.length ==
                                            0
                                        ? Container()
                                        : GestureDetector(
                                            onTap: () {
                                              _iconController
                                                      .category_id.value =
                                                  _iconController
                                                      .categoryArray[index - 1]
                                                      .id;
                                            },
                                            child: menuSelection(
                                              _iconController
                                                  .categoryArray[index - 1]
                                                  .categoryImagePath,
                                              _iconController
                                                  .categoryArray[index - 1]
                                                  .name,
                                              true,
                                              _iconController
                                                  .categoryArray[index - 1].id,
                                            ))),
                          );
                        })),
                SizedBox(
                  height: 20,
                ),
                pickUp(),
                SizedBox(
                  height: 20,
                ),
                searchButton(),
                clearButton(),
              ],
            ),
          ),
          // Obx(() => suggestionAddresses()),
          Obx(() => suggestionContainer()),
        ],
      ),
    );
  }

  Widget pickUp() {
    return Material(
      borderRadius: BorderRadius.circular(12),
      elevation: 5,
      child: Container(
        // height: 40,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Obx(() => InkWell(
                  onTap: () {
                    _iconController.order_type.value = 1;
                  },
                  child: Container(
                    height: 40, width: 70,

                    alignment: Alignment.center,
                    // width: double.infinity,
                    child: Text(
                      "Pick Up",
                      style: TextStyle(
                          color: _iconController.order_type == 1
                              ? Colors.black
                              : Colors.grey.shade500,
                          fontWeight: FontWeight.w500,
                          fontSize: 15),
                    ),
                  ),
                )),
            Container(
              width: 2,
              height: 50,
              decoration: BoxDecoration(
                  // color: Colors.grey.shade400,
                  gradient: LinearGradient(colors: [Colors.grey, Colors.white]),
                  borderRadius: BorderRadius.circular(32)),
            ),
            Obx(
              () => InkWell(
                onTap: () {
                  _iconController.order_type.value = 2;
                },
                child: Container(
                  height: 40,
                  alignment: Alignment.center,
                  width: 70,
                  child: Text(
                    "Delivery",
                    style: TextStyle(
                        color: _iconController.order_type == 2
                            ? Colors.black
                            : Colors.grey.shade500,
                        fontWeight: FontWeight.w500,
                        fontSize: 15),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future showBottomSheetForSearchOptions(BuildContext context) {
    return showModalBottomSheet(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        backgroundColor: Colors.white,
        context: context,
        builder: (context) {
          return Container(
            height: 520,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(15.0),
                  child: Container(
                    //padding: EdgeInsets.only(top: 8, bottom: 8),
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xFFf9f9fb),
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(
                        left: 20,
                        right: 10,
                      ),
                      child: Obx(
                        () => TextField(
                          textInputAction: TextInputAction.done,
                          textAlignVertical: TextAlignVertical.center,
                          enabled: true,
                          onChanged: (value) =>
                              _iconController.getResult(value),
                          focusNode: _iconController.myFocusNode3,
                          controller: _iconController.searchStr.value,
                          keyboardType: TextInputType.text,
                          autocorrect: false,
                          style: TextStyle(
                              fontFamily: AppFont.regular,
                              color: Colors.black,
                              fontSize: 15),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Search a category",
                              hintStyle: TextStyle(
                                  fontFamily: AppFont.regular,
                                  color: Color(0xFF7B7B7B),
                                  fontSize: 14),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              icon: Image.asset(
                                AssestPath.homeView + "Search.png",
                                height: 13,
                                fit: BoxFit.cover,
                                color: Color(0xFF7B7B7B),
                              )),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                    child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Obx(() => Container(
                        child: _iconController.searchStr.value.text == ''
                            ? GridView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        mainAxisSpacing: 10.0,
                                        crossAxisSpacing: 5.0,
                                        mainAxisExtent: 95),
                                itemCount:
                                    _iconController.categoryArray.length + 1,
                                itemBuilder: (context, ind) {
                                  return Obx(() => ind ==
                                          _iconController.categoryArray.length
                                      ? GestureDetector(
                                          onTap: () {
                                            Get.back();
                                            _iconController.category_id.value =
                                                0;
                                          },
                                          child: menuSelection(
                                              "assets/images/HomeView/showAll.png",
                                              "Show All",
                                              false,
                                              0))
                                      : Container(
                                          margin: EdgeInsets.only(bottom: 5),
                                          child: GestureDetector(
                                              onTap: () {
                                                _iconController
                                                        .category_id.value =
                                                    _iconController
                                                        .categoryArray[ind].id;
                                                Get.back();
                                              },
                                              child: menuSelection(
                                                _iconController
                                                    .categoryArray[ind]
                                                    .categoryImagePath,
                                                _iconController
                                                    .categoryArray[ind].name,
                                                true,
                                                _iconController
                                                    .categoryArray[ind].id,
                                              )),
                                        ));
                                })
                            : GridView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        mainAxisSpacing: 10.0,
                                        crossAxisSpacing: 5.0,
                                        mainAxisExtent: 95),
                                itemCount:
                                    _iconController.categorySearch.length + 1,
                                itemBuilder: (context, ind) {
                                  return Obx(
                                    () => ind ==
                                            _iconController
                                                .categorySearch.length
                                        ? GestureDetector(
                                            onTap: () {
                                              Get.back();
                                              _iconController
                                                  .category_id.value = 0;
                                            },
                                            child: menuSelection(
                                                "assets/images/HomeView/showAll.png",
                                                "Show All",
                                                false,
                                                0))
                                        : Container(
                                            margin: EdgeInsets.only(bottom: 5),
                                            child: GestureDetector(
                                                onTap: () {
                                                  _iconController
                                                          .category_id.value =
                                                      _iconController
                                                          .categorySearch[ind]
                                                          .id;
                                                },
                                                child: menuSelection(
                                                    _iconController
                                                        .categorySearch[ind]
                                                        .categoryImagePath,
                                                    _iconController
                                                        .categorySearch[ind]
                                                        .name,
                                                    true,
                                                    _iconController
                                                        .categorySearch[ind]
                                                        .id))),
                                  );
                                }))),
                  ),
                )),
              ],
            ),
          );
        });
  }

  Column menuSelection(image, text, value, id) {
    return Column(
      children: [
        Center(
          child: Container(
            height: 63,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                border: Border.all(
                    color: text == "Show More"
                        ? Colors.transparent
                        : _iconController.category_id.value == id
                            ? Color(AppColor.red)
                            : Colors.transparent),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 5,
                      blurStyle: BlurStyle.outer)
                ],
                color: Colors.white,
                shape: BoxShape.circle),
            child: value
                ? Image.network(
                    image,
                    errorBuilder: (context, error, stackTrace) =>
                        SvgPicture.network(
                      image,
                    ),
                  )
                : Image.asset(
                    image,
                    color: text == "Show More"
                        ? Color(AppColor.greytextColor)
                        : _iconController.category_id.value == id
                            ? Color(AppColor.red)
                            : Color(AppColor.greyClr),
                    height: 40,
                    width: 40,
                  ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Center(
          child: Text(
            text,
            style: TextStyle(
              color: text == "Show More"
                  ? Color(AppColor.greytextColor)
                  : _iconController.category_id.value == id
                      ? Color(AppColor.red)
                      : Color(AppColor.greytextColor),
              fontSize: text == "Show More" ? 12 : 14,
              fontFamily: "Campton",
              fontWeight: FontWeight.normal,
            ),
          ),
        )
      ],
    );
  }

  Widget suggestionAddresses() {
    return Visibility(
        visible: _iconController.isAddressPopUpOpen.value,
        child: DropDownAddress());
  }

  Widget suggestionContainer() {
    return Visibility(
      visible: _iconController.isSuggestionPopUpOpen.value,
      child: Container(
          margin: EdgeInsets.only(top: 380, left: 20),
          padding: EdgeInsets.only(
            left: 35,
          ),
          width: Get.width * 0.80,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              boxShadow: [BoxShadow(blurRadius: 5, color: Colors.grey[200])]),
          child: Column(
            children: [
              Obx(
                () => Container(
                  padding: EdgeInsets.only(top: 5, right: 10),
                  height: 45,
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: _iconController.onSuggetionStoreTap,
                          child: Container(
                            decoration: BoxDecoration(
                              color:
                                  _iconController.currentSuggetionTab.value ==
                                          "Store"
                                      ? Color(0xFFdb8a8a)
                                      : Colors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Center(
                              child: Text(
                                "Store",
                                style: TextStyle(
                                  color: _iconController
                                              .currentSuggetionTab.value ==
                                          "Store"
                                      ? Colors.white
                                      : Colors.grey,
                                  fontFamily: AppFont.regular,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: _iconController.onSuggetionServiceTap,
                          child: Container(
                            decoration: BoxDecoration(
                              color:
                                  _iconController.currentSuggetionTab.value ==
                                          "Menu"
                                      ? Color(0xFFdb8a8a)
                                      : Colors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Center(
                              child: Text(
                                "Menu",
                                style: TextStyle(
                                  color: _iconController
                                              .currentSuggetionTab.value ==
                                          "Menu"
                                      ? Colors.white
                                      : Colors.grey,
                                  fontFamily: AppFont.regular,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              suggestionList(),
            ],
          )),
    );
  }

  Widget suggestionList() {
    var list = [];
    if (_iconController.currentSuggetionTab.value == "Store") {
      _iconController.arrStoreSuggestionString.forEach((element) {
        if (element.url == "store") {
          list.add(element);
        }
      });
    } else {
      _iconController.arrStoreSuggestionString.forEach((element) {
        if (element.url != "store") {
          list.add(element);
        }
      });
    }
    return ListView.builder(
      padding: EdgeInsets.only(top: 10),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: list.length,
      itemBuilder: (context, index) {
        // ignore: invalid_use_of_protected_member
        var currentObj = list[index];

        return InkWell(
          onTap: () {
            _iconController.suggestionStr.value.text = currentObj.name;
            _iconController.isSuggestionPopUpOpen.value = false;
            _iconController.selectedSuggestionObj.value = currentObj;
            FocusScope.of(context).unfocus();
          },
          child: Container(
            padding: EdgeInsets.all(10),
            child: Text(
              currentObj.name,
              style: TextStyle(
                fontFamily: AppFont.regular,
                fontSize: 15,
              ),
            ),
          ),
        );
      },
    );
  }

  InkWell searchButton() {
    return InkWell(
      onTap: () {
        _iconController.fabIconNumber.value =
            !_iconController.fabIconNumber.value;
        // _iconController.getAllDataForDashboard();
        _iconController.suggestionStr.value.text = null;
        _iconController.getAllRestaurantssort();
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color(AppColor.red),
        ),
        child: Stack(
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'searchNow'.tr,
                    style: TextStyle(
                        fontFamily: AppFont.regular,
                        color: Color(
                          AppColor.logoBgColor,
                        ),
                        fontSize: 17),
                  ),
                ],
              ),
            ),
            Align(
                alignment: FractionalOffset.centerRight,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(9)),
                  padding:
                      EdgeInsets.only(left: 4, right: 4, top: 2, bottom: 2),
                  margin: EdgeInsets.only(right: 10),
                  child: Icon(
                    Icons.arrow_forward,
                    color: Color(AppColor.red),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Container buildTextFieldContainer(
      {String hinttext,
      String searchimg,
      bool enabled = false,
      String img,
      TextEditingController controller}) {
    return Container(
        margin: EdgeInsets.only(bottom: 10, top: 10),
        padding: EdgeInsets.only(bottom: 10, top: 10),
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color(0xFFf9f9fb),
        ),
        child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(
              left: 20,
              right: 10,
            ),
            child: TextField(
              textInputAction: TextInputAction.next,
              textAlignVertical: TextAlignVertical.center,
              enabled: enabled,
              controller: controller,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hinttext,
                  hintStyle: TextStyle(
                    fontFamily: AppFont.regular,
                    fontSize: 14,
                    color: (hinttext == 'subCategorys'.tr ||
                            hinttext == 'postCodeOrArea'.tr)
                        ? Color(0xFFafb3b8)
                        : Colors.black,
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  icon: Image.asset(
                    AssestPath.homeView + "$img",
                    height: 13,
                    fit: BoxFit.cover,
                    color: Color(0xFFafb3b8),
                  )),
            )));
  }

  Widget popUpmenu(BuildContext context, Widget widget) {
    return PopupMenuButton<String>(
      child: widget,
      onSelected: (String str) {
        _iconController.selectedSubCategoryName.value = str;
        // _iconController.findSubCategoryIdFromName();
      },
      itemBuilder: (BuildContext context) {
        return _iconController.arrCategoryWiseSubCategoryString
            .map((String choice) {
          return PopupMenuItem<String>(
            value: choice,
            child: Container(
              height: 25,
              width: 200,
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Text(
                  choice,
                  style: TextStyle(
                    fontFamily: AppFont.medium,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          );
        }).toList();
      },
    );
  }

  Widget dropdownfieldForSuggestion(
      {String hinttext,
      String searchimg,
      String img,
      bool enabled = true,
      TextEditingController controller,
      FocusNode focus}) {
    return Container(
      //padding: EdgeInsets.only(top: 8, bottom: 8),
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color(0xFFf9f9fb),
      ),
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(
          left: 20,
          right: 10,
        ),
        child: TextField(
          textInputAction: TextInputAction.done,
          textAlignVertical: TextAlignVertical.center,
          enabled: enabled,
          focusNode: focus,
          controller: controller,
          keyboardType: TextInputType.text,
          onChanged: (str) {
            if (str.isEmpty || _iconController.suggestionStr.value.text == '') {
              _iconController.isSuggestionPopUpOpen.value = false;

              _iconController.arrStoreSuggestionString.clear();
            } else if (str.length > 2) {
              _iconController.getSuggestions(searchtext: str);
            }
          },
          autocorrect: false,
          style: TextStyle(
              fontFamily: AppFont.regular, color: Colors.black, fontSize: 15),
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hinttext,
              hintStyle: TextStyle(
                  fontFamily: AppFont.regular,
                  color: (hinttext == 'postCodeOrArea'.tr ||
                          hinttext == "Restaurant")
                      ? Color(0xFFafb3b8)
                      : Colors.black,
                  fontSize: 14),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              icon: Image.asset(
                AssestPath.homeView + "$img",
                height: 13,
                fit: BoxFit.cover,
                color: Color(0xFF7B7B7B),
              )),
        ),
      ),
    );
  }

  InkWell clearButton() {
    return InkWell(
      onTap: () {
//         _iconController.resetAdvanceSerach();
        // _iconController.mainCategorySelected = " ";
        _iconController.suggestionStr.value.text = "";
        _iconController.selectedAddress.value = 'postCodeOrArea'.tr;
        _iconController.order_type.value = 0;
        _iconController.placeList.clear();
        _iconController.category_id.value = 0;

        _iconController.getAllRestaurantssort();
//        _iconController.selectedSubCategoryName.value = 'subCategorys'.tr;

//        _iconController.clearAdvanceSearch();
//         _iconController.resetAdvanceSerach();
//        _iconController.getAllDataForDashboard();
      },
      child: Container(
        padding: EdgeInsets.only(bottom: 10),
        height: 30,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'clear'.tr,
                style: TextStyle(
                  fontFamily: AppFont.medium,
                  color: Color(AppColor.greytextColor),
                  fontSize: 17,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
