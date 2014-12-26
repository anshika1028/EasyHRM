// @SOURCE:/home/anshika/play/SaralHRM/conf/routes
// @HASH:7ea3e96dde8f55f0a8148a8fe3b8856b4bbc74ab
// @DATE:Wed Dec 24 14:58:38 IST 2014

import Routes.{prefix => _prefix, defaultPrefix => _defaultPrefix}
import play.core._
import play.core.Router._
import play.core.Router.HandlerInvokerFactory._
import play.core.j._

import play.api.mvc._
import _root_.controllers.Assets.Asset
import _root_.play.libs.F

import Router.queryString


// @LINE:49
// @LINE:48
// @LINE:46
// @LINE:20
// @LINE:19
// @LINE:18
// @LINE:17
// @LINE:16
// @LINE:15
// @LINE:14
// @LINE:13
// @LINE:11
// @LINE:10
// @LINE:8
// @LINE:7
// @LINE:6
package controllers {

// @LINE:46
class ReverseAssets {
    

// @LINE:46
def at(file:String): Call = {
   implicit val _rrc = new ReverseRouteContext(Map(("path", "/public")))
   Call("GET", _prefix + { _defaultPrefix } + "assets/" + implicitly[PathBindable[String]].unbind("file", file))
}
                        
    
}
                          

// @LINE:49
// @LINE:48
// @LINE:16
class ReverseManageUsers {
    

// @LINE:49
// @LINE:48
def changeStatus(user_name:String): Call = {
   (user_name: @unchecked) match {
// @LINE:49
case (user_name)  =>
  import ReverseRouteContext.empty
  Call("GET", _prefix + { _defaultPrefix } + "manageusers/" + implicitly[PathBindable[String]].unbind("user_name", dynamicString(user_name)))
                                         
   }
}
                                                

// @LINE:16
def index(): Call = {
   import ReverseRouteContext.empty
   Call("GET", _prefix + { _defaultPrefix } + "manageusers")
}
                        
    
}
                          

// @LINE:20
// @LINE:19
// @LINE:18
// @LINE:17
class ReverseReports {
    

// @LINE:18
def viewReport(): Call = {
   import ReverseRouteContext.empty
   Call("POST", _prefix + { _defaultPrefix } + "reports")
}
                        

// @LINE:17
def index(): Call = {
   import ReverseRouteContext.empty
   Call("GET", _prefix + { _defaultPrefix } + "reports")
}
                        

// @LINE:20
def viewAllReport(): Call = {
   import ReverseRouteContext.empty
   Call("POST", _prefix + { _defaultPrefix } + "AllUserReports")
}
                        

// @LINE:19
def allReportIndex(): Call = {
   import ReverseRouteContext.empty
   Call("GET", _prefix + { _defaultPrefix } + "UsersReports")
}
                        
    
}
                          

// @LINE:11
// @LINE:10
// @LINE:6
class ReverseApplication {
    

// @LINE:11
def logout(): Call = {
   import ReverseRouteContext.empty
   Call("GET", _prefix + { _defaultPrefix } + "logout")
}
                        

// @LINE:6
def index(): Call = {
   import ReverseRouteContext.empty
   Call("GET", _prefix)
}
                        

// @LINE:10
def authenticate(): Call = {
   import ReverseRouteContext.empty
   Call("POST", _prefix + { _defaultPrefix } + "login")
}
                        
    
}
                          

// @LINE:15
// @LINE:14
// @LINE:13
class ReverseAttendance {
    

// @LINE:15
def punchOut(): Call = {
   import ReverseRouteContext.empty
   Call("POST", _prefix + { _defaultPrefix } + "attendance/punchOut")
}
                        

// @LINE:13
def index(): Call = {
   import ReverseRouteContext.empty
   Call("GET", _prefix + { _defaultPrefix } + "attendance")
}
                        

// @LINE:14
def punchIn(): Call = {
   import ReverseRouteContext.empty
   Call("POST", _prefix + { _defaultPrefix } + "attendance/punchIn")
}
                        
    
}
                          

// @LINE:8
// @LINE:7
class ReverseDashboard {
    

// @LINE:7
def index(): Call = {
   import ReverseRouteContext.empty
   Call("GET", _prefix + { _defaultPrefix } + "dashboard")
}
                        

// @LINE:8
def admin(): Call = {
   import ReverseRouteContext.empty
   Call("GET", _prefix + { _defaultPrefix } + "dashboarda")
}
                        
    
}
                          
}
                  

