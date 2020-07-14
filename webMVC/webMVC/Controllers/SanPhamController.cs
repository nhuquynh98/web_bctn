using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace webMVC.Controllers
{
    public class SanPhamController : ApiController
    {
        // GET: api/SanPham
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET: api/SanPham/5
        public string Get(int id)
        {
            return "value";
        }

        // POST: api/SanPham
        public void Post([FromBody]string value)
        {
        }

        // PUT: api/SanPham/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/SanPham/5
        public void Delete(int id)
        {
        }
    }
}
