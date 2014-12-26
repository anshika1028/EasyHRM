
package views.html

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
object logged extends BaseScalaTemplate[play.twirl.api.HtmlFormat.Appendable,Format[play.twirl.api.HtmlFormat.Appendable]](play.twirl.api.HtmlFormat) with play.twirl.api.Template1[Users,play.twirl.api.HtmlFormat.Appendable] {

  /**/
  def apply/*1.2*/(users: Users):play.twirl.api.HtmlFormat.Appendable = {
      _display_ {

Seq[Any](format.raw/*1.16*/("""

"""),_display_(/*3.2*/if(users != null)/*3.19*/ {_display_(Seq[Any](format.raw/*3.21*/("""
    """),format.raw/*4.5*/("""<ul class="nav navbar-nav navbar-right">
        <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> """),_display_(/*6.100*/users/*6.105*/.fullname),format.raw/*6.114*/(""" """),format.raw/*6.115*/("""<b class="caret"></b></a>
            <ul class="dropdown-menu">
                <li><a href=""""),_display_(/*8.31*/controllers/*8.42*/.account.settings.routes.Index.index()),format.raw/*8.80*/(""""><i class="fa fa-wrench"></i> """),_display_(/*8.112*/Messages("settings")),format.raw/*8.132*/("""</a></li>
                <li class="divider"></li>
                <li><a href=""""),_display_(/*10.31*/routes/*10.37*/.Application.logout()),format.raw/*10.58*/(""""><i class="fa fa-power-off"></i> """),_display_(/*10.93*/Messages("logout")),format.raw/*10.111*/("""</a></li>
            </ul>
        </li>
    </ul>
<ul class="nav navbar-nav navbar-left">
    <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-calendar"></i> Attendance <b class="caret"></b></a>
        <ul class="dropdown-menu">
            <li><a href=""""),_display_(/*18.27*/routes/*18.33*/.Attendance.index()),format.raw/*18.52*/(""""><i class="fa fa-clock-o"></i> Punch In/Out</a></li>
            <li class="divider"></li>
            <li><a href=""""),_display_(/*20.27*/routes/*20.33*/.Reports.index()),format.raw/*20.49*/(""""><i class="fa fa-file-text-o"></i> Reports</a></li>
        </ul>
    </li>
    """),_display_(/*23.6*/if(users.isadmin)/*23.23*/ {_display_(Seq[Any](format.raw/*23.25*/("""
    """),format.raw/*24.5*/("""<li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-users"></i> Manage Users <b class="caret"></b></a>
        <ul class="dropdown-menu">
            <li><a href=""""),_display_(/*27.27*/routes/*27.33*/.ManageUsers.index()),format.raw/*27.53*/(""""> user list</a></li>
            <li class="divider"></li>
            <li><a href=""""),_display_(/*29.27*/routes/*29.33*/.Reports.allReportIndex()),format.raw/*29.58*/("""">Users Reports</a></li>
        </ul>
    </li>
    """)))}),format.raw/*32.6*/("""
"""),format.raw/*33.1*/("""</ul>
    """),_display_(/*34.6*/if(users.isadmin)/*34.23*/ {_display_(Seq[Any](format.raw/*34.25*/("""
        """),format.raw/*35.9*/("""<ul class="nav navbar-nav navbar-right">
            <li class=""><a href="signup"><i class="fa fa-users"></i> Create User</a></li>
        </ul>
    """)))}),format.raw/*38.6*/("""
""")))}),format.raw/*39.2*/("""
"""))}
  }

  def render(users:Users): play.twirl.api.HtmlFormat.Appendable = apply(users)

  def f:((Users) => play.twirl.api.HtmlFormat.Appendable) = (users) => apply(users)

  def ref: this.type = this

}
              /*
                  -- GENERATED --
                  DATE: Wed Dec 24 14:58:40 IST 2014
                  SOURCE: /home/anshika/play/SaralHRM/app/views/logged.scala.html
                  HASH: 226d6a68624e1c48a30ff4b28aca6ae10b189789
                  MATRIX: 723->1|825->15|853->18|878->35|917->37|948->42|1145->212|1159->217|1189->226|1218->227|1339->322|1358->333|1416->371|1475->403|1516->423|1625->505|1640->511|1682->532|1744->567|1784->585|2125->899|2140->905|2180->924|2325->1042|2340->1048|2377->1064|2485->1146|2511->1163|2551->1165|2583->1170|2827->1387|2842->1393|2883->1413|2996->1499|3011->1505|3057->1530|3141->1584|3169->1585|3206->1596|3232->1613|3272->1615|3308->1624|3489->1775|3521->1777
                  LINES: 26->1|29->1|31->3|31->3|31->3|32->4|34->6|34->6|34->6|34->6|36->8|36->8|36->8|36->8|36->8|38->10|38->10|38->10|38->10|38->10|46->18|46->18|46->18|48->20|48->20|48->20|51->23|51->23|51->23|52->24|55->27|55->27|55->27|57->29|57->29|57->29|60->32|61->33|62->34|62->34|62->34|63->35|66->38|67->39
                  -- GENERATED --
              */
          