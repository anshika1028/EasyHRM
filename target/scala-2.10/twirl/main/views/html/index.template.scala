
package views.html

import play.twirl.api._
import play.twirl.api.TemplateMagic._

import play.api.templates.PlayMagic._
import models._
import controllers._
import java.lang._
import java.util._
import scala.collection.JavaConversions._
import scala.collection.JavaConverters._
import play.api.i18n._
import play.core.j.PlayMagicForJava._
import play.mvc._
import play.data._
import play.api.data.Field
import play.mvc.Http.Context.Implicit._
import views.html._

/**/
object index extends BaseScalaTemplate[play.twirl.api.HtmlFormat.Appendable,Format[play.twirl.api.HtmlFormat.Appendable]](play.twirl.api.HtmlFormat) with play.twirl.api.Template2[Form[Application.Register],Form[Application.Login],play.twirl.api.HtmlFormat.Appendable] {

  /**/
  def apply/*1.2*/(signupForm: Form[Application.Register], loginForm: Form[Application.Login]):play.twirl.api.HtmlFormat.Appendable = {
      _display_ {
def /*3.2*/scripts/*3.9*/:play.twirl.api.HtmlFormat.Appendable = {_display_(

Seq[Any](format.raw/*3.13*/("""
    """),format.raw/*4.5*/("""<script src=""""),_display_(/*4.19*/routes/*4.25*/.Assets.at("javascripts/password.js")),format.raw/*4.62*/("""" type="text/javascript"></script>
""")))};
Seq[Any](format.raw/*1.78*/("""

"""),format.raw/*5.2*/("""

"""),_display_(/*7.2*/main(null, scripts)/*7.21*/ {_display_(Seq[Any](format.raw/*7.23*/("""

  """),_display_(/*9.4*/wflash()),format.raw/*9.12*/("""
  """),format.raw/*10.3*/("""<div class="col-lg-6">
   Saral HRM comes as a comprehensive solution for the efficient management and development of your Human Resource.  It will assist you in the complex and strategic process of managing this crucial resource of your enterprise. Based on modular architecture, it facilitates a vast range of HR activities, with features that reflect the main HR management activities. It comes as a web-enabled application and considering the available flexibility, Saral HRM is a perfect platform for reengineering your HR processes and achieving a new level of HR Management.
  <br>
  <img src=""""),_display_(/*13.14*/routes/*13.20*/.Assets.at("images/hrm.png")),format.raw/*13.48*/("""" alt="images234" height="300" width="550"/>
  </div>

  <div class="col-lg-6">
    <div class="well">
      """),_display_(/*18.8*/login(loginForm)),format.raw/*18.24*/("""
    """),format.raw/*19.5*/("""</div>

   <!-- <div class="well">
      """),_display_(/*22.8*/account/*22.15*/.signup.createFormOnly(signupForm)),format.raw/*22.49*/("""
    """),format.raw/*23.5*/("""</div>-->
  </div>
""")))}))}
  }

  def render(signupForm:Form[Application.Register],loginForm:Form[Application.Login]): play.twirl.api.HtmlFormat.Appendable = apply(signupForm,loginForm)

  def f:((Form[Application.Register],Form[Application.Login]) => play.twirl.api.HtmlFormat.Appendable) = (signupForm,loginForm) => apply(signupForm,loginForm)

  def ref: this.type = this

}
              /*
                  -- GENERATED --
                  DATE: Wed Dec 24 14:58:40 IST 2014
                  SOURCE: /home/anshika/play/SaralHRM/app/views/index.scala.html
                  HASH: 482b763f2dfebb4f30cbd7d2d509f56910a28c9e
                  MATRIX: 767->1|914->80|928->87|1008->91|1039->96|1079->110|1093->116|1150->153|1225->77|1253->189|1281->192|1308->211|1347->213|1377->218|1405->226|1435->229|2064->831|2079->837|2128->865|2264->975|2301->991|2333->996|2401->1038|2417->1045|2472->1079|2504->1084
                  LINES: 26->1|28->3|28->3|30->3|31->4|31->4|31->4|31->4|33->1|35->5|37->7|37->7|37->7|39->9|39->9|40->10|43->13|43->13|43->13|48->18|48->18|49->19|52->22|52->22|52->22|53->23
                  -- GENERATED --
              */
          