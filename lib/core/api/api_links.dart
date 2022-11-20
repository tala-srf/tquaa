class ApiBaseUrl {
   static String baseUrl = 'https://mobiletest.tuqaatech.com';
  static const String baseservicescountry = "/api/services/app/Country";
  static const String base_services_account = "/api/services/app/Account";
  static const String base_services_user = "/api/services/app/User";
  static const String baseSearchPartner = "/api/services/app/CityPartner";
  static const String baseServiceChat = "/api/services/app/Chat";
   static const String basefirebase = "/api/services/app/UserInformation";

}

// all api links

// Api GET
class ApiGet {
  //Api Url For User
  static const String allcountryurl =
      "${ApiBaseUrl.baseservicescountry}/GetAllCountries";

  // partner

  static const String cityPartner = "${ApiBaseUrl.baseSearchPartner}/GetAll";
// chat
  static const String listchatuser =
      '${ApiBaseUrl.baseServiceChat}/GetAllChatList';
       static const String allmessagesuser =
      '${ApiBaseUrl.baseServiceChat}/GetDialogByChatId';
     static const String imageuser =
      '${ApiBaseUrl.basefirebase}/DownloadImage';
         
       
}
//

//API Post
class ApiPost {
  //Api Url For Auth
  static const String loginUrl = "/api/TokenAuth/Authenticate";
  static const String registerurl =
      "${ApiBaseUrl.base_services_account}/Register";
  static const String firebaseurl =
      "${ApiBaseUrl.base_services_user}/InsertFireBaseToken";

   // chat 
    static const String sendmessage =
      '${ApiBaseUrl.baseServiceChat}/PostChat';
         
}
