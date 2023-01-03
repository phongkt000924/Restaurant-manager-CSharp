
namespace QuanLyQuanAn
{
    partial class quanlyMon
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle2 = new System.Windows.Forms.DataGridViewCellStyle();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(quanlyMon));
            this.label1 = new System.Windows.Forms.Label();
            this.data = new System.Windows.Forms.DataGridView();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.label7 = new System.Windows.Forms.Label();
            this.lb_id = new System.Windows.Forms.Label();
            this.lb_ten = new System.Windows.Forms.Label();
            this.lb_loai = new System.Windows.Forms.Label();
            this.lb_gia = new System.Windows.Forms.Label();
            this.lb_ngungban = new System.Windows.Forms.Label();
            this.btn_xoa = new System.Windows.Forms.Button();
            this.btn_ngungban = new System.Windows.Forms.Button();
            this.tb_ten = new System.Windows.Forms.TextBox();
            this.tb_gia = new System.Windows.Forms.TextBox();
            this.cb_loai = new System.Windows.Forms.ComboBox();
            this.btn_them = new System.Windows.Forms.Button();
            this.label8 = new System.Windows.Forms.Label();
            this.label9 = new System.Windows.Forms.Label();
            this.label10 = new System.Windows.Forms.Label();
            this.label11 = new System.Windows.Forms.Label();
            this.panel1 = new System.Windows.Forms.Panel();
            this.panel2 = new System.Windows.Forms.Panel();
            ((System.ComponentModel.ISupportInitialize)(this.data)).BeginInit();
            this.panel1.SuspendLayout();
            this.panel2.SuspendLayout();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Arial", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(178, 17);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(118, 16);
            this.label1.TabIndex = 4;
            this.label1.Text = "DANH SÁCH MÓN";
            this.label1.Click += new System.EventHandler(this.label1_Click);
            // 
            // data
            // 
            this.data.AllowUserToAddRows = false;
            this.data.AllowUserToDeleteRows = false;
            this.data.AllowUserToResizeColumns = false;
            this.data.AllowUserToResizeRows = false;
            dataGridViewCellStyle1.Font = new System.Drawing.Font("Arial", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.data.AlternatingRowsDefaultCellStyle = dataGridViewCellStyle1;
            this.data.BackgroundColor = System.Drawing.Color.DarkSeaGreen;
            this.data.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.data.Location = new System.Drawing.Point(12, 43);
            this.data.MultiSelect = false;
            this.data.Name = "data";
            this.data.ReadOnly = true;
            this.data.RowHeadersVisible = false;
            dataGridViewCellStyle2.Font = new System.Drawing.Font("Arial Narrow", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.data.RowsDefaultCellStyle = dataGridViewCellStyle2;
            this.data.RowTemplate.DefaultCellStyle.Font = new System.Drawing.Font("Arial", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.data.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.data.Size = new System.Drawing.Size(480, 466);
            this.data.TabIndex = 3;
            this.data.MouseUp += new System.Windows.Forms.MouseEventHandler(this.data_MouseUp);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.BackColor = System.Drawing.Color.Transparent;
            this.label2.Font = new System.Drawing.Font("Arial", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.ForeColor = System.Drawing.Color.Black;
            this.label2.Location = new System.Drawing.Point(607, 17);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(120, 16);
            this.label2.TabIndex = 5;
            this.label2.Text = "MÓN ĐANG CHỌN";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.BackColor = System.Drawing.Color.Transparent;
            this.label3.Font = new System.Drawing.Font("Arial", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.Location = new System.Drawing.Point(19, 15);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(24, 16);
            this.label3.TabIndex = 6;
            this.label3.Text = "ID:";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.BackColor = System.Drawing.Color.Transparent;
            this.label4.Font = new System.Drawing.Font("Arial", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.Location = new System.Drawing.Point(10, 46);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(33, 16);
            this.label4.TabIndex = 7;
            this.label4.Text = "Tên:";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.BackColor = System.Drawing.Color.Transparent;
            this.label5.Font = new System.Drawing.Font("Arial", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label5.Location = new System.Drawing.Point(10, 73);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(36, 16);
            this.label5.TabIndex = 8;
            this.label5.Text = "Loại:";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.BackColor = System.Drawing.Color.Transparent;
            this.label6.Font = new System.Drawing.Font("Arial", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label6.Location = new System.Drawing.Point(14, 102);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(32, 16);
            this.label6.TabIndex = 9;
            this.label6.Text = "Giá:";
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.BackColor = System.Drawing.Color.Transparent;
            this.label7.Font = new System.Drawing.Font("Arial", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label7.Location = new System.Drawing.Point(7, 128);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(76, 16);
            this.label7.TabIndex = 10;
            this.label7.Text = "Ngừng bán:";
            // 
            // lb_id
            // 
            this.lb_id.AutoSize = true;
            this.lb_id.BackColor = System.Drawing.Color.Transparent;
            this.lb_id.Font = new System.Drawing.Font("Arial", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lb_id.Location = new System.Drawing.Point(89, 15);
            this.lb_id.Name = "lb_id";
            this.lb_id.Size = new System.Drawing.Size(70, 16);
            this.lb_id.TabIndex = 11;
            this.lb_id.Text = "chưa chọn";
            // 
            // lb_ten
            // 
            this.lb_ten.AutoSize = true;
            this.lb_ten.BackColor = System.Drawing.Color.Transparent;
            this.lb_ten.Font = new System.Drawing.Font("Arial", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lb_ten.Location = new System.Drawing.Point(89, 46);
            this.lb_ten.Name = "lb_ten";
            this.lb_ten.Size = new System.Drawing.Size(70, 16);
            this.lb_ten.TabIndex = 12;
            this.lb_ten.Text = "chưa chọn";
            // 
            // lb_loai
            // 
            this.lb_loai.AutoSize = true;
            this.lb_loai.BackColor = System.Drawing.Color.Transparent;
            this.lb_loai.Font = new System.Drawing.Font("Arial", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lb_loai.Location = new System.Drawing.Point(89, 73);
            this.lb_loai.Name = "lb_loai";
            this.lb_loai.Size = new System.Drawing.Size(70, 16);
            this.lb_loai.TabIndex = 13;
            this.lb_loai.Text = "chưa chọn";
            // 
            // lb_gia
            // 
            this.lb_gia.AutoSize = true;
            this.lb_gia.BackColor = System.Drawing.Color.Transparent;
            this.lb_gia.Font = new System.Drawing.Font("Arial", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lb_gia.Location = new System.Drawing.Point(89, 102);
            this.lb_gia.Name = "lb_gia";
            this.lb_gia.Size = new System.Drawing.Size(70, 16);
            this.lb_gia.TabIndex = 14;
            this.lb_gia.Text = "chưa chọn";
            // 
            // lb_ngungban
            // 
            this.lb_ngungban.AutoSize = true;
            this.lb_ngungban.BackColor = System.Drawing.Color.Transparent;
            this.lb_ngungban.Font = new System.Drawing.Font("Arial", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lb_ngungban.Location = new System.Drawing.Point(89, 128);
            this.lb_ngungban.Name = "lb_ngungban";
            this.lb_ngungban.Size = new System.Drawing.Size(70, 16);
            this.lb_ngungban.TabIndex = 15;
            this.lb_ngungban.Text = "chưa chọn";
            // 
            // btn_xoa
            // 
            this.btn_xoa.Location = new System.Drawing.Point(160, 171);
            this.btn_xoa.Name = "btn_xoa";
            this.btn_xoa.Size = new System.Drawing.Size(75, 23);
            this.btn_xoa.TabIndex = 16;
            this.btn_xoa.Text = "Xóa";
            this.btn_xoa.UseVisualStyleBackColor = true;
            this.btn_xoa.Click += new System.EventHandler(this.btn_xoa_Click);
            // 
            // btn_ngungban
            // 
            this.btn_ngungban.Location = new System.Drawing.Point(28, 171);
            this.btn_ngungban.Name = "btn_ngungban";
            this.btn_ngungban.Size = new System.Drawing.Size(75, 23);
            this.btn_ngungban.TabIndex = 17;
            this.btn_ngungban.Text = "Ngừng bán";
            this.btn_ngungban.UseVisualStyleBackColor = true;
            this.btn_ngungban.Click += new System.EventHandler(this.btn_ngungban_Click);
            // 
            // tb_ten
            // 
            this.tb_ten.Location = new System.Drawing.Point(51, 35);
            this.tb_ten.Name = "tb_ten";
            this.tb_ten.Size = new System.Drawing.Size(184, 20);
            this.tb_ten.TabIndex = 18;
            // 
            // tb_gia
            // 
            this.tb_gia.Location = new System.Drawing.Point(51, 88);
            this.tb_gia.Name = "tb_gia";
            this.tb_gia.Size = new System.Drawing.Size(184, 20);
            this.tb_gia.TabIndex = 19;
            // 
            // cb_loai
            // 
            this.cb_loai.FormattingEnabled = true;
            this.cb_loai.Location = new System.Drawing.Point(51, 62);
            this.cb_loai.Name = "cb_loai";
            this.cb_loai.Size = new System.Drawing.Size(184, 21);
            this.cb_loai.TabIndex = 20;
            // 
            // btn_them
            // 
            this.btn_them.Location = new System.Drawing.Point(109, 126);
            this.btn_them.Name = "btn_them";
            this.btn_them.Size = new System.Drawing.Size(75, 32);
            this.btn_them.TabIndex = 21;
            this.btn_them.Text = "Thêm";
            this.btn_them.UseVisualStyleBackColor = true;
            this.btn_them.Click += new System.EventHandler(this.btn_them_Click);
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Font = new System.Drawing.Font("Arial", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label8.Location = new System.Drawing.Point(14, 90);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(32, 16);
            this.label8.TabIndex = 24;
            this.label8.Text = "Giá:";
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Font = new System.Drawing.Font("Arial", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label9.Location = new System.Drawing.Point(14, 63);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(36, 16);
            this.label9.TabIndex = 23;
            this.label9.Text = "Loại:";
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Font = new System.Drawing.Font("Arial", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label10.Location = new System.Drawing.Point(19, 36);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(33, 16);
            this.label10.TabIndex = 22;
            this.label10.Text = "Tên:";
            // 
            // label11
            // 
            this.label11.AutoSize = true;
            this.label11.Font = new System.Drawing.Font("Arial", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label11.ForeColor = System.Drawing.Color.Black;
            this.label11.Location = new System.Drawing.Point(617, 309);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(78, 16);
            this.label11.TabIndex = 25;
            this.label11.Text = "THÊM MÓN";
            this.label11.Click += new System.EventHandler(this.label11_Click);
            // 
            // panel1
            // 
            this.panel1.BackColor = System.Drawing.Color.Orchid;
            this.panel1.Controls.Add(this.lb_gia);
            this.panel1.Controls.Add(this.label3);
            this.panel1.Controls.Add(this.label4);
            this.panel1.Controls.Add(this.label5);
            this.panel1.Controls.Add(this.label6);
            this.panel1.Controls.Add(this.label7);
            this.panel1.Controls.Add(this.lb_id);
            this.panel1.Controls.Add(this.btn_ngungban);
            this.panel1.Controls.Add(this.lb_ten);
            this.panel1.Controls.Add(this.btn_xoa);
            this.panel1.Controls.Add(this.lb_loai);
            this.panel1.Controls.Add(this.lb_ngungban);
            this.panel1.Location = new System.Drawing.Point(528, 43);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(261, 218);
            this.panel1.TabIndex = 26;
            // 
            // panel2
            // 
            this.panel2.BackColor = System.Drawing.Color.LightSeaGreen;
            this.panel2.Controls.Add(this.tb_ten);
            this.panel2.Controls.Add(this.tb_gia);
            this.panel2.Controls.Add(this.cb_loai);
            this.panel2.Controls.Add(this.label8);
            this.panel2.Controls.Add(this.btn_them);
            this.panel2.Controls.Add(this.label9);
            this.panel2.Controls.Add(this.label10);
            this.panel2.Location = new System.Drawing.Point(528, 338);
            this.panel2.Name = "panel2";
            this.panel2.Size = new System.Drawing.Size(261, 171);
            this.panel2.TabIndex = 27;
            // 
            // quanlyMon
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.Aqua;
            this.ClientSize = new System.Drawing.Size(803, 521);
            this.Controls.Add(this.panel2);
            this.Controls.Add(this.label11);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.data);
            this.Controls.Add(this.panel1);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MaximizeBox = false;
            this.Name = "quanlyMon";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Quản lý các món ăn";
            this.Load += new System.EventHandler(this.quanlyMon_Load);
            ((System.ComponentModel.ISupportInitialize)(this.data)).EndInit();
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            this.panel2.ResumeLayout(false);
            this.panel2.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.DataGridView data;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Label lb_id;
        private System.Windows.Forms.Label lb_ten;
        private System.Windows.Forms.Label lb_loai;
        private System.Windows.Forms.Label lb_gia;
        private System.Windows.Forms.Label lb_ngungban;
        private System.Windows.Forms.Button btn_xoa;
        private System.Windows.Forms.Button btn_ngungban;
        private System.Windows.Forms.TextBox tb_ten;
        private System.Windows.Forms.TextBox tb_gia;
        private System.Windows.Forms.ComboBox cb_loai;
        private System.Windows.Forms.Button btn_them;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.Label label10;
        private System.Windows.Forms.Label label11;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Panel panel2;
    }
}