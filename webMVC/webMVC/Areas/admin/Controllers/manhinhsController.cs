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
    public class manhinhsController : Controller
    {
        private BCTNEntities db = new BCTNEntities();

        // GET: admin/manhinhs
        public ActionResult Index()
        {
            return View(db.manhinhs.ToList());
        }

        // GET: admin/manhinhs/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            manhinh manhinh = db.manhinhs.Find(id);
            if (manhinh == null)
            {
                return HttpNotFound();
            }
            return View(manhinh);
        }

        // GET: admin/manhinhs/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: admin/manhinhs/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,maSp,tensp,congnghemanhinh,dophangiai,manhinhrong,matkinhcamung")] manhinh manhinh)
        {
            if (ModelState.IsValid)
            {
                db.manhinhs.Add(manhinh);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(manhinh);
        }

        // GET: admin/manhinhs/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            manhinh manhinh = db.manhinhs.Find(id);
            if (manhinh == null)
            {
                return HttpNotFound();
            }
            return View(manhinh);
        }

        // POST: admin/manhinhs/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,maSp,tensp,congnghemanhinh,dophangiai,manhinhrong,matkinhcamung")] manhinh manhinh)
        {
            if (ModelState.IsValid)
            {
                db.Entry(manhinh).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(manhinh);
        }

        // GET: admin/manhinhs/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            manhinh manhinh = db.manhinhs.Find(id);
            if (manhinh == null)
            {
                return HttpNotFound();
            }
            return View(manhinh);
        }

        // POST: admin/manhinhs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            manhinh manhinh = db.manhinhs.Find(id);
            db.manhinhs.Remove(manhinh);
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
