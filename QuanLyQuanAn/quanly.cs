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
using System.Collections;

namespace QuanLyQuanAn
{
    public partial class quanly : Form
    {
        public SqlConnection con;
        static List<ban> tblist;
        static List<hoadon> hoadonlist;
        static bool loaded = false;
        public string idnv, tennv, pass;
        public bool isAD;
        public quanly()
        {
            tblist = new List<ban>();
            hoadonlist = new List<hoadon>();
            InitializeComponent();
            cb_giamgiamonan.SelectedIndex = 0;
            tabControl_table.SelectedIndex = 1;
            btn_delete.Enabled = false;
            //MessageBox.Show(isAD.ToString());
            
        }
        #region load
        private void quanly_Load_1(object sender, EventArgs e)
        {
            loadBan();
            loadMangVe();
            loadLoai();
            //MessageBox.Show(cb_loai.Items[0].ToString());
            loadThucdon(cb_loai.Items[0].ToString());
            cb_giamgiahoadon.SelectedIndex = 0;
            lb_nhanvien.Text = tennv;
            lb_idnv.Text = idnv;
            loaded = true;
            if (!isAD)
            {
                button2.Enabled = false;
                button3.Enabled = false;
                button7.Enabled = false;
                button5.Enabled = false;
                button6.Enabled = false;
            }
        }

        void reload()
        {
            loadBan();
            loadMangVe();
            loadLoai();
            //MessageBox.Show(cb_loai.Items[0].ToString());
            loadThucdon(cb_loai.Items[0].ToString());
            cb_giamgiahoadon.SelectedIndex = 0;
        }

        void loadBan()
        {
            tab_BoxView.Controls.Clear();
            tblist.Clear();
            if (con.State == ConnectionState.Closed)
                con.Open();
            SqlDataReader rs = new SqlCommand("select c.soban,l.tenloai,c.controng from ban c join loaiban l on c.loaiban=l.idloaiban where c.bihu=0", con).ExecuteReader();
            while (rs.Read())
            {
                tblist.Add(new ban(rs.GetInt32(0), rs.GetString(1), (bool)rs.GetSqlBoolean(2)));
            }
            rs.Close();
            int size = tblist.Count;
            int index = 0;
            int y = 10;
            int width = 120, height = 120, khoangcach = 20, le = 20;
            cb_bantrong.Items.Clear();
            foreach (ban ba in tblist)
            {
                if (ba.getStatus()) cb_bantrong.Items.Add(ba.getSoBan() + " " + ba.getTen());
                Button b = new Button();
                b.Name = tblist.IndexOf(ba).ToString();
                b.Text = ba.getSoBan() + "\n" + ba.getTen().Substring(ba.getTen().IndexOf(" "), 4) + "-" + ba.getTen().Substring(ba.getTen().LastIndexOf(" "));
                b.Font = new Font(b.Font.FontFamily, 10, FontStyle.Bold);
                b.BackColor = Color.Blue;
                b.ForeColor = Color.White;
                b.Size = new Size(width, height);
                b.Location = new Point((index * width) + le + (index * khoangcach), y + le);
                b.MouseClick += table_click;
                if (!ba.getStatus())
                {
                    b.BackColor = Color.Red;
                }

                tab_BoxView.Controls.Add(b);
                if ((index + 1) % 5 == 0)
                {
                    y += height + khoangcach;
                    index = -1;
                }
                index++;
                if (tblist.IndexOf(ba) == 0 && !loaded)
                {
                    table_click(b, null);
                }else if(lb_ban.Text.Substring(0,7).Equals("MANG VỀ"))
                {
                    continue;
                } 
                else if (ba.getSoBan() == Convert.ToInt32(lb_ban.Text.Substring(6)) && loaded)
                {
                    table_click(b, null);
                    tabControl_table.SelectedIndex = 1;
                }
            }
            cb_bantrong.SelectedIndex = 0;
        }

