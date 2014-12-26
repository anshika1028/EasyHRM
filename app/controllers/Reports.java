package controllers;

import play.Logger;
import models.Users;
import models.Records;
import play.mvc.Controller;
import play.mvc.Result;
import play.mvc.Security;
import views.html.reports.index;
import views.html.reports.AllReportIndex;
import play.data.Form;
import play.data.format.Formats;
import play.data.validation.Constraints;
import play.i18n.Messages;
import play.db.ebean.Model;
import java.lang.String;
import java.util.Date;
import java.util.List;
import models.utils.AppException;
import static play.libs.Json.*;

/**
 * User: Anshika Gupta
 * Date: 20/12/14
 */

@Security.Authenticated(Secured.class)
public class Reports extends Controller {


    public static class ReportForm {
        @Formats.DateTime(pattern = "yyyy-MM-dd")
        public Date date1;

        @Formats.DateTime(pattern = "yyyy-MM-dd")
        public Date date2;

        public ReportForm() {
            this.date1= new Date();

        }
        ReportForm(Date date1,Date date2) {
            this.date1= date1;
            this.date2=date2;
        }
        /*public String validate() {

        }*/

    }


    public static Result index() {

        String username = request().username();

        if(username==null){
            flash("error","session expired");

            return redirect( "/");
        }
        Form<ReportForm> reportForm = Form.form(ReportForm.class);
        Users user = Users.findByUserName(username);
        reportForm = reportForm.fill(new ReportForm());

        return ok(index.render(user,reportForm,null));
    }

    public static Result viewReport() {
        String username = request().username();

        if(username==null){
            flash("error","session expired");

            return redirect( "/");
        }

        Form<ReportForm> ReportForm = Form.form(ReportForm.class).bindFromRequest();
        ReportForm report = ReportForm.get();
        Date d1=report.date1;
        Date d2=report.date2;
        Users user = Users.findByUserName(username);
        Long id=user.id;

        List<Records> records =new Model.Finder(String.class, Records.class).where().gt("date_punch_in", d1).lt("date_punch_in", d2).eq("user_id",id).findList();
        ReportForm = ReportForm.fill(new ReportForm(report.date1,report.date2));
        return ok(index.render(user,ReportForm,records));
    }

    public static class UsersReportForm {
        @Formats.DateTime(pattern = "yyyy-MM-dd")
        public Date date1;

        @Formats.DateTime(pattern = "yyyy-MM-dd")
        public Date date2;

        public Long user;

        public UsersReportForm() {

            this.date1= new Date();
            this.date2= new Date();
        }
        UsersReportForm(Long user,Date date1,Date date2) {
            this.user= user;
            this.date1= date1;
            this.date2=date2;
        }
        public Users users;
        /*public String validate() {

        }*/

    }

    public static Result allReportIndex() throws AppException{

        String username = request().username();

        if(username==null){
            flash("error","session expired");

            return redirect( "/");
        }
        Form<UsersReportForm> usersReportForm = Form.form(UsersReportForm.class);
        Users user = Users.findByUserName(username);
        usersReportForm = usersReportForm.fill(new UsersReportForm(Long.valueOf(0),new Date(),new Date()));

        List<Users> usersnames =Users.findAll();
        return ok(AllReportIndex.render(user,usersReportForm, usersnames,null));
    }

    public static Result viewAllReport() throws AppException{
        String username = request().username();

        if(username==null){
            flash("error","session expired");

            return redirect( "/");
        }

        Form<UsersReportForm> usersReportForm = Form.form(UsersReportForm.class).bindFromRequest();
        UsersReportForm form = usersReportForm.get();

        Date d1=form.date1;

        Date d2=form.date2;


        Long id=form.user;
        Logger.debug("report.user==========" +id);
        Logger.debug("report.user==========" +form.date1);

        List<Users> usersDetails=null;
        if(id.equals(Long.valueOf(0))){
             usersDetails =Users.findAllRecords(d1, d2);
        }else{

             usersDetails =Users.findAllRecordsByUserId(d1, d2, id);
        }

        Users user = Users.findByUserName(username);
        usersReportForm = usersReportForm.fill(new UsersReportForm(id,form.date1,form.date2));

        List<Users> usersnames =Users.findAll();
        return ok(AllReportIndex.render(user,usersReportForm,usersnames,usersDetails));
    }



}