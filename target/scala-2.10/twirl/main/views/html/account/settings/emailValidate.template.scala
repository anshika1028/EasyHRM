
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
object emailValidate extends BaseScalaTemplate[play.twirl.api.HtmlFormat.Appendable,Format[play.twirl.api.HtmlFormat.Appendable]](play.twirl.api.HtmlFormat) with play.twirl.api.Template1[Users,play.twirl.api.HtmlFormat.Appendable] {

  /**/
  def apply/*1.2*/(users: Users):play.twirl.api.HtmlFormat.Appendable = {
      _display_ {import helper._

Seq[Any](format.raw/*1.16*/("""

"""),format.raw/*4.1*/("""
"""),_display_(/*5.2*/index(users)/*5.14*/ {_display_(Seq[Any](format.raw/*5.16*/("""

    """),_display_(/*7.6*/wflash()),format.raw/*7.14*/("""

""")))}))}
  }

  def render(users:Users): play.twirl.api.HtmlFormat.Appendable = apply(users)

  def f:((Users) => play.twirl.api.HtmlFormat.Appendable) = (users) => apply(users)

  def ref: this.type = this

}
              /*
                  -- GENERATED --
                  DATE: Wed Dec 24 14:58:40 IST 2014
                  SOURCE: /home/anshika/play/SaralHRM/app/views/account/settings/emailValidate.scala.html
                  HASH: f6bcff77695bb494ecb947bb6f43da089525b662
                  MATRIX: 747->1|864->15|892->34|919->36|939->48|978->50|1010->57|1038->65
                  LINES: 26->1|29->1|31->4|32->5|32->5|32->5|34->7|34->7
                  -- GENERATED --
              */
          