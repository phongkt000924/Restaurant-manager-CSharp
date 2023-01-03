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
using System.Diagnostics;

namespace QuanLyQuanAn
{
    public partial class dothi : Form
    {
        public SqlConnection con;
        double luot_tong,luot_mangve,luot_taiban;
        double thu_tong, thu_mangve,thu_taiban;
        double tg_mangve, tg_taiban;
        public dothi()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            luot_taiban = (int)new SqlCommand("select count(*) from hoadon where dathanhtoan=1 and soban!=0", con).ExecuteScalar();
            luot_mangve = (int)new SqlCommand("select count(*) from hoadon where dathanhtoan=1 and soban=0", con).ExecuteScalar();
            luot_tong = luot_taiban + luot_mangve;

            thu_taiban = (int)new SqlCommand("select sum(thuctra) from hoadon where dathanhtoan=1 and soban!=0", con).ExecuteScalar();
            thu_mangve = (int)new SqlCommand("select sum(thuctra) from hoadon where dathanhtoan=1 and soban=0", con).ExecuteScalar();
            thu_tong = thu_taiban + thu_mangve;

            tg_mangve = (int)new SqlCommand("select avg(tb1.tg) from (select DATEPART(N,checkout-checkin) 'tg',idhoadon from hoadon where dathanhtoan=1 and soban=0 and DATEPART(N,checkout-checkin)!=0) tb1", con).ExecuteScalar();
            tg_taiban = (int)new SqlCommand("select avg(tb1.tg) from (select DATEPART(N,checkout-checkin) 'tg',idhoadon from hoadon where dathanhtoan=1 and soban!=0 and DATEPART(N,checkout-checkin)!=0) tb1", con).ExecuteScalar();

            chart1.Series["s1"].Points.AddXY("Mang về", luot_mangve);
            chart1.Series["s1"].Points.AddXY("Tại quán", luot_taiban);
            lb_luot_mangve.Text = luot_mangve.ToString()+ " lượt";
            lb_luot_taiban.Text = luot_taiban.ToString()+ " lượt";
            lb_luot_tong.Text = luot_tong.ToString()+" lượt";

            chart2.Series["s1"].Points.AddXY("Mang về", thu_mangve);
            chart2.Series["s1"].Points.AddXY("Tại quán", thu_taiban);
            lb_thu_taiban.Text = thu_taiban.ToString("#,##0") + " VND";
            lb_thu_mangve.Text = thu_mangve.ToString("#,##0") + " VND";
            lb_thu_tong.Text = thu_tong.ToString("#,##0") + " VND";

            chart3.Series["s1"].Points.AddXY("Mang về", tg_mangve);
            chart3.Series["s1"].Points.AddXY("Tại quán", tg_taiban);
            lb_tg_mangve.Text = tg_mangve.ToString() + " phút";
            lb_tg_taiban.Text = tg_taiban.ToString() + " phút";

            int index = 0;
            string[] list = new string[3];
            SqlDataReader rs = new SqlCommand("select top(3) count(t.ten),t.ten from (select h.idhoadon, d.idmon from hoadon h join dshd d on h.idhoadon = d.idhoadon  where dathanhtoan = 1) tb1 join thucdon t on t.id = tb1.idmon group by t.ten order by count(t.ten) DESC", con).ExecuteReader();
            while (rs.Read() && index < 3)
            {
                list[index] = rs.GetString(1);
                index++;
                Debug.WriteLine(rs.GetString(1));
            }
            rs.Close();
            mon_1.Text ="1. "+list[0];
            mon_2.Text = "2. " + list[1];
            mon_3.Text = "3. " + list[2];

            index = 0;
            rs = new SqlCommand("select top(3) count(soban) 'solan',soban from hoadon where dathanhtoan=1 and soban !=0 group by soban order by solan DESC ", con).ExecuteReader();
            while (rs.Read() && index < 3)
            {
                list[index] = rs.GetInt32(1)+"";
                index++;
                Debug.WriteLine(rs.GetInt32(1)+"");
            }
            rs.Close();
            ban_1.Text = "1. Bàn số " + list[0];
            ban_2.Text = "2. Bàn số " + list[1];
            ban_3.Text = "3. Bàn số " + list[2];
            

            index = 0;
            rs = new SqlCommand("select top(3) tb1.sl,l.tenloai from (select count(h.idhoadon) N'sl',b.loaiban from hoadon h join ban b on h.soban=b.soban where h.dathanhtoan=1 group by b.loaiban) tb1 join loaiban l on l.idloaiban=tb1.loaiban", con).ExecuteReader();
            while (rs.Read() && index < 3)
            {
                list[index] = rs.GetString(1);
                index++;
                Debug.WriteLine(rs.GetString(1));
            }
            rs.Close();
            lb_1.Text = "1. " + list[0];
            lb_2.Text = "2. " + list[1];
            lb_3.Text = "3. " + list[2];
        }

        private void chart3_Click(object sender, EventArgs e)
        {

        }
    }
}
