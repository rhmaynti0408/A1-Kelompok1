import 'package:flutter/cupertino.dart';
import 'package:a1_1_20/cubit/auth_cubit.dart';
import 'package:a1_1_20/cubit/page_cubit.dart';
import 'package:a1_1_20/constantst.dart';
import 'package:a1_1_20/widgets/custom_text_form_field.dart';
import 'package:a1_1_20/widgets/my_button.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:a1_1_20/models/user_sementara.dart';
import 'package:a1_1_20/routes/routes.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Widget titleSection() {
      return Container(
        margin: EdgeInsets.fromLTRB(defaultMargin, 30, defaultMargin, 44),
        child: Text(
          "Selamat Datang \n Di Bookstore",
          style: blackTextStyle.copyWith(
            fontSize: 24,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget formSection() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextFormField(
              title: "Email",
              hintText: "Email anda",
              controller: emailController,
            ),
            CustomTextFormField(
              title: "Kata Sandi",
              hintText: "Kata sandi anda",
              isObscure: true,
              controller: passwordController,
            ),
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (emailController.text == 'admin' &&
                    passwordController.text == 'admin') {
                  Navigator.of(context)
                      .pushReplacementNamed(Routes.userProduct);
                } else if (state is AuthSuccess) {
                  context.read<PageCubit>().setPage(0);
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    'main-page',
                    (route) => false,
                  );
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

                return MyButton(
                  onTap: () {
                    User_Sementara.email = emailController.text;
                    User_Sementara.password = passwordController.text;
                    context.read<AuthCubit>().signIn(
                          email: emailController.text,
                          password: passwordController.text,
                        );
                  },
                  margin: EdgeInsets.only(top: 10),
                  width: double.infinity,
                  height: 55,
                  text: "Masuk",
                );
              },
            ),
          ],
        ),
      );
    }

    Widget registerSection() {
      return Container(
        margin: EdgeInsets.only(bottom: 50, top: 30),
        child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, 'register-page');
          },
          child: Text(
            "Belum Memiliki Akun? Daftar",
            style: lightTextStyle.copyWith(
              fontSize: 16,
              fontWeight: light,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: ListView(
          children: [
            titleSection(),
            formSection(),
            registerSection(),
          ],
        ),
      ),
    );
  }
}