// @LINE:43
// @LINE:26
// @LINE:25
// @LINE:24
// @LINE:23
// @LINE:22
package controllers.account.settings {

// @LINE:43
// @LINE:26
// @LINE:25
class ReverseEmail {
    

// @LINE:43
def validateEmail(token:String): Call = {
   import ReverseRouteContext.empty
   Call("GET", _prefix + { _defaultPrefix } + "email/" + implicitly[PathBindable[String]].unbind("token", dynamicString(token)))
}
                        

// @LINE:26
def runEmail(): Call = {
   import ReverseRouteContext.empty
   Call("POST", _prefix + { _defaultPrefix } + "settings/email")
}
                        

// @LINE:25
def index(): Call = {
   import ReverseRouteContext.empty
   Call("GET", _prefix + { _defaultPrefix } + "settings/email")
}
                        
    
}
                          

// @LINE:24
// @LINE:23
class ReversePassword {
    

// @LINE:23
def index(): Call = {
   import ReverseRouteContext.empty
   Call("GET", _prefix + { _defaultPrefix } + "settings/password")
}
                        

// @LINE:24
def runPassword(): Call = {
   import ReverseRouteContext.empty
   Call("POST", _prefix + { _defaultPrefix } + "settings/password")
}
                        
    
}
                          

// @LINE:22
class ReverseIndex {
    

// @LINE:22
def index(): Call = {
   import ReverseRouteContext.empty
   Call("GET", _prefix + { _defaultPrefix } + "settings")
}
                        
    
}
                          
}
                  

// @LINE:41
// @LINE:40
// @LINE:37
// @LINE:36
// @LINE:33
// @LINE:30
// @LINE:29
package controllers.account {

// @LINE:33
// @LINE:30
// @LINE:29
class ReverseSignup {
    

// @LINE:33
def confirm(confirmToken:String): Call = {
   import ReverseRouteContext.empty
   Call("GET", _prefix + { _defaultPrefix } + "confirm/" + implicitly[PathBindable[String]].unbind("confirmToken", dynamicString(confirmToken)))
}
                        

// @LINE:30
def save(): Call = {
   import ReverseRouteContext.empty
   Call("POST", _prefix + { _defaultPrefix } + "signup")
}
                        

// @LINE:29
def create(): Call = {
   import ReverseRouteContext.empty
   Call("GET", _prefix + { _defaultPrefix } + "signup")
}
                        
    
}
                          

// @LINE:41
// @LINE:40
// @LINE:37
// @LINE:36
class ReverseReset {
    

// @LINE:41
def runReset(token:String): Call = {
   import ReverseRouteContext.empty
   Call("POST", _prefix + { _defaultPrefix } + "reset/" + implicitly[PathBindable[String]].unbind("token", dynamicString(token)))
}
                        

// @LINE:36
def ask(): Call = {
   import ReverseRouteContext.empty
   Call("GET", _prefix + { _defaultPrefix } + "reset/ask")
}
                        

// @LINE:40
def reset(token:String): Call = {
   import ReverseRouteContext.empty
   Call("GET", _prefix + { _defaultPrefix } + "reset/" + implicitly[PathBindable[String]].unbind("token", dynamicString(token)))
}
                        

// @LINE:37
def runAsk(): Call = {
   import ReverseRouteContext.empty
   Call("POST", _prefix + { _defaultPrefix } + "reset/ask")
}
                        
    
}
                          
}
                  


