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
    public partial class quanlyLoai : Form
    {
        public SqlConnection con;
        public quanlyLoai()
        {
            InitializeComponent();
        }

        private void quanlyLoai_Load(object sender, EventArgs e)
        {
            load();
        }
        void load()
        {
            SqlDataAdapter a = new SqlDataAdapter("select idloai N'ID',tenloai N'Tên'  from loai", con);
            DataSet ds = new DataSet();
            a.Fill(ds);
            data.DataSource = ds.Tables[0];
            data.Columns[0].Width = 50;
            data.Columns[1].Width = 195;
            data.Columns[0].HeaderCell.Style.Font = new Font("Arial", 10, FontStyle.Bold);
            data.Columns[1].HeaderCell.Style.Font = new Font("Arial", 10, FontStyle.Bold);
            data.Refresh();
            btn_sua.Enabled = false;
            btn_xoa.Enabled = false;
        }

        private void data_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void data_MouseUp(object sender, MouseEventArgs e)
        {
            if (data.Rows.Count != 0)
            {
                lb_id.Text = data.Rows[data.CurrentCell.RowIndex].Cells[0].Value.ToString();
                lb_ten.Text = data.Rows[data.CurrentCell.RowIndex].Cells[1].Value.ToString();
                btn_sua.Enabled = true;
                btn_xoa.Enabled = true;
            }
            
        }

        private void btn_xoa_Click(object sender, EventArgs e)
        {
            if((int)new SqlCommand("select count(loai) from thucdon where loai=" + lb_id.Text + "", con).ExecuteScalar() != 0)
            {
                MessageBox.Show("Không thể xóa do loại này đã liên kết đến các bảng khác!");
                return;
            }
            new SqlCommand("delete loai where idloai =" + lb_id.Text, con).ExecuteNonQuery();
            MessageBox.Show("Thao tác hoàn tất");
            load();
        }

        private void btn_sua_Click(object sender, EventArgs e)
        {
            if (tb_sua.Text.Length > 40)
            {
                MessageBox.Show("Đầu vào tối đa 40 ký tự!");
                return;
            }

            if (tb_sua.Text.Trim().Length == 0)
            {
                MessageBox.Show("Đầu vào không được để trống!");
                return;
            }
            if(DialogResult.Yes==MessageBox.Show("Chuyển '"+lb_ten.Text+"' thành '" + tb_sua.Text + "'","Xác nhận sửa tên loại",MessageBoxButtons.YesNo))
            {
                new SqlCommand("update loai set tenloai= N'"+tb_sua.Text+"' where idloai="+lb_id.Text, con).ExecuteNonQuery();
                tb_sua.Text = "";
                MessageBox.Show("Thao tác hoàn tất");
                load();
            }
        }

        private void btn_them_Click(object sender, EventArgs e)
        {
            if (tb_them.Text.Length > 40)
            {
                MessageBox.Show("Đầu vào tối đa 40 ký tự!");
                return;
            }

            if (tb_them.Text.Trim().Length == 0)
            {
                MessageBox.Show("Đầu vào không được để trống!");
                return;
            }
            int max =(int) new SqlCommand("select max(idloai) from loai", con).ExecuteScalar() + 1;
            new SqlCommand("insert into loai values("+max+",N'"+tb_them.Text+"')",con).ExecuteNonQuery();
            MessageBox.Show("Thao tác hoàn tất");
            tb_them.Text = "";
            load();
        }
    }
}
