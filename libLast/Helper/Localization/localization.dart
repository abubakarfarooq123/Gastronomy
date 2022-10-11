import 'package:get/get_navigation/src/root/internacionalization.dart';

class AppLocalization extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          // introduction
          'nextbtn': "Next",
          'introduction1Title': "Choose Your\nService Area",
          'introduction1Description':
              "Lorem will add a line like this to your package's pubspec.yaml",
          'introduction2Title': "Book Service At\nAny Time & Date",
          'introduction2Description':
              "This will add a line like this to your package's pubspec.yaml",
          'introduction3Title': "Confirm Booking\n& Secure Pay",
          'introduction3Description':
              "This will add a line like this to your package's pubspec.yaml",
          //selectCategory
          'titleOfSelectMainCategory': "Choose your area",
          'commingSoon': "Cooming Soon",
          'selectedCategory': "Cosmetics",
          'selectedCategory1': "Gastronomy",

          'selectedservices': "Selected Services",
          //signup
          'registertext': "Register With Us",
          'signuptext': "Signup To Continue",
          'firstnamehint': "First name",
          'lastnamehint': "Last name",
          'Emailhint': "Email Address",
          'Passcodehint': "Set Passcode",
          'confirmPWhint': "Confirm Passcode",
          'phoneNumberHint': "Phone Number",

          'haveaccount': "Have an account",
          'signup': "SignUp",
          'successfully': "Successfully registered",
          'alreadytaken': 'The email has already been taken.',
          // Verify otp screen

          'mobileNumberVerification': "Mobile number verification",
          'seconds': "Seconds",
          'submitOtp': "Submit OTP",
          'verificationCode': "Verification Code",
          'resendOtp': 'Resend OTP',
          'submitOtp2': "Submit OTP",
          //<<<<<SignUpController>>>>>//
          'tostfirstname': "Enter first name",
          'tostphone': "Enter phone number",
          'tostlastname': "Enter last name",
          'tostemail': "Enter email",
          'tostVemail': "Enter valid email",
          'tostPW': "Enter Password",
          'tostPW8Chr': "Password Must be 8 Characters",
          'tostCPW': "Enter confirm password",
          'tostPWnotmatch': "Password and confirm password not match",
          'platformios': "ios",
          'platformAndroid': "Android",
          'pleaselogin': "Your user is logout, Please login again",
          'text1':
              "I would like to receive emails from reserved4you with current offers and news.You can find more information in our",
          'privacy': "privacy policy.",
          'text2':
              "With the registration I agree to the general terms and conditions of reserved4you.",
          //login
          'lestGetTogether': "Let's Get Together",
          'loginToContinue': "LogIn To Continue",
          'email': "Email",
          'password': "Password",
          'forgotPassword': "Forgot Password?",
          'login': "Login",
          'dontHaveanccount': "Don't have an account",
          'signUp': "Sign Up",
          'enterEmail': "Enter email",
          'enterPassword': "Enter Password",
          'continueAsGuestAccount': "Continue As Guest Account?",
          // ForgotPasswordView
          'oopsalert': "Oops! Forgot Password",
          'enteremailmsg':
              'Enter email address and we will send\npasscode reset link on mail.',
          'sent': "Sent",
          'rememberPW': "I remember the Passcode?",
          // forgot controller
          // 'tostemail': "Enter email",
          // GuestUserView
          'letget': "Let's Get Together",
          'guest': 'Guest User',
          'continue': "Continue As Guest",
          // Guest controller
          'validemail': "Enter valid email",
          'Monum': "Enter Mobile Number",

          //dashBoard
          'welcom': "Welcome!",
          'hi': "Hi,",
          'WhatYouWantToDo': "Enjoy ordering!",
          'advanceSearch': "Advance Search",
          'subCategorys': "Sub-categorys",
          'searchNow': "Search Now",
          'findsalonOrParlor': "Find salon or parlor",
          'postCodeOrArea': "Post code or area",
          'whichDate': "Which Date",
          'new': "New",
          'recommanded': "Recommanded",
          'bestRated': "Top Rated",
          'result': " Result",
          'results': " Results",
          'sort': "Sort",
          'a-z': "A-Z",
          'z-a': "Z-A",
          'nearest': "Nearest",
          'lowestPrice': "Lowest Price",
          'highestPrice': "Highest Price",
          'sun': "Sun", //--
          'mon': "Mon", //--
          'tues': "Tues", //--
          'wed': "Wed", //--
          'thurs': "Thurs", //--
          'fri': "Fri", //--
          'sat': "Sat", //--
          'january': "January",
          'february': "February",
          'march': "March",
          'april': "April",
          'may': "May",
          'june': "June",
          'july': "July",
          'august': "August",
          'september': "September",
          'october': "October",
          'november': "November",
          'december': "December",
          'bookingSystem': "Booking System",
          'discounts': "Discounts",
          'home': "Home",
          'favourite': "Favourite",
          'notification': "Notifications",
          'profile': "Profile",
          'services': "Services",
          'reviewes': "Reviwes",
          'clear': "Clear", //--
          'filterApplySuccessfully': "Filter Apply Successfully",

          'selectServices': "Select Service", //--
          'selectEmployee': "Select Employee", //--
          'writeCommentBelow': "Write comment below",
          'releaseToRefresh': "Release To Refresh",
          'refreshCompleted': "Refresh Completed",
          'pullDownRefresh': "Pull Down Refresh",
          'all': "All",
          'reject': "Reject",
          'yourReview': "Your Review",
          // DashBordConttroler

          //filter
          'filter': "Filter",
          'filterByPrice': "Price Range",
          'filterByRating': "Reviews",
          'filterRestaurantType': "Restaurant Type",
          'applyFilter': "Apply Filter",
          'pleaseSelectPriceAndRating': " Please Select price and Rating",
          //map
          'mapView': "Map View",
          //storeDetail
          'closedDay': "Closed Day",
          'close': "Closed Now",
          'open': "Open",
          'contacts': "Contacts",
          'callNow': "Call Now",
          'about': "About",
          'portFolio': "PortFolio",
          'proccedTopay': 'Proceed To Pay',
          'proccedTopay2': "Checkout process",
          'servicesText': "Services",
          //services
          'subCategories': "Sub-categories",
          'topdiscountPopuler': "Top Discount & Populer ",
          'allServices': "All Services",
          'pleaseSelectProceed': "Please select service to proceed",
          'shoeDetail': "Show Detail →",
          'from': "From",
          'discription': "Description", //--
          'select': "Select",
          'selected': "Selected",
          //about
          'specifics': "Specifics",
          'readMore': "Read More",
          'readLess': "Read Less",
          'advantages': "Advantages",
          'stylistExpert': "Styllist Expert",
          'publicTransportation': "Public Transportation",
          'nearestSpot': "Nearest Spot",
          'locationByMap': "Location By map",
          'district': "District",
          'openingHours': "Opening Hours",
          'storeClose': "Store Close",
          'webHome': "WebHome",
          'employeeReviews': "Employee Reviews",
          'findByEmployeeName': "Find by Employee Name ..",
          'findByEmployeeNameShort': "Find by Employee Name ..",
          'stylistExpertReview': "Stylist Expert Reviews",
          'dayago': " day ago",
          'nodatafound': "No data found",
          'monday': "Monday",
          'tuesday': "Tuesday",
          'wednesday': "Wednesday",
          'thursday': "Thursday",
          'friday': "Friday",
          'saturday': "Saturday",
          'sunday': "Sunday",
