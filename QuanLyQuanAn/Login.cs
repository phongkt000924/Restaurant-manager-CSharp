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
    public partial class Login : Form
    {
        SqlConnection con;
        public Login()
        {
            InitializeComponent();
        }

        private void Login_Load(object sender, EventArgs e)
        {
            con = new SqlConnection("Server=LAPTOP-V97KUNH8\\SQLEXPRESS;Database=quanlyquanan;User Id=sa;Password=000924;");
           
        }

        private void btn_exit_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void btn_login_Click(object sender, EventArgs e)
        {
            SqlCommand com = new SqlCommand("select top(1) * from taikhoan where idnv = '"+tb_id.Text+"' and pass = '"+tb_pass.Text+"'",con);
            con.Open();
            SqlDataReader rs = com.ExecuteReader();
            bool check=false;
            string tennv = "";
            bool isAd = false;
            bool ban = false;
            while (rs.Read())
            {
                check = true;
                tennv = rs.GetString(2);
                isAd = (bool)rs.GetSqlBoolean(3);
                //MessageBox.Show(isAd.ToString());
                ban= (bool)rs.GetSqlBoolean(4);
            }
            
            con.Close();
            if (ban)
            {
                MessageBox.Show("Tai khoan da bi khoa");
                return;
            }

            if (check)
            {
                quanly ql = new quanly();
                ql.idnv = tb_id.Text;
                ql.tennv = tennv;
                ql.pass = tb_pass.Text;
                ql.isAD = isAd;
                ql.con = this.con;
                ql.Show();
                this.Hide();
            }
            else
            {
                MessageBox.Show("ID và PASS không chính xác");
            }
        }
    }
}
