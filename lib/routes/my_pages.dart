import 'package:get/get.dart';
import 'package:itsuit/modules/cupones/create_cupon/create_cupon_binding.dart';
import 'package:itsuit/modules/cupones/create_cupon/create_cupon_screen.dart';
import 'package:itsuit/modules/cupones/detail_cupon/detail_cupon_binding.dart';
import 'package:itsuit/modules/cupones/detail_cupon/detail_cupon_screen.dart';
import 'package:itsuit/modules/cupones/list_cupon/list_cupon_binding.dart';
import 'package:itsuit/modules/cupones/list_cupon/list_cupon_screen.dart';
import 'package:itsuit/modules/home/home_binding.dart';
import 'package:itsuit/modules/home/home_screen.dart';
import 'package:itsuit/modules/login/login_binding.dart';
import 'package:itsuit/modules/on_boarding/on_boarding_binding.dart';
import 'package:itsuit/modules/own_profile/own_profile_binding.dart';
import 'package:itsuit/modules/portfolio/create_done_job/create_done_job_binding.dart';
import 'package:itsuit/modules/portfolio/create_done_job/create_done_job_screen.dart';
import 'package:itsuit/modules/portfolio/detail_done_job/detail_done_job_binding.dart';
import 'package:itsuit/modules/portfolio/detail_done_job/detail_done_job_screen.dart';
import 'package:itsuit/modules/portfolio/list_done_jobs/list_done_jobs_screen.dart';
import 'package:itsuit/modules/proceso_seleccion/contra_oferta_create/create_contra_oferta_binding.dart';
import 'package:itsuit/modules/proceso_seleccion/contra_oferta_detail/detail_contra_oferta_binding.dart';
import 'package:itsuit/modules/proceso_seleccion/oferta_create/create_oferta_binding.dart';
import 'package:itsuit/modules/proceso_seleccion/oferta_detail/detail_oferta_binding.dart';
import 'package:itsuit/modules/proceso_seleccion/ofertas_list/list_oferta_binding.dart';
import 'package:itsuit/modules/proceso_seleccion/proceso_create/create_proceso_binding.dart';
import 'package:itsuit/modules/proceso_seleccion/proceso_detail/detail_proceso_binding.dart';
import 'package:itsuit/modules/proceso_seleccion/proceso_list/proceso_list_binding.dart';
import 'package:itsuit/modules/proceso_seleccion/proceso_list/proceso_list_screen.dart';
import 'package:itsuit/modules/profile/profile_binding.dart';
import 'package:itsuit/modules/profile/profile_screen.dart';
import 'package:itsuit/modules/screens.dart';
import 'package:itsuit/modules/seleccion_directa/detail_seleccion_directa/detail_seleccion_directa_binding.dart';
import 'package:itsuit/modules/seleccion_directa/detail_seleccion_directa/detail_seleccion_directa_screen.dart';
import 'package:itsuit/modules/seleccion_directa/seleccion_directa_create/create_seleccion_directa_binding.dart';
import 'package:itsuit/modules/seleccion_directa/seleccion_directa_create/create_seleccion_directa_screen.dart';
import 'package:itsuit/modules/sign_up/sign_up_binding.dart';
import 'package:itsuit/modules/splash/splash_binding.dart';
import 'package:itsuit/routes/my_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.SPLASH,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.ONBOARDING,
      page: () => OnBoarding(),
      binding: OnBoardingBinding(),
    ),
    // Pagina de Sign up principal
    GetPage(
      name: AppRoutes.SIGNUOP,
      page: () => SignUpScreen(),
      binding: SignUpBinding(),
    ),
    // Sign up empresa
    GetPage(
      name: AppRoutes.SIGNUOPEMPRESA,
      page: () => SignUpEmpresa(),
      binding: SignUpBinding(),
    ),
    //Sign Up proveedor
    GetPage(
      name: AppRoutes.SIGNUOPPROVEEDOR,
      page: () => SignUpProveedor(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: AppRoutes.HOME,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
    // Propio perfil - 1
    GetPage(
      name: AppRoutes.OWNPROFILE,
      page: () => OwnProfileScreen(),
      binding: OwnProfileBinding(),
    ),
    // Perfil - 1
    GetPage(
      name: AppRoutes.PROFILE,
      page: () => ProfileScreen(),
      binding: ProfileBinding(),
    ),
    // Cupones - 3 rutas
    //
    GetPage(
      name: AppRoutes.CREATECUPON,
      page: () => CreateCuponScreen(),
      binding: CreateCuponBinding(),
    ),
    GetPage(
      name: AppRoutes.LISTCUPON,
      page: () => ListCuponScreen(),
      binding: ListCuponBinding(),
    ),
    GetPage(
      name: AppRoutes.DETAILSCUPON,
      page: () => DetailsCuponScreen(),
      binding: DetailsCuponBinding(),
    ),

    //Portafolio - 3 rutas
    //
    GetPage(
      name: AppRoutes.CREATEDONEJOB,
      page: () => CreateDoneJobScreen(),
      binding: CreateDoneJobBinding(),
    ),
    GetPage(
      name: AppRoutes.DETAILSDONEJOB,
      page: () => DetailsDoneJobScreen(),
      binding: CreateDoneJobBinding(),
    ),
    GetPage(
      name: AppRoutes.LISTDONEJOB,
      page: () => ListDoneJobScreen(),
      binding: DetailsDoneJobBinding(),
    ),

    //Seleccion Directa - 2 rutas
    //
    GetPage(
        name: AppRoutes.SELECCIONDIRECTACREATE,
        page: () => CreateSeleccionDirectaScreen(),
        binding: CreateSeleccionDirectaBinding()),
    GetPage(
        name: AppRoutes.SELECCIONDIRECTADETAIL,
        page: () => SeleccionDirectaDetailScreen(),
        binding: DetailSeleccionDirectaBinding()),
    // Proceso de seleccion - 7 rutas
    //
    GetPage(
        name: AppRoutes.CREATECONTRAOFERTA,
        page: () => CreateContraOfertaScreen(),
        binding: CreateContraOfertaBinding()),
    GetPage(
        name: AppRoutes.DETAILCONTRAOFERTA,
        page: () => DetailContraOfertaScreen(),
        binding: DetailContraOfertaBinding()),
    GetPage(
        name: AppRoutes.CREATEOFERTA,
        page: () => CreateOfertaScreen(),
        binding: CreateOfertaBinding()),
    GetPage(
        name: AppRoutes.DETAILOFERTA,
        page: () => DetailOfertaScreen(),
        binding: DetailOfertaBinding()),
    GetPage(
        name: AppRoutes.LISTOFERTAS,
        page: () => ListOfertaScreen(),
        binding: ListOfertaBinding()),
    GetPage(
        name: AppRoutes.CREATEPROCESO,
        page: () => CreateProcesoSeleccionScreen(),
        binding: CreateProcesoBinding()),
    GetPage(
        name: AppRoutes.DETAILPROCESO,
        page: () => DetailProcesoScreen(),
        binding: DetailProcesoBinding()),
    GetPage(
        name: AppRoutes.LISTPROCESO,
        page: () => ProcesoListScreen(),
        binding: ProcesoListBinding()),
  ];
}