        void loadMangVe()//Load mang về chỉ các hóa đơn mang về nếu có!
        {
            hoadonlist.Clear();
            tabpane_ListView.Controls.Clear();
            SqlDataReader rs = new SqlCommand("select * from hoadon where soban=0 and dathanhtoan=0 and idhoadon like '" + DateTime.Now.ToString("yyyyMMdd") + "%'", con).ExecuteReader();
            while (rs.Read())
            {
                //new hoadon(rs.GetString(0), rs.GetInt32(1), (DateTime)rs.GetSqlDateTime(2), (DateTime)rs.GetSqlDateTime(3), rs.GetInt32(4), rs.GetString(5), rs.GetInt32(6),(bool) rs.GetSqlBoolean(7)
                hoadon temp = new hoadon(rs.GetString(0), rs.GetInt32(1), (DateTime)rs.GetSqlDateTime(2), (DateTime)rs.GetSqlDateTime(3), rs.GetInt32(4), rs.GetString(5), rs.GetInt32(6), rs.GetInt32(7), rs.GetInt32(8));
                hoadonlist.Add(temp);
                Debug.WriteLine(temp.idhoadon);
            }
            rs.Close();
            int size = hoadonlist.Count;
            int index = 0;
            int y = 10;
            int width = 120, height = 120, khoangcach = 20, le = 20;
            foreach (hoadon ba in hoadonlist)
            {
                if (ba.soban == 0)
                {
                    Button b = new Button();
                    b.Text = "Mang Về\n" + ba.idhoadon;
                    b.BackColor = Color.Red;
                    b.Font = new Font("Arial", 12, FontStyle.Bold);
                    b.Size = new Size(width, height);
                    b.Location = new Point((index * width) + le + (index * khoangcach), y + le);
                    b.MouseClick += mangve_click;
                    tabpane_ListView.Controls.Add(b);
                    if ((index + 1) % 5 == 0)
                    {
                        y += height + khoangcach;
                        index = -1;
                    }
                    index++;
                }
            }
            Button add = new Button();
            //add.Text = "Thêm hóa đơn mang về";
            add.BackColor = Color.Green;
            add.Image = new Bitmap(@"add.png");
            add.Size = new Size(width, height);
            add.Location = new Point((index * width) + le + (index * khoangcach), y + le);
            add.MouseClick += addmangve_click;
            tabpane_ListView.Controls.Add(add);
        }

        void loadLoai()
        {
            cb_loai.Items.Clear();
            cb_loai.Items.Add("Tất cả");
            SqlDataReader rs = new SqlCommand("select * from loai", con).ExecuteReader();
            while (rs.Read())
            {
                cb_loai.Items.Add(rs.GetString(1));
            }
            rs.Close();
            cb_loai.SelectedIndex = 0;
        } //load các loại món

        void loadThucdon(String s)
        {
            dg_thucdon.DataSource = null;
            if (s.Equals("Tất cả"))
            {
                s = "%%";
            }
            SqlDataAdapter adapter = new SqlDataAdapter("select t.id 'ID' ,t.ten 'Tên',t.gia 'Giá' from thucdon t join loai l on t.loai = l.idloai where t.ngungban=0 and l.tenloai like N'" + s + "'", con);
            DataSet ds = new DataSet();
            adapter.Fill(ds);
            dg_thucdon.DataSource = ds.Tables[0];
            dg_thucdon.Columns[0].Width = 35;
            dg_thucdon.Columns[1].Width = 235;
            dg_thucdon.Columns[2].Width = 70;
            dg_thucdon.Columns[0].HeaderCell.Style.Font = new Font("Arial", 13, FontStyle.Bold);
            dg_thucdon.Columns[1].HeaderCell.Style.Font = new Font("Arial", 13, FontStyle.Bold);
            dg_thucdon.Columns[2].HeaderCell.Style.Font = new Font("Arial", 13, FontStyle.Bold);
            dg_thucdon.Refresh();
        } //laod thực đơn theo loại

        void loadThucdon(String s1, String s2)
        {
            dg_thucdon.DataSource = null;
            if (s1.Equals("Tất cả"))
            {
                s1 = "%%";
            }
            SqlDataAdapter adapter = new SqlDataAdapter("select t.id 'ID' ,t.ten 'Tên',t.gia 'Giá' from thucdon t join loai l on t.loai = l.idloai where t.ngungban=0 and l.tenloai like N'" + s1 + "'" + "and (t.ten like N'%" + s2 + "%' or t.id like N'%" + s2 + "%' )", con);
            DataSet ds = new DataSet();
            adapter.Fill(ds);
            dg_thucdon.DataSource = ds.Tables[0];
            dg_thucdon.Columns[0].Width = 35;
            dg_thucdon.Columns[1].Width = 235;
            dg_thucdon.Columns[2].Width = 70;
            dg_thucdon.Columns[0].HeaderCell.Style.Font = new Font("Arial", 13, FontStyle.Bold);
            dg_thucdon.Columns[1].HeaderCell.Style.Font = new Font("Arial", 13, FontStyle.Bold);
            dg_thucdon.Columns[2].HeaderCell.Style.Font = new Font("Arial", 13, FontStyle.Bold);
            dg_thucdon.Refresh();
        } // load thực đơn theo loại và cả custom text

