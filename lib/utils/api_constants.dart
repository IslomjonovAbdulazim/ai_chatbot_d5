class ApiConstants {
  static const baseUrl = "https://cors-anywhere.herokuapp.com/corsdemohttps://ai-chatbot-backend-k388.onrender.com/api";

  // auth
  static const google = "$baseUrl/auth/google";
  static const verify = "$baseUrl/auth/verify";
  static const profile = "$baseUrl/profile";

  // chat
  static const chats = "$baseUrl/chats";
  static String message(String id) => "$baseUrl/chats/$id/messages";
}