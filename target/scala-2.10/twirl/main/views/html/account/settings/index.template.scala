
package views.html.account.settings

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
object index extends BaseScalaTemplate[play.twirl.api.HtmlFormat.Appendable,Format[play.twirl.api.HtmlFormat.Appendable]](play.twirl.api.HtmlFormat) with play.twirl.api.Template2[Users,Html,play.twirl.api.HtmlFormat.Appendable] {

  /**/
  def apply/*1.2*/(users: Users)(content: Html):play.twirl.api.HtmlFormat.Appendable = {
      _display_ {

Seq[Any](format.raw/*1.31*/("""

"""),_display_(/*3.2*/main(users)/*3.13*/ {_display_(Seq[Any](format.raw/*3.15*/("""

    """),format.raw/*5.5*/("""<div class="row">
        <div class="col col-lg-4">
            <ul class="nav nav-pills nav-stacked">
                <li>
                    <a href=""""),_display_(/*9.31*/controllers/*9.42*/.account.settings.routes.Password.index),format.raw/*9.81*/("""">"""),_display_(/*9.84*/Messages("password")),format.raw/*9.104*/("""</a>
                </li>
                <li>
                    <a href=""""),_display_(/*12.31*/controllers/*12.42*/.account.settings.routes.Email.index),format.raw/*12.78*/("""">"""),_display_(/*12.81*/Messages("email")),format.raw/*12.98*/("""</a>
                </li>
            </ul>
        </div>
        <div class="col col-lg-8">
        """),_display_(/*17.10*/content),format.raw/*17.17*/("""
        """),format.raw/*18.9*/("""</div>
    </div>
""")))}))}
  }

  def render(users:Users,content:Html): play.twirl.api.HtmlFormat.Appendable = apply(users)(content)

  def f:((Users) => (Html) => play.twirl.api.HtmlFormat.Appendable) = (users) => (content) => apply(users)(content)

  def ref: this.type = this

}
              /*
                  -- GENERATED --
                  DATE: Wed Dec 24 14:58:40 IST 2014
                  SOURCE: /home/anshika/play/SaralHRM/app/views/account/settings/index.scala.html
                  HASH: 36410d0e0f0d34ea2d5c240a373e6c2d2453fd64
                  MATRIX: 744->1|861->30|889->33|908->44|947->46|979->52|1160->207|1179->218|1238->257|1267->260|1308->280|1413->358|1433->369|1490->405|1520->408|1558->425|1689->529|1717->536|1753->545
                  LINES: 26->1|29->1|31->3|31->3|31->3|33->5|37->9|37->9|37->9|37->9|37->9|40->12|40->12|40->12|40->12|40->12|45->17|45->17|46->18
                  -- GENERATED --
              */
          