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
    public partial class quanlyHDTK : Form
    {
        public SqlConnection con;
        public quanlyHDTK()
        {
            InitializeComponent();
            
        }

        private void quanlyHDTK_Load(object sender, EventArgs e)
        {
            cb_day.SelectedIndex = 0;
            cb_month.SelectedIndex = 0;
            cb_year.SelectedIndex = 0;
            load();

        }
        void load()
        {
            string id = "";
            string day, mo, year;
            if (cb_year.SelectedItem.ToString().Equals("ALL")) id = "%%";
            else
            {
                year = cb_year.SelectedItem.ToString();
                if (cb_month.SelectedItem.ToString().Equals("ALL")) id = year + "%";
                else
                {
                    mo = cb_month.SelectedItem.ToString();
                    if (cb_day.SelectedItem.ToString().Equals("ALL")) id = year + mo + "%";
                    else
                    {
                        day = cb_day.SelectedItem.ToString();
                        id = year + mo + day + "%";
                    }
                }
            }
            string s = "select h.idhoadon 'ID', h.checkin 'Check In', h.checkout 'Check Out', h.soban N'Bàn',t.nameDP N'Người lập',h.tongtien N'Tổng',h.giamgia N'Giảm',h.thuctra N'Thực' from hoadon h join taikhoan t on h.idnv=t.idnv where h.dathanhtoan=1 and h.idhoadon like '"+id+"'";
            SqlDataAdapter a = new SqlDataAdapter(s, con);
            DataSet ds = new DataSet();
            a.Fill(ds);
            data.DataSource = ds.Tables[0];
            data.Columns[0].Width = 100;
            data.Columns[1].Width = 150;
            data.Columns[2].Width = 150;
            data.Columns[3].Width = 40;
            data.Columns[4].Width = 80;
            data.Columns[5].Width = 100;
            data.Columns[6].Width = 40;
            data.Columns[7].Width = 100;
            data.Refresh();
            double tong=0;
            foreach(DataGridViewRow r in data.Rows)
            {
                tong+=Convert.ToDouble(r.Cells[7].Value.ToString());
            }
            lb_tongthu.Text = tong.ToString("#,##0") + " VND";
        }

        private void data_MouseUp(object sender, MouseEventArgs e)
        {
            string id = data.Rows[data.CurrentCell.RowIndex].Cells[0].Value.ToString();
            string s = "select t.ten N'Tên',d.soluong N'SL',d.dongia N'Tổng',d.giamgia N'Giảm', d.tongtien N'Thực trả' from dshd d join thucdon t on d.idmon=t.id where idhoadon='"+id+"'";
            SqlDataAdapter a = new SqlDataAdapter(s, con);
            DataSet ds = new DataSet();
            a.Fill(ds);
            data1.DataSource = ds.Tables[0];
            data1.Columns[0].Width = 150;
            data1.Columns[1].Width = 50;
            data1.Columns[2].Width = 80;
            data1.Columns[3].Width = 70;
            data1.Columns[4].Width = 80;
            data1.Refresh();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            load();
        }

        private void cb_year_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cb_year.SelectedIndex == 0)
            {
                cb_month.SelectedIndex = 0;
                cb_day.SelectedIndex = 0;
            }
        }

        private void cb_month_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cb_month.SelectedIndex == 0)
            {
                cb_day.SelectedIndex = 0;
            }
        }
    }
}
