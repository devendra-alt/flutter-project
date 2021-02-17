import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:sign_up_app/services/UIAuth.dart';

class Settingp extends StatefulWidget {
  @override
  _SettingpState createState() => _SettingpState();
}

class _SettingpState extends State<Settingp> {
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final User _user = _auth.currentUser;
    bool _showSpinner = false;
    final _profile = _user.photoURL != null
        ? _user.photoURL
        : 'https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png';
    final _userName = _user.displayName != null ? _user.displayName : "none";
    return Scaffold(
      // backgroundColor: Colors.lightBlue,
      body: ModalProgressHUD(
        inAsyncCall: _showSpinner,
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: NetworkImage(_profile),
                  radius: 50,
                  backgroundColor: Colors.transparent,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  _userName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontFamily: "Baloo2",
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  _user.email,
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: "Baloo2",
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      _showSpinner = true;
                    });
                    await getSignOutUI(context);
                    setState(() {
                      _showSpinner = false;
                    });
                  },
                  child: Text(
                    "SignOut",
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
