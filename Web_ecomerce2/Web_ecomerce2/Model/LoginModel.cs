using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Web_ecomerce2.Model
{
    public partial class LoginModel
    {
        [Required(ErrorMessage ="Tài khoản không được để trống")]
        [Display(Name = "Số điện thoại hoặc email")]
        [RegularExpression(@"^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$|^\+?\d{0,2}\-?\d{4,5}\-?\d{5,6}", ErrorMessage = "Nhập email hay số điện thoại sai định dạng")]
        public string userName { get; set; }

        [Required(ErrorMessage ="Mật khẩu không được để trống")]
        [Display(Name = "Mật khẩu của bẹn")]
        [DataType(DataType.Password)]
        public string passWord { get; set; }
        public LoginModel() { }
    }
}