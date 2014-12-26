
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
object AllReportIndex extends BaseScalaTemplate[play.twirl.api.HtmlFormat.Appendable,Format[play.twirl.api.HtmlFormat.Appendable]](play.twirl.api.HtmlFormat) with play.twirl.api.Template4[Users,Form[controllers.Reports.UsersReportForm],List[models.Users],List[models.Users],play.twirl.api.HtmlFormat.Appendable] {

  /**/
  def apply/*1.2*/(user: Users,reportForm:Form[controllers.Reports.UsersReportForm],usersname:List[models.Users],usersdetails:List[models.Users]):play.twirl.api.HtmlFormat.Appendable = {
      _display_ {import helper._

Seq[Any](format.raw/*1.129*/("""


"""),format.raw/*5.1*/("""
"""),_display_(/*6.2*/main(user)/*6.12*/ {_display_(Seq[Any](format.raw/*6.14*/("""
"""),_display_(/*7.2*/wflash()),format.raw/*7.10*/("""
"""),format.raw/*8.1*/("""<h3>Report</h3>
<div class="span12">
    <div class="well">
        """),_display_(/*11.10*/Allreport(reportForm,usersname)),format.raw/*11.41*/("""


    """),format.raw/*14.5*/("""</div>
</div>

    """),_display_(/*17.6*/if(usersdetails!=null)/*17.28*/{_display_(Seq[Any](format.raw/*17.29*/("""

"""),_display_(/*19.2*/AllviewReport(usersdetails)),format.raw/*19.29*/("""
    """)))}),format.raw/*20.6*/("""
""")))}),format.raw/*21.2*/("""
"""))}
  }

  def render(user:Users,reportForm:Form[controllers.Reports.UsersReportForm],usersname:List[models.Users],usersdetails:List[models.Users]): play.twirl.api.HtmlFormat.Appendable = apply(user,reportForm,usersname,usersdetails)

  def f:((Users,Form[controllers.Reports.UsersReportForm],List[models.Users],List[models.Users]) => play.twirl.api.HtmlFormat.Appendable) = (user,reportForm,usersname,usersdetails) => apply(user,reportForm,usersname,usersdetails)

  def ref: this.type = this

}
              /*
                  -- GENERATED --
                  DATE: Fri Dec 26 11:33:51 IST 2014
                  SOURCE: /home/anshika/play/SaralHRM/app/views/reports/AllReportIndex.scala.html
                  HASH: 4f283a3969ba2a7399a134d40587a7160a259d21
                  MATRIX: 819->1|1050->128|1079->148|1106->150|1124->160|1163->162|1190->164|1218->172|1245->173|1341->242|1393->273|1427->280|1473->300|1504->322|1543->323|1572->326|1620->353|1656->359|1688->361
                  LINES: 26->1|29->1|32->5|33->6|33->6|33->6|34->7|34->7|35->8|38->11|38->11|41->14|44->17|44->17|44->17|46->19|46->19|47->20|48->21
                  -- GENERATED --
              */
          