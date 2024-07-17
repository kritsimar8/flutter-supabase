import 'package:car_rental/core/secrets/app_secrets.dart';
import 'package:car_rental/core/theme/theme.dart';
import 'package:car_rental/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:car_rental/features/auth/data/repositries/auth_repository_impl.dart';
import 'package:car_rental/features/auth/domain/usecases/user_sign_up.dart';
import 'package:car_rental/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:car_rental/features/auth/presentation/pages/login_page.dart';
import 'package:car_rental/features/auth/presentation/pages/signup_page.dart';
import 'package:car_rental/init_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
   await initDependencies();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_)=> serviceLocator<AuthBloc>(),
        )
    ],
     child: const MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 @override 
 Widget build(BuildContext context){
  return MaterialApp(
  title:'Flutter Demo',
  theme: AppTheme.darkThemeMode,
  home:const LogInPage(),
  );
 }
}