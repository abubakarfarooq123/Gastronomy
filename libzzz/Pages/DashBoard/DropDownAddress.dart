import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reserved4u/Helper/NotificatiokKeys.dart';
import 'package:reserved4u/Pages/DashBoard/DashBoardController.dart';

// ignore: must_be_immutable
class DropDownAddress extends StatelessWidget {
  DashBoardController _iconController = Get.put(DashBoardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: TextField(
          onChanged: (value) => _iconController.getSuggestion(value),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Address | ZIP Code",
            focusColor: Colors.white,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            prefixIcon: Icon(
              Icons.pin_drop_outlined,
              color: Colors.black,
            ),
            // suffixIcon: IconButton(
            //     onPressed: () {
            //       _iconController.isAddressPopUpOpen.value = false;
            //     },
            //     icon: Icon(Icons.keyboard_arrow_down_sharp)),
          ),
        ),
      ),
      body: Visibility(
        visible: _iconController.isAddressPopUpOpen.value,
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(5),
            alignment: Alignment.center,
            width: Get.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
                boxShadow: [BoxShadow(blurRadius: 5, color: Colors.grey[200])]),
            child: Obx(() => Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 10, bottom: 10, left: 10),
                      child: InkWell(
                        onTap: () {
                          Get.back();
                          _iconController.isAddressPopUpOpen.value = false;

                          _iconController.selectedAddress.value =
                              _iconController.currentLoc.value;
                        },
                        child: Row(
                          children: [
                            Image.asset("assets/images/current_loc.png",
                                height: 22),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Current Location",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Container(
                                  width: 240,
                                  child: Text(
                                    _iconController.currentLoc.value.toString(),
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 12,
                                        color: Colors.black.withOpacity(0.5)),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    _iconController.placeList.length != 0
                        ? Container(height: 1.5, color: Colors.grey.shade400)
                        : Container(),
                    Obx(() => Container(
                          height: _iconController.placeList.length == 0
                              ? 0
                              : 50 *
                                  (_iconController.placeList.length + 1)
                                      .toDouble(),
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: _iconController.placeList.length,
                            itemBuilder: (context, index) {
                              return Obx(
                                () => ListTile(
                                    onTap: () {
                                      Get.back();
                                      _iconController.saveToRecentSearches(
                                          _iconController
                                              .placeList[index].description);
                                      _iconController.isAddressPopUpOpen.value =
                                          false;
                                      _iconController.selectedAddress.value =
                                          _iconController
                                              .placeList[index].description;
                                      _iconController.controller.clear();
                                      _iconController.placeList.clear();
                                    },
                                    leading: Icon(Icons.pin_drop_outlined),
                                    title: Text(_iconController
                                        .placeList[index].description)),
                              );
                            },
                          ),
                        )),
                    _iconController.searchHistory.length != 0
                        ? Container(height: 1.5, color: Colors.grey.shade400)
                        : Container(),
                    Container(
                        height: _iconController.searchHistory.length == 0
                            ? 0
                            : 50 *
                                (_iconController.searchHistory.length + 1)
                                    .toDouble(),
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: _iconController.searchHistory.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: Icon(Icons.restore),
                              title: Text(
                                  "${_iconController.searchHistory[index]}"),
                              onTap: () {
                                Get.back();

                                _iconController.isAddressPopUpOpen.value =
                                    false;
                                _iconController.selectedAddress.value =
                                    _iconController.searchHistory[index];
                                _iconController.controller.clear();
                              },
                            );
                          },
                        )),
                    Container(height: 1.5, color: Colors.grey.shade400),
                    _iconController.homeList.isNotEmpty
                        ? Container(
                            padding:
                                EdgeInsets.only(top: 10, bottom: 10, left: 10),
                            child: InkWell(
                              onTap: () {
                                _iconController.pincodeForSearch.value =
                                    _iconController.homeList.first.postcode;

                                _iconController.isAddressPopUpOpen.value =
                                    false;
                                _iconController.selectedAddress.value =
                                    _iconController.homeList.first.streetName +
                                        " " +
                                        _iconController.homeList.first.houseNo +
                                        " " +
                                        _iconController.homeList.first.bellName
                                            .toString() +
                                        " " +
                                        _iconController
                                            .homeList.first.postcode +
                                        " " +
                                        _iconController.homeList.first.city;
                                Get.back();
                              },
                              child: Row(
                                children: [
                                  Image.asset("assets/images/checkout/home.png",
                                      color: Color(AppColor.red)),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Home",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14),
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        _iconController
                                                .homeList.first.streetName +
                                            " " +
                                            _iconController
                                                .homeList.first.houseNo +
                                            " " +
                                            _iconController
                                                .homeList.first.bellName
                                                .toString() +
                                            " " +
                                            _iconController
                                                .homeList.first.postcode +
                                            " " +
                                            _iconController.homeList.first.city,
                                        overflow: TextOverflow.ellipsis,
                                        // "Andsberger Allle 65 im andel’s Hoteconst l\nBerlin, 12369 Berlin",
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 12,
                                            color:
                                                Colors.black.withOpacity(0.5)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        : Container(),
                    _iconController.homeList.isNotEmpty
                        ? Container(height: 1, color: Colors.grey.shade400)
                        : Container(),
                    _iconController.officeList.isNotEmpty
                        ? Container(
                            padding:
                                EdgeInsets.only(top: 10, bottom: 10, left: 10),
                            child: InkWell(
                              onTap: () {
                                _iconController.pincodeForSearch.value =
                                    _iconController.officeList.first.postcode;

                                _iconController.isAddressPopUpOpen.value =
                                    false;
                                _iconController
                                    .selectedAddress.value = _iconController
                                        .officeList.first.streetName +
                                    " " +
                                    _iconController.officeList.first.houseNo +
                                    " " +
                                    _iconController.officeList.first.bellName
                                        .toString() +
                                    " " +
                                    _iconController.officeList.first.postcode +
                                    " " +
                                    _iconController.officeList.first.city;
                                Get.back();
                              },
                              child: Row(
                                children: [
                                  Image.asset(
                                      "assets/images/checkout/office.png",
                                      color: Color(AppColor.red)),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Office",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14),
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        _iconController
                                                .officeList.first.streetName +
                                            " " +
                                            _iconController
                                                .officeList.first.houseNo +
                                            " " +
                                            _iconController
                                                .officeList.first.bellName
                                                .toString() +
                                            " " +
                                            _iconController
                                                .officeList.first.postcode +
                                            " " +
                                            _iconController
                                                .officeList.first.city,
                                        // "Andsberger Allle 65 im andel’s Hoteconst l\nBerlin, 12369 Berlin",
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 12,
                                            color:
                                                Colors.black.withOpacity(0.5)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        : Container(),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}

// typedef OnSearchChanged = Future<List<String>> Function(String);

// class SearchWithSuggestionDelegate extends SearchDelegate<String> {
//   final OnSearchChanged onSearchChanged;
//   List<String> _searchHistory = const [];

//   SearchWithSuggestionDelegate({String searchFieldLabel, this.onSearchChanged})
//       : super(searchFieldLabel: searchFieldLabel);

//   @override
//   Widget buildLeading(BuildContext context) {
//     return IconButton(
//       icon: const Icon(Icons.arrow_back),
//       onPressed: () => Navigator.pop(context),
//     );
//   }

//   @override
//   List<Widget> buildActions(BuildContext context) {
//     return [
//       IconButton(
//         icon: Icon(Icons.clear),
//         onPressed: () => query = "",
//       ),
//     ];
//   }

//   @override
//   void showResults(BuildContext context) {
//     close(context, query);
//   }

//   @override
//   Widget buildResults(BuildContext context) => null;

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     return FutureBuilder<List<String>>(
//       future: onSearchChanged != null ? onSearchChanged(query) : null,
//       builder: (context, snapshot) {
//         if (snapshot.hasData) _searchHistory = snapshot.data;
//         return ListView.builder(
//           itemCount: _searchHistory.length,
//           itemBuilder: (context, index) {
//             return ListTile(
//               leading: Icon(Icons.restore),
//               title: Text("${_searchHistory[index]}"),
//               onTap: () => close(context, _searchHistory[index]),
//             );
//           },
//         );
//       },
//     );
//   }
// }
