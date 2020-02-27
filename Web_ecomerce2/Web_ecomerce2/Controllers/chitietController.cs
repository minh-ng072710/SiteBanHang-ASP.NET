using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Web_ecomerce2.Model;
namespace Web_ecomerce2.Controllers
{
    public class chitietController : Controller
    {
        // GET: chitiet
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult loadchitiet(int id)
        {
            e_comerceEntities db = new e_comerceEntities();
            List<SanPham> detail = (from q in db.SanPhams where q.MaSP == id select q).ToList();
            return View(detail);
        }

    }
}