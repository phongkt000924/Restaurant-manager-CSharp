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
    public partial class quanlyBan : Form
    {
        public SqlConnection con;
        static bool isAdd = true;
        public quanlyBan()
        {
            InitializeComponent();
            //con = new SqlConnection("Server=LAPTOP-92AKL11M\\SQLEXPRESS;Database=quanlyquanan;User Id=sa;Password=123;");
            //con.Open();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void quanlyBan_Load(object sender, EventArgs e)
        {
            reload();
        }
        void reload()
        {
            loadBan();
            loadLoaiban();
            btn_delete.Enabled = false;
            btn_save.Enabled = false;
            cb_loaiban_b.DropDownStyle = ComboBoxStyle.Simple;
            tb_soban.ReadOnly = true;
            cb_loaiban_b.Enabled = false;
            btn_edit.Enabled = false;
        }
        void loadBan()
        {
            SqlDataAdapter adapter = new SqlDataAdapter("select b.soban N'Số bàn',l.tenloai N'Loại bàn',b.bihu N'Đã Ngừng' from ban b join loaiban l on b.loaiban=l.idloaiban", con);
            DataSet ds = new DataSet();
            adapter.Fill(ds);
            dataGridView1.DataSource = ds.Tables[0];
            dataGridView1.Columns[0].Width = 90;
            dataGridView1.Columns[1].Width = 125;
            dataGridView1.Columns[2].Width = 90;
            dataGridView1.Columns[0].HeaderCell.Style.Font = new Font("Arial", 10, FontStyle.Bold);
            dataGridView1.Columns[1].HeaderCell.Style.Font = new Font("Arial", 10, FontStyle.Bold);
            dataGridView1.Columns[2].HeaderCell.Style.Font = new Font("Arial", 10, FontStyle.Bold);
            dataGridView1.Refresh();
        }
        void loadLoaiban()
        {
            cb_loaiban_b.Items.Clear();
            cb_laoiban.Items.Clear();
            SqlDataReader rs = new SqlCommand("select * from loaiban", con).ExecuteReader();
            while (rs.Read())
            {
                cb_laoiban.Items.Add(rs.GetString(1));
                cb_loaiban_b.Items.Add(rs.GetString(1));
            }
            rs.Close();
            cb_loaiban_b.SelectedIndex = 0;
            cb_laoiban.SelectedIndex = 0;
        }

        private void button3_Click(object sender, EventArgs e)
        {
            //SqlCommand com = new SqlCommand("select count(l.soban) from ban l join hoadon h on l.soban=h.soban join loaiban lb on lb.idloaiban = l.loaiban where lb.tenloai = N'"+cb_laoiban.Text+"'", con);
            SqlCommand com = new SqlCommand("select * from ban b join loaiban l on l.idloaiban=b.loaiban where l.tenloai=N'"+cb_laoiban.Text+"'",con);
            SqlDataReader rs = com.ExecuteReader();
            int sl=0;
            //MessageBox.Show(sl + "");
            while (rs.Read())
            {
                sl = rs.GetInt32(0);
            }
            rs.Close();
            //if ((int)com.ExecuteScalar()==0)
            if(sl==0)
            {
                new SqlCommand("delete loaiban where tenloai = N'" + cb_laoiban.Text + "'", con).ExecuteNonQuery();
                MessageBox.Show("Thao tác hoàn tất");
            }
            else
            {
                MessageBox.Show("Loại bàn này đang tồn tại trong các hóa đơn\nnên tạm thời chưa thể xóa!");
            }
            reload();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (tb_sualoai.Text.Trim().Length == 0)
            {
                MessageBox.Show("Tên loại bàn không được để trống");
               return;
            }
            if (tb_sualoai.Text.Length > 20)
            {
                MessageBox.Show("Tên loại bắt buộc phải dưới 20 ký tự!");
                return;
            }
            
            
            if(DialogResult.Yes== MessageBox.Show("Bạn có muốn sửa " + cb_laoiban.Text + " thành " + tb_sualoai.Text + "?", "Xác nhận sửa loại bàn", MessageBoxButtons.YesNo))
            {
                new SqlCommand("update loaiban set tenloai= N'" + tb_sualoai.Text + "' where tenloai=N'" + cb_laoiban.Text + "'", con).ExecuteNonQuery();
                MessageBox.Show("Thao tác hoàn tất");
            }
            
            reload();
            tb_sualoai.Text = "";
        }

        private void button2_Click(object sender, EventArgs e)
        {
            if (tb_themloai.Text.Trim().Length == 0)
            {
                MessageBox.Show("Tên loại bàn không được để trống");
                return;
            }
            if (tb_themloai.Text.Length > 20)
            {
                MessageBox.Show("Tên loại bắt buộc phải dưới 20 ký tự!");
                return;
            }
            SqlCommand com = new SqlCommand("select max(idloaiban) from loaiban", con);
            int max = (int)com.ExecuteScalar()+1;
            if (cb_laoiban.Items.Contains(tb_themloai.Text))
            {
                MessageBox.Show("Loại bàn bạn muốn thêm đã tồn tại!");
                return;
            }
            new SqlCommand("insert into loaiban values("+max+",N'"+tb_themloai.Text+"')",con).ExecuteNonQuery();
            MessageBox.Show("Thao tác hoàn tất");
            btn_add.Enabled = true;
            reload();
            tb_themloai.Text = "";
        }

        private void btn_delete_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("select count(b.soban) from ban b join hoadon h on b.soban=h.soban where h.dathanhtoan=0 and b.soban="+tb_soban.Text, con);
            int sl = (int)cmd.ExecuteScalar();
            if (sl != 0)
            {
                MessageBox.Show("Không thể tạm dừng bàn do bàn đang được khách ngồi");
                return;
            }
            else
            {
                if(btn_delete.Text.Equals("Dừng SD"))
                {
                    new SqlCommand("update ban set bihu="+1 +"where soban="+tb_soban.Text, con).ExecuteNonQuery();
                }
                else
                {
                    new SqlCommand("update ban set bihu=" + 0 + "where soban=" + tb_soban.Text, con).ExecuteNonQuery();
                }
            }
            MessageBox.Show("Thao tác hoàn tất");
            reload();
        }

        private void dataGridView1_MouseUp(object sender, MouseEventArgs e)
        {
            tb_soban.Text= dataGridView1.Rows[dataGridView1.CurrentCell.RowIndex].Cells[0].Value.ToString();
            int index=cb_loaiban_b.Items.IndexOf(dataGridView1.Rows[dataGridView1.CurrentCell.RowIndex].Cells[1].Value.ToString());
            cb_loaiban_b.SelectedIndex = index;
            //MessageBox.Show(index + "");
            if ((bool)dataGridView1.Rows[dataGridView1.CurrentCell.RowIndex].Cells[2].Value == true)
            {
                btn_delete.Text = "Dùng Lại";
            }
            else btn_delete.Text = "Dừng SD";
            btn_delete.Enabled = true;
            btn_add.Enabled = true;
            cb_loaiban_b.DropDownStyle = ComboBoxStyle.Simple;
        }

        private void btn_edit_Click(object sender, EventArgs e)
        {
            reload();
        }

        private void btn_save_Click(object sender, EventArgs e)
        {
            var isNumeric = int.TryParse(tb_soban.Text, out _);
            if (!isNumeric)
            {
                MessageBox.Show("Đầu vào phải là một con số");
                return;
            }
            if (tb_soban.Text.Trim().Length == 0)
            {
                MessageBox.Show("Tên loại bàn không được để trống");
                return;
            }
            int check = (int)new SqlCommand("select count(soban) from ban where soban="+tb_soban.Text, con).ExecuteScalar();
                if (check != 0)
                {
                    MessageBox.Show("Số bàn đã tồn tại!");
                    return;
                }
                else
                {
                //MessageBox.Show(cb_loaiban_b.SelectedItem.ToString());
                    SqlDataReader rs = new SqlCommand("select idloaiban from loaiban where tenloai = N'" + cb_loaiban_b.SelectedItem.ToString() + "';", con).ExecuteReader();
                    int id=1;
                    if (rs.Read()) id = rs.GetInt32(0);
                    rs.Close();
                    new SqlCommand("insert into ban values("+tb_soban.Text+","+id+",1,0)",con).ExecuteNonQuery();
                    MessageBox.Show("Thao tác hoàn tất");
                btn_add.Enabled = true;
                reload();
                }
           
        }

        private void btn_add_Click(object sender, EventArgs e)
        {
            isAdd = true;
            cb_loaiban_b.DropDownStyle = ComboBoxStyle.DropDownList;
            cb_loaiban_b.Enabled = true;
            tb_soban.ReadOnly = false;
            btn_save.Enabled = true;
            btn_edit.Enabled = true;
            btn_add.Enabled = false;
        }
    }
}
