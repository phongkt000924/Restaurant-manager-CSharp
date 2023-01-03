using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;
namespace QuanLyQuanAn
{
    public partial class userSetting : Form
    {
        public string pass,id;
        public SqlConnection con;
        public userSetting()
        {
            InitializeComponent();
        }

        private void btn__Click(object sender, EventArgs e)
        {
            if (tb_name.Text.Trim().Length == 0 || tb_name.Text.Length > 50)
            {
                MessageBox.Show("Tên phải không rỗng và dưới 50 ký tự");
                return;
            }
            new SqlCommand("update taikhoan set namedp='"+tb_name.Text+"' where idnv='"+id+"'", con).ExecuteNonQuery();
            MessageBox.Show("Thao tác xong");
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (!tb_oldpass.Text.Equals(pass))
            {
                MessageBox.Show("Mật khẩu cũ không đúng!");
                return;
            }
            if(tb_newpass.Text.Trim().Length==0 || tb_newpass.Text.Length > 15)
            {
                MessageBox.Show("Mật khẩu phải không rỗng và dưới 15 ký tự");
                return;
            }
            new SqlCommand("update taikhoan set pass='" + tb_newpass.Text + "' where idnv = '" + id + "'", con).ExecuteNonQuery();
            //id = tb_newpass.Text;
            pass = tb_newpass.Text;
            tb_oldpass.Text = "";
            tb_newpass.Text = "";
            MessageBox.Show("Thao tác xong");
        }
    }
}
