class ResponseCodeForAPI {
  static const int sucessC = 1;
}

class ApiUrl {
  static const BASE_URL =
      "https://www.reserved4you.jotwebstudio.com/api/v1/user/";
  static const BASE_URL1 =
      "https://www.reserved4you.jotwebstudio.com/api/gastronomy/v1/user/";
  static const String login = BASE_URL + "login";
  static const String register = BASE_URL + "register";
  static const String sociallogin = BASE_URL + "social-login";
  static const String forgotPassword = BASE_URL + "forgot-password";

  //all catergory
  static const String allCategory = BASE_URL1 + "all-category";

// add Fav
  static const String addFav = BASE_URL1 + "add-store-favorites";
  static const String getFav = BASE_URL1 + "favorites-list";
  static const String removefav = BASE_URL1 + "remove-store-favorites";

  //All Restaurant details
  static const String allRestaurant = BASE_URL1 + "get-restaurant-list";
  static const String allVouchers = BASE_URL1 + "get-voucher-list";

  // Get restaurant type
  static const String getRestaurantType = BASE_URL1 + "get-restaurant-type";

  /// menu list
  static const String restaurantMenuApi = BASE_URL1 + "get-restaurant-menu";
  static const String restaurantMenuListApi =
      BASE_URL1 + "get-store-category-menu";
  static const String getSubcategoryByCategoryIDAPI =
      BASE_URL1 + "get-subcategory";

  /// add to cart api
  static const String addToCartAPI = BASE_URL1 + "select-menu";

  /// get selected menu item api
  static const String getSelectedMenuItemAPI = BASE_URL1 + "get-select-menu";

  //Vouchers
  static const String genralDetails = BASE_URL1 + "get-restaurant-general";

//Reviews
  static const String resturantsReviews = BASE_URL1 + "get-restaurant-reviews";
  //Notifications
  static const String notifications = BASE_URL1 + "notifications";

  static const String getserviceproviderlist =
      BASE_URL + "get-service-provider-list";
  static const String serviceshortby = BASE_URL + "service-short-by";
  //About Facilities

  static const String getFacilites = BASE_URL + "get-facilities";
  static const String applyFilter = BASE_URL + "filter-restaurant";
  static const String catewisesubcategory = BASE_URL + "cate-wise-subcategory";
  // static const String addstorefavorites = BASE_URL + "add-store-favorites";
  // static const String removestorefavorites =
  //     BASE_URL + "remove-store-favorites";
  static const String storeselectservice = BASE_URL + "store-select-service";
  static const String getselectservice = BASE_URL + "get-select-service";
  static const String storebookingavailabletimedirect =
      BASE_URL + "store-booking-available-time-direct";
  static const String guestuser = BASE_URL + "guest-user";
  static const String withdrawpayment = BASE_URL + "withdraw-payment";
  static const String catesubcateservice = BASE_URL + "cate-subcate-service";
  static const String showservicedetails = BASE_URL + "show-service-details";
  static const String getavailableempservice =
      BASE_URL + "get-available-emp-service";
  static const String favoriteslist = BASE_URL + "favorites-list";
  // static const String StorSuggestion = BASE_URL + "store-suggestion";
  static const String bookingtimeavailable =
      BASE_URL + "booking-time-available";

  static const String storecancelservice = BASE_URL + "store-cancel-service";
  static const String getuserprofile = BASE_URL + "get-user-profile";

  static const String updateuserprofile = BASE_URL + "update-user-profile";

  static const String storeReview = BASE_URL1 + "store-feed-back";
  static const String viewreviewbyempid = BASE_URL + "view-review-by-emp-id";
  static const String storesuggestion =
      BASE_URL1 + "store-suggestion?search_text=";
  static const String servicesuggestion = BASE_URL + "service-suggestion";

  static const String changepassword = BASE_URL + "change-password";
  static const String storeemployee = BASE_URL + "store-employee";

  static const String myorderliststatus = BASE_URL1 + "my-order-list?status=";

  static const String userstorerating = BASE_URL1 + "store-user-rating";
  static const String getsubcateservice = BASE_URL + "get-subcate-service";

  static const String storeservicesearch = BASE_URL + "store-service-search";
  static const String ordercancellationreason =
      BASE_URL + "order-cancellation-reason";

  static const String sortbyreview = BASE_URL + "sort-by-review";
  static const String filterbyreview = BASE_URL + "filter-by-review";
  static const String getuserreviews = BASE_URL1 + "get-user-reviews";
  static const String deleteuserprofile = BASE_URL + "delete-user-profile";
  static const String contactus = BASE_URL + "contact-us";
  static const String logout = BASE_URL + "logout?islogout=1";
  static const String checkoutdata = BASE_URL1 + "process-checkout";

  static const String updatecheckoutdata = BASE_URL + "update-checkout-data";
  static const String getuserappointmentdaymonth =
      BASE_URL + "get-user-appointment-day-month";
  static const String storewisecategory = BASE_URL + "store-wise-category";
  static const String clearselectionstore = BASE_URL + "clear-selection-store";
  static const String getbookingdetails = BASE_URL + "get-booking-details";
  static const String notification = BASE_URL + "notifications";
  static const String reschedule = BASE_URL + "reschedule-appointment";
  static const String permission = BASE_URL + "customer-profile";
  static const String verifyEmail = BASE_URL + "verify-email";
  static const String resendEmail = BASE_URL + "resend-email";
  static const String allowNotification =
      BASE_URL + "allow-notification?allow_notifications";
  static const String updateProfilePicture =
      BASE_URL + "update-profile-picture";
  static const String deleteProfilePicture =
      BASE_URL + "delete-profile-picture";
  static const String emailexist = BASE_URL + "email-exist";

  static const String addAddress = BASE_URL1 + "address/store";
  static const String updateAddress = BASE_URL1 + "address/update";
  static const String deleteAddress = BASE_URL1 + "address/remove";
  static const String getAddressList = BASE_URL1 + "address/get-list";
}

const stripePublishableKey = "pk_test_pyAji6er6sj1KeM06MlYOTsy00dkDuHTU2";