        void loadHDBan(int soban) // load lên các thông tin cơ bản của 1 hóa đơn lên bàn BẰNG SỐ BÀN
        {
            SqlDataReader rs = new SqlCommand("select * from hoadon where soban=" + soban + " and dathanhtoan=0 and idhoadon like '" + DateTime.Now.ToString("yyyyMMdd") + "%'", con).ExecuteReader();
            while (rs.Read())
            {
                lb_checkin.Text = ((DateTime)rs.GetSqlDateTime(2)).ToString("dd/MM/yyyy HH:mm:ss tt");
                lb_mahoadon.Text = rs.GetString(0);
                cb_giamgiahoadon.Text = 0 + "%";
            }
            rs.Close();
            //btn_delete.Enabled = false;
        }
        void loadHDBan(string hoadon) // load lên các thông tin cơ bản của 1 hóa đơn lên bàn BẰNG HÓA ĐƠN
        {
            SqlDataReader rs = new SqlCommand("select * from hoadon where soban=0 and dathanhtoan=0 and idhoadon='"+hoadon+"'", con).ExecuteReader();
            while (rs.Read())
            {
                lb_checkin.Text = ((DateTime)rs.GetSqlDateTime(2)).ToString("dd/MM/yyyy HH:mm:ss tt");
                lb_mahoadon.Text = rs.GetString(0);
                cb_giamgiahoadon.Text = 0 + "%";
            }
            rs.Close();
           
        }

        void loadDSHD(string idhoadon) // load các món ăn đã gọi 
        {
            SqlDataAdapter adapter = new SqlDataAdapter("select t.ten N'Tên',d.soluong 'SL',d.dongia N'Tổng',d.giamgia N'Giảm (%)',d.tongtien N'Còn' from dshd d join thucdon t on d.idmon=t.id where d.idhoadon = '" + idhoadon + "'", con);
            DataSet ds = new DataSet();
            adapter.Fill(ds);
            dg_mondagoi.DataSource = ds.Tables[0];
            dg_mondagoi.Columns[0].Width = 200;
            dg_mondagoi.Columns[2].Width = 60;
            dg_mondagoi.Columns[1].Width = 35;
            dg_mondagoi.Columns[3].Width = 50;
            dg_mondagoi.Columns[4].Width = 78;
            dg_mondagoi.Columns[0].HeaderCell.Style.Font = new Font("Arial", 10, FontStyle.Bold);
            dg_mondagoi.Columns[2].HeaderCell.Style.Font = new Font("Arial", 10, FontStyle.Bold);
            dg_mondagoi.Columns[1].HeaderCell.Style.Font = new Font("Arial", 10, FontStyle.Bold);
            dg_mondagoi.Columns[3].HeaderCell.Style.Font = new Font("Arial", 10, FontStyle.Bold);
            dg_mondagoi.Columns[4].HeaderCell.Style.Font = new Font("Arial", 10, FontStyle.Bold);
            dg_mondagoi.Refresh();
            if (dg_mondagoi.Rows.Count != 0)
            {
                pn_chuagoimon.SendToBack();
            } else
            {
                dg_mondagoi.SendToBack();
                lb_panelSay.Text = "Bàn này chưa gọi món";
            }
            tinhtienHD();
            btn_delete.Enabled = false;
            // con.Close();
        }

        #endregion 