// @LINE:49
// @LINE:48
// @LINE:46
// @LINE:20
// @LINE:19
// @LINE:18
// @LINE:17
// @LINE:16
// @LINE:15
// @LINE:14
// @LINE:13
// @LINE:11
// @LINE:10
// @LINE:8
// @LINE:7
// @LINE:6
package controllers.javascript {
import ReverseRouteContext.empty

// @LINE:46
class ReverseAssets {
    

// @LINE:46
def at : JavascriptReverseRoute = JavascriptReverseRoute(
   "controllers.Assets.at",
   """
      function(file) {
      return _wA({method:"GET", url:"""" + _prefix + { _defaultPrefix } + """" + "assets/" + (""" + implicitly[PathBindable[String]].javascriptUnbind + """)("file", file)})
      }
   """
)
                        
    
}
              

// @LINE:49
// @LINE:48
// @LINE:16
class ReverseManageUsers {
    

// @LINE:49
// @LINE:48
def changeStatus : JavascriptReverseRoute = JavascriptReverseRoute(
   "controllers.ManageUsers.changeStatus",
   """
      function(user_name) {
      if (true) {
      return _wA({method:"POST", url:"""" + _prefix + { _defaultPrefix } + """" + "manageusers/" + (""" + implicitly[PathBindable[String]].javascriptUnbind + """)("user_name", encodeURIComponent(user_name))})
      }
      if (true) {
      return _wA({method:"GET", url:"""" + _prefix + { _defaultPrefix } + """" + "manageusers/" + (""" + implicitly[PathBindable[String]].javascriptUnbind + """)("user_name", encodeURIComponent(user_name))})
      }
      }
   """
)
                        

// @LINE:16
def index : JavascriptReverseRoute = JavascriptReverseRoute(
   "controllers.ManageUsers.index",
   """
      function() {
      return _wA({method:"GET", url:"""" + _prefix + { _defaultPrefix } + """" + "manageusers"})
      }
   """
)
                        
    
}
              

// @LINE:20
// @LINE:19
// @LINE:18
// @LINE:17
class ReverseReports {
    

// @LINE:18
def viewReport : JavascriptReverseRoute = JavascriptReverseRoute(
   "controllers.Reports.viewReport",
   """
      function() {
      return _wA({method:"POST", url:"""" + _prefix + { _defaultPrefix } + """" + "reports"})
      }
   """
)
                        

// @LINE:17
def index : JavascriptReverseRoute = JavascriptReverseRoute(
   "controllers.Reports.index",
   """
      function() {
      return _wA({method:"GET", url:"""" + _prefix + { _defaultPrefix } + """" + "reports"})
      }
   """
)
                        

// @LINE:20
def viewAllReport : JavascriptReverseRoute = JavascriptReverseRoute(
   "controllers.Reports.viewAllReport",
   """
      function() {
      return _wA({method:"POST", url:"""" + _prefix + { _defaultPrefix } + """" + "AllUserReports"})
      }
   """
)
                        

// @LINE:19
def allReportIndex : JavascriptReverseRoute = JavascriptReverseRoute(
   "controllers.Reports.allReportIndex",
   """
      function() {
      return _wA({method:"GET", url:"""" + _prefix + { _defaultPrefix } + """" + "UsersReports"})
      }
   """
)
                        
    
}
              

// @LINE:11
// @LINE:10
// @LINE:6
class ReverseApplication {
    

// @LINE:11
def logout : JavascriptReverseRoute = JavascriptReverseRoute(
   "controllers.Application.logout",
   """
      function() {
      return _wA({method:"GET", url:"""" + _prefix + { _defaultPrefix } + """" + "logout"})
      }
   """
)
                        

// @LINE:6
def index : JavascriptReverseRoute = JavascriptReverseRoute(
   "controllers.Application.index",
   """
      function() {
      return _wA({method:"GET", url:"""" + _prefix + """"})
      }
   """
)
                        

// @LINE:10
def authenticate : JavascriptReverseRoute = JavascriptReverseRoute(
   "controllers.Application.authenticate",
   """
      function() {
      return _wA({method:"POST", url:"""" + _prefix + { _defaultPrefix } + """" + "login"})
      }
   """
)
                        
    
}
              

// @LINE:15
// @LINE:14
// @LINE:13
class ReverseAttendance {
    

// @LINE:15
def punchOut : JavascriptReverseRoute = JavascriptReverseRoute(
   "controllers.Attendance.punchOut",
   """
      function() {
      return _wA({method:"POST", url:"""" + _prefix + { _defaultPrefix } + """" + "attendance/punchOut"})
      }
   """
)
                        

// @LINE:13
def index : JavascriptReverseRoute = JavascriptReverseRoute(
   "controllers.Attendance.index",
   """
      function() {
      return _wA({method:"GET", url:"""" + _prefix + { _defaultPrefix } + """" + "attendance"})
      }
   """
)
                        

// @LINE:14
def punchIn : JavascriptReverseRoute = JavascriptReverseRoute(
   "controllers.Attendance.punchIn",
   """
      function() {
      return _wA({method:"POST", url:"""" + _prefix + { _defaultPrefix } + """" + "attendance/punchIn"})
      }
   """
)
                        
    
}
              

// @LINE:8
// @LINE:7
class ReverseDashboard {
    

// @LINE:7
def index : JavascriptReverseRoute = JavascriptReverseRoute(
   "controllers.Dashboard.index",
   """
      function() {
      return _wA({method:"GET", url:"""" + _prefix + { _defaultPrefix } + """" + "dashboard"})
      }
   """
)
                        

// @LINE:8
def admin : JavascriptReverseRoute = JavascriptReverseRoute(
   "controllers.Dashboard.admin",
   """
      function() {
      return _wA({method:"GET", url:"""" + _prefix + { _defaultPrefix } + """" + "dashboarda"})
      }
   """
)
                        
    
}
              
}
        

