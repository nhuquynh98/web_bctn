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
    public class hedieuhanhsController : Controller
    {
        private BCTNEntities db = new BCTNEntities();

        // GET: admin/hedieuhanhs
        public ActionResult Index()
        {
            return View(db.hedieuhanhs.ToList());
        }

        // GET: admin/hedieuhanhs/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            hedieuhanh hedieuhanh = db.hedieuhanhs.Find(id);
            if (hedieuhanh == null)
            {
                return HttpNotFound();
            }
            return View(hedieuhanh);
        }

        // GET: admin/hedieuhanhs/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: admin/hedieuhanhs/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,maSp,tensp,hedieuhanh1,chipset,tocdoCPU,chipdohoa")] hedieuhanh hedieuhanh)
        {
            if (ModelState.IsValid)
            {
                db.hedieuhanhs.Add(hedieuhanh);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(hedieuhanh);
        }

        // GET: admin/hedieuhanhs/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            hedieuhanh hedieuhanh = db.hedieuhanhs.Find(id);
            if (hedieuhanh == null)
            {
                return HttpNotFound();
            }
            return View(hedieuhanh);
        }

        // POST: admin/hedieuhanhs/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,maSp,tensp,hedieuhanh1,chipset,tocdoCPU,chipdohoa")] hedieuhanh hedieuhanh)
        {
            if (ModelState.IsValid)
            {
                db.Entry(hedieuhanh).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(hedieuhanh);
        }

        // GET: admin/hedieuhanhs/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            hedieuhanh hedieuhanh = db.hedieuhanhs.Find(id);
            if (hedieuhanh == null)
            {
                return HttpNotFound();
            }
            return View(hedieuhanh);
        }

        // POST: admin/hedieuhanhs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            hedieuhanh hedieuhanh = db.hedieuhanhs.Find(id);
            db.hedieuhanhs.Remove(hedieuhanh);
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
