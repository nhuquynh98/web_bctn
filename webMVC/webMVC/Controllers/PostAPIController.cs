using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using webMVC.Models;

namespace webMVC.Controllers
{
    public class PostAPIController : ApiController
    {
        private readonly BCTNEntities db = new BCTNEntities();

        public IHttpActionResult Get(string query)
        {
            var title = db.sanphams.Where(x => x.tensp.Contains(query)).Select(x => x.tensp).ToList();
            return Ok(title);
        }
    }
}