// @LINE:43
// @LINE:26
// @LINE:25
// @LINE:24
// @LINE:23
// @LINE:22
package controllers.account.settings.javascript {
import ReverseRouteContext.empty

// @LINE:43
// @LINE:26
// @LINE:25
class ReverseEmail {
    

// @LINE:43
def validateEmail : JavascriptReverseRoute = JavascriptReverseRoute(
   "controllers.account.settings.Email.validateEmail",
   """
      function(token) {
      return _wA({method:"GET", url:"""" + _prefix + { _defaultPrefix } + """" + "email/" + (""" + implicitly[PathBindable[String]].javascriptUnbind + """)("token", encodeURIComponent(token))})
      }
   """
)
                        

// @LINE:26
def runEmail : JavascriptReverseRoute = JavascriptReverseRoute(
   "controllers.account.settings.Email.runEmail",
   """
      function() {
      return _wA({method:"POST", url:"""" + _prefix + { _defaultPrefix } + """" + "settings/email"})
      }
   """
)
                        

// @LINE:25
def index : JavascriptReverseRoute = JavascriptReverseRoute(
   "controllers.account.settings.Email.index",
   """
      function() {
      return _wA({method:"GET", url:"""" + _prefix + { _defaultPrefix } + """" + "settings/email"})
      }
   """
)
                        
    
}
              

// @LINE:24
// @LINE:23
class ReversePassword {
    

// @LINE:23
def index : JavascriptReverseRoute = JavascriptReverseRoute(
   "controllers.account.settings.Password.index",
   """
      function() {
      return _wA({method:"GET", url:"""" + _prefix + { _defaultPrefix } + """" + "settings/password"})
      }
   """
)
                        

// @LINE:24
def runPassword : JavascriptReverseRoute = JavascriptReverseRoute(
   "controllers.account.settings.Password.runPassword",
   """
      function() {
      return _wA({method:"POST", url:"""" + _prefix + { _defaultPrefix } + """" + "settings/password"})
      }
   """
)
                        
    
}
              

// @LINE:22
class ReverseIndex {
    

// @LINE:22
def index : JavascriptReverseRoute = JavascriptReverseRoute(
   "controllers.account.settings.Index.index",
   """
      function() {
      return _wA({method:"GET", url:"""" + _prefix + { _defaultPrefix } + """" + "settings"})
      }
   """
)
                        
    
}
              
}
        

