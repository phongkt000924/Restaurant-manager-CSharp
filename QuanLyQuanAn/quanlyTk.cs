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
    public partial class quanlyTk : Form
    {
        public SqlConnection con;
        public string id;
        public quanlyTk()
        {
            InitializeComponent();
        }

        private void quanlyTk_Load(object sender, EventArgs e)
        {
            load();
        }
        void load()
        {
            SqlDataAdapter a = new SqlDataAdapter("select idnv,namedp,ban from taikhoan where loai=0 and idnv!='"+id+"'", con);
            DataSet ds = new DataSet();
            a.Fill(ds);
            data.DataSource = ds.Tables[0];
            data.Columns[0].Width = 135;
            data.Columns[1].Width = 135;
            data.Columns[2].Width = 30;
            data.Columns[0].HeaderCell.Style.Font = new Font("Arial", 10, FontStyle.Regular);
            data.Columns[1].HeaderCell.Style.Font = new Font("Arial", 10, FontStyle.Regular);
            data.Refresh();
            btn_delete.Enabled = false;
            button1.Enabled = false;
        }

        private void btn_delete_Click(object sender, EventArgs e)
        {
            if (0!=(int)new SqlCommand("select count(idnv) from hoadon where idnv = N'" + lb_id.Text + "'", con).ExecuteScalar())
            {
                //MessageBox.Show("Không thể xóa do tài khoản này còn nằm trong nhiều hóa đơn!");
                if (DialogResult.Yes == MessageBox.Show("Không thể xóa do tài khoản này còn nằm trong nhiều hóa đơn!\n Bạn có thể lựa chọn khóa tài khoản!", "Xác nhận Khóa tài khoản", MessageBoxButtons.YesNo))
                {
                    new SqlCommand("update taikhoan set ban=1 where idnv='" + lb_id.Text + "'", con).ExecuteNonQuery();
                    MessageBox.Show("Thao tác hoàn tất");
                    load();
                }
                return;
            }
            if(DialogResult.Yes==MessageBox.Show("Tài khoản này sẽ bị xóa khỏi hệ thống!","Xác nhận xóa tài khoản", MessageBoxButtons.YesNo))
            {
                new SqlCommand("delete taikhoan where idnv='" + lb_id.Text+"'", con).ExecuteNonQuery();
                MessageBox.Show("Thao tác hoàn tất");
                load();
            }
        }

        private void data_MouseUp(object sender, MouseEventArgs e)
        {
            lb_id.Text = data.Rows[data.CurrentCell.RowIndex].Cells[0].Value.ToString();
            lb_name.Text = data.Rows[data.CurrentCell.RowIndex].Cells[1].Value.ToString();
            btn_delete.Enabled = true;
            if ((bool)data.Rows[data.CurrentCell.RowIndex].Cells[2].Value == true)
            {
                button1.Enabled = true;
            }
        }

        private void btn_thêm_Click(object sender, EventArgs e)
        {
            if(tb_id.Text.Trim().Length==0 || tb_name.Text.Trim().Length==0 || tb_pass.Text.Trim().Length == 0)
            {
                MessageBox.Show("Hãy điền đầy đủ các thông tin!");
                return;
            }
            if(tb_id.Text.Length>15 || tb_pass.Text.Length>15 || tb_name.Text.Length > 50)
            {
                MessageBox.Show("Đầu vào tối đa của id và pass là 15, với name là 50!");
                return;
            }
            if(0!=(int)new SqlCommand("select count(idnv) from taikhoan where idnv='" + tb_id + "'", con).ExecuteScalar())
            {
                MessageBox.Show("Đã có id này rồi!");
                return;
            }
            new SqlCommand("insert into taikhoan values('"+tb_id.Text+"','"+tb_pass.Text+"','"+tb_name.Text+"',0,0)", con).ExecuteNonQuery();
            MessageBox.Show("Thao tác hoàn tất");
            load();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (DialogResult.Yes == MessageBox.Show("Bỏ khóa tài khoản!", "Xác nhận bỏ Khóa tài khoản", MessageBoxButtons.YesNo))
            {
                new SqlCommand("update taikhoan set ban=0 where idnv='" + lb_id.Text + "'", con).ExecuteNonQuery();
                MessageBox.Show("Thao tác hoàn tất");
                load();
            }
        }
    }
}
