import 'package:car_rental/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:car_rental/core/secrets/app_secrets.dart';
import 'package:car_rental/core/theme/theme.dart';
import 'package:car_rental/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:car_rental/features/auth/data/repositries/auth_repository_impl.dart';
import 'package:car_rental/features/auth/domain/usecases/user_sign_up.dart';
import 'package:car_rental/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:car_rental/features/auth/presentation/pages/login_page.dart';
import 'package:car_rental/features/auth/presentation/pages/signup_page.dart';
import 'package:car_rental/features/blog/presentation/bloc/blog_bloc.dart';
import 'package:car_rental/features/blog/presentation/pages/blog_page.dart';
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
      BlocProvider(create: (_)=> 
        serviceLocator<AppUserCubit>(),
      ),
      BlocProvider(
        create: (_)=> serviceLocator<AuthBloc>(),
        ),
      BlocProvider(
        create: (_)=> serviceLocator<BlogBloc>(),
        ),
    ],
     child: const MyApp(),));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override 
  void initState(){
    super.initState();
    context.read<AuthBloc>().add(AuthIsUserLoggedIn());
  }


 @override 
 Widget build(BuildContext context){
  return MaterialApp(
  title:'Flutter Demo',
  theme: AppTheme.darkThemeMode,
  debugShowCheckedModeBanner:false,
 home: BlocSelector<AppUserCubit, AppUserState, bool>(
    selector: (state) {
      return state is AppUserLoggedIn;
    },
    builder: (context, isLoggedIn) {
       return const BlogPage();
      // if(isLoggedIn){
       
      // }
      // return const LogInPage();
    },
  ),
  );
 }
}