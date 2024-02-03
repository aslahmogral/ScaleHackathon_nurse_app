import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/colors.dart';
import '../../constants/image_strings.dart';
import '../../constants/sizes.dart';
import '../../constants/text_strings.dart';
import '../../features/authentication/controllers/login_controller.dart';
import '../buttons/social_button.dart';

class SocialFooter extends StatelessWidget {
  const SocialFooter({
    Key? key,
    
    required this.onPressed,
  }) : super(key: key);

  
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Container(
      padding: const EdgeInsets.only(top: tDefaultSpace * 1.5, bottom: tDefaultSpace),
      child: Column(
        children: [
          
            TSocialButton(
              image: tGoogleLogo,
              background: tGoogleBgColor,
              foreground: tGoogleForegroundColor,
              text: '${tConnectWith.tr} ${tGoogle.tr}',
              onPressed: (){}
            ),
          
          const SizedBox(height: 10),
           TSocialButton(
              image: tFacebookLogo,
              foreground: tWhiteColor,
              background: tFacebookBgColor,
              text: '${tConnectWith.tr} ${tFacebook.tr}',
              onPressed: (){}
            ),
          
          
        ],
      ),
    );
  }
}
