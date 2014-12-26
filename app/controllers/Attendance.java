package controllers;

import play.Logger;
import models.Users;
import models.Records;
import play.mvc.Controller;
import play.mvc.Result;
import play.mvc.Security;
import views.html.record.index;
import play.data.Form;
import play.data.format.Formats;
import play.data.validation.Constraints;
import play.i18n.Messages;

import java.lang.String;
import java.util.Date;

/**
 * User: Anshika Gupta
 * Date: 20/12/14
 */

@Security.Authenticated(Secured.class)
public class Attendance extends Controller {

    public static class PunchForm {
        @Formats.DateTime(pattern = "yyyy-MM-dd HH:mm:ss")
        public Date date_punch_in;

        public String note;

        @Formats.DateTime(pattern = "yyyy-MM-dd HH:mm:ss")
        public Date date_punch_out;

        @Formats.DateTime(pattern = "yyyy-MM-dd")
        public Date date;

        @Formats.DateTime(pattern = "HH:mm")
        public Date time;

public Long userid;
        public PunchForm() {}
        PunchForm(Date date_punch_in,Date date_punch_out,Long userid) {
            this.date_punch_in= date_punch_in;
            this.date_punch_out=date_punch_out;
            this.note=note;
            this.date=new Date();
            this.time=new Date();
            this.userid=userid;
            Logger.debug("gdgfdfgdfgdf D1===============" +userid);

        }



    }



    public static Result index() {
        String username = request().username();
        if(username==null){
            flash("error","session expired");

            return redirect( "/");
        }

        /*Records record1 = Records.findByUsernameJoina(request().username());
        Logger.debug("inside id1===============" +record1.id);*/
         Form<PunchForm> punchForm = Form.form(PunchForm.class);
        Users user = Users.findByUserName(username);


            Long id=user.id;
        Logger.debug("inside D1===============" +id);
        Records record = Records.findByUsernameJoin(id);
        if(record!=null){
            Logger.debug("inside D1===============" +record.date_punch_out);

            if(record.date_punch_out==null) {
                punchForm = punchForm.fill(new PunchForm(record.date_punch_in, record.date_punch_out,id));
            }else{

                punchForm = punchForm.fill(new PunchForm(null, null,id));
            }
        }else{

            punchForm = punchForm.fill(new PunchForm(null, null,id));
        }

        return ok(index.render(user,punchForm,record));
    }

    public static Result punchIn() {
        String username = request().username();
        if(username==null){
            flash("error","session expired");

            return redirect( "/");
        }
        Form<PunchForm> punchForm = Form.form(PunchForm.class).bindFromRequest();
        PunchForm Punchf = punchForm.get();
        Users user = Users.findByUserName(username);

        try {

            Records record = new Records();
           try{
            Result resultError = checkBeforeSave(Records.findByUsernameJoin(Punchf.userid).date_punch_out );

            if (resultError != null) {

                return resultError;
            }
        } catch(Exception e){}
            record.date_punch_in=new Date();
            record.note1= Punchf.note;
            record.user=user;

            record.save();
            return redirect(routes.Attendance.index());

        } catch (Exception e) {
            flash("error", Messages.get("error.technical"));
            Logger.error("Signup.save error", e);

        }
        return null;
    }
    public static Result punchOut() {
        try {
            String username = request().username();
            if(username==null){
                flash("error","session expired");

                return redirect( "/");
            }
            Form<PunchForm> punchForm = Form.form(PunchForm.class).bindFromRequest();
            PunchForm Punchf = punchForm.get();
            Records record = Records.findByUsernameJoin(Punchf.userid);

            Result resultError = checkBeforeSave(record.date_punch_in );

            if (resultError != null) {

                return resultError;
            }


            record.date_punch_out=new Date();
            record.note2= Punchf.note;


            record.save();
            flash("message", "Record succesfully saved");
            return redirect(routes.Attendance.index());

        } catch (Exception e) {
            Logger.error("Signup.save error", e);
            flash("error", Messages.get("error.technical"));
        }
        flash("error", Messages.get("error.attendance.overlapping"));
        return redirect(routes.Attendance.index());
    }

    private static Result checkBeforeSave( Date d1) {
        // Check unique email

            Long diff = (d1.getTime() - new Date().getTime()) / 60000;
            Logger.debug("Di ===============" + diff);


            if (diff == 0) {
                flash("error", Messages.get("error.attendance.overlapping"));
                return redirect(routes.Attendance.index());
            }

      return null;
    }

}