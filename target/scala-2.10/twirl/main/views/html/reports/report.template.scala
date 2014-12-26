
package views.html.reports

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
object report extends BaseScalaTemplate[play.twirl.api.HtmlFormat.Appendable,Format[play.twirl.api.HtmlFormat.Appendable]](play.twirl.api.HtmlFormat) with play.twirl.api.Template1[Form[controllers.Reports.ReportForm],play.twirl.api.HtmlFormat.Appendable] {

  /**/
  def apply/*1.2*/(reportForm:Form[controllers.Reports.ReportForm]):play.twirl.api.HtmlFormat.Appendable = {
      _display_ {import helper._
implicit def /*4.2*/implicitFieldConstructor/*4.26*/ = {{ FieldConstructor(twitterBootstrapInput.render) }};
Seq[Any](format.raw/*1.51*/("""

"""),format.raw/*4.80*/("""



"""),_display_(/*8.2*/form(routes.Reports.viewReport())/*8.35*/ {_display_(Seq[Any](format.raw/*8.37*/("""

"""),format.raw/*10.1*/("""<fieldset>


<table><tr>
    <td>
        """),_display_(/*15.10*/inputText(
        reportForm("date1"),
        '_label -> "Date1",
        'type -> "date",
        'class -> "form-control"

        )),format.raw/*21.10*/("""
    """),format.raw/*22.5*/("""</td>
    <td>
        """),_display_(/*24.10*/inputText(
        reportForm("date2"),

        '_label -> "Date2",
        'type -> "date",
        'class -> "form-control"

        )),format.raw/*31.10*/("""
    """),format.raw/*32.5*/("""</td>
    <td>


            <input type="submit" class="btn btn-primary" value="Generate">

    </td>
</tr></table>




</fieldset>


""")))}),format.raw/*47.2*/("""

"""))}
  }

  def render(reportForm:Form[controllers.Reports.ReportForm]): play.twirl.api.HtmlFormat.Appendable = apply(reportForm)

  def f:((Form[controllers.Reports.ReportForm]) => play.twirl.api.HtmlFormat.Appendable) = (reportForm) => apply(reportForm)

  def ref: this.type = this

}
              /*
                  -- GENERATED --
                  DATE: Wed Dec 24 14:58:40 IST 2014
                  SOURCE: /home/anshika/play/SaralHRM/app/views/reports/report.scala.html
                  HASH: d0d9b96d64138426753a4895106bb7a4e4c464b6
                  MATRIX: 762->1|906->70|938->94|1022->50|1051->148|1081->153|1122->186|1161->188|1190->190|1260->233|1417->369|1449->374|1500->398|1658->535|1690->540|1856->676
                  LINES: 26->1|28->4|28->4|29->1|31->4|35->8|35->8|35->8|37->10|42->15|48->21|49->22|51->24|58->31|59->32|74->47
                  -- GENERATED --
              */
          