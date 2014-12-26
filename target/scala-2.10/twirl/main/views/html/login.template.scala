
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
object login extends BaseScalaTemplate[play.twirl.api.HtmlFormat.Appendable,Format[play.twirl.api.HtmlFormat.Appendable]](play.twirl.api.HtmlFormat) with play.twirl.api.Template1[Form[Application.Login],play.twirl.api.HtmlFormat.Appendable] {

  /**/
  def apply/*1.2*/(loginForm: Form[Application.Login]):play.twirl.api.HtmlFormat.Appendable = {
      _display_ {import helper._
implicit def /*4.2*/implicitFieldConstructor/*4.26*/ = {{ FieldConstructor(twitterBootstrapInput.render) }};
Seq[Any](format.raw/*1.38*/("""

"""),format.raw/*4.80*/("""

"""),format.raw/*6.1*/("""<h3>"""),_display_(/*6.6*/Messages("signin.signin")),format.raw/*6.31*/("""</h3>

"""),_display_(/*8.2*/form(routes.Application.authenticate(), 'class -> "form")/*8.59*/ {_display_(Seq[Any](format.raw/*8.61*/("""

    """),_display_(/*10.6*/if(loginForm.hasGlobalErrors)/*10.35*/ {_display_(Seq[Any](format.raw/*10.37*/("""
        """),format.raw/*11.9*/("""<p class="error">
            <span class="label label-danger">"""),_display_(/*12.47*/loginForm/*12.56*/.globalError.message),format.raw/*12.76*/("""</span>
        </p>
    """)))}),format.raw/*14.6*/("""

    """),format.raw/*16.5*/("""<fieldset>
        """),_display_(/*17.10*/inputText(
            loginForm("username"),
            'placeholder -> Messages("username"),
            '_label -> null,
            '_help -> Messages("signin.your.username"),
            'class -> "form-control"
        )),format.raw/*23.10*/("""
        """),_display_(/*24.10*/inputPassword(
            loginForm("password"),
            '_label -> null,
            'placeholder -> Messages("password"),
            '_help -> Messages("signin.your.password"),
            'class -> "form-control"
        )),format.raw/*30.10*/("""
    """),format.raw/*31.5*/("""</fieldset>

    <div class="form-actions">
        <input type="submit" class="btn btn-primary" value=""""),_display_(/*34.62*/Messages("signin.signin")),format.raw/*34.87*/("""">
        <small><a href=""""),_display_(/*35.26*/controllers/*35.37*/.account.routes.Reset.ask),format.raw/*35.62*/("""">"""),_display_(/*35.65*/Messages("forgot.password")),format.raw/*35.92*/("""</a></small>
    </div>
""")))}),format.raw/*37.2*/("""
"""))}
  }

  def render(loginForm:Form[Application.Login]): play.twirl.api.HtmlFormat.Appendable = apply(loginForm)

  def f:((Form[Application.Login]) => play.twirl.api.HtmlFormat.Appendable) = (loginForm) => apply(loginForm)

  def ref: this.type = this

}
              /*
                  -- GENERATED --
                  DATE: Wed Dec 24 14:58:40 IST 2014
                  SOURCE: /home/anshika/play/SaralHRM/app/views/login.scala.html
                  HASH: a591ac4cc4f7816305059f3d3cc01f9f20643755
                  MATRIX: 740->1|871->57|903->81|987->37|1016->135|1044->137|1074->142|1119->167|1152->175|1217->232|1256->234|1289->241|1327->270|1367->272|1403->281|1494->345|1512->354|1553->374|1609->400|1642->406|1689->426|1937->653|1974->663|2226->894|2258->899|2390->1004|2436->1029|2491->1057|2511->1068|2557->1093|2587->1096|2635->1123|2690->1148
                  LINES: 26->1|28->4|28->4|29->1|31->4|33->6|33->6|33->6|35->8|35->8|35->8|37->10|37->10|37->10|38->11|39->12|39->12|39->12|41->14|43->16|44->17|50->23|51->24|57->30|58->31|61->34|61->34|62->35|62->35|62->35|62->35|62->35|64->37
                  -- GENERATED --
              */
          