        Button btn_focus_temp;
        private void table_click(object sender, EventArgs e)
        {
            // border
            if (btn_focus_temp != null)
            {
                btn_focus_temp.FlatAppearance.BorderColor = Color.White;
                btn_focus_temp.FlatAppearance.BorderSize = 3;
                btn_focus_temp.FlatStyle = FlatStyle.Standard;
            }
            Button btn = (Button)sender;
            btn.FlatStyle = FlatStyle.Flat;
            btn.FlatAppearance.BorderColor = Color.Yellow;
            btn.FlatAppearance.BorderSize = 3;
            btn_focus_temp = btn;
            //create hd
            if (btn.BackColor == Color.Blue)
            {
                //MessageBox.Show(btn.Name+"  "+ tblist.Capacity);
                ban ba = tblist.ElementAt(Convert.ToInt32(btn.Name));
                lb_ban.Text = "BÀN SỐ " + ba.getSoBan();
                lb_loaiban.Text = ba.getTen();
                lb_trangthai.ForeColor = Color.Blue;
                lb_trangthai.Text = "Còn trống";
                lb_checkin.Text = "UNKNOW";
                lb_mahoadon.Text = "UNKNOW";
                btn_taohoadon.Enabled = true;
                dg_mondagoi.SendToBack();
                lb_panelSay.Text = "Bàn này còn chưa có người!!!";
                cb_bantrong.Enabled = false;
                btn_chuyenban.Enabled = false;
                btn_huy.Enabled = false;
                btn_thanhtoan.Enabled = false;
                btn_them.Enabled = false;
                lb_tong.Text = "0 VND";
                lb_thuctra.Text = "0 VND";
            }
            else
            {
                ban ba = tblist.ElementAt(Convert.ToInt32(btn.Name));
                lb_ban.Text = "BÀN SỐ " + ba.getSoBan();
                lb_loaiban.Text = ba.getTen();
                lb_trangthai.ForeColor = Color.Red;
                lb_trangthai.Text = "Đã có người";
                btn_taohoadon.Enabled = false;
                cb_bantrong.Enabled = true;
                btn_chuyenban.Enabled = true;
                btn_huy.Enabled = true;
                btn_thanhtoan.Enabled = true;
                btn_them.Enabled = false;
                loadHDBan(ba.getSoBan());
                loadDSHD(lb_mahoadon.Text);
            }
        }
        Button btn_temp=null;
        private void mangve_click(object sender, EventArgs e)
        {
            //boder
            if (btn_temp != null)
            {
                btn_temp.FlatAppearance.BorderColor = Color.White;
                btn_temp.FlatAppearance.BorderSize = 3;
                btn_temp.FlatStyle = FlatStyle.Standard;
            }
            Button btn = (Button)sender;
            btn.FlatStyle = FlatStyle.Flat;
            btn.FlatAppearance.BorderColor = Color.Yellow;
            btn.FlatAppearance.BorderSize = 3;
            btn_temp = btn;
            //click
            lb_ban.Text = "MANG VỀ " + btn.Text.Substring(16);
            lb_loaiban.Text = "Mang Về";
            lb_trangthai.ForeColor = Color.Green;
            lb_trangthai.Text = "Đang xử lý";
            btn_taohoadon.Enabled = false;
            cb_bantrong.Enabled = false;
            btn_chuyenban.Enabled = false;
            btn_huy.Enabled = true;
            btn_thanhtoan.Enabled = true;
            btn_them.Enabled = false;
            //Button btn = (Button)sender;
            string id = btn.Text.Substring(8).Trim();
            loadHDBan(id);
            loadDSHD(id);
        }
        private void addmangve_click(object sender, EventArgs e)
        {
            //MessageBox.Show("hello");
            lb_ban.Text = "MANG VỀ";
            lb_loaiban.Text = "Mang Về";
            lb_trangthai.ForeColor = Color.Green;
            lb_trangthai.Text = "Không có";
            btn_taohoadon.Enabled = false;
            cb_bantrong.Enabled = false;
            btn_chuyenban.Enabled = false;
            btn_huy.Enabled = true;
            btn_thanhtoan.Enabled = true;
            btn_them.Enabled = false;
            SqlCommand com = new SqlCommand("select count(idhoadon) from hoadon where idhoadon like '" + DateTime.Now.ToString("yyyyMMdd") + "%'", con);
            int max = (int)com.ExecuteScalar() + 1;
            string id = DateTime.Now.ToString("yyyyMMdd") + max;
            lb_mahoadon.Text = id;
            DateTime checkin = DateTime.Now;
            lb_checkin.Text = checkin.ToString("yyyy-MM-dd HH:mm:ss tt");
            addNewHoadon(new hoadon(id, 0, checkin, checkin, 0, lb_idnv.Text, 0, 0, 0));
            reload();
        }
            private void btn_taohoadon_Click(object sender, EventArgs e)
        {
            SqlCommand com = new SqlCommand("select count(idhoadon) from hoadon where idhoadon like '"+DateTime.Now.ToString("yyyyMMdd")+"%'", con);
            int max =(int)com.ExecuteScalar()+1;
            string id = DateTime.Now.ToString("yyyyMMdd") + max;
            DateTime checkin = DateTime.Now;
            addNewHoadon(new hoadon(id,0,checkin,checkin,Convert.ToInt32(lb_ban.Text.Substring(6)),lb_idnv.Text,0,0,0));
            setBan(Convert.ToInt32(lb_ban.Text.Substring(6)), false);
            reload();
            loadHDBan(Convert.ToInt32(lb_ban.Text.Substring(6)));
        }

        void addNewHoadon(hoadon hd)
        {
            SqlCommand com = new SqlCommand("insert into hoadon values('"+hd.idhoadon+"',"+hd.tongtien+",'"+hd.checkin.ToString("yyyy-MM-dd HH:mm:ss tt")+"','"+ hd.checkout.ToString("yyyy-MM-dd HH:mm:ss tt") + "',"+hd.soban+",'"+hd.idnv+"',"+hd.giamgia+","+hd.dathanhtoan+"," + hd.thuctra+")", con);
            com.ExecuteNonQuery();
        }//Thêm mới một hóa đơn vào csdl

