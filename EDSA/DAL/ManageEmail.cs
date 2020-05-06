using EDSA.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;

namespace EDSA.DAL
{
    public static class ManageEmail
    {
        public static void SendEmail(EmailModel model)
        {
            MailMessage message = new MailMessage("geo.eli.ger@gmail.com", model.Email);
            message.Subject = "Login Details";
            message.Body = "Dear "+model.FullName + "<br />Please find your login details bellow. <br /> Username: " +model.Username+ "<br />Password: "+model.Password+"<br/>Note: Please reset your password after login.<br/>Thank you !";
            message.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.EnableSsl = true;
            NetworkCredential NetworkCred = new NetworkCredential();
            NetworkCred.UserName = "geo.eli.ger@gmail.com";
            NetworkCred.Password = "geo&eli123";
            smtp.UseDefaultCredentials = false;
            smtp.Credentials = NetworkCred;
            smtp.Port = 587;
            smtp.Send(message);
        }
    }
}