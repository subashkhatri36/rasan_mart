import 'package:flutter/material.dart';
import 'package:rasan_mart/core/constant/defaultvalue.dart';
import 'package:rasan_mart/core/constant/strings.dart';
import 'package:rasan_mart/core/enum/enum.dart';
import 'package:rasan_mart/core/themes/app_theme.dart';
import 'package:rasan_mart/presentation/pages/authpage/widgets/input_border.dart';
import 'package:rasan_mart/presentation/routes/app_routes.dart';

class AuthenticationPage extends StatefulWidget {
  @override
  _AuthenticationPageState createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Form(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Center(
                        child: Image.asset(
                          'assets/images/logo.PNG',
                          width: Defaultvalue.defaultPadding * 10,
                          height: Defaultvalue.defaultPadding * 10,
                        ),
                      ),
                    ),
                    SizedBox(height: Defaultvalue.defaultFontsize),
                    Padding(
                        padding: const EdgeInsets.all(
                            Defaultvalue.defaultPadding / 2),
                        child: TextFormField(
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                          decoration: new InputDecoration(
                              hintText: Strings.userNameInput,
                              labelText: Strings.userNameInput,
                              labelStyle: buildTextStyle(context),
                              hintStyle: TextStyle(
                                  color: Theme.of(context).primaryColor),
                              fillColor: Theme.of(context).primaryColor,
                              focusedBorder: buildOutlineInputBorder(context),
                              enabledBorder: buildOutlineInputBorder(context)),
                        )),
                    SizedBox(height: Defaultvalue.defaultFontsize),
                    Padding(
                        padding: const EdgeInsets.all(
                            Defaultvalue.defaultPadding / 2),
                        child: TextFormField(
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                          decoration: new InputDecoration(
                              hintText: Strings.userPassword,
                              labelText: Strings.userPassword,
                              labelStyle: buildTextStyle(context),
                              hintStyle: TextStyle(
                                  color: Theme.of(context).primaryColor),
                              fillColor: Theme.of(context).primaryColor,
                              focusedBorder: buildOutlineInputBorder(context),
                              enabledBorder: buildOutlineInputBorder(context)),
                        )),
                    SizedBox(height: Defaultvalue.defaultFontsize / 2),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            right: Defaultvalue.defaultFontsize),
                        child: Text('Forget Password ?',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                color: Theme.of(context).primaryColor)),
                      ),
                    ),
                    SizedBox(height: Defaultvalue.defaultPadding + 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: Defaultvalue.defaultPadding / 2),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  color: AppTheme.lightBtnColor,
                                  borderRadius: BorderRadius.circular(
                                      Defaultvalue.defaultFontsize * 2),
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(0.0, 0.75),
                                        blurRadius: 15.0,
                                        spreadRadius: 1.0)
                                  ]),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  primary: Colors.transparent,
                                  onPrimary: Theme.of(context).primaryColor,
                                ),
                                onPressed: () {
                                  Navigator.of(context).pushNamed('/dashboard');
                                },
                                child: Text(
                                  Strings.btnLogintext,
                                  style: TextStyle(
                                      fontSize:
                                          Defaultvalue.defaultFontsize + 5),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: Defaultvalue.defaultPadding),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  color: AppTheme.lightBtnColor,
                                  borderRadius: BorderRadius.circular(
                                      Defaultvalue.defaultFontsize * 2),
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(3.0, 2.0),
                                        blurRadius: 15.0,
                                        spreadRadius: 1.0)
                                  ]),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  primary: Colors.transparent,
                                  onPrimary: Theme.of(context).primaryColor,
                                ),
                                onPressed: () {},
                                child: Text(
                                  Strings.btnSignuptext,
                                  style: TextStyle(
                                      fontSize:
                                          Defaultvalue.defaultFontsize + 5),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  TextStyle buildTextStyle(BuildContext context) {
    return TextStyle(
        color: Theme.of(context).primaryColor,
        fontSize: Defaultvalue.defaultFontsize);
  }
}
