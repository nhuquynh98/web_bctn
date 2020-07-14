using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using webMVC.Models;

namespace webMVC.Controllers
{
    public class ContactController : Controller
    {
        BCTNEntities db = new BCTNEntities();
        // GET: Home
        public ActionResult Index()
        {
            DAO listModel = new DAO();
            listModel.Thongtins = db.thongtins.ToList();
            listModel.thongtingiohang = new List<sanpham>();
            if (Session["giohang"] != null)
            {
                listModel.thongtingiohang = (List<sanpham>)Session["giohang"];
            }
            return View(listModel);
        }
    }
}