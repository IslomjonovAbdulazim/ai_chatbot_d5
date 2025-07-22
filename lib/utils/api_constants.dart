class ApiConstants {
  static const baseUrl = "https://aichatbotbackend-production-ef4d.up.railway.app/api";

  // auth
  static const google = "$baseUrl/auth/google";
  static const verify = "$baseUrl/auth/verify";
  static const profile = "$baseUrl/profile";

  // chat
  static const chats = "$baseUrl/chats";
  static String message(String id) => "$baseUrl/chats/$id/messages";

  // usage
  static const usage = "$baseUrl/user/usage";
  static const chart = "$baseUrl/user/usage/chart";
}

