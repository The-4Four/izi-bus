import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:izi_bus/firebase_options.dart';
import 'package:izi_bus/routes.dart';
import 'package:izi_bus/shared/themes/app_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(AppWidget());
}

class AppWidget extends StatelessWidget {
  final Future<FirebaseApp> initialization = Firebase.initializeApp();

  AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          // Alguma coisa deu errado na inicialização do App
          return const Material(
              child: Center(
                  child: Text("Não foi possível inicializar o Firebase",
                      textDirection: TextDirection.ltr)));
        } else if (snapshot.connectionState == ConnectionState.done) {
          // App carregado, está tudo certo
          return MaterialApp(
            title: 'Izi Bus',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primaryColor: AppColors.primary,
            ),
            initialRoute: '/splash',
            //home: const Home(),
            onGenerateRoute: Routes.generateRoute,
          );
        } else {
          // Enquanto o firebase está carregando indicar para o usuário
          return const Material(
              child: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }
}
