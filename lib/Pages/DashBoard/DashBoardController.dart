import 'dart:async';
import 'dart:convert';
import 'package:geocoder/geocoder.dart';
import 'package:google_places_picker/google_places_picker.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:reserved4u/Helper/NotificatiokKeys.dart';
import 'package:reserved4u/Helper/ResponseModel.dart';
import 'package:reserved4u/Helper/apiProvider.dart';
import 'package:reserved4u/Helper/preferences.dart';
import 'package:reserved4u/Helper/url.dart';
import 'package:reserved4u/Pages/Authentication/Login/LoginModel.dart';
import 'package:reserved4u/Pages/DashBoard/CategoryModel.dart';
import 'package:reserved4u/Pages/DashBoard/DashBoardModel.dart';
import 'package:get/get.dart';
import 'package:reserved4u/Pages/DashBoard/Resturant/models/restaurant_typeModel.dart';
import 'package:reserved4u/Pages/Favourite/FavController.dart';
import 'package:geolocator/geolocator.dart';
//import 'package:reserved4u/Pages/Favourite/FavController.dart';

import '../Profile/my_addresses/widgets/AddressModel.dart';
import 'Resturant/models/resturant_model.dart';
import 'googlepDesign.dart';

class DashBoardController extends GetxController
    with GetSingleTickerProviderStateMixin {
  TabController tabController;

  var refreshController = RefreshController();
  var scrollController = ScrollController();
  var favList = <ResturantModel>[].obs;
  var homeList = <Office>[].obs;
  var officeList = <Office>[].obs;
  var resturantArray = <ResturantModel>[].obs;
  var arrCategory = <CatgoryData>[].obs;
  var arrRecommandedBestRated = <TopRatedStore>[].obs;
  var arrStoreList = <StoreList>[].obs;
  var arrSpecifics = <RestaurantTypeModel>[].obs;
  var selectedIndex = "".obs;
  var title = "".obs;
  var visibilityInfo = 1.0.obs;
  var isLoader = false.obs;
  var mainCategorySelected = "";
  var selectedCategoryId = "".obs;
  var selectedCategoryName = 'all'.tr.obs;
  var selectedOptions = "new";
  var selectedOptionsInd = 0.obs;
  var isBookingSystem = true.obs;
  var isDiscount = false.obs;
  var sortByText = 'sort'.tr.obs;
  var selectedRating = "0".obs;
  var selectedPrice = "0".obs;
  var selectedIds = [].obs;
  var selectedDate = 'whichDate'.tr.obs;
  var fabIconNumber = false.obs;
  var fabIconNumber2 = false.obs;
  var isVisibleSearch = false.obs;

  var showSearch = false.obs;

  // ignore: deprecated_member_use
  var arrCategoryWiseSubCategory = List<CategoryWiseSubCategory>().obs;

  // ignore: deprecated_member_use
  var arrCategoryWiseSubCategoryString = List<String>().obs;

  // ignore: deprecated_member_use
  var arrStoreSuggestionString = List<SuggestionData>().obs;
  var isSuggestionPopUpOpen = false.obs;
  var selectedSuggestionObj = SuggestionData().obs;
  var pincode = "";

  //selected area
  var selectedAddress = 'postCodeOrArea'.tr.obs;
  var selectedAddressForFilter = "Find by place,name and,zip code..".obs;
  var markers = Set<Marker>().obs;

  var selectedLat = 51.1657.obs;
  var selectedLon = 10.4515.obs;
  var currentDate = DateTime.now().obs;
  var formatedDate = ''.obs;
  var isDateSelected = false.obs;
  var selectedStoreId = "";
  var selectedSubCategoryId = "".obs;
  var selectedSubCategoryName = 'subCategorys'.tr.obs;
  var pincodeForSearch = "".obs;
  var suggestionStr = TextEditingController().obs;
  var deviceId = "";
  var isScroll = false.obs;
  var currentSuggetionTab = "Store".obs;
  var Rating = "0".obs;
  var addressStr = TextEditingController().obs;
  var searchStr = TextEditingController().obs;
  RxDouble scrollValue = 0.0.obs;
  var favController = FavouriteController();
  var sort;
  var order_type = 0.obs;

  var category_id = 0.obs;
  var search_text;
  var categoryArray = <CategoryModel>[].obs;

  var filter_by_facilities;
  var free_delivery = false.obs;
  var min_order_amount = "lesser";
  var Price = "0".obs;
  // var selectedSpecificationIdAdd = [].obs;
  var selectedrestauranttypeIdAdd = [].obs;
  var isAddressPopUpOpen = false.obs;
  RxInt minOrderType = 3.obs;
  var myFocusNode = FocusNode();
  var myFocusNode2 = FocusNode();
  var myFocusNode3 = FocusNode();
  var categorySearch = <CategoryModel>[].obs;

  //index
  BuildContext context;
  var markersForMapView = Set<Marker>().obs;

  CameraPosition cameraPositionForMapView = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 18,
  );