// @LINE:41
// @LINE:40
// @LINE:37
// @LINE:36
// @LINE:33
// @LINE:30
// @LINE:29
package controllers.account.javascript {
import ReverseRouteContext.empty

// @LINE:33
// @LINE:30
// @LINE:29
class ReverseSignup {
    

// @LINE:33
def confirm : JavascriptReverseRoute = JavascriptReverseRoute(
   "controllers.account.Signup.confirm",
   """
      function(confirmToken) {
      return _wA({method:"GET", url:"""" + _prefix + { _defaultPrefix } + """" + "confirm/" + (""" + implicitly[PathBindable[String]].javascriptUnbind + """)("confirmToken", encodeURIComponent(confirmToken))})
      }
   """
)
                        

// @LINE:30
def save : JavascriptReverseRoute = JavascriptReverseRoute(
   "controllers.account.Signup.save",
   """
      function() {
      return _wA({method:"POST", url:"""" + _prefix + { _defaultPrefix } + """" + "signup"})
      }
   """
)
                        

// @LINE:29
def create : JavascriptReverseRoute = JavascriptReverseRoute(
   "controllers.account.Signup.create",
   """
      function() {
      return _wA({method:"GET", url:"""" + _prefix + { _defaultPrefix } + """" + "signup"})
      }
   """
)
                        
    
}
              

// @LINE:41
// @LINE:40
// @LINE:37
// @LINE:36
class ReverseReset {
    

// @LINE:41
def runReset : JavascriptReverseRoute = JavascriptReverseRoute(
   "controllers.account.Reset.runReset",
   """
      function(token) {
      return _wA({method:"POST", url:"""" + _prefix + { _defaultPrefix } + """" + "reset/" + (""" + implicitly[PathBindable[String]].javascriptUnbind + """)("token", encodeURIComponent(token))})
      }
   """
)
                        

// @LINE:36
def ask : JavascriptReverseRoute = JavascriptReverseRoute(
   "controllers.account.Reset.ask",
   """
      function() {
      return _wA({method:"GET", url:"""" + _prefix + { _defaultPrefix } + """" + "reset/ask"})
      }
   """
)
                        

// @LINE:40
def reset : JavascriptReverseRoute = JavascriptReverseRoute(
   "controllers.account.Reset.reset",
   """
      function(token) {
      return _wA({method:"GET", url:"""" + _prefix + { _defaultPrefix } + """" + "reset/" + (""" + implicitly[PathBindable[String]].javascriptUnbind + """)("token", encodeURIComponent(token))})
      }
   """
)
                        

// @LINE:37
def runAsk : JavascriptReverseRoute = JavascriptReverseRoute(
   "controllers.account.Reset.runAsk",
   """
      function() {
      return _wA({method:"POST", url:"""" + _prefix + { _defaultPrefix } + """" + "reset/ask"})
      }
   """
)
                        
    
}
              
}
        


