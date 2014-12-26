
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
object Allreport extends BaseScalaTemplate[play.twirl.api.HtmlFormat.Appendable,Format[play.twirl.api.HtmlFormat.Appendable]](play.twirl.api.HtmlFormat) with play.twirl.api.Template2[Form[controllers.Reports.UsersReportForm],List[models.Users],play.twirl.api.HtmlFormat.Appendable] {

  /**/
  def apply/*1.2*/(reportForm:Form[controllers.Reports.UsersReportForm],list:List[models.Users]):play.twirl.api.HtmlFormat.Appendable = {
      _display_ {import helper._
implicit def /*4.2*/implicitFieldConstructor/*4.26*/ = {{ FieldConstructor(twitterBootstrapInput.render) }};
Seq[Any](format.raw/*1.80*/("""

"""),format.raw/*4.80*/("""



"""),_display_(/*8.2*/form(routes.Reports.viewAllReport())/*8.38*/ {_display_(Seq[Any](format.raw/*8.40*/("""

"""),format.raw/*10.1*/("""<fieldset>


<table><tr>
    <td>

        <select  name="user" class="form-control">

            <option value="0">All</option>

            """),_display_(/*20.14*/for(u <- list) yield /*20.28*/ {_display_(Seq[Any](format.raw/*20.30*/("""


            """),format.raw/*23.13*/("""<option value=""""),_display_(/*23.29*/u/*23.30*/.id),format.raw/*23.33*/("""" """),_display_(/*23.36*/if(u.id.toString().equals(reportForm("user").value.toString()))/*23.99*/{_display_(Seq[Any](format.raw/*23.100*/("""

                    """),format.raw/*25.21*/("""selected="selected"
                    """)))}),format.raw/*26.22*/(""" """),format.raw/*26.23*/(""">
                """),_display_(/*27.18*/u/*27.19*/.fullname),format.raw/*27.28*/("""</option>
""")))}),format.raw/*28.2*/("""
        """),format.raw/*29.9*/("""</select>
    </td>
    <td>
        """),_display_(/*32.10*/inputText(
        reportForm("date1"),
        '_label -> "Date1",
        'type -> "date",
        'class -> "form-control"

        )),format.raw/*38.10*/("""
    """),format.raw/*39.5*/("""</td>
    <td>
        """),_display_(/*41.10*/inputText(
        reportForm("date2"),

        '_label -> "Date2",
        'type -> "date",
        'class -> "form-control"

        )),format.raw/*48.10*/("""
    """),format.raw/*49.5*/("""</td>
    <td>


            <input type="submit" class="btn btn-primary" value="Generate">

    </td>
</tr></table>




</fieldset>


""")))}),format.raw/*64.2*/("""

"""))}
  }

  def render(reportForm:Form[controllers.Reports.UsersReportForm],list:List[models.Users]): play.twirl.api.HtmlFormat.Appendable = apply(reportForm,list)

  def f:((Form[controllers.Reports.UsersReportForm],List[models.Users]) => play.twirl.api.HtmlFormat.Appendable) = (reportForm,list) => apply(reportForm,list)

  def ref: this.type = this

}
              /*
                  -- GENERATED --
                  DATE: Fri Dec 26 11:08:24 IST 2014
                  SOURCE: /home/anshika/play/SaralHRM/app/views/reports/Allreport.scala.html
                  HASH: dd2afd1062fc3aed5171173dd12a15d7e3003ed1
                  MATRIX: 789->1|962->99|994->123|1078->79|1107->177|1137->182|1181->218|1220->220|1249->222|1420->366|1450->380|1490->382|1533->397|1576->413|1586->414|1610->417|1640->420|1712->483|1752->484|1802->506|1874->547|1903->548|1949->567|1959->568|1989->577|2030->588|2066->597|2131->635|2288->771|2320->776|2371->800|2529->937|2561->942|2727->1078
                  LINES: 26->1|28->4|28->4|29->1|31->4|35->8|35->8|35->8|37->10|47->20|47->20|47->20|50->23|50->23|50->23|50->23|50->23|50->23|50->23|52->25|53->26|53->26|54->27|54->27|54->27|55->28|56->29|59->32|65->38|66->39|68->41|75->48|76->49|91->64
                  -- GENERATED --
              */
          