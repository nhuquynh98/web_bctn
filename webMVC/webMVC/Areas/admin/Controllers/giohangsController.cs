using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using webMVC.Models;
using webMVC.Areas.admin.Models;

namespace webMVC.Areas.admin.Controllers
{
    public class giohangsController : Controller
    {
        private BCTNEntities db = new BCTNEntities();

        // GET: admin/giohangs
        public ActionResult Index()
        {
            DAOADMIN listModel = new DAOADMIN();
            List<TaiKhoan> tk = db.TaiKhoans.Where(x => x.Phanquyen == 0).ToList<TaiKhoan>();
            List<GIOHANG> listGioHang = new List<GIOHANG>();
            foreach (var item in tk)
            {
                var sanpham = db.giohangs.Where(x => x.makhachhang == item.makh).ToList().Count;
                if(sanpham > 0)
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
            List<giohang> listGioHang = db.giohangs.Where(x => x.makhachhang == tk.makh).ToList<giohang>();
            List<sanpham> listSanPham = new List<sanpham>();
            foreach (var item in listGioHang)
            {
                sanpham sp = db.sanphams.SingleOrDefault(x => x.masp == item.masp);
                sp.slsp = item.soluongdamua;
                listSanPham.Add(sp);
            }
            listModel.taikhoan = tk;
            listModel.listsanpham = listSanPham;
            return View(listModel);
        }

        // GET: admin/giohangs/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: admin/giohangs/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,makhachhang,masp,gia,soluongdamua,ngaymua")] giohang giohang)
        {
            if (ModelState.IsValid)
            {
                db.giohangs.Add(giohang);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(giohang);
        }

        // GET: admin/giohangs/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            giohang giohang = db.giohangs.Find(id);
            if (giohang == null)
            {
                return HttpNotFound();
            }
            return View(giohang);
        }

        // POST: admin/giohangs/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,makhachhang,masp,gia,soluongdamua,ngaymua")] giohang giohang)
        {
            if (ModelState.IsValid)
            {
                db.Entry(giohang).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(giohang);
        }

        // GET: admin/giohangs/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            giohang giohang = db.giohangs.Find(id);
            if (giohang == null)
            {
                return HttpNotFound();
            }
            return View(giohang);
        }

        // POST: admin/giohangs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            giohang giohang = db.giohangs.Find(id);
            db.giohangs.Remove(giohang);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
