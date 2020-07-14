using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using webMVC.Models;
using webMVC.Areas.admin.Models;
using System.Net;

namespace webMVC.Areas.admin.Controllers
{
    public class ThanhToanController : Controller
    {
        private BCTNEntities db = new BCTNEntities();

        // GET: admin/ThanhToan
        public ActionResult Index()
        {
            DAOADMIN listModel = new DAOADMIN();
            List<TaiKhoan> tk = db.TaiKhoans.Where(x => x.Phanquyen == 0).ToList<TaiKhoan>();
            List<GIOHANG> listGioHang = new List<GIOHANG>();
            foreach (var item in tk)
            {
                var sanpham = db.muahangs.Where(x => x.makhachhang == item.makh).ToList().Count;
                if (sanpham > 0)
                {
                    GIOHANG giohang = new GIOHANG();
                    giohang.makh = item.makh;
                    giohang.Ten = item.Ten;
                    giohang.Ho = item.Ho;
                    giohang.Sdt = item.Sdt;
                    giohang.Email = item.Email;
                    giohang.sanpham = sanpham;
                    listGioHang.Add(giohang);
                }
            }

            listModel.listGioHang = listGioHang;
            return View(listModel);
        }

        // GET: admin/giohangs/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TaiKhoan tk = db.TaiKhoans.Find(id);
            if (tk == null)
            {
                return HttpNotFound();
            }
            DAOADMIN listModel = new DAOADMIN();
            List<muahang> listMuaHang = db.muahangs.Where(x => x.makhachhang == tk.makh).ToList<muahang>();
            List<sanpham> listSanPham = new List<sanpham>();
            foreach (var item in listMuaHang)
            {
                sanpham sp = db.sanphams.SingleOrDefault(x => x.masp == item.masp);
                sp.slsp = item.soluongdamua;
                listSanPham.Add(sp);
            }
            listModel.taikhoan = tk;
            listModel.listsanpham = listSanPham;
            return View(listModel);
        }
    }
}