
package views.html.record

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
object punchout extends BaseScalaTemplate[play.twirl.api.HtmlFormat.Appendable,Format[play.twirl.api.HtmlFormat.Appendable]](play.twirl.api.HtmlFormat) with play.twirl.api.Template1[Form[controllers.Attendance.PunchForm],play.twirl.api.HtmlFormat.Appendable] {

  /**/
  def apply/*1.2*/(punchForm: Form[controllers.Attendance.PunchForm]):play.twirl.api.HtmlFormat.Appendable = {
      _display_ {import helper._
implicit def /*4.2*/implicitFieldConstructor/*4.26*/ = {{ FieldConstructor(twitterBootstrapInput.render) }};
Seq[Any](format.raw/*1.53*/("""

"""),format.raw/*4.80*/("""

"""),format.raw/*6.1*/("""<h3>Punch  out</h3>

"""),_display_(/*8.2*/form(routes.Attendance.punchOut())/*8.36*/ {_display_(Seq[Any](format.raw/*8.38*/("""

"""),format.raw/*10.1*/("""<fieldset>

   Date&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  """),_display_(/*12.51*/punchForm("date")/*12.68*/.value),format.raw/*12.74*/("""
"""),format.raw/*13.1*/("""<br>   Time&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  """),_display_(/*13.49*/punchForm("time")/*13.66*/.value),format.raw/*13.72*/("""

    """),_display_(/*15.6*/inputText(
    punchForm("note"),
    'placeholder -> Messages("notes"),
    '_label -> "Note",
    'class -> "form-control"
    )),format.raw/*20.6*/("""
    """),format.raw/*21.5*/("""<input type="hidden" name="userid" value=""""),_display_(/*21.48*/punchForm("userid")/*21.67*/.value),format.raw/*21.73*/("""">



</fieldset>

<div class="form-actions">
    <input type="submit" class="btn btn-primary" value=""""),_display_(/*28.58*/Messages("date_punch_out")),format.raw/*28.84*/("""">
</div>

<div>&nbsp;</div>
<div>Last punch-in time: """),_display_(/*32.27*/punchForm("date_punch_in")/*32.53*/.value),format.raw/*32.59*/("""</div>

""")))}),format.raw/*34.2*/("""

"""))}
  }

  def render(punchForm:Form[controllers.Attendance.PunchForm]): play.twirl.api.HtmlFormat.Appendable = apply(punchForm)

  def f:((Form[controllers.Attendance.PunchForm]) => play.twirl.api.HtmlFormat.Appendable) = (punchForm) => apply(punchForm)

  def ref: this.type = this

}
              /*
                  -- GENERATED --
                  DATE: Wed Dec 24 14:58:40 IST 2014
                  SOURCE: /home/anshika/play/SaralHRM/app/views/record/punchout.scala.html
                  HASH: d1d6124aadf3af9ab50f6719500ee6b305697d31
                  MATRIX: 765->1|911->72|943->96|1027->52|1056->150|1084->152|1131->174|1173->208|1212->210|1241->212|1330->274|1356->291|1383->297|1411->298|1486->346|1512->363|1539->369|1572->376|1722->506|1754->511|1824->554|1852->573|1879->579|2009->682|2056->708|2138->763|2173->789|2200->795|2239->804
                  LINES: 26->1|28->4|28->4|29->1|31->4|33->6|35->8|35->8|35->8|37->10|39->12|39->12|39->12|40->13|40->13|40->13|40->13|42->15|47->20|48->21|48->21|48->21|48->21|55->28|55->28|59->32|59->32|59->32|61->34
                  -- GENERATED --
              */
          