        void setBan(int soban, bool controng)
        {
            int temp = 0;
            if (controng) temp = 1;
            SqlCommand com = new SqlCommand("update ban set controng = "+temp+" where soban= "+soban, con);
            com.ExecuteNonQuery();
        }//thiết lập bàn trống hhay có người

        private void btn_them_Click(object sender, EventArgs e)
        {
            if (cb_giamgiamonan.SelectedIndex != 0)
            {
                if (DialogResult.No == MessageBox.Show("Mặt hàng này sẽ được giảm giá đến " + cb_giamgiamonan.Text, "Xác nhận giảm giá món ăn", MessageBoxButtons.YesNo))
                    return;
            }
            int giam = Convert.ToInt32(cb_giamgiamonan.SelectedItem.ToString().Substring(0, cb_giamgiamonan.SelectedItem.ToString().LastIndexOf("%")));
            int idmon = Convert.ToInt32(dg_thucdon.Rows[dg_thucdon.CurrentCell.RowIndex].Cells[0].Value.ToString());
            string idhoadon = lb_mahoadon.Text;
            int sl = (int)nu_soluong.Value;
            int gia = Convert.ToInt32(tb_tong.Text.Substring(0, tb_tong.Text.LastIndexOf(" ")).Replace(",", ""));
            int tong = Convert.ToInt32(tb_thuctra.Text.Substring(0, tb_thuctra.Text.LastIndexOf(" ")).Replace(",", ""));
            string tenmon = tb_monan.Text;
            foreach(DataGridViewRow r in dg_mondagoi.Rows)
            {
               // MessageBox.Show(r.Cells[0].Value.ToString() + "   " + tenmon);
                if (r.Cells[0].Value.ToString().Equals(tenmon))
                {
                   // MessageBox.Show(r.Cells[3].Value.ToString()+"   "+ giam.ToString());
                    if (!r.Cells[3].Value.ToString().Trim().Equals(giam.ToString().Trim()))
                    {
                        if (DialogResult.No==MessageBox.Show("Món này đã tổn tại nhưng khác về Giảm Giá!!!\nBạn có muốn thêm vào theo mức giá giảm đã có?", "Sai khác giá giảm", MessageBoxButtons.YesNo))
                        {
                            return;
                        }else
                        {
                            cb_giamgiamonan.Text = r.Cells[3].Value.ToString().Trim() + "%";
                            tinhtien();
                            sl += Convert.ToInt32(r.Cells[1].Value.ToString());
                            gia = Convert.ToInt32(tb_tong.Text.Substring(0, tb_tong.Text.LastIndexOf(" ")).Replace(",", ""));
                            tong = Convert.ToInt32(tb_thuctra.Text.Substring(0, tb_thuctra.Text.LastIndexOf(" ")).Replace(",", ""));
                            gia += Convert.ToInt32(r.Cells[2].Value.ToString());
                            tong += Convert.ToInt32(r.Cells[4].Value.ToString());
                            updateDSHD(idmon, idhoadon, gia, sl, tong);
                            cb_giamgiamonan.Text = 0 + "%";
                            return;
                        }
                    }
                    else
                    {
                        gia = Convert.ToInt32(tb_tong.Text.Substring(0, tb_tong.Text.LastIndexOf(" ")).Replace(",", ""));
                        tong = Convert.ToInt32(tb_thuctra.Text.Substring(0, tb_thuctra.Text.LastIndexOf(" ")).Replace(",", ""));
                        sl +=Convert.ToInt32(r.Cells[1].Value.ToString());
                        gia+= Convert.ToInt32(r.Cells[2].Value.ToString());
                        tong+= Convert.ToInt32(r.Cells[4].Value.ToString());
                        updateDSHD(idmon, idhoadon, gia, sl, tong);
                        cb_giamgiamonan.Text = 0 + "%";
                        return;
                    }
                }
            }
            cb_giamgiamonan.Text = 0 + "%";
            nu_soluong.Value=1;
            addDSHD(idmon,idhoadon,gia,sl,giam,tong);
        }//Button thêm thực đơn lên bàn.
        void updateDSHD(int idmon, string id, int gia, int soluong, int tong) // cập nhật lại món ăn trong hóa đơn
        {
            SqlCommand com = new SqlCommand("update DSHD set dongia="+gia+",soluong="+soluong+",tongtien="+tong+" where idmon="+idmon+" and idhoadon = '"+id+"'", con);
            com.ExecuteNonQuery();
            loadDSHD(lb_mahoadon.Text);
        }
        void addDSHD(int idmon,string id, int gia,int soluong, int giam, int tong)//Thêm món ăn vòa hóa đơn
        {
            SqlCommand com = new SqlCommand("insert into dshd values("+idmon+",'"+id+"',"+gia+","+soluong+","+giam+","+tong+")", con);
            com.ExecuteNonQuery();
            loadDSHD(lb_mahoadon.Text);
        }
        void tinhtienHD() // tính tiền hóa đơn và hiện ra màn hình
        {
            double tongtien = 0 ;
            foreach(DataGridViewRow r in dg_mondagoi.Rows)
            {
                tongtien += Convert.ToDouble(r.Cells[4].Value.ToString());
            }
            double giamgia = 1 - Convert.ToDouble(cb_giamgiahoadon.SelectedItem.ToString().Substring(0, cb_giamgiahoadon.SelectedItem.ToString().LastIndexOf("%"))) / (Double)100;
            lb_thuctra.Text = (Math.Round(tongtien * giamgia / 1000d, 0) * 1000).ToString("#,##0") + " VND";
            lb_tong.Text = (tongtien).ToString("#,##0") + " VND";
            
        }
        private void cb_giamgiahoadon_SelectedIndexChanged(object sender, EventArgs e)
        {
            tinhtienHD();
        }