//khadija//
  GeolocatorPlatform _geolocatorPlatform = GeolocatorPlatform.instance;
  var controller = TextEditingController();
  var placeList = <Predictions>[].obs;
  var currentLoc = ''.obs;
  var city = ''.obs;

  List searchHistory = [].obs;

  @override
  void onInit() async {
    tabController = TabController(length: 4, vsync: this);
    refreshController = RefreshController();
    scrollController = ScrollController();
    getAllRestaurantType();
    getRecentSearchesLike();
    getUserCurrentLocation();
    getAllRestaurantssort();
    // getFavList();
    // addToFavorite();
    var isLogin = await Preferences.preferences
        .getBool(key: PrefernceKey.isUserLogin, defValue: false);

    if (isLogin) {
      var userData =
          await Preferences.preferences.getString(key: PrefernceKey.userData);

      var loginUserDataObj = LoginModel.fromJson(jsonDecode(userData));
      title.value = 'hi'.tr + " " + loginUserDataObj.firstName;
      getAddressesList();
    } else {
      title.value = 'welcom'.tr;
    }
    getAllCategory();
    super.onInit();
  }

  Map<MarkerId, Marker> marker2 = <MarkerId, Marker>{}.obs;
  Completer<GoogleMapController> mapController = Completer();

  void zoomForPerticuarIndex(ResturantModel currentObj) async {
    GoogleMapController controller;
    controller = await mapController.future;

    controller.animateCamera(CameraUpdate.newLatLngZoom(
        LatLng(double.parse(currentObj.latitude),
            double.parse(currentObj.longitude)),
        16));
    final marker = Marker(
      markerId: MarkerId('place_name'),
      position: LatLng(double.parse(currentObj.latitude),
          double.parse(currentObj.longitude)),
      icon: BitmapDescriptor.defaultMarker,
      infoWindow: InfoWindow(title: 'title', snippet: 'address'),
    );
    marker2[MarkerId('place_name')] = marker;
  }

  Future getRecentSearchesLike() async {
    searchHistory = await Preferences.preferences
        .getList(key: PrefernceKey.recentSearch, defValue: []);

    return searchHistory;
  }

  Future saveToRecentSearches(String searchText) async {
    if (searchText == null) return;
    List aaa =
        await Preferences.preferences.getList(key: PrefernceKey.recentSearch) ??
            [];
    Set<String> allSearches = aaa.toSet();

    allSearches = {searchText, ...allSearches};
    List abc = allSearches.toList();
    await Preferences.preferences
        .saveList(key: PrefernceKey.recentSearch, value: abc);
    getRecentSearchesLike();
  }

  Future getSuggestion(String input) async {
    String baseURL =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json';
    String request = '$baseURL?input=${input}&key=$googleAndroidApikey';
    var response = await http.get(Uri.parse(request));
    if (response.statusCode == 200) {
      placeList.clear();
      Predictions model = Predictions();
      json.decode(response.body)['predictions'].forEach((data) {
        model = Predictions.fromJson(data);
        placeList.add(model);
      });
    } else {
      throw Exception('Failed to load predictions');
    }
  }

  getUserCurrentLocation() async {
    await Geolocator.requestPermission().then((value) async {
      Position position = await _geolocatorPlatform.getCurrentPosition();
      final coordinates =
          new Coordinates(position.latitude, position.longitude);
      var addresses =
          await Geocoder.local.findAddressesFromCoordinates(coordinates);
      var first = addresses.first;
      pincodeForSearch.value = first.postalCode.toString();
      currentLoc.value = first.addressLine.toString();
      selectedAddress.value = first.addressLine.toString();
      city.value = first.locality.toString();
      print(
          "Last location ======${addresses.first}====${addresses.first.postalCode} === " +
              first.addressLine.toString());
    }).onError((error, stackTrace) async {
      await Geolocator.requestPermission();
      print("ERROR" + error.toString());
    });
  }

  getResult(String input) {
    categorySearch.clear();

    categorySearch
      ..addAll(categoryArray
          .where(
              (value) => value.name.toLowerCase().contains(input.toLowerCase()))
          .toList());

    print(categorySearch.toString());

    // return categorySearch;
  }

  Future getAddressesList() async {
    var api = ApiProvider();
    var res = await api.getApiCall(ApiUrl.getAddressList);
    print(res.body);
    final jsonString = json.decode(res.body);
    if (jsonString["ResponseData"] != null) {
      if (jsonString["ResponseData"]['home'] != null) {
        Office homeModel = Office();
        homeModel = Office.fromJson(jsonString["ResponseData"]['home']);
        homeList.add(homeModel);
      }
      if (jsonString["ResponseData"]['office'] != null) {
        Office officeModel = Office();
        officeModel = Office.fromJson(jsonString["ResponseData"]['office']);
        officeList.add(officeModel);
      }
    }
    return jsonString["ResponseData"];
  }

  void getSuggestions({String searchtext}) {
    ApiProvider apiProvider = ApiProvider();

    var body = {"search_text": searchtext};
    print(body);
    apiProvider.getApiCall(ApiUrl.storesuggestion + searchtext).then((value) {
      var responseJson = json.decode(value.body);
      print(responseJson);
      ResponseModel _responseModel = ResponseModel.fromJson(responseJson);
      if (_responseModel.responseCode == ResponseCodeForAPI.sucessC) {
        var responsedata = responseJson["ResponseData"];
        arrStoreSuggestionString.clear();

        arrStoreSuggestionString.value = SuggestionData.getData(responsedata);
        isSuggestionPopUpOpen.value = false;
        // ignore: invalid_use_of_protected_member
        if (arrStoreSuggestionString.value.length > 0) {
          isSuggestionPopUpOpen.value = true;
        }
      } else {}
    });
  }

  onSuggetionStoreTap() {
    currentSuggetionTab.value = "Store";
    arrStoreSuggestionString.value = [];
    getSuggestions(searchtext: suggestionStr.value.text);
  }

  onSuggetionServiceTap() {
    currentSuggetionTab.value = "Menu";
    arrStoreSuggestionString.value = [];
    getSuggestions(searchtext: suggestionStr.value.text);
  }

  getAllCategory() async {
    var res = await http.get(Uri.parse(ApiUrl.allCategory));
    var jsonDecodeString = json.decode(res.body);
    if (jsonDecodeString["ResponseCode"] == 1) {
      CategoryModel model = CategoryModel();
      categoryArray.clear();
      jsonDecodeString["ResponseData"].forEach((data) {
        print(data);
        model = CategoryModel.fromJson(data);
        categoryArray.add(model);
      });
    }
  }

  Future<void> openPlacePicker(BuildContext context) async {
    PluginGooglePlacePicker.initialize(
      androidApiKey: googleAndroidApikey,
      iosApiKey: googleiOSApikey,
    );

    try {
      var placeName;
      var place = await PluginGooglePlacePicker.showAutocomplete(
        mode: PlaceAutocompleteMode.MODE_OVERLAY,
        countryCode: 'DE',
      );
      placeName = place;
      final coordinates =
          new Coordinates(placeName.latitude, placeName.longitude);
      var addresses =
          await Geocoder.local.findAddressesFromCoordinates(coordinates);
      var first = addresses.first;
      pincodeForSearch.value = first.postalCode.toString();
      selectedAddress.value = place.address;
      isAddressPopUpOpen.value = false;
    } on Exception catch (e) {
      print(e);
    }
  }

  // getAllRestaurants() async {
  //   isLoader.value = true;
  //   print("In the Function");

  //   var res = await http.get(Uri.parse(ApiUrl.allRestaurant));

  //   var jsonDecodeString = json.decode(res.body);
  //   if (jsonDecodeString["ResponseCode"] == 1) {
  //     ResturantModel model = ResturantModel();
  //     jsonDecodeString["ResponseData"]["store"].forEach((data) {
  //       print(data);
  //       model = ResturantModel.fromJson(data);
  //       resturantArray.add(model);
  //       print(resturantArray.length);
  //     });
  //     isLoader.value = false;

  //     print("Trues");
  //   }

  //   print("Out the Function");
  // }

  getAllRestaurantType() async {
    isLoader.value = true;
    print("In the Function");

    var res = await http.get(Uri.parse(ApiUrl.getRestaurantType));

    var jsonDecodeString = json.decode(res.body);
    if (jsonDecodeString["ResponseCode"] == 1) {
      RestaurantTypeModel model = RestaurantTypeModel();
      arrSpecifics.clear();

      jsonDecodeString["ResponseData"].forEach((data) {
        print("restaurantType data:$data");
        model = RestaurantTypeModel.fromJson(data);
        arrSpecifics.add(model);
        print(arrSpecifics.length);
      });
      isLoader.value = false;

      print("True");
    }

    print("Get restaurant type out Function");
  }

  // addToFavorite(String storeid) async {
  //   print("my::::::::::::::::::$storeid");
  //   var api = ApiProvider();
  //   var res = await api.post(ApiUrl.addFav, {"store_id": storeid});
  //   print(res.statusCode);
  //   var jsonDecodeString = json.decode(res.body);
  //   if (jsonDecodeString["ResponseCode"] == 1) {
  //     getAllRestaurantssort();
  //   }
  //   ResponseModel _responseModel = ResponseModel.fromJson(jsonDecodeString);
  //   if (_responseModel.responseCode == ResponseCodeForAPI.sucessC) {
  //     // getFavList();
  //   } else {}
  //   showTostMessage(message: _responseModel.responseText);
  // }

  void selectedSpecificationIdAdd(ind) {
    if (selectedIds.contains(ind)) {
      selectedIds.remove(ind);
    } else {
      selectedIds.add(ind);
    }
  }

  removeToFavorite(String storeid) async {
    print("remove");
    print("remove");
    print("remove:::::::::::$storeid");
    var api = ApiProvider();
    var res = await api.post(ApiUrl.removefav, {"store_id": storeid});
    print(res.statusCode);
    var jsonDecodeString = json.decode(res.body);
    ResponseModel _responseModel = ResponseModel.fromJson(jsonDecodeString);
    if (_responseModel.responseCode == ResponseCodeForAPI.sucessC) {
      favController.getFavList;

      // getFavList();
      // refreshHomePage();
    } else {}
    showTostMessage(message: _responseModel.responseText);

    if (jsonDecodeString["ResponseCode"] == 1) {
      getAllRestaurantssort();
    }
  }

  void addAllmarkersForMap() {
    markersForMapView.clear();
    if (resturantArray.length > 0) {
      var temp = resturantArray.first;
      cameraPositionForMapView = CameraPosition(
        target:
            LatLng(double.parse(temp.latitude), double.parse(temp.longitude)),
        zoom: 15,
      );
    }

    for (ResturantModel temp in resturantArray) {
      if (temp.latitude != null) {
        markersForMapView.add(Marker(
          markerId: MarkerId(temp.storeName),
          infoWindow: InfoWindow(
              title: temp.storeName,
              snippet: "⭐ ${temp.avgRating}"), // "★ ${temp.avgRating}"
          position:
              LatLng(double.parse(temp.latitude), double.parse(temp.longitude)),
        ));
      }
    }
  }

  void doFavouriteFromServer(String storeid, String url, int currentIndex) {
    ApiProvider apiProvider = ApiProvider();

    var body = {"store_id": storeid};
    print(body);
    apiProvider.post(url, body).then((value) {
      var responseJson = json.decode(value.body);
      ResponseModel _responseModel = ResponseModel.fromJson(responseJson);
      if (_responseModel.responseCode == ResponseCodeForAPI.sucessC) {
        resturantArray[currentIndex].favourite.value =
            !resturantArray[currentIndex].favourite.value;
        FavouriteController().getFavList;
      } else {}

      showTostMessage(message: _responseModel.responseText);
    });
  }

  void getAllDataForDashboard() {
    ApiProvider apiProvider = ApiProvider();

    var bookingsystem = "";
    if (isBookingSystem.value == true) {
      bookingsystem = "yes";
    }
    var discount = "";
    if (isDiscount.value == true) {
      discount = "yes";
    }
    arrRecommandedBestRated.clear();
    arrStoreList.clear();

    // ignore: unrelated_type_equality_checks
    var date = isDateSelected == true ? formatedDate.value : "";

    var url = ApiUrl.getserviceproviderlist +
        "?main_category=$mainCategorySelected" +
        "&date=$date" +
        "&search_text=${suggestionStr.value.text}" +
        "&pincode=$pincodeForSearch" +
        "&category_id=$selectedCategoryId" +
        "&subcategory_id=$selectedSubCategoryId" +
        "&booking_system=$bookingsystem" +
        "&discount=$discount" +
        "&home_type=$selectedOptions";

    print(url);
    apiProvider.getApiCall(url).then((value) {
      var responseJson = json.decode(value.body);
      print(responseJson);
      ResponseModel _responseModel = ResponseModel.fromJson(responseJson);
      if (_responseModel.responseCode == ResponseCodeForAPI.sucessC) {
        var responsedata = responseJson["ResponseData"];

        arrRecommandedBestRated.value =
            TopRatedStore.getData(responsedata["top_rated_store"]);

        arrStoreList.value = StoreList.getData(responsedata["storeList"]);
        isLoader.value = false;
        addAllmarkersForMap();
      }

      //isLoader.value = false;
    });
  }

  getAllRestaurantssort() async {
    isLoader.value = true;
    var discount = isDiscount == false || isDiscount == null ? 0 : isDiscount;
    var BookingSystem = isBookingSystem == false || isBookingSystem == null
        ? 0
        : isBookingSystem;
    var freedelivery =
        free_delivery == false || free_delivery == null ? 0 : free_delivery;
    var ordertype = order_type == 1
        ? 'pickup'
        : order_type == 2
            ? 'delivery'
            : order_type;
    var min_order = minOrderType.value == 0
        ? 'lesser'
        : minOrderType.value == 1
            ? 'greater'
            : min_order_amount;
    print("In the Function");
    // resturantArray.clear();
    var api = ApiProvider();
    var res = await api.getApiCall(
      "${ApiUrl.allRestaurant}?sorting=${sort}&booking_system=${BookingSystem}&discount=${discount}&order_type=${ordertype}&address=${selectedAddress}&category_id=${category_id}&search_text=${suggestionStr.value.text}&zipcode=${pincodeForSearch}&tab_type=${selectedOptions}&rating=${"${selectedRating.value}"}&price_range=${selectedPrice.value}&filter_by_facilities=${selectedIds}&Restaurant_type=${selectedrestauranttypeIdAdd.join(",")}&free_delivery=${freedelivery}&min_order_amount=${min_order}",
    );

    var jsonDecodeString = json.decode(res.body);
    if (jsonDecodeString["ResponseCode"] == 1) {
      ResturantModel model = ResturantModel();
      resturantArray.clear();

      jsonDecodeString["ResponseData"]["store"].forEach((data) {
        print(data);
        model = ResturantModel.fromJson(data);
        // resturantArray.clear();
        resturantArray.add(model);
        print(resturantArray.length);
      });
      isLoader.value = false;

      print("Trues");
    }

    print("Out the Function");
    // addAllmarkersForMap();
  }

  sortArray() {
    resturantArray.sort((a, b) => b.storeName.compareTo(a.storeName));
    print(resturantArray);
  }

  // Future<void> getFavData() async {
  //   isLoader.value = true;
  //   ApiProvider apiProvider = ApiProvider();

  //   favList.clear();

  //   var url = ApiUrl.favoriteslist;
  //   var body = {};

  //   await apiProvider.getApiCall(ApiUrl.getFav).then((value) {
  //     var responseJson = json.decode(value.body);
  //     print(responseJson);
  //     ResponseModel _responseModel = ResponseModel.fromJson(responseJson);
  //     if (_responseModel.responseCode == ResponseCodeForAPI.sucessC) {
  //       var responsedata = responseJson["ResponseData"];
  //       // getFavList();
  //       // arrFavStoreList.value = ResponseModel.getData(responsedata);
  //       ResturantModel _resturantModel = ResturantModel();
  //       responseJson["ResponseData"].forEach((data) {
  //         _resturantModel = ResturantModel.fromJson(data);

  //         favList.add(_resturantModel);
  //         isLoader.value = false;
  //         refreshController.refreshCompleted();
  //       });
  //       return favList;
  //     } else {
  //       return favList;
  //     }
  //   });
  // }

  // Future<void> getFavList() async {
  //   isLoader.value = true;

  //   favList.clear();
  //   var api = ApiProvider();
  //   var res = await api.getApiCall(ApiUrl.getFav);
  //   print(res.body);
  //   final jsonString = json.decode(res.body);
  //   ResturantModel resturantModel = ResturantModel();
  //   jsonString["ResponseData"].forEach((data) {
  //     resturantModel = ResturantModel.fromJson(data);

  //     favList.add(resturantModel);
  //   });

  //   isLoader.value = false;
  //   refreshController.refreshCompleted();
  //   return favList;

  //   // Preferences.preferences.clearPref();
  // }

  void clearAllDataAndPullToRefresh() {
    resturantArray.clear();
    isBookingSystem.value = true;
    isDiscount.value = false;
    sortByText.value = "sort".tr;
    selectedSubCategoryId.value = "";
    selectedSubCategoryName.value = 'subCategorys'.tr;
    pincodeForSearch.value = "";
    suggestionStr.value.text = "";
    selectedIndex.value = "";
    fabIconNumber.value = false;
    //selectedOptionsInd.value = 0;
    //selectedOptions = "new";
    selectedCategoryId.value = "";
    selectedCategoryName.value = 'all'.tr;
    scrollController = ScrollController();
    isScroll.value = false;
    resetFilters();

    getAllRestaurantssort();

    refreshController.refreshCompleted();
  }

  applyFilter() {
    selectedRating.value;
    selectedIds;
    var bookingsystem = "";
    if (isBookingSystem.value == true) {
      bookingsystem = "yes";
    }
    var discount = "";
    if (isDiscount.value == true) {
      discount = "yes";
    }
    var freedelivery =
        free_delivery == false || free_delivery == null ? 0 : free_delivery;
    var ordertype = order_type == 1
        ? 'pickup'
        : order_type == 2
            ? 'delivery'
            : order_type;
    resturantArray.clear();

    Map<String, dynamic> body = {
      "rating": "${selectedRating.value}",
      "price_range": selectedPrice.value,
      "filter_by_facilities": "${selectedIds}",
      "discount": discount == "" ? null : discount,
      "booking_system": bookingsystem,
      "free_delivery": freedelivery,
      "min_order_amount": min_order_amount,
    };
    ApiProvider apiProvider = ApiProvider();

    print(body);
    apiProvider.post(ApiUrl.applyFilter, body).then((value) {
      var responseJson = json.decode(value.body);
      print(responseJson);

      ResponseModel _responseModel = ResponseModel.fromJson(responseJson);
      if (_responseModel.responseCode == ResponseCodeForAPI.sucessC) {
        var responsedata = responseJson["ResponseData"];

        arrStoreList.value = StoreList.getData(responsedata["storeList"]);
        // print(arrStoreList.length);
      } else {}

      isLoader.value = false;
    });
  }

  void resetFilters() {
    selectedPrice.value = "0";
    selectedRating.value = "0";
    minOrderType.value = -1;
    selectedIds.clear();
    free_delivery.value = false;

    getAllRestaurantssort();
  }

  // void refreshHomePage() {
  //   DashBoardController _dashboar = Get.find();
  //   // _dashboar.getAllDataForDashboard();
  // }
}
