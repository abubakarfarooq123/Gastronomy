const googleiOSApikey = "AIzaSyA5pxLBa96kQj0qywyovHcBv73gOD5zla8"; //
const googleAndroidApikey = "AIzaSyArMQUYVZdZwTxj3Jc8arW7nGNmIp_9ktU"; //
const appStaticPriceSymbol = "€";

mixin PrefernceKey {
  static String recentSearch = "recentSearches";
  static String isUserLogin = "isUserLogin";
  static String loginToken = "loginToken";
  static String isIntroductionScreenLoaded = "isIntroductionScreenLoaded";
  static String mainSelectedCategory = "mainSelectedCategory";
  static String userData = "userData";
  static String saveCardData = "saveCardData";
  static String isSaveCardData = "isSaveCardData";
  static String isGuestUser = "isGuestUser";
  static String savelanguageKey = "savelanguageKey";
  static String email = "email";
  static String password = "password";
  static String rememberMe = "rememberMe";
  static String totalNotification = "totalNotification";
}

mixin AppFont {
  static String heavyBold = "CAMPTONBLACK";
  static String bold = "CAMPTONBOLD";
  static String regular = "CAMPTONBOOK";
  static String medium = "CAMPTONMEDIUM";
  static String semiBold = "CAMPTONSEMIBOLD";
  static String light = "CAMPTONLIGHT";
}

mixin AssestPath {
  static String arrow = "assets/images/";
  static String intro = "assets/images/Intro/";
  static String onBoarding = "assets/images/_onBording/";
  static String dashboard = "assets/images/_Dashboard/";
  static String login = "assets/images/Login/";
  static String category = "assets/images/Category/";
  static String favourite = "assets/images/Favourite/";
  static String homeView = "assets/images/HomeView/";
  static String detailScreen = "assets/images/DetailScreen/";
  static String checkout = "assets/images/CheckOut/";
  static String bottomnavbar = "assets/images/bottomnavbar/";
  static String profile = "assets/images/Profile/";
  static String setting = "assets/images/Settings/";
  static String giveFeedback = "assets/images/GiveFeedback";
  static String noNotifiation = "assets/images/";
  static String noFavourites = "assets/images/";
}

mixin AppColor {
  static int textFieldBg = 0xfff9f9fb;
  static int textFieldtextColor = 0xff797e88;
  static int maincategoryDisableColor = 0xFFf9f9fb;
  static int maincategoryDisableBorderColor = 0xFFefeff2;
  static int maincategoryDisableTextColor = 0xFFe9e9ed;
  static int maincategorySelectedColor = 0xFFfef4ee;
  static int red = 0xffE14942;
  static int greyClr = 0xff7B7B7B;

  static int maincategorySelectedTextColor = 0xffE14942;

  static int logoBgColor = 0xFFfef4ee;
  // ignore: non_constant_identifier_names
  static int backColour = 0xFFffffff;
  static int firstColour = 0xFFCABABA;
  static int secondColour = 0xFFfef4ed;
  static int thirdColour = 0xFFf9f9fb;
  static int fouthColour = 0xFFfaba5f;
  static int profileColour = 0xFFf1f1f1;
  static int scaffoldbgcolor = 0xFFffffff;
  static int reviewContainer = 0xFFfef5e7;
  static int bgColor = 0xFFffffff;
  static int starContainer = 0xFFfaba5f;
  static int stackColor = 0xFFfef3f3;
  static int confirmtextColor = 0xFF1e6604;
  static int confirmlightColor = 0xFFedf6ed;
  static int confirmborderColor = 0xFFf0f7f0;
  static int greytextColor = 0xFF9fa3a9;
  static int moneytextColor = 0xFFdb8a8a;
  static int paymentfailedColor = 0xFFf5282a;
  static int bottomNavbarColor = 0xFF101928;
  static int black = 0xFF000000;
  static int lightpink = 0XFFFDF5EF;
}

mixin MainCategories {
  static String cosmetics = "cosmetics";
}

mixin SortinOptions {
  static String aToz = "A-Z";
  static String zToa = 'Z-A';
  // static String nearest = "Nearest";
  // static String lowestPrice = "Lowest Price";
  // static String highestPrice = "Highest Price";
  // static String bestRated = "Best Rated";
}

mixin PaymentMethods {
  static String masterCard = "stripe";
  static String visaCard = "stripe";
  static String klarna = "klarna";
  static String paypal = "paypal";
  static String cash = "cash";
  static String applePay = "applepay";
  static String googlePay = "googlepay";
}