        private void btn_chuyenban_Click(object sender, EventArgs e)
        {
            string banold = lb_ban.Text.Substring(7);
            string bannew = cb_bantrong.Text.Substring(0, cb_bantrong.Text.IndexOf(" "));
            if(DialogResult.Yes==MessageBox.Show("Chuyển từ bàn "+banold+" sang bàn "+bannew+"?","Xác nhận chuyển bàn", MessageBoxButtons.YesNo)){
                SqlCommand com = new SqlCommand("update hoadon set soban="+bannew+" where idhoadon='"+lb_mahoadon.Text+"'",con);
                com.ExecuteNonQuery();
                setBan(Convert.ToInt32(bannew),false);
                setBan(Convert.ToInt32(banold), true);
                lb_ban.Text = "BÀN SỐ " + bannew;
                reload();
            }
        }
        private void btn_huy_Click(object sender, EventArgs e)
        {
            if (DialogResult.No == MessageBox.Show("Có chắc chắn xóa hóa đơn này không?", "Xác nhận xóa hóa đơn", MessageBoxButtons.YesNo))
                return;
            string idhoadon = lb_mahoadon.Text;
            SqlCommand com = new SqlCommand("update hoadon set dathanhtoan=2 where idhoadon = '"+idhoadon+"'", con);
            com.ExecuteNonQuery();
            if(lb_trangthai.ForeColor!=Color.Green)
                setBan(Convert.ToInt32(lb_ban.Text.Substring(7)),true);
            lb_tong.Text = "0 VND";
            lb_thuctra.Text = "0 VND";
            reload();
            if (hoadonlist.Count > 0)
            {
                if (tabControl_table.SelectedIndex==0)
                {
                    foreach (Button temp in tabpane_ListView.Controls.OfType<Button>())
                    {
                        if (temp.Text.Substring(8).Trim().Equals(hoadonlist[hoadonlist.Count - 1].idhoadon.Trim()))
                        {
                            mangve_click(temp, null);
                            break;
                        }
                    }
                }
            }
            else
            {
                lb_ban.Text = "BÀN SỐ 1";
                tabControl_table.SelectedIndex = 1;
            }
        }
        private void btn_thanhtoan_Click(object sender, EventArgs e)
        {
            if (dg_mondagoi.Rows.Count==0)
            {
                MessageBox.Show("Hóa đơn này rỗng nến không thể thực hiện thanh toán!\nBạn có thể hủy nó nếu muốn!");
                return;
            }
            if (cb_giamgiahoadon.SelectedIndex != 0)
            {
                if (DialogResult.No == MessageBox.Show("Hóa đơn này sẽ được giảm giá đến " + cb_giamgiahoadon.Text+"\n Có muốn tiếp tục không?", "Xác nhận giảm giá Hóa đơn", MessageBoxButtons.YesNo))
                    return;
            }
            else
            {
                if (DialogResult.No == MessageBox.Show("Thực hiện thanh toán hóa đơn này?", "Xác nhận thanh toán Hóa đơn", MessageBoxButtons.YesNo))
                {
                    return;
                }
            }
            string idhoadon = lb_mahoadon.Text;
            string tong = lb_tong.Text.Substring(0,lb_tong.Text.LastIndexOf(" ")).Replace(",","");
            string thuctra = lb_thuctra.Text.Substring(0,lb_thuctra.Text.LastIndexOf(" ")).Replace(",","");
            string giamgia = cb_giamgiahoadon.Text.Substring(0,cb_giamgiahoadon.Text.LastIndexOf("%"));
            string checkout = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss tt");
            SqlCommand com = new SqlCommand("update hoadon set dathanhtoan=1,giamgia="+giamgia+",tongtien="+tong+",thuctra="+thuctra+",checkout='"+checkout+"' where idhoadon = '" + idhoadon + "'", con);
            com.ExecuteNonQuery();
            if (lb_trangthai.ForeColor != Color.Green)
            {
                setBan(Convert.ToInt32(lb_ban.Text.Substring(6)), true);
            }
            lb_tong.Text = "0 VND";
            lb_thuctra.Text = "0 VND";
            MessageBox.Show("Hoàn tất thanh toán");
            reload();
            if (hoadonlist.Count > 0)
            {
                if (tabControl_table.SelectedIndex == 0)
                {
                    foreach (Button temp in tabpane_ListView.Controls.OfType<Button>())
                    {
                        if (temp.Text.Substring(8).Trim().Equals(hoadonlist[hoadonlist.Count - 1].idhoadon.Trim()))
                        {
                            mangve_click(temp, null);
                            break;
                        }
                    }
                }
            }
            else
            {
                lb_ban.Text = "BÀN SỐ 1";
                tabControl_table.SelectedIndex = 1;
            }
        }
        private void btn_delete_Click(object sender, EventArgs e)
        {
            string tenmon = dg_mondagoi.Rows[dg_mondagoi.CurrentCell.RowIndex].Cells[0].Value.ToString();
            SqlCommand com = new SqlCommand("delete d from dshd d join thucdon t on d.idmon=t.id where t.ten= N'"+tenmon+"';", con);
            //MessageBox.Show("delete d from dshd d join thucdon t on d.idmon = t.id where t.ten = '" + tenmon + "';");
            com.ExecuteNonQuery();
            loadDSHD(lb_mahoadon.Text);
        }
        private void dg_mondagoi_MouseUp(object sender, MouseEventArgs e)
        {
            btn_delete.Enabled = true;
        }
        private void button1_Click(object sender, EventArgs e)
        {
            MessageBox.Show( DateTime.Now.ToString("MM dd"));
        }

        
        #region Thực đơn
        private void cb_loai_SelectedIndexChanged(object sender, EventArgs e)
        {
            loadThucdon(((ComboBox)sender).Items[cb_loai.SelectedIndex].ToString());
            btn_them.Enabled = false;
        }
        private void dg_thucdon_MouseUp(object sender, MouseEventArgs e)
        {
            tb_monan.Text = dg_thucdon.Rows[dg_thucdon.CurrentCell.RowIndex].Cells[1].Value.ToString();
            tinhtien();
            if (lb_trangthai.ForeColor == Color.Red || lb_trangthai.ForeColor == Color.Green)
            {
                btn_them.Enabled = true;
            }
        }
        private void tb_monan_KeyDown(object sender, KeyEventArgs e)
        {
            cb_loai.SelectedIndex = 0;
            loadThucdon(cb_loai.Items[cb_loai.SelectedIndex].ToString(), tb_monan.Text);
            btn_them.Enabled = false;

        }
        private void tb_monan_KeyUp(object sender, KeyEventArgs e)
        {
            cb_loai.SelectedIndex = 0;
            loadThucdon(cb_loai.Items[cb_loai.SelectedIndex].ToString(), tb_monan.Text);
            btn_them.Enabled = false;
        }
        private void tb_monan_Click(object sender, EventArgs e)
        {
            ((TextBox)sender).SelectAll();
            ((TextBox)sender).Focus();
        }
        void tinhtien()
        {
            double giamgia =1- Convert.ToDouble(cb_giamgiamonan.SelectedItem.ToString().Substring(0,cb_giamgiamonan.SelectedItem.ToString().LastIndexOf("%")))/(Double)100;
            tb_thuctra.Text = (Math.Round((Convert.ToDouble(nu_soluong.Value) * Convert.ToDouble(dg_thucdon.Rows[dg_thucdon.CurrentCell.RowIndex].Cells[2].Value.ToString()) * giamgia)/1000d,0)*1000).ToString("#,##0") + " VND";
            tb_tong.Text= (Convert.ToInt32(nu_soluong.Value) * Convert.ToInt32(dg_thucdon.Rows[dg_thucdon.CurrentCell.RowIndex].Cells[2].Value.ToString())).ToString("#,##0") + " VND";
        }
        private void cb_giamgiamonan_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (loaded) tinhtien();
        }
        private void nu_soluong_ValueChanged_1(object sender, EventArgs e)
        {
            tinhtien();
        }







