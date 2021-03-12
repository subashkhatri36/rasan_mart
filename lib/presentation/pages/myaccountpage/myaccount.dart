import 'package:flutter/material.dart';
import 'package:rasan_mart/core/constant/defaultvalue.dart';
import 'package:rasan_mart/data/models/address.dart';
import 'package:rasan_mart/presentation/widgets/add_address_button.dart';

class MyAccount extends StatefulWidget {
  @override
  _MyAccountState createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  String userEmail;
  String userImg;
  List<Address> userAddress;
  @override
  void initState() {
    loadingInfo();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .4,
              width: MediaQuery.of(context).size.width,
              color: Colors.red,
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Container(
                    width: 140,
                    decoration: BoxDecoration(
                        //  borderRadius: Bor,
                        shape: BoxShape.circle,
                        color: Theme.of(context).primaryColor),
                    child: Image.network(
                      userImg,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  SizedBox(height: Defaultvalue.defaultFontsize),
                  //Text(userIm)
                ],
              ),
            ),
            AddAddressButton(),
          ],
        ),
      ),
    );
  }

  loadingInfo() {
    userEmail = 'abcd@example.com';
    userImg =
        'https://image.freepik.com/free-vector/man-profile-cartoon_18591-58482.jpg';
    userAddress = null;
  }
}
