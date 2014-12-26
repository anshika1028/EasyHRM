
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
object index extends BaseScalaTemplate[play.twirl.api.HtmlFormat.Appendable,Format[play.twirl.api.HtmlFormat.Appendable]](play.twirl.api.HtmlFormat) with play.twirl.api.Template3[Users,Form[controllers.Reports.ReportForm],List[models.Records],play.twirl.api.HtmlFormat.Appendable] {

  /**/
  def apply/*1.2*/(users: Users,reportForm:Form[controllers.Reports.ReportForm],list:List[models.Records]):play.twirl.api.HtmlFormat.Appendable = {
      _display_ {import helper._

Seq[Any](format.raw/*1.90*/("""


"""),format.raw/*5.1*/("""
"""),_display_(/*6.2*/main(users)/*6.13*/ {_display_(Seq[Any](format.raw/*6.15*/("""
"""),_display_(/*7.2*/wflash()),format.raw/*7.10*/("""
"""),format.raw/*8.1*/("""<h3>Report</h3>
<div class="span12">
    <div class="well">
        """),_display_(/*11.10*/report(reportForm)),format.raw/*11.28*/("""


    """),format.raw/*14.5*/("""</div>
</div>

    """),_display_(/*17.6*/if(list!=null)/*17.20*/{_display_(Seq[Any](format.raw/*17.21*/("""

"""),_display_(/*19.2*/viewReport(list)),format.raw/*19.18*/("""
    """)))}),format.raw/*20.6*/("""

""")))}))}
  }

  def render(users:Users,reportForm:Form[controllers.Reports.ReportForm],list:List[models.Records]): play.twirl.api.HtmlFormat.Appendable = apply(users,reportForm,list)

  def f:((Users,Form[controllers.Reports.ReportForm],List[models.Records]) => play.twirl.api.HtmlFormat.Appendable) = (users,reportForm,list) => apply(users,reportForm,list)

  def ref: this.type = this

}
              /*
                  -- GENERATED --
                  DATE: Wed Dec 24 14:58:40 IST 2014
                  SOURCE: /home/anshika/play/SaralHRM/app/views/reports/index.scala.html
                  HASH: aeaba22de3cb0d92c713a621ed0b372c815b5082
                  MATRIX: 788->1|979->89|1008->109|1035->111|1054->122|1093->124|1120->126|1148->134|1175->135|1271->204|1310->222|1344->229|1390->249|1413->263|1452->264|1481->267|1518->283|1554->289
                  LINES: 26->1|29->1|32->5|33->6|33->6|33->6|34->7|34->7|35->8|38->11|38->11|41->14|44->17|44->17|44->17|46->19|46->19|47->20
                  -- GENERATED --
              */
          