// @LINE:49
// @LINE:48
// @LINE:46
// @LINE:20
// @LINE:19
// @LINE:18
// @LINE:17
// @LINE:16
// @LINE:15
// @LINE:14
// @LINE:13
// @LINE:11
// @LINE:10
// @LINE:8
// @LINE:7
// @LINE:6
package controllers.ref {


// @LINE:46
class ReverseAssets {
    

// @LINE:46
def at(path:String, file:String): play.api.mvc.HandlerRef[_] = new play.api.mvc.HandlerRef(
   controllers.Assets.at(path, file), HandlerDef(this.getClass.getClassLoader, "", "controllers.Assets", "at", Seq(classOf[String], classOf[String]), "GET", """ Map static resources from the /public folder to the /assets URL path""", _prefix + """assets/$file<.+>""")
)
                      
    
}
                          

// @LINE:49
// @LINE:48
// @LINE:16
class ReverseManageUsers {
    

// @LINE:48
def changeStatus(user_name:String): play.api.mvc.HandlerRef[_] = new play.api.mvc.HandlerRef(
   controllers.ManageUsers.changeStatus(user_name), HandlerDef(this.getClass.getClassLoader, "", "controllers.ManageUsers", "changeStatus", Seq(classOf[String]), "POST", """""", _prefix + """manageusers/$user_name<[^/]+>""")
)
                      

// @LINE:16
def index(): play.api.mvc.HandlerRef[_] = new play.api.mvc.HandlerRef(
   controllers.ManageUsers.index(), HandlerDef(this.getClass.getClassLoader, "", "controllers.ManageUsers", "index", Seq(), "GET", """""", _prefix + """manageusers""")
)
                      
    
}
                          

// @LINE:20
// @LINE:19
// @LINE:18
// @LINE:17
class ReverseReports {
    

// @LINE:18
def viewReport(): play.api.mvc.HandlerRef[_] = new play.api.mvc.HandlerRef(
   controllers.Reports.viewReport(), HandlerDef(this.getClass.getClassLoader, "", "controllers.Reports", "viewReport", Seq(), "POST", """""", _prefix + """reports""")
)
                      

// @LINE:17
def index(): play.api.mvc.HandlerRef[_] = new play.api.mvc.HandlerRef(
   controllers.Reports.index(), HandlerDef(this.getClass.getClassLoader, "", "controllers.Reports", "index", Seq(), "GET", """""", _prefix + """reports""")
)
                      

// @LINE:20
def viewAllReport(): play.api.mvc.HandlerRef[_] = new play.api.mvc.HandlerRef(
   controllers.Reports.viewAllReport(), HandlerDef(this.getClass.getClassLoader, "", "controllers.Reports", "viewAllReport", Seq(), "POST", """""", _prefix + """AllUserReports""")
)
                      

// @LINE:19
def allReportIndex(): play.api.mvc.HandlerRef[_] = new play.api.mvc.HandlerRef(
   controllers.Reports.allReportIndex(), HandlerDef(this.getClass.getClassLoader, "", "controllers.Reports", "allReportIndex", Seq(), "GET", """""", _prefix + """UsersReports""")
)
                      
    
}
                          

// @LINE:11
// @LINE:10
// @LINE:6
class ReverseApplication {
    

// @LINE:11
def logout(): play.api.mvc.HandlerRef[_] = new play.api.mvc.HandlerRef(
   controllers.Application.logout(), HandlerDef(this.getClass.getClassLoader, "", "controllers.Application", "logout", Seq(), "GET", """""", _prefix + """logout""")
)
                      

// @LINE:6
def index(): play.api.mvc.HandlerRef[_] = new play.api.mvc.HandlerRef(
   controllers.Application.index(), HandlerDef(this.getClass.getClassLoader, "", "controllers.Application", "index", Seq(), "GET", """ Home page""", _prefix + """""")
)
                      

// @LINE:10
def authenticate(): play.api.mvc.HandlerRef[_] = new play.api.mvc.HandlerRef(
   controllers.Application.authenticate(), HandlerDef(this.getClass.getClassLoader, "", "controllers.Application", "authenticate", Seq(), "POST", """""", _prefix + """login""")
)
                      
    
}
                          

// @LINE:15
// @LINE:14
// @LINE:13
class ReverseAttendance {
    

// @LINE:15
def punchOut(): play.api.mvc.HandlerRef[_] = new play.api.mvc.HandlerRef(
   controllers.Attendance.punchOut(), HandlerDef(this.getClass.getClassLoader, "", "controllers.Attendance", "punchOut", Seq(), "POST", """""", _prefix + """attendance/punchOut""")
)
                      

// @LINE:13
def index(): play.api.mvc.HandlerRef[_] = new play.api.mvc.HandlerRef(
   controllers.Attendance.index(), HandlerDef(this.getClass.getClassLoader, "", "controllers.Attendance", "index", Seq(), "GET", """""", _prefix + """attendance""")
)
                      

// @LINE:14
def punchIn(): play.api.mvc.HandlerRef[_] = new play.api.mvc.HandlerRef(
   controllers.Attendance.punchIn(), HandlerDef(this.getClass.getClassLoader, "", "controllers.Attendance", "punchIn", Seq(), "POST", """""", _prefix + """attendance/punchIn""")
)
                      
    
}
                          

// @LINE:8
// @LINE:7
class ReverseDashboard {
    

// @LINE:7
def index(): play.api.mvc.HandlerRef[_] = new play.api.mvc.HandlerRef(
   controllers.Dashboard.index(), HandlerDef(this.getClass.getClassLoader, "", "controllers.Dashboard", "index", Seq(), "GET", """""", _prefix + """dashboard""")
)
                      

// @LINE:8
def admin(): play.api.mvc.HandlerRef[_] = new play.api.mvc.HandlerRef(
   controllers.Dashboard.admin(), HandlerDef(this.getClass.getClassLoader, "", "controllers.Dashboard", "admin", Seq(), "GET", """""", _prefix + """dashboarda""")
)
                      
    
}
                          
}
        

