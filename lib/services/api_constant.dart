


class ApiConstant{
  //http://172.252.13.79:3212
  //static String baseUrl="http://10.10.12.49:8003"; // live
  static String baseUrl="http://10.10.12.49:8001"; // local
  static String imageBaseUrl = "http://10.10.12.49:8001";

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
   static String goalsEndPoint = "/api/v1/auth/goals/";
   static String getAllMilestonesEndPoint({required int id}) => "/api/v1/auth/goals/$id/milestones/";
   static String updateMilestoneEndPoint = "/api/v1/auth/milestones/update/";
   static String saveCoachEndPoint({required int id}) => "/api/v1/auth/favorites/$id/";
   static String savedCoachEndPoint = "/api/v1/auth/favorites/";


   /// coach auth api ends points
  static String coachProfile = "/api/v1/auth/profile/";
  static String coachBookAllUserEedPoint ="/api/v1/auth/bookings/coach/";
  static String coachUpcomingSessionEndPoint = "/api/v1/auth/bookings/coach/upcomming_session/";

   /// social auth api ends points
  static String clientGoogleLogIn = "/api/v1/auth/google-login/";

  /// status change api coach and client both
static String statusChangeEndPoint({required int id}) => "/api/v1/auth/bookings/$id/status/";
static String availableTopicsEndPoint = "/api/v1/community/topics/";
static String addTopicEndPoint = "/api/v1/community/posts/";
static String aboutUsEndPoint = "/api/v1/settings/about_us/";
static String termsOfConditionEndPoint = "/api/v1/settings/terms_conditions/";
static String privacyPolicyEndPoint = "/api/v1/settings/privacy_policies/";


/// chat api ends points with client and coach
 static String createChatEndPoint = "/api/v1/chat/rooms/";
 static String messageEndPoint({required int id}) => "/api/v1/chat/messages/$id/";
 static String sendMessageEndPoint({required int id}) => "/api/v1/chat/messages/$id/";
 static String inboxEndPoint = "/api/v1/chat/rooms/";

 ///chat with ai for client and coach part
  static String newSessionEndPoint = "/api/v1/ai/sessions/";
  static String aiAssistanceEndPoint = "/api/v1/ai/assistant/";
  static String allHistoryEndPoint = "/api/v1/ai/sessions/";
  static String deleteSessionEndPoint({required String id}) => "/api/v1/ai/delete-session/$id/";
  static String renameSessionEndPoint = "/api/v1/ai/rename-session/";
  static String getAllHistorySessionEndPoint({required String id}) => "/api/v1/ai/get-session/$id/";


}