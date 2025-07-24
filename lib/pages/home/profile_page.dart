import 'package:ai_chatbot_d5/models/profile_model.dart';
import 'package:ai_chatbot_d5/providers/profile_provider.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isLoading = false;
  ProfileModel? profile;
  TokenUsageModel? usage;
  List<DailyUsageModel> daily = [];
  bool isError = false;

  @override
  void initState() {
    load();
    super.initState();
  }

  void load() async {
    isLoading = true;
    setState(() {});
    profile = await ProfileProvider.profile();
    usage = await ProfileProvider.usage();
    daily = await ProfileProvider.daily();
    isError = usage == null || profile == null;
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff141718),
      appBar: AppBar(
        backgroundColor: Color(0xff141718),
        title: Text(
          "Profile",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Center(
        child: isLoading
            ? CircularProgressIndicator(color: Colors.white)
            : isError
                ? Text(
                    "Something Went Wrong",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                : SafeArea(
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          // profile
                          Text(
                            profile!.email,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),

                          // usage

                          //
                        ],
                      ),
                    ),
                  ),
      ),
    );
  }
}