//coustem
          'errorduring': "Error During Communication: ",
          'invalidrequest': "Invalid Request: ",
          'unauthorised': "Unauthorised: ",
          'invalidinput': "Invalid Input: ",
          //review
          'vanueReview': " Venue Review ",
          'serviceStaff': "Service & staff",
          'Ambiance': "Ambiance",
          'priceprefoma': "Price-Performance ratio",
          'waitingPeriod': "waiting period",
          'atmosphere': "Atmosphere",
          'venueReplay': "Venue replay",
          'showFullRatings': "Show Full Ratings",
          'giveFeedBack': "Give Feedback",
          'sortBy': "Sort By",
          'serviceBy': "Service by ",
          'customerReview': "Customer Review",
          'byRating': "By Ratting",
          'rating': 'rating',
          'byServices': "By Services",
          'newest': "Newest",
          'bestRatings': "Best Ratings",
          'worstRating': "Worst Rating",
          'typeyourexperiencehere': "Type your experience here..",
          'sendyourfeedback': "Send Your Feedback",
          'ratingSubmitedSuccessfully': "Rating submited successfully.",

          //procced to pay
          'chooseStylistandSetDate': "Choose Stylist and set Date & Time →",
          'letsCheckout': "Let's Checkout",
          'totalBooking': "Total Booking",
          'pleaseChooseDate': "Please choose Stylist,Date & Time for",
          'checkOut': "Checkout Process",
          'selectStylist': "Select Stylist",

          'selectDateTime': "Select Date/Time",
          'chooseDate': "Choose Date",
          'thisDayHoliday': "This day holiday",
          'done': "Done",

          'bookingcouldnot': "Payment for Booking Could Not be",
          'pleaseSelectDateAndTime':
              "Please selected date and time for services",
          'anyPerson': "Any Person",
          'bookingSum': "   Booking\n  Summery",
          'billingDet': "  Billing\n Details",
          'compeletePay': "Compelete\nPayment",
          //booking summery
          'bookingSummery': "Booking Summery",
          'vanueName': "Vanue Name",
          'cancellationPolicy': "Cancellation Policy",
          'showPolicy': "Show Policy →",
          'proccedToPay': "Proceed to Payment",
          'proceedToBillingDetail': "Proceed to Billing Detail",

          //booking billing details
          'bookingDetail': "Billing Details",
          'phoneNumber': "Phone Number",
          'phoneNumberValid': "Enter 11 digit mobile number",
          //complete Payment
          'completePayment': "Complete Payment",
          'masterCard': "Master Card",
          'visaCard': "Visa Card",
          'klarna': "Klarna",
          'payPal': "Paypal",
          'cashOnVenue': "Cash On Venue",
          'ApplePay': "Apple Pay",
          'GooglePay': "GooglePay",
          'cash': "cash",
          'cardNumber': "Card Number",
          'mm/yyyy': "(MM/YYYY)Exp. date",
          'cvv': "CVV",
          'saveCardForNextPayment': "Save Card For Next Payment",
          'byContinuing': "By continuing you agree to our",
          'bookingCondition': "Booking Condition",
          'payTo': "Pay to",
          'enterCardNumber': "Enter card number",
          'enterCvv': "Enter CVV number",
          'enterValidCardNumber': "Enter valid card number",
          'enterExpiryDate': "Enter card expiry date",
          'enterCardCvv': "Enter card CVV",
          'paidVia': "Paid Via",

          'stripe': "stripe",
          'card': "Card",
          'totalPaidAmount': "Total paid Ammount",
          'totalpayableamount': "Total Payable Amount",
          'totalpaid': "Total Paid",
          'totalpay': "Total Pay",
          'confirmed': 'Confirmed',
          'paymentFailed': "Oops! Payment Failed",
          'paymentTryAgain':
              "Payment for Booking Could Not be Proceed.Please try again",
          'yourBookingId': "Your Booking ID:",
          'bookingConfirmed': "Booking Confirmed",
          'congressAppoinment': "Congratulation! your appointment",
          'successfullyBooking': "successfully booked",
          'paymentSummery': "Payment Summery",
          'bookingDetails': "Booking Details",
          'details': "Details",
          //mybooking
          'bookedStatus': "booked",
          'pendingStatus': "pending",
          'runningStatus': "running",
          'rescheduleStatus': "reschedule",
          'completedStatus': "completed",
          'cancelStatus': "cancel",
          'myBookings': "My Bookings",
          'pending': "Pending",
          'running': "Running",
          'completed': "Completed",
          'canceled': "Canceled",
          'confirmation': "Confirmation",
          'areYouSureForCancellation':
              "Are you sure you want to cancle the booking?",
          'showpolicy': "Show Policy",
          'yesCancelIt': "Yes, Cancel it?",
          'reasonForCancellation': "Reason for Cancellation",
          'iCanceledTheBookingBecause': "I canceled the booking because",
          'bookingId': "Booking ID:",
          'sharYourReview': "Share Your Review",
          'customerProfile': "Customer profile - request",
          'evaluationReq': "Evaluation request!",
          'seeCencelationReason': "See Cencelation Reason",
          'typeReson': 'Type Reason Here..',
          'bookAgain': "Book Again?",
          'goToToday': "Go to Today",
          'daily': "Daily",
          'monthly': "Monthly",
          "commingSoon!!": "Comming Soon!!",
          "favouriteCollection": 'Favourite Collection',
          //give feedbake
          'howWasYourExperience': "How was your experience ",
          'giveRatings': "Give Ratings",
          'typeYourExperience': "Type your experience here..",
          'sendYourFeedBack': "Send Your Feedback",
          //areSureToRemove

          'areYouWantToRemove':
              'Are you sure you want to remove your service selection?',
          'areYouSureWantToQuit': 'Are you sure you want to quit?',
          //cancel
          'cancel': "Cancel",
          'accept': "Accept",
          //No DataFound
          'noDataFound': "No Data Found",
          //invalis User
          'invalidUser': "Invalid User",
          //Please connect your device to the internet
          'peaseConnectDeviceYourInternet':
              "Please connect your device to the internet",
          //are you you want to quit
          'areYouSureYouWantToQuit': 'Are you sure you want to quit?',
          //yes / no
          'yes': 'Yes',
          'no': 'No',
          //<<<<ProfileView>>>>>//
          'titelofProfile': "My Profile",
          'contact': "Contact",
          'bookingbtn': "My Booking",
          //<<<<Edit_Page>>>>>//
          'editProfile': "Edit Profile",
          'phonehint': "Phone Number",
          'updatebtn': "Update Profile",
          //<<<<SettingView>>>>>//
          'changedPw': "Changed Password",
          'givenReview': "Given Reviews",
          'aboutus': "About Us",
          'trems': "Terms & Condition",
          'Policy': "Cancelation Policy",
          'titelofsetting': "Setting",
          'langugebtn': "Choose Languages",
          'en_US': "English",
          'fr': "French",
          'ge': "German",
          'letsChangeYourLanguge': "Let's Change Your languages",
          'updatelanguge': "Update Language",
          'language': "Language",
          'deleteProfile': "Delete Profile",
          'logout': "Logout",
          'privacyPolicy': "Privacy Policy",

          'deletealertmsg':
              "Are you sure you want to delete your profile permanently?",
          // change password

          'oldPassword': "Old Password",
          'newPassword': "New Password",
          'confirmNewPassword': "Confirm New Password",
          'updatePassword': "Update Password",

          //toast message address controller
          'street': "Enter your street",
          'house': "Enter your house no",
          'city': "Enter your city",
          "postal": "Enter your postal code",

          // Tost messege  setting  Controller//
          'oldPW': "Enter your old password",
          'newPW': "Enter your new password",
          'notMatch': "New password and confrim password doesn't match",
          'tostname': "Enter your name",
          'toastSettingemail': "Enter your e-mail",
          'tostquery': "Enter your message or query",
          //'updatebtn':"Update Password",
          // About us //
          'titleaboutus': "About Us",
          'letus': "Let us know Who is",
          'infoText':
              "this is the new trend. How does our system work? It's simple: we create connections. We combine bookings, overview lists and other advantageous functions in several different areas. So you are prepared for the future.",
          'anyquery': "Any Suggestions & Query",
          'fullname': "Your full name",
          'youremail': "Your email address",
          'yourmsg': "Type your message here..",
          'sendmsg': "Send Message",
          //Check OutView
          'booking': " Booking",
          'summery': "Summery",
          'billing': " Billing",
          'compelete': "Compelete",
          'payment': "Payment",
          'selectsub-categorieshint': "Select Sub-categories",
          'findbyservicehint': "Suche nach Service",
          'send': 'Send',
          //
          'nostore': "No Stores are in Favorite List ",
          // booking view
          'nobookings': "No Booking",
          'failed': "Failed",
          'dateNotAailble':
              "We are sorry! This date cannot be booked with the specified dates. Please choose a different time.",
          'closeDilog': 'Close',
          'selectTimeSlot': "Please select time",
          'rememberMe': 'Remember me',
          'rescheduleAppointment': "Reschedule Appointment?",
          'getDetails': "Get details",
          'review': "Review",
          'showRating': "Show rating",
          'loschen': "Clear",
          'further': "Select",

          // terms & conditions
          'tltr': "TLTR",
          'theContractDoesNotEtc':
              "The contract does not expire unless terminated by one of the parties. The contract "
                  "should be terminated two weeks in advance by email for a monthly subscription and 30 days in advance for "
                  "an annual subscription by email. If the terms of sale are violated, we reserve the right to terminate the"
                  " contract with you without notice.",
          'yourContractWithUsEtc':
              "Your contract with us will not expire unless terminated by one of the parties. "
                  "The contract begins on the day of payment.",
          'youMustTerminateThisEtc':
              "You must terminate this agreement about the period of use by notifying us in "
                  "writing two (2) weeks in advance at our e-mail address kuendigung@reserved4you.de if you have used the "
                  "monthly payment method. If you have made use of the annual payment method, you must terminate this agreement "
                  "over the period of use with thirty (30) days' notice in writing to our e-mail address kuendigung@reserved4you.de.",
          'theTerminationOrSuspensionEtc':
              "The termination or suspension of these Terms of Sale for whatever reason shall not "
                  "affect rights and obligations that arose or occurred prior to the expiration date or termination and invoices or"
                  " other obligations must be paid within thirty (30) days of such termination.",
          'weReserveTheRightToEtc':
              "We reserve the right to terminate or block your account and access to the website / app "
                  "without prior notice and at our sole discretion and to block or prevent your future access and use of your "
                  "account if you breach the terms of sale violated. If necessary, we can also remove any content or information "
                  "you have shared if we believe it is in violation of the Terms of Sale.",

          // cancel policy
          'theBookingCanBeCanceledEtc':
              "The booking can be canceled before the appointment and you can request a refund. If "
                  "you do not cancel within the stated time, we will have the discretion to issue a refund for your payment.",
          'asProvidedInClauseEtc':
              "As provided in Clause 13 of these Terms of Use, you can cancel the booking (1 (one) hour to"
                  " 48 (forty-eight) hours) before your scheduled date and all of your payment will be refunded. If you do not cancel"
                  " the booking within one hour of the agreed appointment booking, then it is at our discretion to refund your payment.",
          'weProvideTheServiceEtc':
              "We provide the service provider \"as is\" and \"as available\" without any warranty.",
          'weDoNotGuaranteeThatEtc':
              "We do not guarantee that the app, website and service will function without interruption and"
                  " that the services will always be available for use.",
          'weAlwaysTryToEnsureEtc':
              "We always try to ensure that the website / app is available without interruptions and that the"
                  " transmissions are error-free. Due to the nature of the internet and various other factors, we and we cannot guarantee "
                  "that the website and app will be free of errors or that the defects will be corrected. Furthermore, we do not guarantee"
                  " that the website and the app are virus-free or without other harmful components. In this regard, you need to take"
                  " precautionary measures. In any case, we accept no liability for any loss or damage caused by distributed\n"
                  "denial-of-service attacks, computer viruses or other technically harmful materials that your data processing equipment,"
                  " data processing programs have caused.",
          'weDoNotAssumeAnyEtc':
              "We do not assume any liability for these results or the use of the app / website and the service"
                  " corresponds to the needs.",
          'weAreNotLiableForTheEtc':
              "We are not liable for the consequences of any interruptions or errors in the app / website "
                  "or services and we do not guarantee the accuracy or completeness of inaccuracies and typographical errors.",
          'pleaseNoteThatWeMakeEtc':
              "Please note that we make our website / apps available for private and private use only and "
                  "that you agree not to use our website / app for commercial or business purposes, unless we have you as Service "
                  "provider approved.",

          // data protection
          'thisDataProtectionDeclarationEtc':
              "This data protection declaration explains the type, scope and purpose of the processing of personal data "
                  "(hereinafter referred to as “data”) within our online offer and the associated websites, functions and "
                  "content as well as external online presences, such as our social media profile. (hereinafter jointly "
                  "referred to as \"online offer\"). With regard to the terms used, such as \"processing\" or \"person responsible\","
                  " we refer to the definitions in Art. 4 of the General Data Protection Regulation (GDPR).",
          'responsible': "Responsible",
          'responsibleInfo': "RFU reserved4you GmbH\n"
              "Wilmersdorfer Straße 122-123,\n"
              "10627 Berlin,\n"
              "Germany\n"
              "Register: Commercial\n"
              "register Register number: HRB 208249B\n"
              "Register court: Berlin Charlottenburg\n"
              "Tel .: +49 30 364 299 61\n"
              "E-Mail: info@reserved4you.de",
          'typesOfDataProcessed': "Types of data processed",
          'typesOfDataProcessedInfo': "Inventory data (e.g., names, addresses).\n"
              "Contact details (e.g., email, phone numbers).\n"
              "Content data (e.g., text input, photographs, videos).\n"
              "Contract data (e.g., subject of the contract, duration, customer category).\n"
              "Payment data (e.g. bank details, payment history).\n"
              "Usage data (e.g. websites visited, interest in content, access times).\n"
              "Meta / communication data (e.g. device information, IP addresses).",
          'processingOfSpecialCategoriesEtc':
              "Processing of special categories of data (Art. 9 Para. 1 GDPR)",
          'noSpecialCategoriesEtc':
              "No special categories of data are processed.",
          'categoriesOfPersonsAffectedEtc':
              "Categories of persons affected by the processing",
          'customersInterestedPartiesEtc':
              "Customers, interested parties, visitors and users of the online offer, "
                  "business partners. Visitors and users of the online offer.\nIn the following, we also refer to the "
                  "data subjects collectively as \"users\".",
          'purposeOfProcessingEtc': "Purpose of processing",
          'purposeOfProcessingInfo':
              "Provision of the online offer, its content and shop functions.\n"
                  "Provision of contractual services, service and customer care.\n"
                  "Answering contact inquiries and communicating with users.\n"
                  "Marketing, advertising and market research.\n"
                  "Safety measures.\n\n"
                  "Status: May 2020",
          'termsUsed': "Terms used",
          'personalDataIsAllEtc':
              "\“Personal data\” is all information that relates to an identified or identifiable"
                  " natural person (hereinafter \“data subject\”); A natural person is regarded as identifiable who can be "
                  "identified directly or indirectly, in particular by means of assignment to an identifier such as a name,"
                  " an identification number, location data, an online identifier (e.g. cookie) or one or more special features,"
                  " which express the physical, physiological, genetic, psychological, economic, cultural or social identity "
                  "of this natural person.",
          'processingIsAnyProcessEtc':
              "\"Processing \"is any process carried out with or without the help of automated "
                  "processes or any such series of processes in connection with personal data. The term is broad and encompasses"
                  "practically every handling of data.",
          'responsibleIsTheNaturalEtc':
              "\“Responsible\” is the natural or legal person, authority, institution or "
                  "other body that alone or jointly with others decides on the purposes and means of processing personal data.",
          'relevantLegalBases': "Relevant legal bases",
          'inAccordanceWithArt13Etc':
              "In accordance with Art. 13 GDPR, we will inform you of the legal basis for our data "
                  "processing. If the legal basis is not mentioned in the data protection declaration, the following applies: "
                  "The legal basis for obtaining consent is Art. 6 Para. 1 lit. a and Art. 7 GDPR, the legal basis for processing "
                  "to fulfill our services and to carry out contractual measures Answering inquiries is Article 6 (1) (b) GDPR, the "
                  "legal basis for processing to fulfill our legal obligations is Article 6 (1) (c) GDPR, and the legal basis for"
                  " processing to safeguard our legitimate interests is Art . 6 para. 1 lit.f GDPR. In the case,",
          'safetyMeasures': "Safety measures",
          'inAccordanceWithArt32Etc': "In accordance with Art. 32 GDPR, taking into account the state of the art, the "
              "implementation costs and the type, scope, circumstances and purposes of processing as well as the different "
              "probability of occurrence and severity of the risk for the rights and freedoms of natural persons, we make suitable"
              " technical and organizational measures to ensure a level of protection appropriate to the risk; The measures "
              "include, in particular, securing the confidentiality, integrity and availability of data by controlling physical"
              " access to the data, as well as the access, input, transfer, ensuring availability and their separation. "
              "Furthermore, we have set up procedures that enable the exercise of data subject rights, Ensure deletion of "
              "data and reaction to data threats. Furthermore, we take the protection of personal data into account during the "
              "development or selection of hardware, software and procedures, in accordance with the principle of data protection"
              " through technology design and data protection-friendly default settings (Art. 25 GDPR).",
          'theSecurityMeasuresIncludeEtc':
              "The security measures include, in particular, the encrypted transmission of data "
                  "between your browser and our server.",
          'disclosureAndTransferOfData': "Disclosure and transfer of data",
          'ifWeDiscloseDataToOtherEtc':
              "If we disclose data to other persons and companies (contract processors or third parties)"
                  " as part of our processing, transmit them to them or otherwise grant them access to the data, this is only done "
                  "on the basis of legal permission (e.g. if the data is transmitted to third parties, as is required for payment "
                  "service providers in accordance with Art. 6 Para. 1 lit. - and legal advisors, customer care, bookkeeping, "
                  "billing and similar services that allow us to efficiently and effectively fulfill our contractual obligations,"
                  " administrative tasks and duties).",
          'ifWeCommissionThirdPartiesEtc':
              "If we commission third parties to process data on the basis of a so-called \"order"
                  " processing contract\", this is done on the basis of Art. 28 GDPR.",
          'transfersToThirdCountries': "Transfers to third countries",
          'ifWeProcessDataInEtc': "If we process data in a third country (i.e. outside the European Union (EU) or the European"
              " Economic Area (EEA)) or if this happens in the context of the use of third-party services or disclosure or "
              "transmission of data to third parties, this will only take place if it happens to fulfill our (pre) contractual"
              " obligations, on the basis of your consent, on the basis of a legal obligation or on the basis of our legitimate"
              " interests. Subject to legal or contractual permissions, we process or have the data processed in a third "
              "country only if the special requirements of Art. 44 ff. GDPR are met. This means that processing takes place,"
              " for example, on the basis of special guarantees, such as the officially recognized determination of a data "
              "protection level corresponding to the EU (e.g.",

          // Finishing signing up
          'finishingSigningUp': "Finishing signing up",
          'thisInfoHasComeFromApple': "This info has come from apple",
          'enterEmailHere': "Enter email here",
          'continueText': "Continue",

          'appointmentRescheduleSuccessful':
              'Appointment reschedule successful',
          'general': 'General',
          'feedback': 'Feedback'
        },
        // <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
        'de': {
          'general': 'Allgermein',
          'feedback': 'Bewtungen',
          'loschen': "Loschen",
          'further': "Further",
          'nextbtn': "Weiter",
          'customerProfile': "Kundenprofil - Anfrage !",
          'evaluationReq': "Bewertungsanfrage !",
          'introduction1Title': "Wähle deinen\n bevorzugten Bereich",
          'introduction1Description':
              "Buche deine Termine und\nverwalte alles einfach in deinem Profil.",
          'introduction2Title': "Buche Termine\nrund um die Uhr",
          'introduction2Description':
              "Buche deine Termine, wann und wo du möchtest.",
          'introduction3Title': " Sichere Zahlung\n& Buchungsbestätigung",
          'introduction3Description':
              "Zahle sicher, erhalte deine Buchungsbestätigung\nund genieße deinen gebuchten Service.",
          //selectCategory
          'titleOfSelectMainCategory': "Wähle deinen Bereich",
          'commingSoon': "Cooming Soon",
          'selectedCategory': "Kosmetik",
          'selectedCategory1': "Gastronomy",
          'selectedservices': "Service wählen",
          //signup
          'registertext': "Erstelle einen Account",
          'signuptext':
              "Registriere dich jetzt bei reserved4you und nutze alle Vorteile.",
          'firstnamehint': "Vorname",
          'lastnamehint': "Nachname",
          'Emailhint': "E-Mail",
          'Passcodehint': "Erstelle ein Passwort",
          'confirmPWhint': "Bestätige dein Passwort",
          'phoneNumberHint': "Telefonnummer",
          'haveaccount': "Du hast bereits einen Account?",
          'signup': "Registrieren",
          'successfully': "Erfolgreich registriert",
          'alreadytaken': 'Die E-Mail-Adresse wird bereits verwendet.',
//<<<<<SignUpController>>>>>//
          'tostfirstname': "Bitte gib deinen Vornamen ein.",
          'tostlastname': "Bitte gib deinen Nachnamen ein.",
          'tostemail': "Oops! Bitte gib deine E-Mail Adresse ein.",
          'tostVemail': "Please enter a valid email.",
          'tostPW': "Bitte gib ein Passwort ein.",
          'tostPW8Chr': "Passwort muss mindestens 8 Zeichen haben.",
          'tostCPW': "Geben Sie das Passwort zur Bestätigung ein",
          'tostPWnotmatch':
              "Passwort und Passwort Bestätigung stimmen nicht überein.",
          'platformios': "iOS",
          'platformAndroid': "Android",
          'text1':
              "Ich möchte E-Mails von reserved4you mit aktuellen Angeboten und Neuigkeiten erhalten.Weitere Informationen findest du in unseren",
          'privacy': "Datenschutzbestimmungen.",
          'text2':
              "Mit der Registrierung stimme ich den Allgemeine Geschäftsbedingungen von reserved4you zu.",
          'pleaselogin': "Ausgeloggt. Bitte melde dich erneut an.",
          //login
          'lestGetTogether': "Anmelden bei reserved4you",
          'loginToContinue': "Login",
          'email': "E-Mail",
          'password': "Passwort",
          'forgotPassword': "Passwort vergessen?",
          'login': "Login",
          'dontHaveanccount': "Noch keinen Account?",
          'signUp': "Hier registrieren",
          'enterEmail': "Bitte gib deine E-Mail ein.",
          'enterPassword': "Bitte gib dein Passwort ein.",
          'continueAsGuestAccount': "Fortfahren als Gast Nutzer?",
          'review': "Bewerten",
          // Verify otp screen

          'mobileNumberVerification': "Verifizierung",
          'seconds': "Sekunden",
          'submitOtp':
              "Bitte gib hier den Verifizierungscode ein, den du per Mail erhalten hast.",
          'verificationCode': "Verifizierungscode",
          'resendOtp': 'Erneut senden',
          'submitOtp2': "Bestätigen",
          // ForgotPasswordView
          'oopsalert': "Oops! Passwort vergessen?",
          'sent': "Senden",
          'enteremailmsg':
              "Gib bitte deine E-Mail Adresse ein und wir senden dir\neinen Passwort Reset Link.",
          'rememberPW': "Passwort doch nicht vergessen?",
// forgot controller
          // ignore: equal_keys_in_map
          'tostemail': "Bitte gib deine E-Mail Adresse ein.",
// GuestUserView
          'letget': "Gast Nutzer bei reserved4you",
          'guest': "Los geht's!",
          'continue': "Fortfahren als Gast Nutzer",
// Guest controller
          'validemail': "Bitte gib ein gültige E-Mail Adresse ein.",
          'Monum': "Bitte gib deine Telefonnummer ein.",
//dashBoard

          'welcom': "Willkommen!",
          'hi': "Hi,",
          'WhatYouWantToDo': "viel Spaß beim Buchen!",
          'advanceSearch': "Erweiterte Suche",
          'subCategorys': "Unterkategorien",
          'searchNow': "Suchen",
          'findsalonOrParlor': "Salon oder Service",
          'postCodeOrArea': "Ort oder PLZ",
          'whichDate': "Datum",
          'new': "Neu",
          'recommanded': "Empfohlen",
          'bestRated': "Top Rated",
          'result': " Ergebnis",
          'results': " Ergebnisse",
          'sort': "Sortieren",
          'a-z': "A-Z",
          'z-a': "Z-A",
          'nearest': "Nächstes",
          'lowestPrice': "Preisaufsteigend",
          'highestPrice': "Preisabsteigend",
          'sun': "So",
          'mon': "Mo",
          'tues': "Di",
          'wed': "Mi",
          'thurs': "Do",
          'fri': "Fr",
          'sat': "Sa",
          'january': "Januar",
          'february': "Februar",
          'march': "März",
          'april': "April",
          'may': "Mai",
          'june': "Juni",
          'july': "Juli",
          'august': "August",
          'september': "September",
          'october': "Oktober",
          'november': "November",
          'december': "Dezember",
          'bookingSystem': "Buchungssystem",
          'discounts': "Rabatte",
          'home': "Home",
          'favourite': "Favoriten",
          'notification': "Mitteilungen",
          'profile': "Profil",
          'services': "Salons",
          'reviewes': "Bewertungen",
          'clear': "Löschen",
          'filterApplySuccessfully': "Filter erfolgreich angewendet",
          'selectServices': "Service wählen",
          'selectEmployee': "Mitarbeiter wählen",
          'writeCommentBelow': "Bitte teile hier deine Erfahrungen.",
          'releaseToRefresh': "Ziehen zum Laden",
          'refreshCompleted': "Vollständig geladen",
          'pullDownRefresh': "Ziehen zum Laden",
          'all': "Alle",
//filter
          'filter': "Filter",
          'filterByPrice': "Preisklasse",
          'filterByRating': "Bewertungen",
          'filterRestaurantType': "Eigenschaften",
          'applyFilter': "Anwenden",
//map
          'mapView': "Kartenansicht",
//storeDetail
          'closedDay': "Geschlossenen",
          'close': "Geschlossen",
          // 'close': "Geschlossen",
          'closeDilog': 'Schließen',
          'open': "Geöffnet",
          'contacts': "Kontakt",
          'callNow': "Anrufen",
          'about': "Allgemein",
          'portFolio': "Portfolio",
          'proccedTopay': "Weiter zur Zahlung",
          'proccedTopay2': "Checkout Prozess",
          'servicesText': "Services",
//services
          'subCategories': "Unterkategorien",
          'topdiscountPopuler': "Beliebte Services",
          'allServices': "Alle Services",
          'pleaseSelectProceed':
              "Bitte wähle einen Service aus, um fortzufahren",
          'shoeDetail': "Zeige Details →",
          'from': "ab",
          'discription': "Beschreibung",
          'select': "Wählen",
          'selected': "Ausgewählt",
//about
          'specifics': "Eigenschaften",
          'readMore': "Mehr",
          'readLess': "Weniger",
          'advantages': "Vorteile",
          'stylistExpert': "Mitarbeiter",
          'publicTransportation': "Öffentliche Verkehrsmittel",
          'nearestSpot': "Nächste Haltestelle",
          'locationByMap': "Standort",
          'district': "Bezirk",
          'openingHours': "Öffnungszeiten",
          'storeClose': "Geschlossen",
          'webHome': "Webseite",
          'employeeReviews': "Mitarbeiter Bewertungen",
          'findByEmployeeName': "Suche nach Mitarbeitern, Services …",
          'findByEmployeeNameShort': "Suche nach Mitarbeitern",
          'stylistExpertReview': "Mitarbeiter Bewertungen",
          'dayago': " Vor Tagen",
          'monday': "Montag",
          'tuesday': "Dienstag",
          'wednesday': "Mittwoch",
          'thursday': "Donnerstag",
          'friday': "Freitag",
          'saturday': "Samstag",
          'sunday': "Sonntag",

          'vanueReview': "Bewertungen",
          'serviceStaff': "Service & Mitarbeiter",
          'Ambiance': "Ambiente",
          'priceprefoma': "Preis-Leistung",
          'waitingPeriod': "Wartezeit",
          'atmosphere': "Atmosphäre",
          'venueReplay': "Antwort",
          'showFullRatings': "Mehr anzeigen",
          'giveFeedBack': "Feedback geben",
          'giveRatings': "Bewertung abgeben",
          'sortBy': "Sortieren",
          'serviceBy': "Service von ",
          'customerReview': "Bewertungen",
          'byRating': "Bewertung",
          'rating': 'Bewertung',
          'byServices': "Services",
          'newest': "Neueste Bewertung",
          // 'newest': "Neueste",
          'bestRatings': "Beste Bewertung",
          // 'bestRatings': "Beste",
          'worstRating': "Schlechteste Bewertung",
          // 'worstRating': "Schlechteste",
          'howwasyourexperience': "Teile deine Erfahrungen mit anderen Nutzern",
          'ratingSubmitedSuccessfully': "Feedback erfolgreich gesendet.",
//procced to pay
          'chooseStylistandSetDate':
              "Bitte Mitarbeiter, Datum, Uhrzeit hier wählen →",
          'letsCheckout': "Checkout",
          'totalBooking': "Gesamt",
          'pleaseChooseDate':
              "Bitte wähle einen Mitarbeiter, Datum und Uhrzeit für",
          'checkOut': "Checkout Prozess",
          'selectStylist': "Mitarbeiter wählen",
          'selectDateTime': "Datum/Uhrzeit auswählen",
          'chooseDate': "Datum wählen",
          'thisDayHoliday': "Heute geschlossen!",
          'done': "Weiter",
          'pleaseSelectDateAndTime':
              "Bitte wähle Datum und Uhrzeit für deine Services",
          'anyPerson': "Beliebiger Mitarbeiter",
          'bookingSum': "   Buchungs\n   übersicht",
          'billingDet': "  Kontakt daten",
          'compeletePay': "Zahlung",
          //booking summery
          'bookingSummery': "Buchung",
          'vanueName': "Salon",
          'cancellationPolicy': "Stornierungsrichtlinien",
          'showPolicy': "Anzeigen →",
          'proccedToPay': "Weiter zur Zahlung",
          'proceedToBillingDetail': "Weiter zu den Kontaktdaten",
          //booking billing details
          'bookingDetail': "Kontaktdaten",
          'phoneNumber': "Telefonnummer",
          'phoneNumberValid': "Bitte gib eine gültige Nummer ein.",
          //complete Payment
          'completePayment': "Jetzt buchen",
          'masterCard': "Master Card",
          'visaCard': "Visa",
          'klarna': "Klarna",
          'payPal': "Paypal",
          'cashOnVenue': "vor Ort",
          'ApplePay': "ApplePay",
          'GooglePay': "GooglePay",
          'cash': "vor Ort",
          'cardNumber': "Kartennummer",
          'mm/yyyy': "(MM/YYYY) Ablaufdatum",
          'cvv': "CVV",
          'saveCardForNextPayment': "Karte für nächste Zahlung speichern.",
          'byContinuing': "Indem du fortfährst akzeptierst du unsere",
          'bookingCondition': "AGB",
          'payTo': "Zahlungspflichtig Buchen",
          'enterCardNumber': "Bitte gib deine Kartennummer ein",
          'enterCvv': "Bitte CVV eingeben",
          'enterValidCardNumber': "Bitte gib eine gültige Kartennummer ein",
          'enterExpiryDate': "Bitte gib ein gültiges Ablaufdatum ein",
          'enterCardCvv': "Bitte CVV eingeben",
          'paidVia': "Zahlungsmethode",
          'stripe': "Stripe",
          'card': "Karte",
          'totalPaidAmount': "Gesamtbetrag",
          'totalpaid': "Bezahlt",
          'confirmed': "Bestätigen",
          'paymentFailed': "Oops! Zahlung fehlgeschlagen",
          'paymentTryAgain':
              "Die Zahlung für die Buchung kann nicht ausgeführt werden. Bitte versuche es erneut.",
          'yourBookingId': "Deine Buchungs-ID:",
          'bookingConfirmed': "Buchung bestätigt!",
          'congressAppoinment': "Glückwunsch! Dein Termin",
          'successfullyBooking': "wurde erfolgreich gebucht",
          'paymentSummery': "Zahlungsübersicht",
          'bookingDetails': "Buchungsdetails",
          //mybooking
          'bookedStatus': "Gebucht",
          'pendingStatus': "Steht aus",
          'runningStatus': "Aktiv",
          'rescheduleStatus': "Verschoben",
          'completedStatus': "Erledigt",
          'cancelStatus': "Storniert",
          'myBookings': "Meine Buchungen",
          'pending': "Bevorstehend",
          'running': "Aktuell",
          'completed': "Erledigt",
          'canceled': "Storniert",
          'confirmation': "Bestätigung",
          'areYouSureForCancellation':
              "Bist du sicher, dass du deine Buchung stornieren möchtest?",
          'showpolicy': "Anzeigen",
          'yesCancelIt': "Ja, stornieren!",
          'reasonForCancellation': "Stornierungsgrund",
          'iCanceledTheBookingBecause': "Die Buchung wurde storniert, weil …",
          'bookingId': "Buchungs-ID:",
          'sharYourReview': "Bewertung schreiben",
          'seeCencelationReason': "Stornierungsgrund anzeigen",
          'bookAgain': "Erneut buchen?",
          'goToToday': "Heute",
          'daily': "Tag",
          'monthly': "Monat",
          "commingSoon!!": "Coming Soon!!",
          "favouriteCollection": 'Favoriten',
          'typeYourExperience': "Teile deine Erfahrungen hier ...",
          'sendYourFeedBack': "Feedback senden",
          'yourReview': "deine Bewertung",

          //cancel

          'cancel': "Stornieren",
          'accept': "Annehmen",
          'reject': "Ablehnen",
//No DataFound
          'noDataFound': "Leider noch keine Einträge.",
//invalis User
          'invalidUser': "Ungültiger User!",
          //Please connect your device to the internet
          'peaseConnectDeviceYourInternet':
              "Bitte stelle eine Internetverbindung her",
//are you you want to quit
          'areYouSureYouWantToQuit':
              "Bist du sicher, dass du diesen Salon verlassen möchtest?",

          'yes': "Ja",
          'no': "Nein",

          //<<<<ProfileView>>>>>//
          'titelofProfile': "Mein Profil",
          'contact': "Kontakt",
          'bookingbtn': "Meine Buchungen",

//<<<<Edit_Page>>>>>//
          'editProfile': "Profil bearbeiten",
          'phonehint': "Telefonnummer",
          'updatebtn': "Speichern",

          //<<<<SettingView>>>>>//
          'letsChangeYourLanguge': "Sprache ändern",
          'changedPw': "Passwort ändern",
          'givenReview': "Meine Bewertungen",
          'aboutus': "Über Uns",
          'trems': "AGB",
          'Policy': "Stornierungsrichtlinien",
          'titelofsetting': "Einstellungen",
          'langugebtn': "Sprachauswahl",
          'en_US': "Englisch",
          'fr': "Französisch",
          'ge': "Deutsch",
          'updatelanguge': "Speichern",
          'language': "Sprachen",
          'deleteProfile': "Profil löschen",
          'logout': "Logout",
          'privacyPolicy': "Datenschutz",
          'deletealertmsg':
              "Bist du sicher, dass du dein Profil dauerhaft löschen möchtest?",

          // change password

          'oldPassword': "Altes Passwort",
          'newPassword': "Neues Passwort",
          'confirmNewPassword': "Bestätige dein Passwort",
          'updatePassword': "Passwort ändern",

          //toast message address controller
          'street': "Geben Sie Ihre Straße ein",
          'house': "Geben Sie Ihre Hausnr",
          'city': "Geben Sie Ihre Stadt ein",
          "postal": "Geben Sie Ihre Postleitzahl ein",

          // Tost messege  setting  Controller//
          'oldPW': "Bisheriges Passwort",
          'newPW': "Neues Passwort",
          'notMatch':
              "Neues Passwort und Passwort Bestätigung stimmen nicht überein.",
          'tostname': "Name",
          'toastSettingemail': "E-Mail",
          'tostquery': "Gib deine Frage oder Nachricht hier ein",

          // About us //
          'titleaboutus': "About Us",
          'letus': "Bequem und schnell buchen",
          'infoText':
              "das ist der neue Trend. Wie unser System funktioniert? Ganz einfach: Wir schaffen Verbindungen. Und zwar kombinieren wir Buchungen, Übersichtslisten und weitere vorteilhafte Funktionen in mehreren verschiedenen Bereichen. Damit seid ihr für die Zukunft gewappnet.",
          'anyquery': "Vorschläge oder Fragen",
          'fullname': "Vor/ Nachname",
          'youremail': "E-Mail",
          'yourmsg': "Bitte gib hier deine Frage oder Nachricht ein.",
          'sendmsg': "Senden",
          'selectsub-categorieshint': "Unterkategorie wählen",
          'typeReson': 'Gib hier deinen Stornierungsgrund ein...',
          'send': 'Stornieren',
          'details': "Details",
          //
          'nostore': "keine Geschäfte sind in der Favoritenliste",
          // booking view
          'nobookings': "Leider keine Buchungen gefunden.",
          'failed': "Fehlgeschlagen",
          'dateNotAailble':
              "Tut uns Leid! Dieser Termin ist mit den angegebenen Daten nicht buchbar. Bitte wähle eine andere Uhrzeit.",
          'selectTimeSlot': "Bitte Uhrzeit auswählen",
          'rememberMe': 'Erinnere dich an mich',
          'rescheduleAppointment': "Termin neu ausmachen?",
          'getDetails': "Einzelheiten",
          'showRating': "Bewertung anzeigen",

          // Terms & conditions
          'tltr': "TLTR",
          'theContractDoesNotEtc':
              "Der Vertrag läuft nicht ab, es sei denn, er wird von einer der Parteien gekündigt. Die Kündigung des "
                  "Vertrages sollte bei Monatsabonnement zwei Wochen im Voraus per E-Mail und bei Jahresabonnement 30 Tage "
                  "vorher per E-Mail erfolgen. Bei Verstößen gegen die Verkaufsbedingungen behalten wir uns das Recht vor, "
                  "den Vertrag mit Ihnen fristlos zu kündigen.",
          'yourContractWithUsEtc':
              "Ihr Vertrag mit uns läuft nicht aus, es sei denn, er wird von einer der Parteien gekündigt. "
                  "Der Vertrag beginnt mit dem Tag der Zahlung.",
          'youMustTerminateThisEtc':
              "Sie müssen diese Vereinbarung über die Nutzungsdauer kündigen, indem Sie uns zwei "
                  "(2) Wochen im Voraus schriftlich unter unserer Mail Adresse kuendigung@reserved4you.de mitteilen, wenn Sie die "
                  "monatliche Zahlungsmethode in Anspruch genommen haben. Falls Sie die jährliche Zahlungsmethode in Anspruch "
                  "genommen haben, müssen Sie diese Vereinbarung über die Nutzungsdauer mit einer Frist von dreißig (30) Tagen schriftlich "
                  "unter unserer Mail Adresse kuendigung@reserved4you.de kündigen.",
          'theTerminationOrSuspensionEtc':
              "Die Beendigung oder Aussetzung dieser Verkaufsbedingungen aus welchem Anlass auch immer,"
                  " lässt die Rechte und Pflichten unberührt, die vor dem Ablaufdatum oder der Beendigung aufgetreten oder entstanden "
                  "sind und Rechnungen oder andere Verpflichtungen sind innerhalb von dreißig (30) Tagen nach einer solchen Beendigung "
                  "zu begleichen.",
          'weReserveTheRightToEtc':
              "Wir behalten uns das Recht vor, Ihr Konto und den Zugriff auf die Webseite/App ohne vorherige"
                  " Ankündigung und nach unserem alleinigen Ermessen zu kündigen oder zu sperren und Ihren zukünftigen Zugriff und Ihre"
                  " Nutzung Ihres Kontos zu sperren oder zu verhindern, wenn Sie gegen die Verkaufsbedingungen verstoßen. Falls "
                  "erforderlich, können wir auch alle von Ihnen geteilten Inhalte oder Informationen entfernen, wenn wir glauben, dass "
                  "sie gegen die Verkaufsbedingungen verstoßen.",

          // cancel policy
          'theBookingCanBeCanceledEtc':
              "Die Stornierung der Buchung kann vor dem Termin erfolgen und Sie können eine Rückerstattung "
                  "verlangen. Wenn Sie nicht innerhalb der genannten Zeit stornieren, haben wir das Ermessen eine Rückerstattung für "
                  "Ihre Zahlung zu erhalten.",
          'asProvidedInClauseEtc':
              "Wie in Ziffer 13 dieser Nutzungsbedingungen vorgesehen, können Sie die Buchung stornieren "
                  "(1 (eine) Stunde bis 48 (achtundvierzig) Stunden ) vor Ihrem geplanten Termin und Ihre gesamte Zahlung wird "
                  "zurückerstattet. Wenn Sie die Buchung nicht vor Ablauf einer Stunde bis zur vereinbarten Terminbuchung stornieren,"
                  " dann liegt es in unserem Ermessen, Ihre Zahlung zurückzuerstatten.",
          'weProvideTheServiceEtc':
              "Wir stellen den Dienstleister „wie besehen“ und „wie verfügbar“ ohne jegliche "
                  "Gewährleistung zur Verfügung.",
          'weDoNotGuaranteeThatEtc':
              "Wir garantieren nicht, dass die App, Webseite und der Service ununterbrochen funktionieren "
                  "und dass die Dienste immer zur Nutzung verfügbar sein werden.",
          'weAlwaysTryToEnsureEtc': "Wir bemühen uns stets sicherzustellen, dass die Webseite/App ohne Unterbrechungen verfügbar "
              "ist und dass die Übertragungen fehlerfrei sind. Aufgrund der Natur des Internets und verschiedener anderer Faktoren, "
              "die wir nicht garantieren und wir können nicht garantieren, dass die Webseite und die App fehlerfrei sind oder die"
              " Mängel behoben werden. Darüber hinaus garantieren wir nicht, dass die Website und die App virenfrei sind oder ohne "
              "andere schädliche Komponenten. In dieser Hinsicht müssen Sie Vorsichtsmaßnahmen treffen. In jedem Fall übernehmen wir "
              "keine Haftung für Verluste oder Schäden, die durch verteilte\n"
              "Denial-of-Service-Angriffe, Computerviren oder andere technisch schädliche Materialien, die Ihre "
              "Datenverarbeitungsgeräte, Datenverarbeitungsprogramme verursacht wurden.",
          'weDoNotAssumeAnyEtc':
              "Wir übernehmen keine Gewähr für diese Ergebnisse oder die Nutzung der App/Webseite und "
                  "des Dienstes entspricht dem Bedarf.",
          'weAreNotLiableForTheEtc':
              "Wir haften nicht für die Folgen von Unterbrechungen oder Fehlern in der App/Webseite "
                  "oder Dienstleistungen und wir übernehmen keine Garantie für die Richtigkeit oder Vollständigkeit der Ungenauigkeiten"
                  " und Schreibfehler.",
          'pleaseNoteThatWeMakeEtc':
              "Bitte beachten Sie, dass wir unsere Webseite/Apps nur für den privaten und privaten Gebrauch "
                  "zur Verfügung stellen und dass Sie sich damit einverstanden erklären, unsere Webseite/ App nicht für kommerzielle "
                  "oder geschäftliche Zwecke zu nutzen, es sei denn wir haben Sie als Dienstleister zugelassen.",

          // data protection
          'thisDataProtectionDeclarationEtc':
              "Diese Datenschutzerklärung klärt Sie über die Art, den Umfang und Zweck der Verarbeitung von personenbezogenen "
                  "Daten (nachfolgend kurz „Daten“) innerhalb unseres Onlineangebotes und der mit ihm verbundenen Webseiten,"
                  " Funktionen und Inhalte sowie externen Onlinepräsenzen, wie z.B. unser Social Media Profile auf. "
                  "(nachfolgend gemeinsam bezeichnet als „Onlineangebot“). Im Hinblick auf die verwendeten Begrifflichkeiten, "
                  "wie z.B. „Verarbeitung“ oder „Verantwortlicher“ verweisen wir auf die Definitionen im Art. 4 der "
                  "Datenschutzgrundverordnung (DSGVO).",
          'responsible': "Verantwortlicher",
          'responsibleInfo': "R.F.U. reserved4you GmbH\n"
              "Wilmersdorfer Straße 122-123,\n"
              "10627 Berlin,\n"
              "Deutschland\n"
              "Register: Handelsregister\n"
              "Registernummer: HRB 208249B\n"
              "Registergericht: Berlin Charlottenburg\n"
              "Tel.: +49 30 364 299 61\n"
              "E-Mail: info@reserved4you.de",
          'typesOfDataProcessed': "Arten der verarbeiteten Daten",
          'typesOfDataProcessedInfo': "Bestandsdaten (z.B., Namen, Adressen).\n"
              "Kontaktdaten (z.B., E-Mail, Telefonnummern).\n"
              "Inhaltsdaten (z.B., Texteingaben, Fotografien, Videos).\n"
              "Vertragsdaten (z.B., Vertragsgegenstand, Laufzeit, Kundenkategorie).\n"
              "Zahlungsdaten (z.B., Bankverbindung, Zahlungshistorie).\n"
              "Nutzungsdaten (z.B., besuchte Webseiten, Interesse an Inhalten, Zugriffszeiten).\n"
              "Meta-/Kommunikationsdaten (z.B., Geräte-Informationen, IP-Adressen).",
          'processingOfSpecialCategoriesEtc':
              "Verarbeitung besonderer Kategorien von Daten (Art. 9 Abs. 1 DSGVO)",
          'noSpecialCategoriesEtc':
              "Es werden keine besonderen Kategorien von Daten verarbeitet.",
          'categoriesOfPersonsAffectedEtc':
              "Kategorien der von der Verarbeitung betroffenen Personen:",
          'customersInterestedPartiesEtc':
              "Kunden, Interessenten, Besucher und Nutzer des Onlineangebotes, Geschäftspartner. Besucher und Nutzer des Onlineangebotes.\n"
                  "Nachfolgend bezeichnen wir die betroffenen Personen zusammenfassend auch als „Nutzer“.",
          'purposeOfProcessingEtc': "Zweck der Verarbeitung",
          'purposeOfProcessingInfo':
              "Zurverfügungstellung des Onlineangebotes, seiner Inhalte und Shop-Funktionen.\n"
                  "Erbringung vertraglicher Leistungen, Service und Kundenpflege.\n"
                  "Beantwortung von Kontaktanfragen und Kommunikation mit Nutzern.\n"
                  "Marketing, Werbung und Marktforschung.\n"
                  "Sicherheitsmaßnahmen.\n\n"
                  "Stand: May 2020",
          'termsUsed': "Verwendete Begrifflichkeiten",
          'personalDataIsAllEtc': "„Personenbezogene Daten“ sind alle Informationen, die sich auf eine identifizierte oder identifizierbare "
              "natürliche Person (im Folgenden „betroffene Person“) beziehen; als identifizierbar wird eine natürliche "
              "Person angesehen, die direkt oder indirekt, insbesondere mittels Zuordnung zu einer Kennung wie einem Namen,"
              " zu einer Kennnummer, zu Standortdaten, zu einer Online-Kennung (z.B. Cookie) oder zu einem oder mehreren"
              " besonderen Merkmalen identifiziert werden kann, die Ausdruck der physischen, physiologischen, genetischen, "
              "psychischen, wirtschaftlichen, kulturellen oder sozialen Identität dieser natürlichen Person sind.",
          'processingIsAnyProcessEtc':
              "Verarbeitung“ ist jeder mit oder ohne Hilfe automatisierter Verfahren ausgeführten Vorgang oder jede solche "
                  "Vorgangsreihe im Zusammenhang mit personenbezogenen Daten. Der Begriff reicht weit und umfasst praktisch "
                  "jeden Umgang mit Daten.",
          'responsibleIsTheNaturalEtc':
              "Als „Verantwortlicher“ wird die natürliche oder juristische Person, Behörde, Einrichtung oder andere Stelle,"
                  " die allein oder gemeinsam mit anderen über die Zwecke und Mittel der Verarbeitung von personenbezogenen"
                  " Daten entscheidet, bezeichnet.",

          'relevantLegalBases': "Maßgebliche Rechtsgrundlagen",
          'inAccordanceWithArt13Etc': "Nach Maßgabe des Art. 13 DSGVO teilen wir Ihnen die Rechtsgrundlagen unserer "
              "Datenverarbeitungen mit. Sofern die Rechtsgrundlage in der Datenschutzerklärung nicht genannt wird, gilt"
              " Folgendes: Die Rechtsgrundlage für die Einholung von Einwilligungen ist Art. 6 Abs. 1 lit. a und Art. 7 "
              "DSGVO, die Rechtsgrundlage für die Verarbeitung zur Erfüllung unserer Leistungen und Durchführung vertraglicher"
              " Maßnahmen sowie Beantwortung von Anfragen ist Art. 6 Abs. 1 lit. b DSGVO, die Rechtsgrundlage für die "
              "Verarbeitung zur Erfüllung unserer rechtlichen Verpflichtungen ist Art. 6 Abs. 1 lit. c DSGVO, und die "
              "Rechtsgrundlage für die Verarbeitung zur Wahrung unserer berechtigten Interessen ist Art. 6 Abs. 1 lit. "
              "f DSGVO. Für den Fall, dass lebenswichtige Interessen der betroffenen Person oder einer anderen natürlichen"
              " Person eine Verarbeitung personenbezogener Daten erforderlich machen, dient Art. 6 Abs. 1 lit. d DSGVO als "
              "Rechtsgrundlage.",
          'safetyMeasures': "Sicherheitsmaßnahmen",
          'inAccordanceWithArt32Etc': "Wir treffen nach Maßgabe des Art. 32 DSGVO unter Berücksichtigung des Stands der "
              "Technik, der Implementierungskosten und der Art, des Umfangs, der Umstände und der Zwecke der Verarbeitung "
              "sowie der unterschiedlichen Eintrittswahrscheinlichkeit und Schwere des Risikos für die Rechte und Freiheiten "
              "natürlicher Personen, geeignete technische und organisatorische Maßnahmen, um ein dem Risiko angemessenes"
              " Schutzniveau zu gewährleisten; Zu den Maßnahmen gehören insbesondere die Sicherung der Vertraulichkeit, "
              "Integrität und Verfügbarkeit von Daten durch Kontrolle des physischen Zugangs zu den Daten, als auch des sie "
              "betreffenden Zugriffs, der Eingabe, Weitergabe, der Sicherung der Verfügbarkeit und ihrer Trennung. Des "
              "Weiteren haben wir Verfahren eingerichtet, die eine Wahrnehmung von Betroffenenrechten, Löschung von Daten"
              " und Reaktion auf Gefährdung der Daten gewährleisten. Ferner berücksichtigen wir den Schutz personenbezogener"
              " Daten bereits bei der Entwicklung, bzw. Auswahl von Hardware, Software sowie Verfahren, entsprechend dem "
              "Prinzip des Datenschutzes durch Technikgestaltung und durch datenschutzfreundliche Voreinstellungen "
              "berücksichtigt (Art. 25 DSGVO).",
          'theSecurityMeasuresIncludeEtc':
              "Zu den Sicherheitsmaßnahmen gehört insbesondere die verschlüsselte Übertragung"
                  " von Daten zwischen Ihrem Browser und unserem Server.",
          'disclosureAndTransferOfData':
              "Offenlegung und Übermittlung von Daten",
          'ifWeDiscloseDataToOtherEtc': "Sofern wir im Rahmen unserer Verarbeitung Daten gegenüber anderen Personen und"
              " Unternehmen (Auftragsverarbeitern oder Dritten) offenbaren, sie an diese übermitteln oder ihnen sonst"
              " Zugriff auf die Daten gewähren, erfolgt dies nur auf Grundlage einer gesetzlichen Erlaubnis (z.B. wenn "
              "eine Übermittlung der Daten an Dritte, wie an Zahlungsdienstleister, gem. Art. 6 Abs. 1 lit. b DSGVO zur"
              " Vertragserfüllung erforderlich ist), Sie eingewilligt haben, eine rechtliche Verpflichtung dies vorsieht"
              " oder auf Grundlage unserer berechtigten Interessen (z.B. beim Einsatz von Beauftragten, Hostinganbietern,"
              " Steuer-, Wirtschafts- und Rechtsberatern, Kundenpflege-, Buchführungs-, Abrechnungs- und ähnlichen Diensten,"
              " die uns eine effiziente und effektive Erfüllung unserer Vertragspflichten, Verwaltungsaufgaben und "
              "Pflichten erlauben).",
          'ifWeCommissionThirdPartiesEtc':
              "Sofern wir Dritte mit der Verarbeitung von Daten auf Grundlage eines "
                  "sog. „Auftragsverarbeitungsvertrages“ beauftragen, geschieht dies auf Grundlage des Art. 28 DSGVO.",
          'transfersToThirdCountries': "Übermittlungen in Drittländer",
          'ifWeProcessDataInEtc': "Sofern wir Daten in einem Drittland (d.h. außerhalb der Europäischen Union (EU) oder"
              " des Europäischen Wirtschaftsraums (EWR)) verarbeiten oder dies im Rahmen der Inanspruchnahme von Diensten"
              " Dritter oder Offenlegung, bzw. Übermittlung von Daten an Dritte geschieht, erfolgt dies nur, wenn es zur"
              " Erfüllung unserer (vor)vertraglichen Pflichten, auf Grundlage Ihrer Einwilligung, aufgrund einer "
              "rechtlichen Verpflichtung oder auf Grundlage unserer berechtigten Interessen geschieht. Vorbehaltlich"
              " gesetzlicher oder vertraglicher Erlaubnisse, verarbeiten oder lassen wir die Daten in einem Drittland"
              " nur beim Vorliegen der besonderen Voraussetzungen der Art. 44 ff. DSGVO verarbeiten. D.h. die "
              "Verarbeitung erfolgt z.B. auf Grundlage besonderer Garantien, wie der offiziell anerkannten Feststellung"
              " eines der EU entsprechenden Datenschutzniveaus (z.B. für die USA durch das „Privacy Shield“) oder "
              "Beachtung offiziell anerkannter spezieller vertraglicher Verpflichtungen (so genannte „Standardvertragsklauseln“).",

          // Finishing signing up
          'finishingSigningUp': "Anmeldung abgeschlossen",
          'thisInfoHasComeFromApple': "Diese Info stammt von Apple",
          'enterEmailHere': "E-Mail hier eingeben",
          'continueText': "Fortsetzen",

          'appointmentRescheduleSuccessful': 'Terminverschiebung erfolgreich',
        }
      };
}