        #endregion

        private void button2_Click(object sender, EventArgs e)
        {
            quanlyBan qlban = new quanlyBan();
            qlban.con = this.con; 
            DialogResult rs= qlban.ShowDialog();
            reload();
        }



        private void button3_Click(object sender, EventArgs e)
        {
            quanlyLoai qlloai = new quanlyLoai();
            qlloai.con = this.con;
            DialogResult rs = qlloai.ShowDialog();
            reload();
        }



        private void button5_Click(object sender, EventArgs e)
        {
            quanlyMon qlmon = new quanlyMon();
            qlmon.con = this.con;
            qlmon.ShowDialog();
            reload();
        }

        private void button6_Click(object sender, EventArgs e)
        {
            quanlyTk qltk = new quanlyTk();
            qltk.con = this.con;
            qltk.id = this.idnv;
            qltk.ShowDialog();
            reload();
        }

        private void Qltk_FormClosed(object sender, FormClosedEventArgs e)
        {
            reload();
        }

        private void button7_Click(object sender, EventArgs e)
        {
            quanlyHDTK qlh = new quanlyHDTK();
            qlh.con = this.con;
            qlh.Show();
            qlh.FormClosed += Qlh_FormClosed;
        }

        private void Qlh_FormClosed(object sender, FormClosedEventArgs e)
        {
            
        }

