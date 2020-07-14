using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using webMVC.Areas.admin.Models;
using webMVC.Models;

namespace webMVC.Areas.admin.Controllers
{
    public class sanphamsController : Controller
    {
        private BCTNEntities db = new BCTNEntities();

        // GET: admin/sanphams
        public ActionResult Index()
        {
            return View(db.sanphams.ToList());
        }

        // GET: admin/sanphams/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            sanpham sanpham = db.sanphams.Find(id);
            if (sanpham == null)
            {
                return HttpNotFound();
            }
            DAOADMIN listModel = new DAOADMIN();
            listModel.sp = sanpham;
            listModel.chitietsp = db.chitietsanphams.SingleOrDefault(x => x.masp == sanpham.masp);
            return View(listModel);
        }

        // GET: admin/sanphams/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: admin/sanphams/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "tensp,MaLSP,gia,donvi,mota,slsp")] sanpham sanpham)
        {
            if (ModelState.IsValid)
            {
                sanpham.trangthai = 0;
                db.sanphams.Add(sanpham);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(sanpham);
        }

        // GET: admin/sanphams/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            sanpham sanpham = db.sanphams.Find(id);
            if (sanpham == null)
            {
                return HttpNotFound();
            }
            return View(sanpham);
        }

        // POST: admin/sanphams/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "masp,tensp,MaLSP,gia,donvi,mota,slsp,trangthai")] sanpham sanpham)
        {
            if (ModelState.IsValid)
            {
                if (sanpham.trangthai == null)
                {
                    sanpham.trangthai = 0;
                }
                db.Entry(sanpham).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(sanpham);
        }

        // GET: admin/sanphams/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            sanpham sanpham = db.sanphams.Find(id);
            if (sanpham == null)
            {
                return HttpNotFound();
            }
            return View(sanpham);
        }

        // POST: admin/sanphams/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            sanpham sanpham = db.sanphams.Find(id);
            db.sanphams.Remove(sanpham);
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
