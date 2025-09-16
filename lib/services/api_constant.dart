


class ApiConstant{
  //http://172.252.13.79:3212
  //static String baseUrl="http://10.10.12.49:8003"; // live
  static String baseUrl="http://10.10.12.49:8000"; // local
  static String imageBaseUrl = "http://10.10.12.49:8000";

  /// client all api ends points
  static String clientSignUp = "/api/v1/auth/signup/";
  static String clientLogin = "/api/v1/auth/login/";
  static String emailOtpVerification = "/api/v1/auth/verify-email/";
  static String addUserProfile = "/api/v1/auth/profile/";
  static String addYourGoalEndPoint = "/api/v1/auth/goals/";
  static String setMilestonesEndPoint({required int id}) =>"/api/v1/auth/goals/$id/milestones/";
  static String sendOTP = "/api/v1/auth/send-otp/";
  static String resetPassword = "/api/v1/auth/reset-password/";

}