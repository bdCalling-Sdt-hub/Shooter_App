class ApiConstant {
  static String baseUrl = "http://192.168.10.46:3000/api/v1";
  static String imageBaseUrl = "http://192.168.10.46:3000";
  static String signUp = "/user/sign-up";
  static String signIn = "/user/sign-in";
  static String forgot = "/user/forgot-password";
  static String verifyCode = "/user/verify-code";
  static String changePassword = "/user/change-password";
  static String setPassword = "/user/set-password";
  static String allEvents = "/events/all";
  static String allMatch = "/events/my-complete-matches";
  static String upComingMatch = "/match/upcomming";
  static String upComingEven = "/events/upcomming";
  static String myUpComingEven = "/events/my-upcoming-events";
  static String myUpComingMatchs = "/match/my-upcomming-matches";
  static String myCompletedMatches = "/match/my-complete-matches";
  static String aboutUsEndPoint = "/setting/about-us";
  static String privacyPolicyEndPoint = "/setting/privacy-policy";
  static String termsConditionsEndPoint = "/setting/terms-condition";
  static String subscriptionEndpoint = "/subscription/purchase-subscription";
  static String notificationsEndPoint = "/notification/user";
  static String myScoreEndPoint = "/user/my-score";
  static String scoresEndpoint(String matchId) => "/match/single-complete-match/$matchId";
  static String profileEndPoint(String userId) => "/user/$userId";
  static String updateUser(String userId) => "/user/update/$userId";
  static String eventsRegister(String eventsId) => "/events/register/$eventsId";
}
