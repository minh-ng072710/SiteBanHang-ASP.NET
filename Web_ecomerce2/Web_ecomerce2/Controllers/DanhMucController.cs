using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Web_ecomerce2.Model;

namespace Web_ecomerce2.Content
{
    public class DanhMucController : Controller
    {
      //  public object Model1 { get; private set; }
        public ActionResult productList(string iddanhmuc)
        {
            e_comerceEntities db = new e_comerceEntities();
            List<SanPham> prolist = (from q in db.SanPhams where q.IdDanhMuc == iddanhmuc select q).ToList();
            return View(prolist);
        }

        // GET: DanhMuc
        public ActionResult LoadDanhMuc()
        {
            e_comerceEntities db = new e_comerceEntities();
            List<DanhMuc> dmList = db.DanhMucs.ToList();
            return PartialView(dmList);

       
        }
    }
}