
package views.html.account.signup

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
object create extends BaseScalaTemplate[play.twirl.api.HtmlFormat.Appendable,Format[play.twirl.api.HtmlFormat.Appendable]](play.twirl.api.HtmlFormat) with play.twirl.api.Template1[Form[Application.Register],play.twirl.api.HtmlFormat.Appendable] {

  /**/
  def apply/*1.2*/(signupForm: Form[Application.Register]):play.twirl.api.HtmlFormat.Appendable = {
      _display_ {
def /*3.6*/scripts/*3.13*/:play.twirl.api.HtmlFormat.Appendable = {_display_(

Seq[Any](format.raw/*3.17*/("""
        """),format.raw/*4.9*/("""<script src=""""),_display_(/*4.23*/routes/*4.29*/.Assets.at("javascripts/password.js")),format.raw/*4.66*/("""" type="text/javascript"></script>
    """)))};
Seq[Any](format.raw/*1.42*/("""

    """),format.raw/*5.6*/("""

"""),_display_(/*7.2*/main(Users.findByUserName(request().username()), scripts)/*7.59*/ {_display_(Seq[Any](format.raw/*7.61*/("""

    """),format.raw/*9.5*/("""<div class="span3">
            &nbsp;

    </div>

    <div class="span12">
        <div class="well">
        """),_display_(/*16.10*/createFormOnly(signupForm)),format.raw/*16.36*/("""
        """),format.raw/*17.9*/("""</div>
    </div>
""")))}))}
  }

  def render(signupForm:Form[Application.Register]): play.twirl.api.HtmlFormat.Appendable = apply(signupForm)

  def f:((Form[Application.Register]) => play.twirl.api.HtmlFormat.Appendable) = (signupForm) => apply(signupForm)

  def ref: this.type = this

}
              /*
                  -- GENERATED --
                  DATE: Wed Dec 24 14:58:40 IST 2014
                  SOURCE: /home/anshika/play/SaralHRM/app/views/account/signup/create.scala.html
                  HASH: 54f7828a85f539f1bde007a68ac97870143d84e9
                  MATRIX: 759->1|870->48|885->55|965->59|1000->68|1040->82|1054->88|1111->125|1190->41|1222->165|1250->168|1315->225|1354->227|1386->233|1526->346|1573->372|1609->381
                  LINES: 26->1|28->3|28->3|30->3|31->4|31->4|31->4|31->4|33->1|35->5|37->7|37->7|37->7|39->9|46->16|46->16|47->17
                  -- GENERATED --
              */
          