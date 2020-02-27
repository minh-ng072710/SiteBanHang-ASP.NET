using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Web.Security;
using System.Web.Mvc;
using Web_ecomerce2.Model;
namespace Web_ecomerce2.Controllers
{
    public class userController : Controller
    {
        e_comerceEntities db = new e_comerceEntities();
        public bool checkUser(string name, string pass)
        {
            if (db.KhachHangs.Where(m => m.Email == name && m.MatKhau == pass).Count() > 0)
            {
                return true;
            }
            return false;
        }
        // GET: user

        public ActionResult Index()
        {
            return View();
        }
      
        public ActionResult LogIn()
        {
            return View();
        }
        public ActionResult Register()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Register(KhachHang user)
        {
            if (ModelState.IsValid)
            {
                string password2 = MaHoa.MD5Hash(user.MatKhau);
                //xét email ko trùng
                if (ModelState.IsValid)
                {
                    if (db.KhachHangs.Where(m => m.Email.Equals(user.Email)).Count()==0)
                    {
                        KhachHang objKH = new KhachHang();
                        objKH.TenKH = user.TenKH;
                        objKH.DiaChi = user.DiaChi;
                        objKH.SDT = user.SDT;
                        objKH.Email = user.Email;
                        objKH.MatKhau = password2;
                        db.KhachHangs.Add(objKH);
                        //lưu vào csdl

                        db.SaveChanges();

                        return RedirectToAction("Login", "user");
                    }
                    else
                    // trùng email
                    {
                        ModelState.AddModelError("Email", "Email đã tồn tại !");
                    }
                }
                
            }
                return View("Register");
            
        }

        public ActionResult LogOff()
        {
            FormsAuthentication.SignOut(); //xoa cookie

            //WebSecurity.Logout();
            Session["Name"] = null;
            return RedirectToAction("LogIn", "User");
        }

        private bool checkUserLogin(LoginModel meomeo)
        {
            string meo = MaHoa.MD5Hash(meomeo.passWord);
            if (db.KhachHangs.Where(m => m.SDT == meomeo.userName && m.MatKhau.Equals(meo)).Count() == 1 || db.KhachHangs.Where(m => m.Email == meomeo.userName && m.MatKhau.Equals(meo)).Count() == 1)
            {
                return true;
            }
            return false;
        }

        [HttpPost]
        public ActionResult LogIn(LoginModel user1)
        {
            //dùng để clear lỗi của ràng buộc nhập tên kh.
            //ModelState.Where(m => m.Key == "TenKH").FirstOrDefault().Value.Errors.Clear();
            ///ModelState.Where(m => m.Key == "DiaChi").FirstOrDefault().Value.Errors.Clear();
            if (ModelState.IsValid)
            {
               // string pass = MaHoa.MD5Hash(user1.passWord);
                //ModelState.Where(m => m.Key == "tenkh").FirstOrDefault().Value.Errors.Clear();
                if (checkUserLogin(user1))
                {
                    KhachHang kh = db.KhachHangs.Where(m => m.SDT == user1.userName || m.Email == user1.userName).FirstOrDefault();
                    //gọi hàm GetRolesForUser(string username) 
                    //trong fie CustomRoleProvider.cs) 
                    //nó sẽ chuyền giá trị username để lấy quyền.
                    FormsAuthentication.SetAuthCookie(kh.TenKH, true);

                    Session["Name"] = kh.TenKH.ToString();
                    return RedirectToAction("Index", "Home");
                }
            }
            ViewBag.ErrorMessage = "SAI TÊN ĐĂNG NHẬP HOẶC MẬT KHẨU ? Bạn chưa có tài khoản? Bấm Đăng ký";
            return View();

        }


    }
}