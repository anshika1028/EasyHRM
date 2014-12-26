
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
object email extends BaseScalaTemplate[play.twirl.api.HtmlFormat.Appendable,Format[play.twirl.api.HtmlFormat.Appendable]](play.twirl.api.HtmlFormat) with play.twirl.api.Template2[Users,Form[controllers.account.settings.Email.AskForm],play.twirl.api.HtmlFormat.Appendable] {

  /**/
  def apply/*1.2*/(users: Users, askForm: Form[controllers.account.settings.Email.AskForm]):play.twirl.api.HtmlFormat.Appendable = {
      _display_ {import helper._

Seq[Any](format.raw/*1.75*/("""

"""),format.raw/*4.1*/("""
"""),_display_(/*5.2*/index(users)/*5.14*/ {_display_(Seq[Any](format.raw/*5.16*/("""

    """),_display_(/*7.6*/Messages("account.settings.email")),format.raw/*7.40*/("""

    """),_display_(/*9.6*/wflash()),format.raw/*9.14*/("""

    """),_display_(/*11.6*/form(controllers.account.settings.routes.Email.runEmail())/*11.64*/ {_display_(Seq[Any](format.raw/*11.66*/("""

        """),format.raw/*13.9*/("""<fieldset>
        """),_display_(/*14.10*/inputText(
            askForm("email"),
            'placeholder -> Messages("email"),
            '_label -> null,
            'class -> "form-control"
        )),format.raw/*19.10*/("""
        """),format.raw/*20.9*/("""</fieldset>

        <div class="form-actions">
            <input type="submit" class="btn btn-primary" value=""""),_display_(/*23.66*/Messages("validate")),format.raw/*23.86*/("""">
        </div>
    """)))}),format.raw/*25.6*/("""

""")))}))}
  }

  def render(users:Users,askForm:Form[controllers.account.settings.Email.AskForm]): play.twirl.api.HtmlFormat.Appendable = apply(users,askForm)

  def f:((Users,Form[controllers.account.settings.Email.AskForm]) => play.twirl.api.HtmlFormat.Appendable) = (users,askForm) => apply(users,askForm)

  def ref: this.type = this

}
              /*
                  -- GENERATED --
                  DATE: Wed Dec 24 14:58:40 IST 2014
                  SOURCE: /home/anshika/play/SaralHRM/app/views/account/settings/email.scala.html
                  HASH: a95bd9b02af01edcf1a7c47063f72addb5ebcdfc
                  MATRIX: 788->1|964->74|992->93|1019->95|1039->107|1078->109|1110->116|1164->150|1196->157|1224->165|1257->172|1324->230|1364->232|1401->242|1448->262|1632->425|1668->434|1808->547|1849->567|1902->590
                  LINES: 26->1|29->1|31->4|32->5|32->5|32->5|34->7|34->7|36->9|36->9|38->11|38->11|38->11|40->13|41->14|46->19|47->20|50->23|50->23|52->25
                  -- GENERATED --
              */
          