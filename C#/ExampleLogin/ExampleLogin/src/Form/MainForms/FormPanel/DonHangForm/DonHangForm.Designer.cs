﻿namespace ExampleLogin
{
    partial class DonHangForm
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
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.btnLamMoi = new System.Windows.Forms.Button();
            this.tbTenNhanVien = new System.Windows.Forms.TextBox();
            this.label10 = new System.Windows.Forms.Label();
            this.tbTenKhachHang = new System.Windows.Forms.TextBox();
            this.label9 = new System.Windows.Forms.Label();
            this.btnThongTinDonHang = new System.Windows.Forms.Button();
            this.cbUpLowCase = new System.Windows.Forms.CheckBox();
            this.cbLoc = new System.Windows.Forms.ComboBox();
            this.label8 = new System.Windows.Forms.Label();
            this.tbTimKiem = new System.Windows.Forms.TextBox();
            this.tbNoiNhan = new System.Windows.Forms.TextBox();
            this.ngayGiaoHang = new System.Windows.Forms.DateTimePicker();
            this.ngayDatHang = new System.Windows.Forms.DateTimePicker();
            this.cbMaNhanVien = new System.Windows.Forms.ComboBox();
            this.cbMaKhachHang = new System.Windows.Forms.ComboBox();
            this.tbMaDonHang = new System.Windows.Forms.TextBox();
            this.btnXoa = new System.Windows.Forms.Button();
            this.btnSua = new System.Windows.Forms.Button();
            this.btnThem = new System.Windows.Forms.Button();
            this.label7 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            this.groupBox1.SuspendLayout();
            this.groupBox2.SuspendLayout();
            this.SuspendLayout();
            // 
            // dataGridView1
            // 
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dataGridView1.Location = new System.Drawing.Point(3, 16);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.ReadOnly = true;
            this.dataGridView1.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dataGridView1.Size = new System.Drawing.Size(581, 402);
            this.dataGridView1.TabIndex = 0;
            this.dataGridView1.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridView1_CellClick);
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.btnLamMoi);
            this.groupBox1.Controls.Add(this.tbTenNhanVien);
            this.groupBox1.Controls.Add(this.label10);
            this.groupBox1.Controls.Add(this.tbTenKhachHang);
            this.groupBox1.Controls.Add(this.label9);
            this.groupBox1.Controls.Add(this.btnThongTinDonHang);
            this.groupBox1.Controls.Add(this.cbUpLowCase);
            this.groupBox1.Controls.Add(this.cbLoc);
            this.groupBox1.Controls.Add(this.label8);
            this.groupBox1.Controls.Add(this.tbTimKiem);
            this.groupBox1.Controls.Add(this.tbNoiNhan);
            this.groupBox1.Controls.Add(this.ngayGiaoHang);
            this.groupBox1.Controls.Add(this.ngayDatHang);
            this.groupBox1.Controls.Add(this.cbMaNhanVien);
            this.groupBox1.Controls.Add(this.cbMaKhachHang);
            this.groupBox1.Controls.Add(this.tbMaDonHang);
            this.groupBox1.Controls.Add(this.btnXoa);
            this.groupBox1.Controls.Add(this.btnSua);
            this.groupBox1.Controls.Add(this.btnThem);
            this.groupBox1.Controls.Add(this.label7);
            this.groupBox1.Controls.Add(this.label6);
            this.groupBox1.Controls.Add(this.label5);
            this.groupBox1.Controls.Add(this.label4);
            this.groupBox1.Controls.Add(this.label3);
            this.groupBox1.Controls.Add(this.label2);
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.Location = new System.Drawing.Point(12, 12);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(309, 421);
            this.groupBox1.TabIndex = 1;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Thông tin hóa đơn";
            // 
            // btnLamMoi
            // 
            this.btnLamMoi.Location = new System.Drawing.Point(217, 325);
            this.btnLamMoi.Name = "btnLamMoi";
            this.btnLamMoi.Size = new System.Drawing.Size(75, 23);
            this.btnLamMoi.TabIndex = 25;
            this.btnLamMoi.Text = "Làm mới";
            this.btnLamMoi.UseVisualStyleBackColor = true;
            this.btnLamMoi.Click += new System.EventHandler(this.btnLamMoi_Click);
            // 
            // tbTenNhanVien
            // 
            this.tbTenNhanVien.Location = new System.Drawing.Point(118, 154);
            this.tbTenNhanVien.Name = "tbTenNhanVien";
            this.tbTenNhanVien.ReadOnly = true;
            this.tbTenNhanVien.Size = new System.Drawing.Size(174, 20);
            this.tbTenNhanVien.TabIndex = 24;
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Location = new System.Drawing.Point(15, 157);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(79, 13);
            this.label10.TabIndex = 23;
            this.label10.Text = "Tên nhân viên:";
            // 
            // tbTenKhachHang
            // 
            this.tbTenKhachHang.Location = new System.Drawing.Point(118, 92);
            this.tbTenKhachHang.Name = "tbTenKhachHang";
            this.tbTenKhachHang.ReadOnly = true;
            this.tbTenKhachHang.Size = new System.Drawing.Size(174, 20);
            this.tbTenKhachHang.TabIndex = 22;
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Location = new System.Drawing.Point(15, 95);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(89, 13);
            this.label9.TabIndex = 21;
            this.label9.Text = "Tên khách hàng:";
            // 
            // btnThongTinDonHang
            // 
            this.btnThongTinDonHang.Font = new System.Drawing.Font("Microsoft Sans Serif", 8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnThongTinDonHang.Location = new System.Drawing.Point(18, 316);
            this.btnThongTinDonHang.Name = "btnThongTinDonHang";
            this.btnThongTinDonHang.Size = new System.Drawing.Size(175, 38);
            this.btnThongTinDonHang.TabIndex = 20;
            this.btnThongTinDonHang.Text = "Thông tin chi tiết đơn hàng";
            this.btnThongTinDonHang.UseVisualStyleBackColor = true;
            this.btnThongTinDonHang.Click += new System.EventHandler(this.btnThongTinDonHang_Click);
            // 
            // cbUpLowCase
            // 
            this.cbUpLowCase.AutoSize = true;
            this.cbUpLowCase.Location = new System.Drawing.Point(14, 389);
            this.cbUpLowCase.Name = "cbUpLowCase";
            this.cbUpLowCase.Size = new System.Drawing.Size(128, 17);
            this.cbUpLowCase.TabIndex = 19;
            this.cbUpLowCase.Text = "Phân biệt hoa thường";
            this.cbUpLowCase.UseVisualStyleBackColor = true;
            this.cbUpLowCase.CheckedChanged += new System.EventHandler(this.cbUpLowCase_CheckedChanged);
            // 
            // cbLoc
            // 
            this.cbLoc.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbLoc.FormattingEnabled = true;
            this.cbLoc.Location = new System.Drawing.Point(179, 386);
            this.cbLoc.Name = "cbLoc";
            this.cbLoc.Size = new System.Drawing.Size(113, 21);
            this.cbLoc.TabIndex = 18;
            this.cbLoc.SelectedIndexChanged += new System.EventHandler(this.cbLoc_SelectedIndexChanged);
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(148, 390);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(28, 13);
            this.label8.TabIndex = 17;
            this.label8.Text = "Lọc:";
            // 
            // tbTimKiem
            // 
            this.tbTimKiem.Location = new System.Drawing.Point(74, 360);
            this.tbTimKiem.Name = "tbTimKiem";
            this.tbTimKiem.Size = new System.Drawing.Size(218, 20);
            this.tbTimKiem.TabIndex = 16;
            this.tbTimKiem.TextChanged += new System.EventHandler(this.tbTimKiem_TextChanged);
            this.tbTimKiem.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.tbTimKiem_KeyPress);
            // 
            // tbNoiNhan
            // 
            this.tbNoiNhan.Location = new System.Drawing.Point(118, 255);
            this.tbNoiNhan.Name = "tbNoiNhan";
            this.tbNoiNhan.Size = new System.Drawing.Size(174, 20);
            this.tbNoiNhan.TabIndex = 15;
            // 
            // ngayGiaoHang
            // 
            this.ngayGiaoHang.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.ngayGiaoHang.Location = new System.Drawing.Point(118, 225);
            this.ngayGiaoHang.Name = "ngayGiaoHang";
            this.ngayGiaoHang.Size = new System.Drawing.Size(174, 20);
            this.ngayGiaoHang.TabIndex = 14;
            // 
            // ngayDatHang
            // 
            this.ngayDatHang.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.ngayDatHang.Location = new System.Drawing.Point(118, 190);
            this.ngayDatHang.Name = "ngayDatHang";
            this.ngayDatHang.Size = new System.Drawing.Size(174, 20);
            this.ngayDatHang.TabIndex = 13;
            // 
            // cbMaNhanVien
            // 
            this.cbMaNhanVien.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbMaNhanVien.FormattingEnabled = true;
            this.cbMaNhanVien.Location = new System.Drawing.Point(118, 122);
            this.cbMaNhanVien.Name = "cbMaNhanVien";
            this.cbMaNhanVien.Size = new System.Drawing.Size(174, 21);
            this.cbMaNhanVien.TabIndex = 12;
            this.cbMaNhanVien.SelectedIndexChanged += new System.EventHandler(this.cbMaNhanVien_SelectedIndexChanged);
            // 
            // cbMaKhachHang
            // 
            this.cbMaKhachHang.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbMaKhachHang.FormattingEnabled = true;
            this.cbMaKhachHang.Location = new System.Drawing.Point(118, 57);
            this.cbMaKhachHang.Name = "cbMaKhachHang";
            this.cbMaKhachHang.Size = new System.Drawing.Size(174, 21);
            this.cbMaKhachHang.TabIndex = 11;
            this.cbMaKhachHang.SelectedIndexChanged += new System.EventHandler(this.cbMaKhachHang_SelectedIndexChanged);
            // 
            // tbMaDonHang
            // 
            this.tbMaDonHang.Location = new System.Drawing.Point(118, 25);
            this.tbMaDonHang.Name = "tbMaDonHang";
            this.tbMaDonHang.ReadOnly = true;
            this.tbMaDonHang.Size = new System.Drawing.Size(174, 20);
            this.tbMaDonHang.TabIndex = 10;
            // 
            // btnXoa
            // 
            this.btnXoa.Location = new System.Drawing.Point(217, 287);
            this.btnXoa.Name = "btnXoa";
            this.btnXoa.Size = new System.Drawing.Size(75, 23);
            this.btnXoa.TabIndex = 9;
            this.btnXoa.Text = "Xóa";
            this.btnXoa.UseVisualStyleBackColor = true;
            this.btnXoa.Click += new System.EventHandler(this.btnXoa_Click);
            // 
            // btnSua
            // 
            this.btnSua.Location = new System.Drawing.Point(118, 287);
            this.btnSua.Name = "btnSua";
            this.btnSua.Size = new System.Drawing.Size(75, 23);
            this.btnSua.TabIndex = 8;
            this.btnSua.Text = "Sửa";
            this.btnSua.UseVisualStyleBackColor = true;
            this.btnSua.Click += new System.EventHandler(this.btnSua_Click);
            // 
            // btnThem
            // 
            this.btnThem.Location = new System.Drawing.Point(18, 287);
            this.btnThem.Name = "btnThem";
            this.btnThem.Size = new System.Drawing.Size(75, 23);
            this.btnThem.TabIndex = 7;
            this.btnThem.Text = "Thêm";
            this.btnThem.UseVisualStyleBackColor = true;
            this.btnThem.Click += new System.EventHandler(this.btnThem_Click);
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(11, 363);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(52, 13);
            this.label7.TabIndex = 6;
            this.label7.Text = "Tìm kiếm:";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(15, 255);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(53, 13);
            this.label6.TabIndex = 5;
            this.label6.Text = "Nơi nhận:";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(15, 225);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(85, 13);
            this.label5.TabIndex = 4;
            this.label5.Text = "Ngày giao hàng:";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(15, 190);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(81, 13);
            this.label4.TabIndex = 3;
            this.label4.Text = "Ngày đặt hàng:";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(15, 125);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(75, 13);
            this.label3.TabIndex = 2;
            this.label3.Text = "Mã nhân viên:";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(15, 60);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(85, 13);
            this.label2.TabIndex = 1;
            this.label2.Text = "Mã khách hàng:";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(15, 28);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(74, 13);
            this.label1.TabIndex = 0;
            this.label1.Text = "Mã đơn hàng:";
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.dataGridView1);
            this.groupBox2.Location = new System.Drawing.Point(339, 12);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(587, 421);
            this.groupBox2.TabIndex = 2;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "Danh sách hóa đơn";
            // 
            // DonHangForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.Control;
            this.ClientSize = new System.Drawing.Size(938, 445);
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.groupBox1);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.MaximizeBox = false;
            this.MaximumSize = new System.Drawing.Size(938, 445);
            this.MinimizeBox = false;
            this.MinimumSize = new System.Drawing.Size(938, 445);
            this.Name = "DonHangForm";
            this.ShowIcon = false;
            this.ShowInTaskbar = false;
            this.Text = "HoaDonForm";
            this.Load += new System.EventHandler(this.HoaDonForm_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.groupBox2.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.DataGridView dataGridView1;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.CheckBox cbUpLowCase;
        private System.Windows.Forms.ComboBox cbLoc;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.TextBox tbTimKiem;
        private System.Windows.Forms.TextBox tbNoiNhan;
        private System.Windows.Forms.DateTimePicker ngayGiaoHang;
        private System.Windows.Forms.DateTimePicker ngayDatHang;
        private System.Windows.Forms.ComboBox cbMaNhanVien;
        private System.Windows.Forms.ComboBox cbMaKhachHang;
        private System.Windows.Forms.TextBox tbMaDonHang;
        private System.Windows.Forms.Button btnXoa;
        private System.Windows.Forms.Button btnSua;
        private System.Windows.Forms.Button btnThem;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Button btnThongTinDonHang;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.TextBox tbTenNhanVien;
        private System.Windows.Forms.Label label10;
        private System.Windows.Forms.TextBox tbTenKhachHang;
        private System.Windows.Forms.Button btnLamMoi;
    }
}