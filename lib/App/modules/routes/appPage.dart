import 'package:get/get.dart';
import 'package:monlikountche/App/modules/bindings/homeBinding.dart';
import 'package:monlikountche/App/modules/bindings/loginBindings.dart';
import 'package:monlikountche/App/modules/bindings/resultBinding.dart';
import 'package:monlikountche/App/modules/bindings/swithBinding.dart';
import 'package:monlikountche/App/modules/routes/appRoute.dart';
import 'package:monlikountche/App/modules/views/homeViews.dart' ;
import 'package:monlikountche/App/modules/views/loginViews.dart';
import 'package:monlikountche/App/modules/views/resultViews.dart';
import 'package:monlikountche/App/modules/views/swithView.dart';

class AppPage {


static  final routes=[

GetPage(name:approute.result , page: ()=>Resultviews(),binding:Resultbinding() ),
GetPage(name:approute.swith , page: ()=>Swithview(),binding:Swithbinding() ),
GetPage(name:approute.home , page: ()=>Homeviews(),binding:Homebinding() ),
GetPage(name:approute.login , page: ()=>Loginviews() ,binding: Loginbindings()),
GetPage(name:approute.register , page: ()=>Loginviews() ,binding: Loginbindings()),

];


}