
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
object punchin extends BaseScalaTemplate[play.twirl.api.HtmlFormat.Appendable,Format[play.twirl.api.HtmlFormat.Appendable]](play.twirl.api.HtmlFormat) with play.twirl.api.Template1[Form[controllers.Attendance.PunchForm],play.twirl.api.HtmlFormat.Appendable] {

  /**/
  def apply/*1.2*/(punchForm: Form[controllers.Attendance.PunchForm]):play.twirl.api.HtmlFormat.Appendable = {
      _display_ {import helper._
implicit def /*4.2*/implicitFieldConstructor/*4.26*/ = {{ FieldConstructor(twitterBootstrapInput.render) }};
Seq[Any](format.raw/*1.53*/("""

"""),format.raw/*4.80*/("""

"""),format.raw/*6.1*/("""<h3>Punch in </h3>

"""),_display_(/*8.2*/form(routes.Attendance.punchIn())/*8.35*/ {_display_(Seq[Any](format.raw/*8.37*/("""

"""),format.raw/*10.1*/("""<fieldset>

    Date&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  """),_display_(/*12.52*/punchForm("date")/*12.69*/.value),format.raw/*12.75*/("""
    """),format.raw/*13.5*/("""<br>   Time&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  """),_display_(/*13.53*/punchForm("time")/*13.70*/.value),format.raw/*13.76*/("""

    """),_display_(/*15.6*/inputText(
    punchForm("note"),
    'placeholder -> Messages("notes"),
    '_label -> "Note",
    'class -> "form-control"
    )),format.raw/*20.6*/("""
    """),format.raw/*21.5*/("""<input type="hidden" name="userid" value=""""),_display_(/*21.48*/punchForm("userid")/*21.67*/.value),format.raw/*21.73*/("""">


</fieldset>

<div class="form-actions">

    <input type="submit" class="btn btn-primary" value=""""),_display_(/*28.58*/Messages("date_punch_in")),format.raw/*28.83*/("""">
</div>
""")))}),format.raw/*30.2*/("""

"""))}
  }

  def render(punchForm:Form[controllers.Attendance.PunchForm]): play.twirl.api.HtmlFormat.Appendable = apply(punchForm)

  def f:((Form[controllers.Attendance.PunchForm]) => play.twirl.api.HtmlFormat.Appendable) = (punchForm) => apply(punchForm)

  def ref: this.type = this

}
              /*
                  -- GENERATED --
                  DATE: Wed Dec 24 14:58:40 IST 2014
                  SOURCE: /home/anshika/play/SaralHRM/app/views/record/punchin.scala.html
                  HASH: ba02a8027b177f8c5bca2f85d2eaec1f1adad701
                  MATRIX: 764->1|910->72|942->96|1026->52|1055->150|1083->152|1129->173|1170->206|1209->208|1238->210|1328->273|1354->290|1381->296|1413->301|1488->349|1514->366|1541->372|1574->379|1724->509|1756->514|1826->557|1854->576|1881->582|2011->685|2057->710|2098->721
                  LINES: 26->1|28->4|28->4|29->1|31->4|33->6|35->8|35->8|35->8|37->10|39->12|39->12|39->12|40->13|40->13|40->13|40->13|42->15|47->20|48->21|48->21|48->21|48->21|55->28|55->28|57->30
                  -- GENERATED --
              */
          