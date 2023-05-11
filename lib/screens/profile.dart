// ignore_for_file: prefer_const_constructors
import 'package:a1_1_20/screens/cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:a1_1_20/cubit/auth_cubit.dart';
import 'package:a1_1_20/constantst.dart';
import 'package:provider/provider.dart';
import 'package:a1_1_20/provider/theme_provider.dart';
import '../widgets/profile_listtile.dart';
import 'package:a1_1_20/models/user_sementara.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

String email = User_Sementara.email;
String password = User_Sementara.password;

bool _darkMode = false;

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0.0,
      ),
      body: ListView(
        children: [
          Container(
            height: 210,
            width: double.infinity,
            color: Colors.indigo,
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Container(
                      height: 110,
                      width: 110,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage("assets/images/profile.jpg"),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: SizedBox(
                      height: 32,
                      width: 140,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.green,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              )),
                          onPressed: () {},
                          child: Text(
                            "Edit Profile",
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 6,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, top: 15, bottom: 14),
            child: Text(
              "Account",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          CustomListTile(
              "Email: $email", Icons.person_2_outlined, Icons.circle),
          // CustomListTile("Alamat: $password", Icons.location_on, Icons.circle),
          InkWell(
            child: CustomListTile(
              "My Cart",
              Icons.read_more,
              Icons.keyboard_arrow_right_outlined,
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CartScreen()));
            },
          ),
          // CustomListTile(
          //   "Notification",
          //   Icons.notifications_outlined,
          //   Icons.keyboard_arrow_right_outlined,
          // ),
          // CustomListTile(
          //   "Setting",
          //   Icons.settings,
          //   Icons.keyboard_arrow_right_outlined,
          // ),
          SwitchListTile(
            value: User_Sementara.darkMode,
            title: Text(
              ' Night Mode',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            secondary: Padding(
              padding: const EdgeInsets.all(9.0),
              child: Icon(Icons.dark_mode),
            ),
            onChanged: (newValue) {
              final themeProvider =
                  Provider.of<ThemeProvider>(context, listen: false);

              setState(() {
                User_Sementara.darkMode = newValue;
              }); // change the variable

              User_Sementara.darkMode // call the functions
                  ? themeProvider.setDarkmode()
                  : themeProvider.setLightMode();
            },
            visualDensity: VisualDensity.adaptivePlatformDensity,
            // switchType: SwitchType.material,
            activeColor: Colors.indigo,
          ),
          InkWell(
            child: BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthInitial) {
                  Navigator.pushNamedAndRemoveUntil(
                      context, 'login-page', (route) => false);
                } else if (state is AuthFailed) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: kGreenLightColor,
                      content: Text(state.error),
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state is AuthLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ListTile(
                  onTap: () {
                    context.read<AuthCubit>().signOut();
                  },
                  title: Text(
                    ("Sign out"),
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  leading: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: (Icon(
                      Icons.logout,
                      size: 25,
                    )),
                  ),
                  tileColor: Colors.grey.shade100,
                );
              },
            ),
          ),
          // Padding(
          //   padding: EdgeInsets.only(left: 20, top: 15, bottom: 14),
          //   child: Text(
          //     "Support",
          //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          //   ),
          // ),
          // CustomListTile(
          //   "Help",
          //   Icons.space_bar_rounded,
          //   Icons.keyboard_arrow_right_outlined,
          // ),
          // CustomListTile(
          //   "About us",
          //   Icons.person_outline,
          //   Icons.keyboard_arrow_right_outlined,
          // ),
          // CustomListTile(
          //   "Contact us",
          //   Icons.message,
          //   Icons.keyboard_arrow_right_outlined,
          // ),
          // SizedBox(height: 10),
          Center(
            child: Text(
              "Bookstore bozzz   v10.9.1",
              style: TextStyle(color: Colors.blueGrey, fontSize: 15),
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
