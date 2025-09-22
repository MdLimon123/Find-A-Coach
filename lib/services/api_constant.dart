


class ApiConstant{
  //http://172.252.13.79:3212
  //static String baseUrl="http://10.10.12.49:8003"; // live
  static String baseUrl="http://10.10.12.49:8000"; // local
  static String imageBaseUrl = "http://10.10.12.49:8000";

  /// client auth api ends points
  static String clientSignUp = "/api/v1/auth/signup/";
  static String clientLogin = "/api/v1/auth/login/";
  static String emailOtpVerification = "/api/v1/auth/verify-email/";
  static String addUserProfile = "/api/v1/auth/profile/";
  static String addYourGoalEndPoint = "/api/v1/auth/goals/";
  static String setMilestonesEndPoint({required int id}) =>"/api/v1/auth/goals/$id/milestones/";
  static String sendOTP = "/api/v1/auth/send-otp/";
  static String resetPassword = "/api/v1/auth/reset-password/";

  /// client home and others api ends points
   static String upcomingSessionsHome = "/api/v1/auth/bookings/user/upcomming_session/";
   static String coachCategoryHome = "/api/v1/auth/coaches/by-category/";
   static String featuredCoach = "/api/v1/auth/coach/";
   static String getAllCoachEndPoint = "/api/v1/auth/coach/";
   static String getAllCategoryEndPoint = "/api/v1/auth/coach-categories/";
   static String getAllCoachFilterEndPoint = "/api/v1/auth/coaches/filter/";
   static String singleCategoryEndPoint({required int id}) => "/api/v1/auth/coaches/by-category/$id/";
   static String singleCoachProfile({required int id}) => "/api/v1/auth/user/$id/";
   static String addBookingEndPoint = "/api/v1/auth/bookings/create/";
   static String getAllCommunityEndPoint = "/api/v1/community/posts/";
   static String getCommentEndPoint({required int id}) => "/api/v1/community/posts/$id/comments/";
   static String addCommentEndPoint({required int id}) => "/api/v1/community/posts/$id/comments/";
   static String upcomingSessionEndPoint = "/api/v1/auth/bookings/user/upcomming_session/";
   static String pastSessionEndPoint = "/api/v1/auth/bookings/user/past_session/";
   static String bookingDetailsEndPoint({required int id}) => "/api/v1/auth/bookings/user/";
   static String categoryAndSubCategories = "/api/v1/auth/coaching-areas/";
   static String leaveReviewEndPoint = "/api/v1/auth/reviews/create/";


   /// coach auth api ends points
  static String coachProfile = "/api/v1/auth/profile/";
  static String coachBookAllUserEedPoint ="/api/v1/auth/bookings/coach/";
  static String coachUpcomingSessionEndPoint = "/api/v1/auth/bookings/coach/upcomming_session/";

   /// social auth api ends points
  static String clientGoogleLogIn = "/api/v1/auth/google-login/";

  /// status change api coach and client both
static String statusChangeEndPoint({required int id}) => "/api/v1/auth/bookings/$id/status/";


}