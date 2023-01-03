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
    public partial class quanlyMon : Form
    {
        public SqlConnection con;
        public quanlyMon()
        {
            InitializeComponent();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void quanlyMon_Load(object sender, EventArgs e)
        {
            load();
        }
        void load()
        {
            string s = "select t.id 'ID', t.ten N'Tên', t.gia N'Giá', l.tenloai N'Loại', t.ngungban N'Ngừng' from thucdon t join loai l on l.idloai = t.loai";
            SqlDataAdapter a = new SqlDataAdapter(s, con);
            DataSet ds = new DataSet();
            a.Fill(ds);
            data.DataSource = ds.Tables[0];
            data.Columns[0].Width = 30;
            data.Columns[1].Width = 195;
            data.Columns[2].Width = 75;
            data.Columns[3].Width = 85;
            data.Columns[4].Width = 80;
            data.Columns[0].HeaderCell.Style.Font = new Font("Arial", 10, FontStyle.Bold);
            data.Columns[1].HeaderCell.Style.Font = new Font("Arial", 10, FontStyle.Bold);
            data.Columns[2].HeaderCell.Style.Font = new Font("Arial", 10, FontStyle.Bold);
            data.Columns[3].HeaderCell.Style.Font = new Font("Arial", 10, FontStyle.Bold);
            data.Columns[4].HeaderCell.Style.Font = new Font("Arial", 10, FontStyle.Bold);
            data.Refresh();
            btn_ngungban.Enabled = false;
            btn_xoa.Enabled = false;
            cb_loai.Items.Clear();
            SqlDataReader rs = new SqlCommand("select idloai,tenloai from loai",con).ExecuteReader();
            while (rs.Read())
            {
                cb_loai.Items.Add(rs.GetInt32(0)+" "+rs.GetString(1));
            }
            rs.Close();
            cb_loai.SelectedIndex = 0;
        }

        private void label11_Click(object sender, EventArgs e)
        {

        }

        private void data_MouseUp(object sender, MouseEventArgs e)
        {
            lb_id.Text = data.Rows[data.CurrentCell.RowIndex].Cells[0].Value.ToString();
            lb_ten.Text = data.Rows[data.CurrentCell.RowIndex].Cells[1].Value.ToString();
            lb_loai.Text = data.Rows[data.CurrentCell.RowIndex].Cells[3].Value.ToString();
            lb_gia.Text = data.Rows[data.CurrentCell.RowIndex].Cells[2].Value.ToString();
            bool s = (bool)data.Rows[data.CurrentCell.RowIndex].Cells[4].Value;
            if (s)
            {
                lb_ngungban.Text = "Đã ngừng bán";
                btn_ngungban.Text = "Bán lại";
            }
            else
            {
                lb_ngungban.Text = "Còn bán";
                btn_ngungban.Text = "Ngừng";
            }
            btn_ngungban.Enabled = true;
            btn_xoa.Enabled = true;
        }

        private void btn_ngungban_Click(object sender, EventArgs e)
        {
            SqlDataReader rs = new SqlCommand("select h.idhoadon from hoadon h join  dshd d on d.idhoadon=h.idhoadon where h.dathanhtoan=0 and d.idmon=" + lb_id.Text, con).ExecuteReader();
            int a = 0;
            while (rs.Read())
            {
                a++;
            }
            rs.Close();
            if (a != 0)
            {
                MessageBox.Show("Chưa thực hiện được do món này còn đang được dùng!");
            }
            else
            {
                if (btn_ngungban.Text.Equals("Bán lại"))
                {
                    new SqlCommand("update thucdon set ngungban=0 where id=" + lb_id.Text, con).ExecuteNonQuery();
                    MessageBox.Show("Thao tác hoàn tất");
                    load();
                }
                else
                {
                    new SqlCommand("update thucdon set ngungban=1 where id=" + lb_id.Text, con).ExecuteNonQuery();
                    MessageBox.Show("Thao tác hoàn tất");
                    load();
                }
            }
        }

        private void btn_xoa_Click(object sender, EventArgs e)
        {
            SqlDataReader rs = new SqlCommand("select h.idhoadon from hoadon h join  dshd d on d.idhoadon=h.idhoadon where d.idmon=" + lb_id.Text, con).ExecuteReader();
            int a = 0;
            while (rs.Read())
            {
                a++;
            }
            rs.Close();
            if (a != 0)
            {
                MessageBox.Show("Chưa thực hiện được do món này liên kết với nhiều bảng khác");
            }
            else
            {
                new SqlCommand("delete thucdon where id=" + lb_id.Text, con).ExecuteNonQuery();
                MessageBox.Show("Thao tác hoàn tất");
                load();
            }
        }

        private void btn_them_Click(object sender, EventArgs e)
        {
            if(tb_ten.Text.Trim().Length==0 || tb_gia.Text.Trim().Length==0)
            {
                MessageBox.Show("Đầu  vào không được rỗng");
                return;
            }
            if(tb_ten.Text.Length>40)
            {
                MessageBox.Show("Đầu vào tên phải bé hơn 40");
            }
            if((int)new SqlCommand("select count(id) from thucdon where ten='" + tb_ten.Text+"'", con).ExecuteScalar()!=0)
            {
                MessageBox.Show("Tên đã tồn tại");
                return;
            }
            if(!int.TryParse(tb_gia.Text, out _))
            {
                MessageBox.Show("Giá chưa hợp lệ");
                return;
            }
            int max = (int)new SqlCommand("select max(id) from thucdon",con).ExecuteScalar()+1;
            //MessageBox.Show("insert into thucdon values(" + max + ",N'" + tb_ten + "'," + tb_gia.Text + ",0," + cb_loai.Text.Substring(0, cb_loai.Text.IndexOf(" ")) + ")");
            new SqlCommand("insert into thucdon values("+max+",N'"+tb_ten.Text+"',"+tb_gia.Text+",0,"+cb_loai.Text.Substring(0,cb_loai.Text.IndexOf(" "))+")", con).ExecuteNonQuery();
            MessageBox.Show("Thao tác hoàn tất");
            tb_gia.Text = "";
            tb_ten.Text = "";
            load();
        }
    }
}
