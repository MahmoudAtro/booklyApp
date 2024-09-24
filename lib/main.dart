import 'package:booklyapp/Features/home/data/repo/home_repo_impl.dart';
import 'package:booklyapp/Features/home/domain/entities/book_entity.dart';
import 'package:booklyapp/Features/home/domain/use_cases/fetch_Futured_Book_use_case.dart';
import 'package:booklyapp/Features/home/domain/use_cases/fetch_New_Book_use_case.dart';
import 'package:booklyapp/Features/home/presentation/manager/Fetured_books_cubit/featured_books_cubit.dart';
import 'package:booklyapp/Features/home/presentation/manager/newset_books_cubit/newset_books_cubit.dart';
import 'package:booklyapp/constant.dart';
import 'package:booklyapp/core/utils/app_router.dart';
import 'package:booklyapp/core/utils/bloc_observer.dart';
import 'package:booklyapp/core/utils/functions/setup_api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox<BookEntity>(kFeaturedBox);
  await Hive.openBox(kNewsBooks);
  setupApiServer();
  Bloc.observer = BlocObserverSetup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBooksCubit(
            fetchFuturedBookUseCase:
                FetchFuturedBookUseCase(homeRepo: getIt.get<HomeRepoImpl>()),
          )..fetchFutureBooks(),
        ),
        BlocProvider(
          create: (context) => NewsetBooksCubit(
            fetchNewBookUseCase:
                FetchNewBookUseCase(homeRepo: getIt.get<HomeRepoImpl>()),
          ),
        )
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        debugShowMaterialGrid: false,
        theme:
            ThemeData.dark().copyWith(scaffoldBackgroundColor: scaffoldcolor),
      ),
    );
  }
}
