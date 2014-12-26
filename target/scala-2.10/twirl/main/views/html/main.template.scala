
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
object main extends BaseScalaTemplate[play.twirl.api.HtmlFormat.Appendable,Format[play.twirl.api.HtmlFormat.Appendable]](play.twirl.api.HtmlFormat) with play.twirl.api.Template3[Users,Html,Html,play.twirl.api.HtmlFormat.Appendable] {

  /**/
  def apply/*1.2*/(users: Users = null, scripts: Html = Html(""))(content: Html):play.twirl.api.HtmlFormat.Appendable = {
      _display_ {

Seq[Any](format.raw/*1.64*/("""

"""),format.raw/*3.1*/("""<!DOCTYPE html>

<html>
    <head>
        <title>"""),_display_(/*7.17*/Messages("title")),format.raw/*7.34*/("""</title>
        <link rel="stylesheet" media="screen" href=""""),_display_(/*8.54*/routes/*8.60*/.Assets.at("stylesheets/bootstrap.css")),format.raw/*8.99*/("""">
        <link rel="stylesheet" media="screen" href=""""),_display_(/*9.54*/routes/*9.60*/.Assets.at("stylesheets/main.css")),format.raw/*9.94*/("""">
        <link rel="shortcut icon" type="image/png" href=""""),_display_(/*10.59*/routes/*10.65*/.Assets.at("images/favicon.png")),format.raw/*10.97*/("""">
        <script src=""""),_display_(/*11.23*/routes/*11.29*/.Assets.at("javascripts/jquery/jquery-2.1.0.min.js")),format.raw/*11.81*/("""" type="text/javascript"></script>
        <script src=""""),_display_(/*12.23*/routes/*12.29*/.Assets.at("javascripts/bootstrap.js")),format.raw/*12.67*/("""" type="text/javascript"></script>
        <link rel="stylesheet" media="screen" href=""""),_display_(/*13.54*/routes/*13.60*/.Assets.at("stylesheets/font-awesome.min.css")),format.raw/*13.106*/("""">
        """),_display_(/*14.10*/scripts),format.raw/*14.17*/("""
    """),format.raw/*15.5*/("""</head>
    <body>

        <div ng-controller="MenuCtrl" class="navbar navbar-inverse navbar-default" role="navigation">

            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="fa fa-bars fa-lg fa-inverse"></span>
                </button>
                <a class="navbar-brand" href=""""),_display_(/*25.48*/routes/*25.54*/.Application.index()),format.raw/*25.74*/("""">
                    <i class="fa fa-rocket"></i> Saral HRM
                </a>
                <ul class="nav navbar-nav navbar-right">
                    <li class=""><a href=""""),_display_(/*29.44*/routes/*29.50*/.Application.index()),format.raw/*29.70*/("""">Home</a></li>
                </ul>
            </div>
            """),_display_(/*32.14*/logged(users)),format.raw/*32.27*/("""
        """),format.raw/*33.9*/("""</div>

        <div class="container">
            <div class="row">
                """),_display_(/*37.18*/content),format.raw/*37.25*/("""
            """),format.raw/*38.13*/("""</div>
        </div>

        <hr>
        <div class="footer text-center">
            <div>
                <small>
                    (c) 2014 SaralHRM All Right Reserved | SaralHRM
                </small>
            </div>
        </div>
    </body>
</html>
"""))}
  }

  def render(users:Users,scripts:Html,content:Html): play.twirl.api.HtmlFormat.Appendable = apply(users,scripts)(content)

  def f:((Users,Html) => (Html) => play.twirl.api.HtmlFormat.Appendable) = (users,scripts) => (content) => apply(users,scripts)(content)

  def ref: this.type = this

}
              /*
                  -- GENERATED --
                  DATE: Wed Dec 24 14:58:40 IST 2014
                  SOURCE: /home/anshika/play/SaralHRM/app/views/main.scala.html
                  HASH: 5551f4c091f92dbd5f5719de5074ce7e897e304e
                  MATRIX: 731->1|881->63|909->65|986->116|1023->133|1111->195|1125->201|1184->240|1266->296|1280->302|1334->336|1422->397|1437->403|1490->435|1542->460|1557->466|1630->518|1714->575|1729->581|1788->619|1903->707|1918->713|1986->759|2025->771|2053->778|2085->783|2604->1275|2619->1281|2660->1301|2870->1484|2885->1490|2926->1510|3023->1580|3057->1593|3093->1602|3207->1689|3235->1696|3276->1709
                  LINES: 26->1|29->1|31->3|35->7|35->7|36->8|36->8|36->8|37->9|37->9|37->9|38->10|38->10|38->10|39->11|39->11|39->11|40->12|40->12|40->12|41->13|41->13|41->13|42->14|42->14|43->15|53->25|53->25|53->25|57->29|57->29|57->29|60->32|60->32|61->33|65->37|65->37|66->38
                  -- GENERATED --
              */
          