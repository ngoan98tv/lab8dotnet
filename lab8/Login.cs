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

namespace lab8
{
    public partial class Login : Form
    {
        public Login()
        {
            InitializeComponent();
        }

        private void LoginButton_Click(object sender, EventArgs e)
        {
            string query = "SELECT * FROM teacher WHERE id = '" + textUsername.Text.Trim() + "' AND password = '" + textPassword.Text.Trim() + "'";
            List<string> data = Database.Instance.ReadData(query);
            if (data.Count > 0)
            {
                Menu menu = new Menu(textUsername.Text);
                menu.Visible = true;
                this.Visible = false;
            }
            else
            {
                MessageBox.Show("Incorrect username or password");
            }
            
        }
        
        private void LoginForm_Closed(object sender, FormClosedEventArgs e)
        {
            Application.Exit();
        }
    }
}
