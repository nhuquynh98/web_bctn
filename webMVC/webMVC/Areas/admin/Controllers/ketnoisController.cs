using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using webMVC.Models;

namespace webMVC.Areas.admin.Controllers
{
    public class ketnoisController : Controller
    {
        private BCTNEntities db = new BCTNEntities();

        // GET: admin/ketnois
        public ActionResult Index()
        {
            return View(db.ketnois.ToList());
        }

        // GET: admin/ketnois/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ketnoi ketnoi = db.ketnois.Find(id);
            if (ketnoi == null)
            {
                return HttpNotFound();
            }
            return View(ketnoi);
        }

        // GET: admin/ketnois/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: admin/ketnois/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,maSp,tensp,mangdidong,sim,wifi,GPS,Bluetooth,boSac,jackTaiNghe,ketNoiKhac")] ketnoi ketnoi)
        {
            if (ModelState.IsValid)
            {
                db.ketnois.Add(ketnoi);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(ketnoi);
        }

        // GET: admin/ketnois/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ketnoi ketnoi = db.ketnois.Find(id);
            if (ketnoi == null)
            {
                return HttpNotFound();
            }
            return View(ketnoi);
        }

        // POST: admin/ketnois/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,maSp,tensp,mangdidong,sim,wifi,GPS,Bluetooth,boSac,jackTaiNghe,ketNoiKhac")] ketnoi ketnoi)
        {
            if (ModelState.IsValid)
            {
                db.Entry(ketnoi).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(ketnoi);
        }

        // GET: admin/ketnois/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ketnoi ketnoi = db.ketnois.Find(id);
            if (ketnoi == null)
            {
                return HttpNotFound();
            }
            return View(ketnoi);
        }

        // POST: admin/ketnois/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            ketnoi ketnoi = db.ketnois.Find(id);
            db.ketnois.Remove(ketnoi);
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
