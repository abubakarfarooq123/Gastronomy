import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:reserved4u/Pages/DashBoard/checkout/controllers/cart_controller.dart';
import 'package:reserved4u/Pages/DashBoard/checkout/views/cart_page.dart';
import '../../../../Helper/NotificatiokKeys.dart';
import '../models/restaurant_menu_list.dart';
import '../models/resturant_model.dart';
import '../resturant_detail_controller.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;

class Menu extends StatefulWidget {
  final ResturantModel restaurantModel;

  Menu({Key key, this.restaurantModel}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final ctr = Get.find<ResturantController>();
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 0,
      color: Colors.transparent,
      child: Stack(
        children: [
          Column(
            children: [
              ctr.restaurantMenu.value.responseData == null
                  ? Text("Main categories not found",
                      style: TextStyle(color: Colors.grey))
                  : Container(
                      height: 150,
                      color: Color(AppColor.lightpink),
                      padding: EdgeInsets.symmetric(vertical: 15),
                      width: double.infinity,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: ctr.restaurantMenu.value.responseData
                            .categoryData.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: GestureDetector(
                              onTap: () async {
                                ctr.selectedCategoryIndex.value = index;
                                ctr.selectedCategoryID.value = ctr
                                    .restaurantMenu
                                    .value
                                    .responseData
                                    .categoryData[index]
                                    .id;
                                ctr.menuLoader.value = true;
                                ctr.selectedCategoryName.value = ctr
                                    .restaurantMenu
                                    .value
                                    .responseData
                                    .categoryData[index]
                                    .name;
                                print(
                                    "CategoryName:::::::::::${ctr.selectedCategoryName.value}");

                                await ctr.getRestaurantMenuList(
                                    storeID:
                                        widget.restaurantModel.id.toString(),
                                    subCategoryID: ctr
                                        .selectedSubCategoryID.value
                                        .toString(),
                                    categoryID: ctr.selectedCategoryID.value
                                        .toString());
                                await ctr.getSubcategoryByCategoryID(
                                    storeID:
                                        widget.restaurantModel.id.toString(),
                                    categoryID: ctr.selectedCategoryID.value
                                        .toString());
                                //ctr.isLoader.value = false;
                                ctr.selectedSubCategoryIndex.value = 0;
                                ctr.menuLoader.value = false;
                                print("CLICK: " + index.toString());
                              },
                              child: menuSelection(
                                ctr.restaurantMenu.value.responseData
                                    .categoryData[index].categoryImagePath,
                                ctr.restaurantMenu.value.responseData
                                    .categoryData[index].name,
                                ctr.selectedmenuName[0],
                                "assets/images/HomeView/fries1.png",
                                index: index,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
              Obx(
                () => ctr.subCategory.value.responseData == null
                    ? SizedBox()
                    : Container(
                        height: 2,
                        color: Color(AppColor.lightpink),
                        child: Divider(
                          color: Color(
                            AppColor.red,
                          ),
                          thickness: 2,
                        ),
                      ),
              ),
              Obx(() => ctr.subCategory.value.responseData == null
                  ? Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 0),
                      child: Text("Subcategories not found",
                          style: TextStyle(color: Colors.grey)),
                    )
                  : SizedBox(
                      height: 45,
                      child: Material(
                        color: Color(AppColor.lightpink),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount:
                                ctr.subCategory.value.responseData.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.only(left: 5, right: 5),
                                child: GestureDetector(
                                  onTap: () async {
                                    ctr.selectedSubCategoryIndex.value = index;
                                    ctr.selectedSubCategoryName.value = ctr
                                        .subCategory
                                        .value
                                        .responseData[index]
                                        .name;
                                    ctr.selectedSubCategoryID.value = ctr
                                        .subCategory
                                        .value
                                        .responseData[index]
                                        .id;
                                    ctr.selectedSubCategoryName.value = ctr
                                        .subCategory
                                        .value
                                        .responseData[index]
                                        .name;
                                    //ctr.isLoader.value = true;
                                    ctr.menuLoader.value = true;
                                    await ctr.getRestaurantMenuList(
                                        storeID: widget.restaurantModel.id
                                            .toString(),
                                        subCategoryID: ctr
                                            .selectedSubCategoryID.value
                                            .toString(),
                                        categoryID: ctr.selectedCategoryID.value
                                            .toString());
                                    //ctr.isLoader.value = false;
                                    ctr.menuLoader.value = false;
                                    print("CLICK: " + index.toString());
                                  },
                                  child: menuFlavor(
                                      ctr.subCategory.value.responseData[index]
                                          .name,
                                      index: index),
                                ),
                              );
                            },
                          ),

                          // child: Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          //   children: [
                          //     Icon(
                          //       Icons.search,
                          //       color: Color(AppColor.red),
                          //       size: 20,
                          //     ),
                          //     Obx(() => GestureDetector(
                          //         onTap: () {
                          //           ctr.flavorSelection[0] = true;
                          //           ctr.flavorSelection[1] = false;
                          //           ctr.flavorSelection[2] = false;
                          //           ctr.flavorSelection[3] = false;
                          //         },
                          //         child: menuFlavor("Veggies", ctr.flavorSelection[0]))),
                          //     Obx(() => GestureDetector(
                          //         onTap: () {
                          //           ctr.flavorSelection[0] = false;
                          //           ctr.flavorSelection[1] = true;
                          //           ctr.flavorSelection[2] = false;
                          //           ctr.flavorSelection[3] = false;
                          //         },
                          //         child: menuFlavor("Vegan", ctr.flavorSelection[1]))),
                          //     Obx(() => GestureDetector(
                          //         onTap: () {
                          //           ctr.flavorSelection[0] = false;
                          //           ctr.flavorSelection[1] = false;
                          //           ctr.flavorSelection[2] = true;
                          //           ctr.flavorSelection[3] = false;
                          //         },
                          //         child: menuFlavor("Special", ctr.flavorSelection[2]))),
                          //     Obx(() => GestureDetector(
                          //         onTap: () {
                          //           ctr.flavorSelection[0] = false;
                          //           ctr.flavorSelection[1] = false;
                          //           ctr.flavorSelection[2] = false;
                          //           ctr.flavorSelection[3] = true;
                          //         },
                          //         child: menuFlavor("Chicken", ctr.flavorSelection[3]))),
                          //   ],
                          // ),
                        ),
                      ),
                    )),
              Obx(() => ctr.subCategory.value.responseData == null
                  ? SizedBox()
                  : Container(
                      height: 2,
                      color: Color(AppColor.lightpink),
                      child: Divider(
                        color: Color(
                          AppColor.red,
                        ),
                        thickness: 2,
                      ),
                    )),
              SizedBox(
                height: 10,
              ),
              menuItems(),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget menuSelection(image, text, selected, bg, {int index}) {
    return Obx(() => Column(
          children: [
            Container(
              height: 67,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  image: DecorationImage(image: AssetImage(bg))),
              child: SvgPicture.network(
                image,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                text,
                style: TextStyle(
                  color: ctr.selectedCategoryIndex.value == index
                      ? Color(AppColor.red)
                      : Color(AppColor.greytextColor),
                  fontSize: 16,
                  fontFamily: "Campton",
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          ],
        ));
  }

  Widget menuFlavor(text, {int index}) {
    return Obx(() => Container(
          alignment: Alignment.center,
          height: 30,
          //width: 80,
          decoration: BoxDecoration(
              color: ctr.selectedSubCategoryIndex.value == index
                  ? Color(AppColor.red)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              toBeginningOfSentenceCase(text),
              style: TextStyle(
                color: ctr.selectedSubCategoryIndex.value == index
                    ? Colors.white
                    : Color(AppColor.greytextColor),
                fontSize: 16,
                fontFamily: AppFont.medium,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ));
  }

  Widget menuItems() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ctr.menuList.value.responseData == null
              ? SizedBox()
              : Obx(
                  () => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        toBeginningOfSentenceCase(
                            ctr.selectedCategoryName.value),
                        style: TextStyle(
                          fontSize: 22,
                          fontFamily: AppFont.semiBold,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        toBeginningOfSentenceCase(
                            ctr.selectedSubCategoryName.value),
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: AppFont.medium,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
          SizedBox(
            height: 10,
          ),

          Obx(
            () => !ctr.menuLoader.value
                ? Container(
                    margin: EdgeInsets.only(bottom: 60),
                    child: ctr.menuList.value.responseData == null
                        ? Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Text(
                              "Products not found",
                              style: TextStyle(color: Colors.grey),
                            ),
                          )
                        : ListView.separated(
                            itemCount: ctr.menuList.value.responseData.length,
                            shrinkWrap: true,
                            primary: false,
                            itemBuilder: (context, index) {
                              if (ctr.menuList.value.responseData[index]
                                          .variants ==
                                      null &&
                                  ctr.menuList.value.responseData[index]
                                          .discount !=
                                      null) {
                                return menuCard1(
                                    ctr.menuList.value.responseData[index]);
                              } else if (ctr.menuList.value.responseData[index]
                                      .variants !=
                                  null) {
                                return menuCard(
                                  context,
                                  ctr.menuList.value.responseData[index]
                                      .menuExtras,
                                  ctr.menuList.value.responseData[index],
                                  variatList: ctr.menuList.value
                                      .responseData[index].variants,
                                  imageUrl: ctr.menuList.value
                                      .responseData[index].menuImagePath,
                                  price: ctr
                                      .menuList.value.responseData[index].price,
                                );
                              } else {
                                return menuCard3(ctr.menuList.value
                                    .responseData[index].itemName);
                              }

                              // if (index == 0 || index == 4) {
                              //
                              //   return menuCard3(ctr.menuList.value.responseData[index].itemName);
                              // } else if (index == 1 || index == 3 || index == 6) {
                              //   return menuCard(context, ctr.menuList.value.responseData[index].itemName);
                              // }
                              // return menuCard1(ctr.menuList.value.responseData[index].itemName);

                              /// menuCard1(itemName) when discount available and variat is empty
                              /// menuCard3(itemName) when both discount and variat are null
                              /// menuCard() for both when there is discount and variat are available
                            },
                            separatorBuilder: (context, index) {
                              return Divider(
                                color: Colors.grey,
                              );
                            },
                          ),
                  )
                : Container(
                    width: Get.width,
                    height: 100,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            //child: Image.asset("assets/images/loader.gif"),
                            child:
                                Lottie.asset("assets/images/Logorevise.json"),
                            height: 40.0,
                            width: 40.0,
                          ),
                        ),
                      ],
                    ),
                  ),
          )
          // menuCard()
        ],
      ),
    );
  }

  Widget menuCard(context, List<MenuExtra> menuExtra, ResponseDatum itemName,
      {List<Variant> variatList, String imageUrl, String price}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ListTileTheme(
          contentPadding: EdgeInsets.symmetric(horizontal: 4),
          child: ExpansionTile(
            trailing: Padding(
              padding: const EdgeInsets.only(top: 17),
              child: Material(
                borderRadius: BorderRadius.circular(32),
                elevation: 5,
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.red.withOpacity(0.05),
                        border:
                            Border.all(width: 2, color: Color(AppColor.red)),
                        shape: BoxShape.circle),
                    child: Icon(
                      Icons.keyboard_arrow_down_outlined,
                      size: 22,
                      color: Color(AppColor.red),
                    )),
              ),
            ),
            iconColor: Color(AppColor.red),
            collapsedTextColor: Color(AppColor.black),
            textColor: Color(AppColor.black),
            children: [
              SizedBox(
                height: 5,
              ),
              Container(
                margin: EdgeInsets.only(left: 0),
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(12.5)),
                child: Column(
                  children: List.generate(
                    variatList.length,
                    (index) => variationRow(
                        context,
                        variatList[index].name ?? "N/A",
                        variatList[index].fullImagePath ?? null,
                        variatList[index].price,
                        variatList[index].menuId,
                        variatList[index].id,
                        menuExtra,
                        itemName,
                        imageUrl,
                        price),
                  ),
                ),
              )
            ],
            title: Container(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              // height: 150,
              child: Row(
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          imageUrl,
                          width: Get.width * 0.28,
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                          top: 5,
                          left: 5,
                          child: Container(
                            alignment: Alignment.center,
                            width: 35,
                            padding: EdgeInsets.all(0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border:
                                    Border.all(color: Colors.white, width: 1.5),
                                color: Color(AppColor.red)),
                            child: Text(
                              "%",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white),
                            ),
                          ))
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          child: Text(
                            toBeginningOfSentenceCase(itemName.itemName),
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: AppFont.semiBold,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(
                          child: Text(
                            toBeginningOfSentenceCase(itemName.description),
                            softWrap: true,
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: AppFont.regular,
                                fontWeight: FontWeight.normal,
                                color: Color(AppColor.greytextColor)),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        itemName.discount == null
                            ? Text(
                                "$price€",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: AppFont.semiBold,
                                ),
                              )
                            : Row(
                                children: [
                                  SizedBox(
                                    child: Text(
                                      "$price€",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: AppFont.semiBold,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  SizedBox(
                                    child: Text(
                                      " ${itemName.variants.first.finalPrice}€",
                                      style: TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        fontSize: 16,
                                        color: Color(AppColor.greytextColor),
                                        fontFamily: AppFont.light,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                    thickness: 2,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget menuCard1(ResponseDatum menuDetail) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            // height: 150,
            child: Row(
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        "assets/images/onboarding/chickenpizza.jpg",
                        width: Get.width * 0.28,
                        height: 70,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                        top: 5,
                        left: 5,
                        child: Container(
                          alignment: Alignment.center,
                          width: 35,
                          padding: EdgeInsets.all(0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border:
                                  Border.all(color: Colors.white, width: 1.5),
                              color: Color(AppColor.red)),
                          child: Text(
                            "%",
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                        ))
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        child: Text(
                          toBeginningOfSentenceCase(menuDetail.itemName),
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: AppFont.semiBold,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(
                        child: Text(
                          "It is a trustworthy choice on the long wayyy",
                          softWrap: true,
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: AppFont.regular,
                              fontWeight: FontWeight.normal,
                              color: Color(AppColor.greytextColor)),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            child: Text(
                              menuDetail.price + "#",
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: AppFont.semiBold,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          SizedBox(
                            child: Text(
                              menuDetail.price + "€",
                              style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                fontSize: 16,
                                color: Color(AppColor.greytextColor),
                                fontFamily: AppFont.light,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.grey,
                  thickness: 2,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget menuCard3(String itemName) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            // height: 150,
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    "assets/images/onboarding/chickenpizza.jpg",
                    width: Get.width * 0.28,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        child: Text(
                          toBeginningOfSentenceCase(itemName),
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: AppFont.semiBold,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(
                        child: Text(
                          "It is a trustworthy choice on the long way",
                          softWrap: true,
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: AppFont.regular,
                              fontWeight: FontWeight.normal,
                              color: Color(AppColor.greytextColor)),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            child: Text(
                              "12.00€",
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: AppFont.semiBold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.grey,
                  thickness: 2,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget variationRow(
    context,
    text,
    imageUrl,
    price,
    menuID,
    variantId,
    List<MenuExtra> menuExtra,
    ResponseDatum subCategoryData,
    imageUrlCategory,
    priceCategory,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: SizedBox(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                imageUrl == null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          width: 45,
                          height: 40,
                          color: Colors.grey.withOpacity(0.2),
                        ),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          imageUrl,
                          width: 45,
                          height: 40,
                          fit: BoxFit.cover,
                        ),
                      ),
                SizedBox(
                  width: 5,
                ),
                SizedBox(
                  child: Text(
                    text,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: AppFont.regular,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 10,
            ),
            Row(
              children: [
                SizedBox(
                  child: Text("$price€",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: AppFont.medium,
                        fontWeight: FontWeight.w700,
                      )),
                ),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    ctr.cartButtonVisbility.value = true;
                    _modalBottomSheetMenu(
                      context,
                      menuExtra,
                      subCategoryData,
                      imageUrlCategory,
                      priceCategory,
                      menuID,
                      variantId,
                    );

                    //   Map<String, dynamic> data = {
                    //     "store_id": restaurantModel.id.toString(),
                    //     "category_id": ctr.selectedCategoryID.value.toString(),
                    //     "subcategory_id":
                    //         ctr.selectedSubCategoryID.value.toString(),
                    //     "menu_id": menuID.toString(),
                    //     "menu_variant_id": variantId.toString(),
                    //     "extras": "",
                    //     "quantity": "0",
                    //   };
                    //   print(data);

                    //   totalPrice.value += double.parse(price.toString());
                    //   Get.find<CartController>().cartList.add(data);

                    //   Get.find<CartController>().cartObject['products'] =
                    //       Get.find<CartController>().cartList;
                    //   print(Get.find<CartController>().cartObject);
                  },
                  child: Material(
                    borderRadius: BorderRadius.circular(8),
                    elevation: 5,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 2.0, vertical: 1),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Color(
                                AppColor.red,
                              ),
                              width: 1.5),
                          borderRadius: BorderRadius.circular(8)),
                      child: Text(
                        " + ",
                        style: TextStyle(
                            color: Color(AppColor.red),
                            fontSize: 15,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void _modalBottomSheetMenu(
      context,
      List<MenuExtra> menuExtraList,
      ResponseDatum subCategoryData,
      imageUrlCategory,
      priceCategory,
      menuID,
      variantId) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        builder: (builder) {
          return new Container(
            // height: 700,
            color: Colors.transparent,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                      ),
                      child: Image.network(
                        imageUrlCategory,
                        width: double.infinity,
                        height: 180,
                        fit: BoxFit.cover,
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      toBeginningOfSentenceCase(
                          subCategoryData.itemName.toString()),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        fontFamily: AppFont.medium,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      priceCategory == null ? 'null' : priceCategory,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Color(AppColor.red)),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 0),
                    child: Text(
                      subCategoryData.description == null
                          ? Container()
                          : toBeginningOfSentenceCase(
                              subCategoryData.description),
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                          color: Colors.black54),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Extras",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Color(AppColor.black)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "Choose your Extras",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Color(AppColor.black)),
                    ),
                  ),

                  ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: menuExtraList.length,
                      itemBuilder: (context, index) {
                        return SizedBox(
                            height: 40,
                            child: Obx(
                              () => CheckboxListTile(
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                  title: Text(menuExtraList[index].title),
                                  value: cartController.extras
                                      .contains(menuExtraList[index].id),
                                  checkboxShape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  onChanged: (v) {
                                    if (v) {
                                      cartController.extras
                                          .add(menuExtraList[index].id);
                                      print(cartController.extras);
                                      dynamic abc = [];
                                      for (int i = 0;
                                          i < cartController.extras.length;
                                          i++) {
                                        abc.add({
                                          "id": cartController.extras[i],
                                          "quantity": 1
                                        });
                                      }
                                      print(abc.toString());
                                    } else {
                                      cartController.extras
                                          .remove(menuExtraList[index].id);
                                      print(cartController.extras);
                                      print("remove");
                                    }
                                    print(v);
                                  }),
                            ));
                      }),
                
                  // ListView.builder(
                  //     shrinkWrap: true,
                  //     primary: false,
                  //     itemCount: menuExtraList.length,
                  //     itemBuilder: (context, index) {
                  //       return extras(menuExtraList[index], index);
                  //     }),

                  // ListView.builder(
                  //     shrinkWrap: true,
                  //     primary: false,
                  //     itemCount: menuExtraList.length,
                  //     itemBuilder: (context, index) {
                  //       return Obx(() => SizedBox(
                  //             height: 40,
                  //             child: CheckboxListTile(
                  //                 controlAffinity:
                  //                     ListTileControlAffinity.leading,
                  //                 title: Text(menuExtraList[index].title

                  //                     // Text(
                  //                     //     ctr.checkBoxListData[index]['title']
                  //                     ),
                  //                 value: ctr
                  //                     .checkBoxListData[index]['isCheck'].value,
                  //                 checkboxShape: RoundedRectangleBorder(
                  //                     borderRadius: BorderRadius.circular(15)),
                  //                 onChanged: (v) {
                  //                   ctr.checkBoxListData[index]['isCheck']
                  //                           .value =
                  //                       !ctr.checkBoxListData[index]['isCheck']
                  //                           .value;
                  //                   if (v) {
                  //                     print("Selected");
                  //                     Get.find<CartController>()
                  //                         .cartObject['extras']
                  //                         .add(ctr.checkBoxListData[index]
                  //                             ['title']);
                  //                     print(Get.find<CartController>()
                  //                         .cartObject['extras']);
                  //                   } else {
                  //                     List data = ["q", "f"];
                  //                     data.remove("q");
                  //                     Get.find<CartController>()
                  //                         .cartObject['extras']
                  //                         .remove(ctr.checkBoxListData[index]
                  //                             ['title']);
                  //                     print(Get.find<CartController>()
                  //                         .cartObject['extras']);
                  //                     print("remove");
                  //                   }
                  //                   print(v);
                  //                 }),
                  //           ));
                  //     }),

                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 60,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 6.0,
                          ),
                        ],
                        color: Color(AppColor.red),
                        borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 120,
                          height: 45,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Color((0xff81261F))),
                              borderRadius: BorderRadius.circular(12)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Center(
                                  child: Text(
                                "  - ",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              )),
                              Center(
                                  child: Text(
                                "02",
                                style:
                                    TextStyle(fontSize: 18, color: Colors.red),
                              )),
                              Center(
                                  child: Text(
                                "  +",
                                style:
                                    TextStyle(fontSize: 20, color: Colors.red),
                              ))
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // ctr.cartButtonVisbility.value = true;
                            Map<String, dynamic> data = {
                              "store_id": widget.restaurantModel.id.toString(),
                              "category_id":
                                  ctr.selectedCategoryID.value.toString(),
                              "subcategory_id":
                                  ctr.selectedSubCategoryID.value.toString(),
                              "menu_id": menuID.toString(),
                              "menu_variant_id": variantId.toString(),
                              "extras":
                                  "[{\"id\":1,\"quantity\":1,\"title\":\"Sauce\"},{\"id\":3,\"quantity\":1,\"title\":\"Pepsi\"}]",
                              "quantity": "1",
                            };
                            print(data);

                            // totalPrice.value +=
                            //     double.parse(priceCategory.toString());
                            Get.find<CartController>().cartList.add(data);

                            Get.find<CartController>().cartObject['products'] =
                                Get.find<CartController>().cartList;
                            // print(Get.find<CartController>().cartObject);
                            Get.find<CartController>().onAddToCardButtonClick();
                            Get.to(() => CartPage());
                          },
                          child: Container(
                            width: Get.width * 0.5,
                            height: 45,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Color((0xff81261F))),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Text(
                                "Add this to Cart",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color(AppColor.red)),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  // Widget extras(MenuExtra menuExtra, index) {
  //   return SizedBox(
  //     height: 35,
  //     width: double.infinity,
  //     child: ListTile(
  //       horizontalTitleGap: 5,
  //       leading: Obx(() => Radio(
  //             activeColor: Color(AppColor.red),
  //             value: menuExtra.title,
  //             groupValue: ctr.selectRadio.value,
  //             onChanged: (Object value) {
  //               print(value.toString() + "    " + index.toString());
  //               ctr.selectRadio.value = value;

  //               // print(ctr.selectRadio.value.toString() + ":::::: " + index);
  //             },
  //           )),
  //       title: Obx(() => ctr.selectRadio.value == menuExtra.title
  //           ? Text(menuExtra.title,
  //               style: TextStyle(color: Color(AppColor.red)))
  //           : Text(
  //               menuExtra.title,
  //               style: TextStyle(fontFamily: 'campton', color: Colors.grey),
  //             )),
  //       // trailing: Obx(
  //       //   () => ctr.selectRadio.value == menuExtra.title
  //       //       ? Text("+1.50€", style: TextStyle(color: Color(AppColor.red)))
  //       //       : Text(
  //       //           "+1.50€",
  //       //           style: TextStyle(fontFamily: 'campton', color: Colors.grey),
  //       //         ),
  //       // )
  //     ),
  //   );

  //   // return Column(
  //   //   children: [
  //   //    Obx(()=> Radio(
  //   //       value: "chicken",
  //   //       groupValue: ctr.selectRadio.value,
  //   //       onChanged: (Object value) {
  //   //         ctr.selectRadio.value =value;
  //   //       },
  //   //     )),
  //   // Obx(()=> Radio(
  //   //       value: "abc",
  //   //       groupValue: ctr.selectRadio.value,
  //   //       onChanged: (Object value) {
  //   //         ctr.selectRadio.value =value;
  //   //         print(value);
  //   //       },
  //   //     ),)
  //   //   ],
  //   // );
  // }

  var selectedIndexes = [];
}

class ListTileModel {
  bool enabled;
  String text;

  ListTileModel(this.enabled, this.text);
}
