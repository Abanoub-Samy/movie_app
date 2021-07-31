// ignore: import_of_legacy_library_into_null_safe
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/screens/home_screen.dart';
import 'package:movie_app/shared/cubit/app_cubit.dart';
import 'package:movie_app/shared/cubit/app_states.dart';
import 'package:movie_app/shared/global/cache_helper.dart';
import 'package:movie_app/shared/global/end_points.dart';
import 'package:movie_app/shared/global/responsive.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login-screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  bool isVisible = true;
  var emailText = TextEditingController();
  var passwordText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if (state is GetAccountSuccessState) {
          CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {
            if (value) {
              Navigator.pushReplacementNamed(context, HomeScreen.routeName);
            }
          });
        }
        else if (state is GetGuestSessionSuccessState) {
          CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {
            if (value) {
              Navigator.pushReplacementNamed(context, HomeScreen.routeName);
            }
          });
        } else if (state is GetGuestSessionErrorState) {
          print('You should approve first');
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: kMainDarkColor,
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () {
                  AppCubit.get(context).changeAppMode();
                },
                icon: AppCubit.get(context).isDark
                    ? Icon(
                        Icons.brightness_4_outlined,
                        color: Colors.black,
                      )
                    : Icon(
                        Icons.brightness_4_outlined,
                        color: Colors.white,
                      ),
              ),
            ],
            title: Text(
              'Login Page',
            ),
          ),
          body: Padding(
            padding: EdgeInsets.all(Responsive().width(1, context)),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(Responsive().width(1, context)),
                      child: Row(
                        children: [
                          Text(
                            'Login',
                            style: Theme.of(context).textTheme.headline4,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Responsive().height(3, context),
                    ),
                    Form(
                      key: formKey,
                      child: Padding(
                        padding:  EdgeInsets.all(Responsive().width(1, context)),
                        child: Column(
                          children: [
                            TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                labelText: 'E-mail',
                                prefixIcon: const Icon(Icons.mail),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(Responsive().width(4, context)),
                                ),
                              ),
                              controller: emailText,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'please enter an e-mail';
                                }
                                return null;
                              },
                            ),
                             SizedBox(
                              height: Responsive().height(1, context),
                            ),
                            TextFormField(
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: isVisible,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                prefixIcon: const Icon(Icons.lock),
                                suffixIcon: IconButton(
                                  icon: isVisible
                                      ? Icon(Icons.visibility)
                                      : Icon(Icons.visibility_off),
                                  onPressed: () {
                                    setState(() {
                                      isVisible = !isVisible;
                                    });
                                  },
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(Responsive().width(4, context)),
                                ),
                              ),
                              controller: passwordText,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'please enter password';
                                }
                                return null;
                              },
                            ),
                             SizedBox(
                              height: Responsive().height(2, context),
                            ),
                            Container(
                              width: double.infinity,
                              child: ConditionalBuilder(
                                builder: (ctx) => ElevatedButton(
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      AppCubit.get(context).getSessionWithLogin(
                                        userName: emailText.text,
                                        password: passwordText.text,
                                      );
                                    }
                                  },
                                  child: Text('login'),
                                  style: ButtonStyle(),
                                ),
                                condition: true,
                                fallback: (ctx) =>
                                    Center(child: CircularProgressIndicator()),
                              ),
                            ),
                             SizedBox(
                              height: Responsive().height(2, context),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Don\'t have an account ?',
                                  style: Theme.of(context).textTheme.subtitle1,
                                ),
                                 SizedBox(
                                  width: Responsive().width(1, context),
                                ),
                                TextButton(
                                  onPressed: () {
                                    AppCubit.get(context).launchURL();
                                  },
                                  child: const Text(
                                    'Register Now',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                             SizedBox(
                              height: Responsive().width(3, context),
                            ),
                            Container(
                                width: double.infinity,
                                child: ElevatedButton(
                                    onPressed: () {
                                      AppCubit.get(context).getGuestSession();
                                    },
                                    child: Text('Guest'))),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
