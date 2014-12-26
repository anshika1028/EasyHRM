
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
object password extends BaseScalaTemplate[play.twirl.api.HtmlFormat.Appendable,Format[play.twirl.api.HtmlFormat.Appendable]](play.twirl.api.HtmlFormat) with play.twirl.api.Template1[Users,play.twirl.api.HtmlFormat.Appendable] {

  /**/
  def apply/*1.2*/(users: Users):play.twirl.api.HtmlFormat.Appendable = {
      _display_ {import helper._

Seq[Any](format.raw/*1.16*/("""

"""),format.raw/*4.1*/("""
"""),_display_(/*5.2*/index(users)/*5.14*/ {_display_(Seq[Any](format.raw/*5.16*/("""

    """),_display_(/*7.6*/Messages("account.settings.password")),format.raw/*7.43*/("""

    """),_display_(/*9.6*/wflash()),format.raw/*9.14*/("""

    """),_display_(/*11.6*/form(controllers.account.settings.routes.Password.runPassword())/*11.70*/ {_display_(Seq[Any](format.raw/*11.72*/("""
        """),format.raw/*12.9*/("""<div class="form-actions">
            <input type="submit" class="btn btn-primary" value=""""),_display_(/*13.66*/Messages("reset")),format.raw/*13.83*/("""">
        </div>
    """)))}),format.raw/*15.6*/("""

""")))}))}
  }

  def render(users:Users): play.twirl.api.HtmlFormat.Appendable = apply(users)

  def f:((Users) => play.twirl.api.HtmlFormat.Appendable) = (users) => apply(users)

  def ref: this.type = this

}
              /*
                  -- GENERATED --
                  DATE: Wed Dec 24 14:58:40 IST 2014
                  SOURCE: /home/anshika/play/SaralHRM/app/views/account/settings/password.scala.html
                  HASH: fcefff19998cf950615025a8ba6c4d907c2c02ce
                  MATRIX: 742->1|859->15|887->34|914->36|934->48|973->50|1005->57|1062->94|1094->101|1122->109|1155->116|1228->180|1268->182|1304->191|1423->283|1461->300|1514->323
                  LINES: 26->1|29->1|31->4|32->5|32->5|32->5|34->7|34->7|36->9|36->9|38->11|38->11|38->11|39->12|40->13|40->13|42->15
                  -- GENERATED --
              */
          