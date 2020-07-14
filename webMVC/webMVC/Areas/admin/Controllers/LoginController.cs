using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using webMVC.Areas.admin.Models;
using webMVC.Models;

namespace webMVC.Areas.admin.Controllers
{
    public class LoginController : Controller
    {
        BCTNEntities db = new BCTNEntities();
        // GET: admin/Login
        public ActionResult Index()
        {
            DAOADMIN listModel = new DAOADMIN();
            listModel.taikhoansai = null;
            if (Session["dangnhapAdminSai"] != null)
            {
                listModel.taikhoansai = "Tài khoản không đúng!";
                Session["dangnhapAdminSai"] = null;
            }
            return View(listModel);
        }

        [HttpPost]
        public ActionResult Dangnhap(TaiKhoan tk)
        {
            if (ModelState.IsValid)
            {
                MD5HASH md5Hash = new MD5HASH();
                var mk = md5Hash.encrypt(tk.Matkhau);
                var Admin = db.TaiKhoans.SingleOrDefault(x => x.Email == tk.Email && x.Matkhau == mk && x.Phanquyen == 1);
                if (Admin != null)
                {
                    Session["Admin"] = Admin.Phanquyen;
                    Session["HoTen"] = Admin.Ten;
                    Session["TenDangNhap"] = Admin.TenDangnhap;
                    return Redirect("/admin/Home");
                }
            }
            Session["dangnhapAdminSai"] = true;
            return Redirect("/admin/Login/Index");
        }

        public ActionResult dangxuat()
        {
            Session["Admin"] = null;
            Session["HoTen"] = null;
            Session["TenDangNhap"] = null;
            return Redirect("/admin/Login/Index");
        }
    }
}