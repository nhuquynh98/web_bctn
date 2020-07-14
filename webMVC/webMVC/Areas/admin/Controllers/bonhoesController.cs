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
    public class bonhoesController : Controller
    {
        private BCTNEntities db = new BCTNEntities();

        // GET: admin/bonhoes
        public ActionResult Index()
        {
            return View(db.bonhoes.ToList());
        }

        // GET: admin/bonhoes/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            bonho bonho = db.bonhoes.Find(id);
            if (bonho == null)
            {
                return HttpNotFound();
            }
            return View(bonho);
        }

        // GET: admin/bonhoes/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: admin/bonhoes/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,maSp,tensp,ram,bonhotrong,bonhokhadung,thenhongoai,hotrothetoida")] bonho bonho)
        {
            if (ModelState.IsValid)
            {
                db.bonhoes.Add(bonho);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(bonho);
        }

        // GET: admin/bonhoes/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            bonho bonho = db.bonhoes.Find(id);
            if (bonho == null)
            {
                return HttpNotFound();
            }
            return View(bonho);
        }

        // POST: admin/bonhoes/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,maSp,tensp,ram,bonhotrong,bonhokhadung,thenhongoai,hotrothetoida")] bonho bonho)
        {
            if (ModelState.IsValid)
            {
                db.Entry(bonho).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(bonho);
        }

        // GET: admin/bonhoes/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            bonho bonho = db.bonhoes.Find(id);
            if (bonho == null)
            {
                return HttpNotFound();
            }
            return View(bonho);
        }

        // POST: admin/bonhoes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            bonho bonho = db.bonhoes.Find(id);
            db.bonhoes.Remove(bonho);
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
