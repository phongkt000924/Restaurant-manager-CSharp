using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyQuanAn
{
    class ban
    {
        int soban;
        string ten;
        bool status;
        public ban(int soban, string ten,bool b)
        {
            this.soban = soban;
            this.ten = ten;
            this.status = b;
        }
        public int getSoBan()
        {
            return this.soban;
        }
        public string getTen()
        {
            return this.ten;
        }
        public bool getStatus()
        {
            return this.status;
        }
    }
}
