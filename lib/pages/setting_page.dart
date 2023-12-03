import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

void logout() {
  FirebaseAuth.instance.signOut();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        centerTitle: true,
        title: Text(
          'Perfil',
          style: GoogleFonts.roboto(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                LineAwesomeIcons.moon,
                color: Colors.white,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                width: 120,
                height: 120,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: const Image(
                    image: AssetImage(
                      'assets/images/profile_picture.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Bruce Banner',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.grey.shade400,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'hulkesmaga@gmail.com',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey.shade400,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 45,
                width: 200,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: Colors.grey.shade600,
                    side: BorderSide.none,
                  ),
                  onPressed: () {},
                  child: Text(
                    'Editar Perfil',
                    style: TextStyle(color: Colors.grey.shade200, fontSize: 18),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Divider(),
              const SizedBox(height: 10),
              ProfileMenuWidget(
                title: 'Perfil',
                icon: LineAwesomeIcons.user,
                onPress: () {},
                textColor: Colors.white,
              ),
              ProfileMenuWidget(
                title: 'Chat Privado',
                icon: LineAwesomeIcons.sms,
                onPress: () {},
                textColor: Colors.white,
              ),
              ProfileMenuWidget(
                title: 'Informações',
                icon: LineAwesomeIcons.info,
                onPress: () {},
                textColor: Colors.white,
              ),
              const Divider(color: Colors.grey),
              const SizedBox(height: 10),
              ProfileMenuWidget(
                title: 'Configurações',
                icon: LineAwesomeIcons.cog,
                onPress: () {},
                textColor: Colors.white,
              ),
              const ProfileMenuWidget(
                title: 'Sair',
                icon: LineAwesomeIcons.alternate_sign_out,
                onPress: logout,
                textColor: Colors.red,
                endIcon: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    required this.textColor,
  });

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.white.withOpacity(0.1)),
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: textColor,
        ),
      ),
      trailing: endIcon
          ? Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.white.withOpacity(0.1)),
              child: const Icon(
                LineAwesomeIcons.angle_right,
                size: 18,
                color: Colors.white,
              ),
            )
          : null,
    );
  }
}
