import 'package:get/get.dart';
import '../BusinessLayer/Bindings/init_bindings.dart';
import '../PresentationLayer/Screens/Auth/login_screen.dart';
import '../PresentationLayer/Screens/Public/absences_screen.dart';
import '../PresentationLayer/Screens/Public/advertisiments_screen.dart';
import '../PresentationLayer/Screens/Public/courses_screen.dart';
import '../PresentationLayer/Screens/Public/exam_results_screen.dart';
import '../PresentationLayer/Screens/Public/fees_screen.dart';
import '../PresentationLayer/Screens/Public/home_screen.dart';
import '../PresentationLayer/Screens/Public/homeworks_screen.dart';
import '../PresentationLayer/Screens/Public/notes_screen.dart';
import '../PresentationLayer/Screens/Public/profile_screen.dart';
import '../PresentationLayer/Screens/Public/programs_screen.dart';
import '../PresentationLayer/Screens/Public/sons_screen.dart';
import '../PresentationLayer/Screens/Public/splash_screen.dart';
import '../PresentationLayer/Screens/Public/subjects_screen.dart';
import '../PresentationLayer/Screens/Public/sumResult_screen.dart';
import 'get_routes.dart';

List<GetPage<dynamic>> getPages = [
  GetPage(
      name: AppRoutes.splashScreen,
      page: () =>  SplashScreen(),
      transition: Transition.leftToRightWithFade),
  GetPage(
      name: AppRoutes.loginScreen,
      page: () => LoginScreen(),
      transition: Transition.zoom,
      binding: InitBinding()),
  GetPage(
      name: AppRoutes.sonsScreen,
      page: () => SonsScreen(),
      transition: Transition.zoom,
      binding: InitBinding()),
  GetPage(
      name: AppRoutes.homeScreen,
      page: () => HomeScreen(),
      transition: Transition.zoom,
      binding: InitBinding()),
  GetPage(
      name: AppRoutes.programs,
      page: () => ProgramsScreen(),
      transition: Transition.zoom,),
  GetPage(
    name: AppRoutes.absences,
    page: () => AbsencesScreen(),
    transition: Transition.zoom,),

  GetPage(
    name: AppRoutes.ads,
    page: () => AdvertsScreen(),
    transition: Transition.zoom,),

  GetPage(
    name: AppRoutes.notes,
    page: () => NotesScreen(),
    transition: Transition.zoom,),
  GetPage(
    name: AppRoutes.subjects,
    page: () => SubjectsScreen(),
    transition: Transition.zoom,),
  GetPage(
    name: AppRoutes.homeworks,
    page: () => HomeworksScreen(),
    transition: Transition.zoom,),
  GetPage(
    name: AppRoutes.fees,
    page: () => FeesScreen(),
    transition: Transition.zoom,),
  GetPage(
    name: AppRoutes.courses,
    page: () => CoursesScreen(),
    transition: Transition.zoom,),
  GetPage(
    name: AppRoutes.results,
    page: () => ExamResultsScreen(),
    transition: Transition.zoom,),
  GetPage(
    name: AppRoutes.profileScreen,
    page: () => ProfileScreen(),
    transition: Transition.zoom,),
  GetPage(
    name: AppRoutes.sumResult,
    page: () => SumResultScreen(),
    transition: Transition.zoom,),

];
