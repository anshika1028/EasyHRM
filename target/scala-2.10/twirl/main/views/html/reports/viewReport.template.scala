
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
object viewReport extends BaseScalaTemplate[play.twirl.api.HtmlFormat.Appendable,Format[play.twirl.api.HtmlFormat.Appendable]](play.twirl.api.HtmlFormat) with play.twirl.api.Template1[List[models.Records],play.twirl.api.HtmlFormat.Appendable] {

  /**/
  def apply/*1.2*/(list:List[models.Records]):play.twirl.api.HtmlFormat.Appendable = {
      _display_ {import helper._
def /*7.2*/sum/*7.5*/(a:Long,b:Long):play.twirl.api.HtmlFormat.Appendable = {_display_(

Seq[Any](format.raw/*7.24*/("""
"""),_display_(/*8.2*/((a - b)/60000 % 60)),format.raw/*8.22*/("""

""")))};def /*11.2*/dum/*11.5*/(a:Long,b:Long):play.twirl.api.HtmlFormat.Appendable = {_display_(

Seq[Any](format.raw/*11.24*/("""
"""),_display_(/*12.2*/((a - b)/3600000 % 60)),format.raw/*12.24*/("""

""")))};implicit def /*4.2*/implicitFieldConstructor/*4.26*/ = {{ FieldConstructor(twitterBootstrapInput.render) }};
Seq[Any](format.raw/*1.29*/("""

"""),format.raw/*4.80*/("""


"""),format.raw/*10.2*/("""
"""),format.raw/*14.2*/("""



"""),_display_(/*18.2*/if(list.isEmpty())/*18.20*/{_display_(Seq[Any](format.raw/*18.21*/("""

"""),format.raw/*20.1*/("""<div>No record found.</div>

""")))}/*22.2*/else/*22.6*/{_display_(Seq[Any](format.raw/*22.7*/("""

"""),format.raw/*24.1*/("""<table border="2"><tr>
    <td><h3>In Date</h3></td>
    <td><h3>In Time</h3></td>
    <td><h3>In Note</h3></td>
    <td><h3>Out Date</h3> </td>
    <td><h3>Out Time</h3> </td>
    <td><h3>Out Note</h3></td>
    <td><h3>Total Time</h3></td>
</tr>

    """),_display_(/*34.6*/for(r <- list) yield /*34.20*/ {_display_(Seq[Any](format.raw/*34.22*/("""
    """),_display_(/*35.6*/if(r.date_punch_out!=null)/*35.32*/{_display_(Seq[Any](format.raw/*35.33*/("""
    """),format.raw/*36.5*/("""<tr>
        <td>"""),_display_(/*37.14*/("%1$tY-%1$tm-%1$td".format(r.date_punch_in.getTime()))),format.raw/*37.69*/("""</td>
        <td>"""),_display_(/*38.14*/("%1$tH:%1$tM".format(r.date_punch_in.getTime()))),format.raw/*38.63*/("""</td>
        <td>"""),_display_(/*39.14*/r/*39.15*/.note1),format.raw/*39.21*/("""</td>
        <td>"""),_display_(/*40.14*/("%1$tY-%1$tm-%1$td".format(r.date_punch_out.getTime()))),format.raw/*40.70*/("""</td>
        <td>"""),_display_(/*41.14*/("%1$tH:%1$tM".format(r.date_punch_out.getTime()))),format.raw/*41.64*/("""</td>

        <td>"""),_display_(/*43.14*/r/*43.15*/.note2),format.raw/*43.21*/("""</td>
        <td > """),_display_(/*44.16*/dum( r.date_punch_out.getTime(),r.date_punch_in.getTime())),format.raw/*44.74*/(""":"""),_display_(/*44.76*/sum( r.date_punch_out.getTime(),r.date_punch_in.getTime())),format.raw/*44.134*/(""" """),format.raw/*44.135*/("""</td>
    </tr>
""")))}),format.raw/*46.2*/("""
    """)))}),format.raw/*47.6*/("""



"""),format.raw/*51.1*/("""</table>

""")))}),format.raw/*53.2*/("""







"""))}
  }

  def render(list:List[models.Records]): play.twirl.api.HtmlFormat.Appendable = apply(list)

  def f:((List[models.Records]) => play.twirl.api.HtmlFormat.Appendable) = (list) => apply(list)

  def ref: this.type = this

}
              /*
                  -- GENERATED --
                  DATE: Fri Dec 26 11:49:18 IST 2014
                  SOURCE: /home/anshika/play/SaralHRM/app/views/reports/viewReport.scala.html
                  HASH: abbae2cd2f1812d53dcf7f9cf4843e209133c1b8
                  MATRIX: 750->1|863->130|873->133|968->152|995->154|1035->174|1061->179|1072->182|1168->201|1196->203|1239->225|1273->48|1305->72|1389->28|1418->126|1448->177|1476->228|1507->233|1534->251|1573->252|1602->254|1650->284|1662->288|1700->289|1729->291|2008->544|2038->558|2078->560|2110->566|2145->592|2184->593|2216->598|2261->616|2337->671|2383->690|2453->739|2499->758|2509->759|2536->765|2582->784|2659->840|2705->859|2776->909|2823->929|2833->930|2860->936|2908->957|2987->1015|3016->1017|3096->1075|3126->1076|3173->1093|3209->1099|3240->1103|3281->1114
                  LINES: 26->1|28->7|28->7|30->7|31->8|31->8|33->11|33->11|35->11|36->12|36->12|38->4|38->4|39->1|41->4|44->10|45->14|49->18|49->18|49->18|51->20|53->22|53->22|53->22|55->24|65->34|65->34|65->34|66->35|66->35|66->35|67->36|68->37|68->37|69->38|69->38|70->39|70->39|70->39|71->40|71->40|72->41|72->41|74->43|74->43|74->43|75->44|75->44|75->44|75->44|75->44|77->46|78->47|82->51|84->53
                  -- GENERATED --
              */
          