        private void button1_Click_1(object sender, EventArgs e)
        {
            userSetting u = new userSetting();
            u.con = this.con;
            u.id = this.idnv;
            u.pass = this.pass;
            u.ShowDialog();
            u.FormClosed += U_FormClosed;
        }

        private void U_FormClosed(object sender, FormClosedEventArgs e)
        {
            SqlDataReader rs = new SqlCommand("select * from taikhoan where idnv='"+idnv+"'", con).ExecuteReader();
            while (rs.Read())
            {
                tennv = rs.GetString(2);
                pass = rs.GetString(1);
                lb_nhanvien.Text = tennv;
            }
            rs.Close();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            if(DialogResult.Yes==MessageBox.Show("Thoát chương trình?","Xác nhận thoát", MessageBoxButtons.YesNo))
            {
                Application.Exit();
            }
        }

        private void btn_Reset_Click(object sender, EventArgs e)
        {
            
        }

        private void button8_Click(object sender, EventArgs e)
        {
            if (DialogResult.Yes == MessageBox.Show("Bạn có chắc sẽ thực hiện thao tác reset này?!\nĐiều này sẽ hủy tất cả các hóa đơn chưa được thanh toán của bạn!", "Xác nhận!", MessageBoxButtons.YesNo))
            {
                List<hoadon> hdlist = new List<hoadon>();
                SqlDataReader rs = new SqlCommand("select * from hoadon where dathanhtoan=0", con).ExecuteReader();
                while (rs.Read())
                {
                    //new hoadon(rs.GetString(0), rs.GetInt32(1), (DateTime)rs.GetSqlDateTime(2), (DateTime)rs.GetSqlDateTime(3), rs.GetInt32(4), rs.GetString(5), rs.GetInt32(6),(bool) rs.GetSqlBoolean(7)
                    hoadon temp = new hoadon(rs.GetString(0), rs.GetInt32(1), (DateTime)rs.GetSqlDateTime(2), (DateTime)rs.GetSqlDateTime(3), rs.GetInt32(4), rs.GetString(5), rs.GetInt32(6), rs.GetInt32(7), rs.GetInt32(8));
                    hdlist.Add(temp);
                }
                rs.Close();
                foreach (hoadon h in hdlist)
                {
                    SqlCommand com = new SqlCommand("update hoadon set dathanhtoan=2 where idhoadon = '" + h.idhoadon + "'", con);
                    com.ExecuteNonQuery();
                    setBan(h.soban, true);
                }
                MessageBox.Show("Thao tác thành công!");
                reload();
            }
        }

        private void btn_graph_Click(object sender, EventArgs e)
        {
            dothi d = new dothi();
            d.con = this.con;
            d.Show();
            d.FormClosed += D_FormClosed;
        }

        private void D_FormClosed(object sender, FormClosedEventArgs e)
        {
           
        }

        private void Qlmon_FormClosed(object sender, FormClosedEventArgs e)
        {
            reload();
        }

        private void quanly_FormClosed(object sender, FormClosedEventArgs e)
        {
            Application.Exit();
        }

        
    }
}
