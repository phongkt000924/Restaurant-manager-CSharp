
namespace QuanLyQuanAn
{
    partial class userSetting
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(userSetting));
            this.button1 = new System.Windows.Forms.Button();
            this.tb_oldpass = new System.Windows.Forms.TextBox();
            this.tb_newpass = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.tb_name = new System.Windows.Forms.TextBox();
            this.btn_ = new System.Windows.Forms.Button();
            this.label4 = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(145, 139);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(75, 23);
            this.button1.TabIndex = 0;
            this.button1.Text = "Đổi Pass";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // tb_oldpass
            // 
            this.tb_oldpass.Location = new System.Drawing.Point(93, 67);
            this.tb_oldpass.Name = "tb_oldpass";
            this.tb_oldpass.PasswordChar = '*';
            this.tb_oldpass.Size = new System.Drawing.Size(127, 20);
            this.tb_oldpass.TabIndex = 1;
            // 
            // tb_newpass
            // 
            this.tb_newpass.Location = new System.Drawing.Point(93, 102);
            this.tb_newpass.Name = "tb_newpass";
            this.tb_newpass.PasswordChar = '*';
            this.tb_newpass.Size = new System.Drawing.Size(127, 20);
            this.tb_newpass.TabIndex = 2;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Arial", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(25, 71);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(56, 16);
            this.label1.TabIndex = 3;
            this.label1.Text = "Pass cũ";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Arial", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(25, 106);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(65, 16);
            this.label2.TabIndex = 4;
            this.label2.Text = "Pass mới";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Arial", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.Location = new System.Drawing.Point(272, 70);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(56, 16);
            this.label3.TabIndex = 6;
            this.label3.Text = "Tên mới";
            // 
            // tb_name
            // 
            this.tb_name.Location = new System.Drawing.Point(334, 70);
            this.tb_name.Name = "tb_name";
            this.tb_name.Size = new System.Drawing.Size(127, 20);
            this.tb_name.TabIndex = 5;
            // 
            // btn_
            // 
            this.btn_.Location = new System.Drawing.Point(386, 106);
            this.btn_.Name = "btn_";
            this.btn_.Size = new System.Drawing.Size(75, 23);
            this.btn_.TabIndex = 7;
            this.btn_.Text = "Đổi Tên";
            this.btn_.UseVisualStyleBackColor = true;
            this.btn_.Click += new System.EventHandler(this.btn__Click);
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Arial", 14.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.Location = new System.Drawing.Point(173, 21);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(199, 22);
            this.label4.TabIndex = 8;
            this.label4.Text = "Điều chỉnh tài khoản";
            // 
            // userSetting
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(503, 189);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.btn_);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.tb_name);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.tb_newpass);
            this.Controls.Add(this.tb_oldpass);
            this.Controls.Add(this.button1);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MaximizeBox = false;
            this.Name = "userSetting";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "userSetting";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.TextBox tb_oldpass;
        private System.Windows.Forms.TextBox tb_newpass;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox tb_name;
        private System.Windows.Forms.Button btn_;
        private System.Windows.Forms.Label label4;
    }
}