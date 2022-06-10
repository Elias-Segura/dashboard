import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:smart_admin_dashboard/core/constants/color_constants.dart';
import 'package:smart_admin_dashboard/core/init/provider_list.dart';
import 'package:smart_admin_dashboard/provider/firebase_access.dart';
import 'package:smart_admin_dashboard/screens/home/home_screen.dart';
import 'package:smart_admin_dashboard/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
FirebaseAuth fa = FirebaseAuth.instance;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 
    await Firebase.initializeApp();
   
  runApp(MyApp());
}

Widget build(BuildContext context) {
  return MultiProvider(
      providers: [
        ...ApplicationProvider.instance.dependItems,
        Provider(create: (context) => FirebaseAccessProvider()),
      ],
      child: FutureBuilder(
        builder: (context, snapshot) {
          return MyApp();
        },
      ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Dashboard - Admin Panel v0.1 ',
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(backgroundColor: bgColor, elevation: 0),
        scaffoldBackgroundColor: bgColor,
        primaryColor: greenColor,
        dialogBackgroundColor: secondaryColor,
        buttonColor: greenColor,
        textTheme: GoogleFonts.openSansTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white),
        canvasColor: secondaryColor,
      ),
      home: Auth(),
    );
  }
}

class Auth extends StatefulWidget {
  Auth({Key? key}) : super(key: key);

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
 bool isSign = false ;
 
  @override
  void initState() {
    isSign = false; 
    super.initState();
    
FirebaseAuth.instance
  .authStateChanges()
  .listen((User? user) {
    if (user == null) {
      setState(() {
               isSign = false; 
            });
       
      print('User is currently signed out!');
    } else {
         setState(() {
               isSign = true; 
            });
      print('User is signed in!');
    }
  });
  }
  @override
  Widget build(BuildContext context) {
    return   isSign == false ? Login(title:'GS TICKETS PANEL'): HomeScreen();
  }
}
// class Auth extends StatelessWidget {
//   Auth();

//   @override
//   Widget build(BuildContext context) {
//     return  StreamBuilder(
           
//             builder: (context, snapshot) {
//                 print(snapshot);
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//               return Login(title:'GS TICKETS PANEL');  
//           }
//                if(snapshot.connectionState ==ConnectionState.active){
//                  return HomeScreen();
//                }


//                 return Login(title:'GS TICKETS PANEL');
//             },
//               stream: FirebaseAuth.instance.authStateChanges(),
//           ); 
//   }
// }

