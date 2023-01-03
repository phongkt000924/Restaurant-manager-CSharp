using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyQuanAn
{
    class hoadon
    {
        public string idhoadon { get; set; }
        public int tongtien { get; set; }
        public DateTime checkin { get; set; }
        public DateTime checkout { get; set; }
        public int soban { get; set; }
        public String idnv { get; set; }
        public int giamgia { get; set; }
        public int dathanhtoan { get; set; }
        public int thuctra { get; set; }
        public hoadon(string idhoadon, int tongtien, DateTime checkin, DateTime checkout, int soban, string idnv, int giamgia, int dathanhtoan, int thuctra)
        {
            this.idhoadon = idhoadon;
            this.tongtien = tongtien;
            this.checkin = checkin;
            this.checkout = checkout;
            this.soban = soban;
            this.idnv = idnv;
            this.giamgia = giamgia;
            this.dathanhtoan = dathanhtoan;
            this.thuctra = thuctra;
        }
        public hoadon() { }
    }
}
