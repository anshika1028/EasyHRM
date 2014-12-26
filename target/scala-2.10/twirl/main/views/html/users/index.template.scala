
package views.html.users

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
object index extends BaseScalaTemplate[play.twirl.api.HtmlFormat.Appendable,Format[play.twirl.api.HtmlFormat.Appendable]](play.twirl.api.HtmlFormat) with play.twirl.api.Template2[Users,List[models.Users],play.twirl.api.HtmlFormat.Appendable] {

  /**/
  def apply/*2.2*/(users: Users,json:List[models.Users]):play.twirl.api.HtmlFormat.Appendable = {
      _display_ {import helper._

Seq[Any](format.raw/*2.40*/("""


"""),format.raw/*6.1*/("""
"""),_display_(/*7.2*/main(users)/*7.13*/ {_display_(Seq[Any](format.raw/*7.15*/("""
"""),_display_(/*8.2*/wflash()),format.raw/*8.10*/("""
"""),format.raw/*9.1*/("""<div class="span12">
  <div class="well">
<table >
  <tr >
    <td><b> username</b> </td>
    <td> <b> status </b></td>
    <td> <b>Action</b> </td>
  </tr>
"""),_display_(/*17.2*/for(p <- json) yield /*17.16*/ {_display_(Seq[Any](format.raw/*17.18*/("""
  """),format.raw/*18.3*/("""<tr>
    <td>"""),_display_(/*19.10*/p/*19.11*/.fullname),format.raw/*19.20*/(""" """),format.raw/*19.21*/("""</td>
    <td>"""),_display_(/*20.10*/if(p.status)/*20.22*/{_display_(Seq[Any](format.raw/*20.23*/(""" """),format.raw/*20.24*/("""Active""")))}/*20.31*/else/*20.35*/{_display_(Seq[Any](format.raw/*20.36*/(""" """),format.raw/*20.37*/("""Inactive""")))}),format.raw/*20.46*/("""</td>
    <td>
    <a  href="/manageusers/"""),_display_(/*22.29*/p/*22.30*/.username),format.raw/*22.39*/("""">"""),_display_(/*22.42*/if(p.status)/*22.54*/{_display_(Seq[Any](format.raw/*22.55*/(""" """),format.raw/*22.56*/("""Inctivate""")))}/*22.66*/else/*22.70*/{_display_(Seq[Any](format.raw/*22.71*/(""" """),format.raw/*22.72*/("""Activate""")))}),format.raw/*22.81*/("""</a>

    </td></tr>
""")))}),format.raw/*25.2*/("""
"""),format.raw/*26.1*/("""</table>
    </div></div>
""")))}))}
  }

  def render(users:Users,json:List[models.Users]): play.twirl.api.HtmlFormat.Appendable = apply(users,json)

  def f:((Users,List[models.Users]) => play.twirl.api.HtmlFormat.Appendable) = (users,json) => apply(users,json)

  def ref: this.type = this

}
              /*
                  -- GENERATED --
                  DATE: Wed Dec 24 14:58:40 IST 2014
                  SOURCE: /home/anshika/play/SaralHRM/app/views/users/index.scala.html
                  HASH: 2cd1158bf8943b87a10422c10e757d8b4e520ad5
                  MATRIX: 747->2|888->40|917->60|944->62|963->73|1002->75|1029->77|1057->85|1084->86|1268->244|1298->258|1338->260|1368->263|1409->277|1419->278|1449->287|1478->288|1520->303|1541->315|1580->316|1609->317|1635->324|1648->328|1687->329|1716->330|1756->339|1826->382|1836->383|1866->392|1896->395|1917->407|1956->408|1985->409|2014->419|2027->423|2066->424|2095->425|2135->434|2187->456|2215->457
                  LINES: 26->2|29->2|32->6|33->7|33->7|33->7|34->8|34->8|35->9|43->17|43->17|43->17|44->18|45->19|45->19|45->19|45->19|46->20|46->20|46->20|46->20|46->20|46->20|46->20|46->20|46->20|48->22|48->22|48->22|48->22|48->22|48->22|48->22|48->22|48->22|48->22|48->22|48->22|51->25|52->26
                  -- GENERATED --
              */
          