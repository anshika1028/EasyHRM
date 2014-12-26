
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
object AllviewReport extends BaseScalaTemplate[play.twirl.api.HtmlFormat.Appendable,Format[play.twirl.api.HtmlFormat.Appendable]](play.twirl.api.HtmlFormat) with play.twirl.api.Template1[List[models.Users],play.twirl.api.HtmlFormat.Appendable] {

  /**/
  def apply/*1.2*/(list:List[models.Users]):play.twirl.api.HtmlFormat.Appendable = {
      _display_ {import helper._
def /*8.2*/sum/*8.5*/(a:Long,b:Long):play.twirl.api.HtmlFormat.Appendable = {_display_(

Seq[Any](format.raw/*8.24*/("""
"""),_display_(/*9.2*/((a - b)/60000 % 60)),format.raw/*9.22*/("""

""")))};def /*12.2*/dum/*12.5*/(a:Long,b:Long):play.twirl.api.HtmlFormat.Appendable = {_display_(

Seq[Any](format.raw/*12.24*/("""
"""),_display_(/*13.2*/((a - b)/3600000 % 60)),format.raw/*13.24*/("""

""")))};implicit def /*4.2*/implicitFieldConstructor/*4.26*/ = {{ FieldConstructor(twitterBootstrapInput.render) }};
Seq[Any](format.raw/*1.27*/("""

"""),format.raw/*4.80*/("""



"""),format.raw/*11.2*/("""
"""),format.raw/*15.2*/("""

"""),_display_(/*17.2*/if(list.isEmpty())/*17.20*/{_display_(Seq[Any](format.raw/*17.21*/("""

"""),format.raw/*19.1*/("""<div>No record found.</div>

""")))}/*21.2*/else/*21.6*/{_display_(Seq[Any](format.raw/*21.7*/("""
"""),format.raw/*22.1*/("""<table border="2"><tr>
    <td><h3>User Name</h3></td>
    <td><h3>In Date</h3></td>
    <td><h3>In Time</h3></td>
    <td><h3>In Note</h3></td>
    <td><h3>Out Date</h3> </td>
    <td><h3>Out Time</h3> </td>
    <td><h3>Out Note</h3></td>
    <td><h3>Total Time</h3></td>
</tr>


    """),_display_(/*34.6*/for(p <- list) yield /*34.20*/ {_display_(Seq[Any](format.raw/*34.22*/("""
    """),format.raw/*35.5*/("""<tr>


    """),_display_(/*38.6*/for(r <- p.records) yield /*38.25*/ {_display_(Seq[Any](format.raw/*38.27*/("""


        """),_display_(/*41.10*/if(r.date_punch_out!=null)/*41.36*/{_display_(Seq[Any](format.raw/*41.37*/("""
        """),format.raw/*42.9*/("""<td>"""),_display_(/*42.14*/p/*42.15*/.fullname),format.raw/*42.24*/("""</td>
        <td>"""),_display_(/*43.14*/("%1$tY-%1$tm-%1$td".format(r.date_punch_in.getTime()))),format.raw/*43.69*/("""</td>
        <td>"""),_display_(/*44.14*/("%1$tH:%1$tM".format(r.date_punch_in.getTime()))),format.raw/*44.63*/("""</td>
        <td>"""),_display_(/*45.14*/r/*45.15*/.note1),format.raw/*45.21*/("""</td>
        <td>"""),_display_(/*46.14*/("%1$tY-%1$tm-%1$td".format(r.date_punch_out.getTime()))),format.raw/*46.70*/("""</td>
        <td>"""),_display_(/*47.14*/("%1$tH:%1$tM".format(r.date_punch_out.getTime()))),format.raw/*47.64*/("""</td>

        <td>"""),_display_(/*49.14*/r/*49.15*/.note2),format.raw/*49.21*/("""</td>
        <td > """),_display_(/*50.16*/dum( r.date_punch_out.getTime(),r.date_punch_in.getTime())),format.raw/*50.74*/(""":"""),_display_(/*50.76*/sum( r.date_punch_out.getTime(),r.date_punch_in.getTime())),format.raw/*50.134*/(""" """),format.raw/*50.135*/("""</td>

    """)))}),format.raw/*52.6*/("""
    """),format.raw/*53.5*/("""</tr>

    """)))})))}),format.raw/*55.7*/("""



"""),format.raw/*59.1*/("""</table>
""")))}),format.raw/*60.2*/("""








"""))}
  }

  def render(list:List[models.Users]): play.twirl.api.HtmlFormat.Appendable = apply(list)

  def f:((List[models.Users]) => play.twirl.api.HtmlFormat.Appendable) = (list) => apply(list)

  def ref: this.type = this

}
              /*
                  -- GENERATED --
                  DATE: Fri Dec 26 11:44:53 IST 2014
                  SOURCE: /home/anshika/play/SaralHRM/app/views/reports/AllviewReport.scala.html
                  HASH: 7515da9d038c23c35bb26635cb2c6eb119b1f439
                  MATRIX: 751->1|862->129|872->132|967->151|994->153|1034->173|1060->178|1071->181|1167->200|1195->202|1238->224|1272->46|1304->70|1388->26|1417->124|1448->176|1476->227|1505->230|1532->248|1571->249|1600->251|1648->281|1660->285|1698->286|1726->287|2038->573|2068->587|2108->589|2140->594|2178->606|2213->625|2253->627|2292->639|2327->665|2366->666|2402->675|2434->680|2444->681|2474->690|2520->709|2596->764|2642->783|2712->832|2758->851|2768->852|2795->858|2841->877|2918->933|2964->952|3035->1002|3082->1022|3092->1023|3119->1029|3167->1050|3246->1108|3275->1110|3355->1168|3385->1169|3427->1181|3459->1186|3505->1199|3536->1203|3576->1213
                  LINES: 26->1|28->8|28->8|30->8|31->9|31->9|33->12|33->12|35->12|36->13|36->13|38->4|38->4|39->1|41->4|45->11|46->15|48->17|48->17|48->17|50->19|52->21|52->21|52->21|53->22|65->34|65->34|65->34|66->35|69->38|69->38|69->38|72->41|72->41|72->41|73->42|73->42|73->42|73->42|74->43|74->43|75->44|75->44|76->45|76->45|76->45|77->46|77->46|78->47|78->47|80->49|80->49|80->49|81->50|81->50|81->50|81->50|81->50|83->52|84->53|86->55|90->59|91->60
                  -- GENERATED --
              */
          