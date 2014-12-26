// @SOURCE:/home/anshika/play/SaralHRM/conf/routes
// @HASH:7ea3e96dde8f55f0a8148a8fe3b8856b4bbc74ab
// @DATE:Wed Dec 24 14:58:38 IST 2014


import play.core._
import play.core.Router._
import play.core.Router.HandlerInvokerFactory._
import play.core.j._

import play.api.mvc._
import _root_.controllers.Assets.Asset
import _root_.play.libs.F

import Router.queryString

object Routes extends Router.Routes {

import ReverseRouteContext.empty

private var _prefix = "/"

def setPrefix(prefix: String) {
  _prefix = prefix
  List[(String,Routes)]().foreach {
    case (p, router) => router.setPrefix(prefix + (if(prefix.endsWith("/")) "" else "/") + p)
  }
}

def prefix = _prefix

lazy val defaultPrefix = { if(Routes.prefix.endsWith("/")) "" else "/" }


// @LINE:6
private[this] lazy val controllers_Application_index0_route = Route("GET", PathPattern(List(StaticPart(Routes.prefix))))
private[this] lazy val controllers_Application_index0_invoker = createInvoker(
controllers.Application.index(),
HandlerDef(this.getClass.getClassLoader, "", "controllers.Application", "index", Nil,"GET", """ Home page""", Routes.prefix + """"""))
        

// @LINE:7
private[this] lazy val controllers_Dashboard_index1_route = Route("GET", PathPattern(List(StaticPart(Routes.prefix),StaticPart(Routes.defaultPrefix),StaticPart("dashboard"))))
private[this] lazy val controllers_Dashboard_index1_invoker = createInvoker(
controllers.Dashboard.index(),
HandlerDef(this.getClass.getClassLoader, "", "controllers.Dashboard", "index", Nil,"GET", """""", Routes.prefix + """dashboard"""))
        

// @LINE:8
private[this] lazy val controllers_Dashboard_admin2_route = Route("GET", PathPattern(List(StaticPart(Routes.prefix),StaticPart(Routes.defaultPrefix),StaticPart("dashboarda"))))
private[this] lazy val controllers_Dashboard_admin2_invoker = createInvoker(
controllers.Dashboard.admin(),
HandlerDef(this.getClass.getClassLoader, "", "controllers.Dashboard", "admin", Nil,"GET", """""", Routes.prefix + """dashboarda"""))
        

// @LINE:10
private[this] lazy val controllers_Application_authenticate3_route = Route("POST", PathPattern(List(StaticPart(Routes.prefix),StaticPart(Routes.defaultPrefix),StaticPart("login"))))
private[this] lazy val controllers_Application_authenticate3_invoker = createInvoker(
controllers.Application.authenticate(),
HandlerDef(this.getClass.getClassLoader, "", "controllers.Application", "authenticate", Nil,"POST", """""", Routes.prefix + """login"""))
        

// @LINE:11
private[this] lazy val controllers_Application_logout4_route = Route("GET", PathPattern(List(StaticPart(Routes.prefix),StaticPart(Routes.defaultPrefix),StaticPart("logout"))))
private[this] lazy val controllers_Application_logout4_invoker = createInvoker(
controllers.Application.logout(),
HandlerDef(this.getClass.getClassLoader, "", "controllers.Application", "logout", Nil,"GET", """""", Routes.prefix + """logout"""))
        

// @LINE:13
private[this] lazy val controllers_Attendance_index5_route = Route("GET", PathPattern(List(StaticPart(Routes.prefix),StaticPart(Routes.defaultPrefix),StaticPart("attendance"))))
private[this] lazy val controllers_Attendance_index5_invoker = createInvoker(
controllers.Attendance.index(),
HandlerDef(this.getClass.getClassLoader, "", "controllers.Attendance", "index", Nil,"GET", """""", Routes.prefix + """attendance"""))
        

// @LINE:14
private[this] lazy val controllers_Attendance_punchIn6_route = Route("POST", PathPattern(List(StaticPart(Routes.prefix),StaticPart(Routes.defaultPrefix),StaticPart("attendance/punchIn"))))
private[this] lazy val controllers_Attendance_punchIn6_invoker = createInvoker(
controllers.Attendance.punchIn(),
HandlerDef(this.getClass.getClassLoader, "", "controllers.Attendance", "punchIn", Nil,"POST", """""", Routes.prefix + """attendance/punchIn"""))
        

// @LINE:15
private[this] lazy val controllers_Attendance_punchOut7_route = Route("POST", PathPattern(List(StaticPart(Routes.prefix),StaticPart(Routes.defaultPrefix),StaticPart("attendance/punchOut"))))
private[this] lazy val controllers_Attendance_punchOut7_invoker = createInvoker(
controllers.Attendance.punchOut(),
HandlerDef(this.getClass.getClassLoader, "", "controllers.Attendance", "punchOut", Nil,"POST", """""", Routes.prefix + """attendance/punchOut"""))
        

// @LINE:16
private[this] lazy val controllers_ManageUsers_index8_route = Route("GET", PathPattern(List(StaticPart(Routes.prefix),StaticPart(Routes.defaultPrefix),StaticPart("manageusers"))))
private[this] lazy val controllers_ManageUsers_index8_invoker = createInvoker(
controllers.ManageUsers.index(),
HandlerDef(this.getClass.getClassLoader, "", "controllers.ManageUsers", "index", Nil,"GET", """""", Routes.prefix + """manageusers"""))
        

// @LINE:17
private[this] lazy val controllers_Reports_index9_route = Route("GET", PathPattern(List(StaticPart(Routes.prefix),StaticPart(Routes.defaultPrefix),StaticPart("reports"))))
private[this] lazy val controllers_Reports_index9_invoker = createInvoker(
controllers.Reports.index(),
HandlerDef(this.getClass.getClassLoader, "", "controllers.Reports", "index", Nil,"GET", """""", Routes.prefix + """reports"""))
        

// @LINE:18
private[this] lazy val controllers_Reports_viewReport10_route = Route("POST", PathPattern(List(StaticPart(Routes.prefix),StaticPart(Routes.defaultPrefix),StaticPart("reports"))))
private[this] lazy val controllers_Reports_viewReport10_invoker = createInvoker(
controllers.Reports.viewReport(),
HandlerDef(this.getClass.getClassLoader, "", "controllers.Reports", "viewReport", Nil,"POST", """""", Routes.prefix + """reports"""))
        

// @LINE:19
private[this] lazy val controllers_Reports_allReportIndex11_route = Route("GET", PathPattern(List(StaticPart(Routes.prefix),StaticPart(Routes.defaultPrefix),StaticPart("UsersReports"))))
private[this] lazy val controllers_Reports_allReportIndex11_invoker = createInvoker(
controllers.Reports.allReportIndex(),
HandlerDef(this.getClass.getClassLoader, "", "controllers.Reports", "allReportIndex", Nil,"GET", """""", Routes.prefix + """UsersReports"""))
        

// @LINE:20
private[this] lazy val controllers_Reports_viewAllReport12_route = Route("POST", PathPattern(List(StaticPart(Routes.prefix),StaticPart(Routes.defaultPrefix),StaticPart("AllUserReports"))))
private[this] lazy val controllers_Reports_viewAllReport12_invoker = createInvoker(
controllers.Reports.viewAllReport(),
HandlerDef(this.getClass.getClassLoader, "", "controllers.Reports", "viewAllReport", Nil,"POST", """""", Routes.prefix + """AllUserReports"""))
        

// @LINE:22
private[this] lazy val controllers_account_settings_Index_index13_route = Route("GET", PathPattern(List(StaticPart(Routes.prefix),StaticPart(Routes.defaultPrefix),StaticPart("settings"))))
private[this] lazy val controllers_account_settings_Index_index13_invoker = createInvoker(
controllers.account.settings.Index.index(),
HandlerDef(this.getClass.getClassLoader, "", "controllers.account.settings.Index", "index", Nil,"GET", """""", Routes.prefix + """settings"""))
        

// @LINE:23
private[this] lazy val controllers_account_settings_Password_index14_route = Route("GET", PathPattern(List(StaticPart(Routes.prefix),StaticPart(Routes.defaultPrefix),StaticPart("settings/password"))))
private[this] lazy val controllers_account_settings_Password_index14_invoker = createInvoker(
controllers.account.settings.Password.index(),
HandlerDef(this.getClass.getClassLoader, "", "controllers.account.settings.Password", "index", Nil,"GET", """""", Routes.prefix + """settings/password"""))
        

// @LINE:24
private[this] lazy val controllers_account_settings_Password_runPassword15_route = Route("POST", PathPattern(List(StaticPart(Routes.prefix),StaticPart(Routes.defaultPrefix),StaticPart("settings/password"))))
private[this] lazy val controllers_account_settings_Password_runPassword15_invoker = createInvoker(
controllers.account.settings.Password.runPassword(),
HandlerDef(this.getClass.getClassLoader, "", "controllers.account.settings.Password", "runPassword", Nil,"POST", """""", Routes.prefix + """settings/password"""))
        

// @LINE:25
private[this] lazy val controllers_account_settings_Email_index16_route = Route("GET", PathPattern(List(StaticPart(Routes.prefix),StaticPart(Routes.defaultPrefix),StaticPart("settings/email"))))
private[this] lazy val controllers_account_settings_Email_index16_invoker = createInvoker(
controllers.account.settings.Email.index(),
HandlerDef(this.getClass.getClassLoader, "", "controllers.account.settings.Email", "index", Nil,"GET", """""", Routes.prefix + """settings/email"""))
        

// @LINE:26
private[this] lazy val controllers_account_settings_Email_runEmail17_route = Route("POST", PathPattern(List(StaticPart(Routes.prefix),StaticPart(Routes.defaultPrefix),StaticPart("settings/email"))))
private[this] lazy val controllers_account_settings_Email_runEmail17_invoker = createInvoker(
controllers.account.settings.Email.runEmail(),
HandlerDef(this.getClass.getClassLoader, "", "controllers.account.settings.Email", "runEmail", Nil,"POST", """""", Routes.prefix + """settings/email"""))
        

// @LINE:29
private[this] lazy val controllers_account_Signup_create18_route = Route("GET", PathPattern(List(StaticPart(Routes.prefix),StaticPart(Routes.defaultPrefix),StaticPart("signup"))))
private[this] lazy val controllers_account_Signup_create18_invoker = createInvoker(
controllers.account.Signup.create(),
HandlerDef(this.getClass.getClassLoader, "", "controllers.account.Signup", "create", Nil,"GET", """ Registers the user, sending an email to confirm the account.""", Routes.prefix + """signup"""))
        

// @LINE:30
private[this] lazy val controllers_account_Signup_save19_route = Route("POST", PathPattern(List(StaticPart(Routes.prefix),StaticPart(Routes.defaultPrefix),StaticPart("signup"))))
private[this] lazy val controllers_account_Signup_save19_invoker = createInvoker(
controllers.account.Signup.save(),
HandlerDef(this.getClass.getClassLoader, "", "controllers.account.Signup", "save", Nil,"POST", """""", Routes.prefix + """signup"""))
        

// @LINE:33
private[this] lazy val controllers_account_Signup_confirm20_route = Route("GET", PathPattern(List(StaticPart(Routes.prefix),StaticPart(Routes.defaultPrefix),StaticPart("confirm/"),DynamicPart("confirmToken", """[^/]+""",true))))
private[this] lazy val controllers_account_Signup_confirm20_invoker = createInvoker(
controllers.account.Signup.confirm(fakeValue[String]),
HandlerDef(this.getClass.getClassLoader, "", "controllers.account.Signup", "confirm", Seq(classOf[String]),"GET", """ Accessed when the user confirms the registration.""", Routes.prefix + """confirm/$confirmToken<[^/]+>"""))
        

// @LINE:36
private[this] lazy val controllers_account_Reset_ask21_route = Route("GET", PathPattern(List(StaticPart(Routes.prefix),StaticPart(Routes.defaultPrefix),StaticPart("reset/ask"))))
private[this] lazy val controllers_account_Reset_ask21_invoker = createInvoker(
controllers.account.Reset.ask(),
HandlerDef(this.getClass.getClassLoader, "", "controllers.account.Reset", "ask", Nil,"GET", """ Displays a page to send a reset email given the user's email.""", Routes.prefix + """reset/ask"""))
        

// @LINE:37
private[this] lazy val controllers_account_Reset_runAsk22_route = Route("POST", PathPattern(List(StaticPart(Routes.prefix),StaticPart(Routes.defaultPrefix),StaticPart("reset/ask"))))
private[this] lazy val controllers_account_Reset_runAsk22_invoker = createInvoker(
controllers.account.Reset.runAsk(),
HandlerDef(this.getClass.getClassLoader, "", "controllers.account.Reset", "runAsk", Nil,"POST", """""", Routes.prefix + """reset/ask"""))
        

// @LINE:40
private[this] lazy val controllers_account_Reset_reset23_route = Route("GET", PathPattern(List(StaticPart(Routes.prefix),StaticPart(Routes.defaultPrefix),StaticPart("reset/"),DynamicPart("token", """[^/]+""",true))))
private[this] lazy val controllers_account_Reset_reset23_invoker = createInvoker(
controllers.account.Reset.reset(fakeValue[String]),
HandlerDef(this.getClass.getClassLoader, "", "controllers.account.Reset", "reset", Seq(classOf[String]),"GET", """ Resets the password using the password.""", Routes.prefix + """reset/$token<[^/]+>"""))
        

// @LINE:41
private[this] lazy val controllers_account_Reset_runReset24_route = Route("POST", PathPattern(List(StaticPart(Routes.prefix),StaticPart(Routes.defaultPrefix),StaticPart("reset/"),DynamicPart("token", """[^/]+""",true))))
private[this] lazy val controllers_account_Reset_runReset24_invoker = createInvoker(
controllers.account.Reset.runReset(fakeValue[String]),
HandlerDef(this.getClass.getClassLoader, "", "controllers.account.Reset", "runReset", Seq(classOf[String]),"POST", """""", Routes.prefix + """reset/$token<[^/]+>"""))
        

// @LINE:43
private[this] lazy val controllers_account_settings_Email_validateEmail25_route = Route("GET", PathPattern(List(StaticPart(Routes.prefix),StaticPart(Routes.defaultPrefix),StaticPart("email/"),DynamicPart("token", """[^/]+""",true))))
private[this] lazy val controllers_account_settings_Email_validateEmail25_invoker = createInvoker(
controllers.account.settings.Email.validateEmail(fakeValue[String]),
HandlerDef(this.getClass.getClassLoader, "", "controllers.account.settings.Email", "validateEmail", Seq(classOf[String]),"GET", """""", Routes.prefix + """email/$token<[^/]+>"""))
        

// @LINE:46
private[this] lazy val controllers_Assets_at26_route = Route("GET", PathPattern(List(StaticPart(Routes.prefix),StaticPart(Routes.defaultPrefix),StaticPart("assets/"),DynamicPart("file", """.+""",false))))
private[this] lazy val controllers_Assets_at26_invoker = createInvoker(
controllers.Assets.at(fakeValue[String], fakeValue[String]),
HandlerDef(this.getClass.getClassLoader, "", "controllers.Assets", "at", Seq(classOf[String], classOf[String]),"GET", """ Map static resources from the /public folder to the /assets URL path""", Routes.prefix + """assets/$file<.+>"""))
        

// @LINE:48
private[this] lazy val controllers_ManageUsers_changeStatus27_route = Route("POST", PathPattern(List(StaticPart(Routes.prefix),StaticPart(Routes.defaultPrefix),StaticPart("manageusers/"),DynamicPart("user_name", """[^/]+""",true))))
private[this] lazy val controllers_ManageUsers_changeStatus27_invoker = createInvoker(
controllers.ManageUsers.changeStatus(fakeValue[String]),
HandlerDef(this.getClass.getClassLoader, "", "controllers.ManageUsers", "changeStatus", Seq(classOf[String]),"POST", """""", Routes.prefix + """manageusers/$user_name<[^/]+>"""))
        

// @LINE:49
private[this] lazy val controllers_ManageUsers_changeStatus28_route = Route("GET", PathPattern(List(StaticPart(Routes.prefix),StaticPart(Routes.defaultPrefix),StaticPart("manageusers/"),DynamicPart("user_name", """[^/]+""",true))))
private[this] lazy val controllers_ManageUsers_changeStatus28_invoker = createInvoker(
controllers.ManageUsers.changeStatus(fakeValue[String]),
HandlerDef(this.getClass.getClassLoader, "", "controllers.ManageUsers", "changeStatus", Seq(classOf[String]),"GET", """""", Routes.prefix + """manageusers/$user_name<[^/]+>"""))
        
def documentation = List(("""GET""", prefix,"""controllers.Application.index()"""),("""GET""", prefix + (if(prefix.endsWith("/")) "" else "/") + """dashboard""","""controllers.Dashboard.index()"""),("""GET""", prefix + (if(prefix.endsWith("/")) "" else "/") + """dashboarda""","""controllers.Dashboard.admin()"""),("""POST""", prefix + (if(prefix.endsWith("/")) "" else "/") + """login""","""controllers.Application.authenticate()"""),("""GET""", prefix + (if(prefix.endsWith("/")) "" else "/") + """logout""","""controllers.Application.logout()"""),("""GET""", prefix + (if(prefix.endsWith("/")) "" else "/") + """attendance""","""controllers.Attendance.index()"""),("""POST""", prefix + (if(prefix.endsWith("/")) "" else "/") + """attendance/punchIn""","""controllers.Attendance.punchIn()"""),("""POST""", prefix + (if(prefix.endsWith("/")) "" else "/") + """attendance/punchOut""","""controllers.Attendance.punchOut()"""),("""GET""", prefix + (if(prefix.endsWith("/")) "" else "/") + """manageusers""","""controllers.ManageUsers.index()"""),("""GET""", prefix + (if(prefix.endsWith("/")) "" else "/") + """reports""","""controllers.Reports.index()"""),("""POST""", prefix + (if(prefix.endsWith("/")) "" else "/") + """reports""","""controllers.Reports.viewReport()"""),("""GET""", prefix + (if(prefix.endsWith("/")) "" else "/") + """UsersReports""","""controllers.Reports.allReportIndex()"""),("""POST""", prefix + (if(prefix.endsWith("/")) "" else "/") + """AllUserReports""","""controllers.Reports.viewAllReport()"""),("""GET""", prefix + (if(prefix.endsWith("/")) "" else "/") + """settings""","""controllers.account.settings.Index.index()"""),("""GET""", prefix + (if(prefix.endsWith("/")) "" else "/") + """settings/password""","""controllers.account.settings.Password.index()"""),("""POST""", prefix + (if(prefix.endsWith("/")) "" else "/") + """settings/password""","""controllers.account.settings.Password.runPassword()"""),("""GET""", prefix + (if(prefix.endsWith("/")) "" else "/") + """settings/email""","""controllers.account.settings.Email.index()"""),("""POST""", prefix + (if(prefix.endsWith("/")) "" else "/") + """settings/email""","""controllers.account.settings.Email.runEmail()"""),("""GET""", prefix + (if(prefix.endsWith("/")) "" else "/") + """signup""","""controllers.account.Signup.create()"""),("""POST""", prefix + (if(prefix.endsWith("/")) "" else "/") + """signup""","""controllers.account.Signup.save()"""),("""GET""", prefix + (if(prefix.endsWith("/")) "" else "/") + """confirm/$confirmToken<[^/]+>""","""controllers.account.Signup.confirm(confirmToken:String)"""),("""GET""", prefix + (if(prefix.endsWith("/")) "" else "/") + """reset/ask""","""controllers.account.Reset.ask()"""),("""POST""", prefix + (if(prefix.endsWith("/")) "" else "/") + """reset/ask""","""controllers.account.Reset.runAsk()"""),("""GET""", prefix + (if(prefix.endsWith("/")) "" else "/") + """reset/$token<[^/]+>""","""controllers.account.Reset.reset(token:String)"""),("""POST""", prefix + (if(prefix.endsWith("/")) "" else "/") + """reset/$token<[^/]+>""","""controllers.account.Reset.runReset(token:String)"""),("""GET""", prefix + (if(prefix.endsWith("/")) "" else "/") + """email/$token<[^/]+>""","""controllers.account.settings.Email.validateEmail(token:String)"""),("""GET""", prefix + (if(prefix.endsWith("/")) "" else "/") + """assets/$file<.+>""","""controllers.Assets.at(path:String = "/public", file:String)"""),("""POST""", prefix + (if(prefix.endsWith("/")) "" else "/") + """manageusers/$user_name<[^/]+>""","""controllers.ManageUsers.changeStatus(user_name:String)"""),("""GET""", prefix + (if(prefix.endsWith("/")) "" else "/") + """manageusers/$user_name<[^/]+>""","""controllers.ManageUsers.changeStatus(user_name:String)""")).foldLeft(List.empty[(String,String,String)]) { (s,e) => e.asInstanceOf[Any] match {
  case r @ (_,_,_) => s :+ r.asInstanceOf[(String,String,String)]
  case l => s ++ l.asInstanceOf[List[(String,String,String)]] 
}}
      

def routes:PartialFunction[RequestHeader,Handler] = {

// @LINE:6
case controllers_Application_index0_route(params) => {
   call { 
        controllers_Application_index0_invoker.call(controllers.Application.index())
   }
}
        

// @LINE:7
case controllers_Dashboard_index1_route(params) => {
   call { 
        controllers_Dashboard_index1_invoker.call(controllers.Dashboard.index())
   }
}
        

// @LINE:8
case controllers_Dashboard_admin2_route(params) => {
   call { 
        controllers_Dashboard_admin2_invoker.call(controllers.Dashboard.admin())
   }
}
        

// @LINE:10
case controllers_Application_authenticate3_route(params) => {
   call { 
        controllers_Application_authenticate3_invoker.call(controllers.Application.authenticate())
   }
}
        

// @LINE:11
case controllers_Application_logout4_route(params) => {
   call { 
        controllers_Application_logout4_invoker.call(controllers.Application.logout())
   }
}
        

// @LINE:13
case controllers_Attendance_index5_route(params) => {
   call { 
        controllers_Attendance_index5_invoker.call(controllers.Attendance.index())
   }
}
        

// @LINE:14
case controllers_Attendance_punchIn6_route(params) => {
   call { 
        controllers_Attendance_punchIn6_invoker.call(controllers.Attendance.punchIn())
   }
}
        

// @LINE:15
case controllers_Attendance_punchOut7_route(params) => {
   call { 
        controllers_Attendance_punchOut7_invoker.call(controllers.Attendance.punchOut())
   }
}
        

// @LINE:16
case controllers_ManageUsers_index8_route(params) => {
   call { 
        controllers_ManageUsers_index8_invoker.call(controllers.ManageUsers.index())
   }
}
        

// @LINE:17
case controllers_Reports_index9_route(params) => {
   call { 
        controllers_Reports_index9_invoker.call(controllers.Reports.index())
   }
}
        

// @LINE:18
case controllers_Reports_viewReport10_route(params) => {
   call { 
        controllers_Reports_viewReport10_invoker.call(controllers.Reports.viewReport())
   }
}
        

// @LINE:19
case controllers_Reports_allReportIndex11_route(params) => {
   call { 
        controllers_Reports_allReportIndex11_invoker.call(controllers.Reports.allReportIndex())
   }
}
        

// @LINE:20
case controllers_Reports_viewAllReport12_route(params) => {
   call { 
        controllers_Reports_viewAllReport12_invoker.call(controllers.Reports.viewAllReport())
   }
}
        

// @LINE:22
case controllers_account_settings_Index_index13_route(params) => {
   call { 
        controllers_account_settings_Index_index13_invoker.call(controllers.account.settings.Index.index())
   }
}
        

// @LINE:23
case controllers_account_settings_Password_index14_route(params) => {
   call { 
        controllers_account_settings_Password_index14_invoker.call(controllers.account.settings.Password.index())
   }
}
        

// @LINE:24
case controllers_account_settings_Password_runPassword15_route(params) => {
   call { 
        controllers_account_settings_Password_runPassword15_invoker.call(controllers.account.settings.Password.runPassword())
   }
}
        

// @LINE:25
case controllers_account_settings_Email_index16_route(params) => {
   call { 
        controllers_account_settings_Email_index16_invoker.call(controllers.account.settings.Email.index())
   }
}
        

// @LINE:26
case controllers_account_settings_Email_runEmail17_route(params) => {
   call { 
        controllers_account_settings_Email_runEmail17_invoker.call(controllers.account.settings.Email.runEmail())
   }
}
        

// @LINE:29
case controllers_account_Signup_create18_route(params) => {
   call { 
        controllers_account_Signup_create18_invoker.call(controllers.account.Signup.create())
   }
}
        

// @LINE:30
case controllers_account_Signup_save19_route(params) => {
   call { 
        controllers_account_Signup_save19_invoker.call(controllers.account.Signup.save())
   }
}
        

// @LINE:33
case controllers_account_Signup_confirm20_route(params) => {
   call(params.fromPath[String]("confirmToken", None)) { (confirmToken) =>
        controllers_account_Signup_confirm20_invoker.call(controllers.account.Signup.confirm(confirmToken))
   }
}
        

// @LINE:36
case controllers_account_Reset_ask21_route(params) => {
   call { 
        controllers_account_Reset_ask21_invoker.call(controllers.account.Reset.ask())
   }
}
        

// @LINE:37
case controllers_account_Reset_runAsk22_route(params) => {
   call { 
        controllers_account_Reset_runAsk22_invoker.call(controllers.account.Reset.runAsk())
   }
}
        

// @LINE:40
case controllers_account_Reset_reset23_route(params) => {
   call(params.fromPath[String]("token", None)) { (token) =>
        controllers_account_Reset_reset23_invoker.call(controllers.account.Reset.reset(token))
   }
}
        

// @LINE:41
case controllers_account_Reset_runReset24_route(params) => {
   call(params.fromPath[String]("token", None)) { (token) =>
        controllers_account_Reset_runReset24_invoker.call(controllers.account.Reset.runReset(token))
   }
}
        

// @LINE:43
case controllers_account_settings_Email_validateEmail25_route(params) => {
   call(params.fromPath[String]("token", None)) { (token) =>
        controllers_account_settings_Email_validateEmail25_invoker.call(controllers.account.settings.Email.validateEmail(token))
   }
}
        

// @LINE:46
case controllers_Assets_at26_route(params) => {
   call(Param[String]("path", Right("/public")), params.fromPath[String]("file", None)) { (path, file) =>
        controllers_Assets_at26_invoker.call(controllers.Assets.at(path, file))
   }
}
        

// @LINE:48
case controllers_ManageUsers_changeStatus27_route(params) => {
   call(params.fromPath[String]("user_name", None)) { (user_name) =>
        controllers_ManageUsers_changeStatus27_invoker.call(controllers.ManageUsers.changeStatus(user_name))
   }
}
        

// @LINE:49
case controllers_ManageUsers_changeStatus28_route(params) => {
   call(params.fromPath[String]("user_name", None)) { (user_name) =>
        controllers_ManageUsers_changeStatus28_invoker.call(controllers.ManageUsers.changeStatus(user_name))
   }
}
        
}

}
     