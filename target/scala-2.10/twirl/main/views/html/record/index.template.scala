
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
object index extends BaseScalaTemplate[play.twirl.api.HtmlFormat.Appendable,Format[play.twirl.api.HtmlFormat.Appendable]](play.twirl.api.HtmlFormat) with play.twirl.api.Template3[Users,Form[controllers.Attendance.PunchForm],Records,play.twirl.api.HtmlFormat.Appendable] {

  /**/
  def apply/*1.2*/(users: Users, punchForm: Form[controllers.Attendance.PunchForm], record: Records):play.twirl.api.HtmlFormat.Appendable = {
      _display_ {import helper._

Seq[Any](format.raw/*1.84*/("""


"""),format.raw/*5.1*/("""
"""),_display_(/*6.2*/main(users)/*6.13*/ {_display_(Seq[Any](format.raw/*6.15*/("""
"""),_display_(/*7.2*/wflash()),format.raw/*7.10*/("""

"""),format.raw/*9.1*/("""<div class="span12">
   <div class="well">

"""),_display_(/*12.2*/if(punchForm("date_punch_in").value==null)/*12.44*/{_display_(Seq[Any](format.raw/*12.45*/("""
    """),_display_(/*13.6*/punchin(punchForm)),format.raw/*13.24*/("""
   """)))}/*14.5*/else/*14.9*/{_display_(Seq[Any](format.raw/*14.10*/("""
      """),_display_(/*15.8*/punchout(punchForm)),format.raw/*15.27*/("""
       """)))}),format.raw/*16.9*/("""


   """),format.raw/*19.4*/("""</div>
</div>

""")))}))}
  }

  def render(users:Users,punchForm:Form[controllers.Attendance.PunchForm],record:Records): play.twirl.api.HtmlFormat.Appendable = apply(users,punchForm,record)

  def f:((Users,Form[controllers.Attendance.PunchForm],Records) => play.twirl.api.HtmlFormat.Appendable) = (users,punchForm,record) => apply(users,punchForm,record)

  def ref: this.type = this

}
              /*
                  -- GENERATED --
                  DATE: Wed Dec 24 14:58:40 IST 2014
                  SOURCE: /home/anshika/play/SaralHRM/app/views/record/index.scala.html
                  HASH: 504f311bc5c739ce33104449c17da59991845194
                  MATRIX: 776->1|961->83|990->103|1017->105|1036->116|1075->118|1102->120|1130->128|1158->130|1229->175|1280->217|1319->218|1351->224|1390->242|1413->247|1425->251|1464->252|1498->260|1538->279|1577->288|1610->294
                  LINES: 26->1|29->1|32->5|33->6|33->6|33->6|34->7|34->7|36->9|39->12|39->12|39->12|40->13|40->13|41->14|41->14|41->14|42->15|42->15|43->16|46->19
                  -- GENERATED --
              */
          