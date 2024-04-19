class ApiConstant{

  static String baseUrl="http://192.168.10.46:3000/api/v1";

  static String signUp="/user/sign-up";
  static String signIn="/user/sign-in";
  static String forgot="/user/forgot-password";
  static String verifyCode="/user/verify-code";
  static String changePassword="/user/change-password";
  static String setPassword="/user/set-password";
  static String updateUser(String userId)=> "user/update/$userId";






}