// @LINE:43
// @LINE:26
// @LINE:25
// @LINE:24
// @LINE:23
// @LINE:22
package controllers.account.settings.ref {


// @LINE:43
// @LINE:26
// @LINE:25
class ReverseEmail {
    

// @LINE:43
def validateEmail(token:String): play.api.mvc.HandlerRef[_] = new play.api.mvc.HandlerRef(
   controllers.account.settings.Email.validateEmail(token), HandlerDef(this.getClass.getClassLoader, "", "controllers.account.settings.Email", "validateEmail", Seq(classOf[String]), "GET", """""", _prefix + """email/$token<[^/]+>""")
)
                      

// @LINE:26
def runEmail(): play.api.mvc.HandlerRef[_] = new play.api.mvc.HandlerRef(
   controllers.account.settings.Email.runEmail(), HandlerDef(this.getClass.getClassLoader, "", "controllers.account.settings.Email", "runEmail", Seq(), "POST", """""", _prefix + """settings/email""")
)
                      

// @LINE:25
def index(): play.api.mvc.HandlerRef[_] = new play.api.mvc.HandlerRef(
   controllers.account.settings.Email.index(), HandlerDef(this.getClass.getClassLoader, "", "controllers.account.settings.Email", "index", Seq(), "GET", """""", _prefix + """settings/email""")
)
                      
    
}
                          

// @LINE:24
// @LINE:23
class ReversePassword {
    

// @LINE:23
def index(): play.api.mvc.HandlerRef[_] = new play.api.mvc.HandlerRef(
   controllers.account.settings.Password.index(), HandlerDef(this.getClass.getClassLoader, "", "controllers.account.settings.Password", "index", Seq(), "GET", """""", _prefix + """settings/password""")
)
                      

// @LINE:24
def runPassword(): play.api.mvc.HandlerRef[_] = new play.api.mvc.HandlerRef(
   controllers.account.settings.Password.runPassword(), HandlerDef(this.getClass.getClassLoader, "", "controllers.account.settings.Password", "runPassword", Seq(), "POST", """""", _prefix + """settings/password""")
)
                      
    
}
                          

// @LINE:22
class ReverseIndex {
    

// @LINE:22
def index(): play.api.mvc.HandlerRef[_] = new play.api.mvc.HandlerRef(
   controllers.account.settings.Index.index(), HandlerDef(this.getClass.getClassLoader, "", "controllers.account.settings.Index", "index", Seq(), "GET", """""", _prefix + """settings""")
)
                      
    
}
                          
}
        

// @LINE:41
// @LINE:40
// @LINE:37
// @LINE:36
// @LINE:33
// @LINE:30
// @LINE:29
package controllers.account.ref {


// @LINE:33
// @LINE:30
// @LINE:29
class ReverseSignup {
    

// @LINE:33
def confirm(confirmToken:String): play.api.mvc.HandlerRef[_] = new play.api.mvc.HandlerRef(
   controllers.account.Signup.confirm(confirmToken), HandlerDef(this.getClass.getClassLoader, "", "controllers.account.Signup", "confirm", Seq(classOf[String]), "GET", """ Accessed when the user confirms the registration.""", _prefix + """confirm/$confirmToken<[^/]+>""")
)
                      

// @LINE:30
def save(): play.api.mvc.HandlerRef[_] = new play.api.mvc.HandlerRef(
   controllers.account.Signup.save(), HandlerDef(this.getClass.getClassLoader, "", "controllers.account.Signup", "save", Seq(), "POST", """""", _prefix + """signup""")
)
                      

// @LINE:29
def create(): play.api.mvc.HandlerRef[_] = new play.api.mvc.HandlerRef(
   controllers.account.Signup.create(), HandlerDef(this.getClass.getClassLoader, "", "controllers.account.Signup", "create", Seq(), "GET", """ Registers the user, sending an email to confirm the account.""", _prefix + """signup""")
)
                      
    
}
                          

// @LINE:41
// @LINE:40
// @LINE:37
// @LINE:36
class ReverseReset {
    

// @LINE:41
def runReset(token:String): play.api.mvc.HandlerRef[_] = new play.api.mvc.HandlerRef(
   controllers.account.Reset.runReset(token), HandlerDef(this.getClass.getClassLoader, "", "controllers.account.Reset", "runReset", Seq(classOf[String]), "POST", """""", _prefix + """reset/$token<[^/]+>""")
)
                      

// @LINE:36
def ask(): play.api.mvc.HandlerRef[_] = new play.api.mvc.HandlerRef(
   controllers.account.Reset.ask(), HandlerDef(this.getClass.getClassLoader, "", "controllers.account.Reset", "ask", Seq(), "GET", """ Displays a page to send a reset email given the user's email.""", _prefix + """reset/ask""")
)
                      

// @LINE:40
def reset(token:String): play.api.mvc.HandlerRef[_] = new play.api.mvc.HandlerRef(
   controllers.account.Reset.reset(token), HandlerDef(this.getClass.getClassLoader, "", "controllers.account.Reset", "reset", Seq(classOf[String]), "GET", """ Resets the password using the password.""", _prefix + """reset/$token<[^/]+>""")
)
                      

// @LINE:37
def runAsk(): play.api.mvc.HandlerRef[_] = new play.api.mvc.HandlerRef(
   controllers.account.Reset.runAsk(), HandlerDef(this.getClass.getClassLoader, "", "controllers.account.Reset", "runAsk", Seq(), "POST", """""", _prefix + """reset/ask""")
)
                      
    
}
                          
}
        
    