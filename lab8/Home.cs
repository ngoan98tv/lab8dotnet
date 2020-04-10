using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace lab8
{
    public partial class Home : Form
    {
        private string teacher_id;
        public Home(string id, string name)
        {
            InitializeComponent();
            this.teacher_id = id;
            teacherNameLabel.Text = name;
            InitialData();
        }

        private void InitialData()
        {
            stateLabel.Text = "Đang tải...";
            string query = "SELECT DISTINCT s.id AS id, s.name AS name " +
                "FROM subject AS s " +
                "JOIN course AS c ON s.id = c.subject_id " +
                "WHERE c.teacher_id = '" + teacher_id + "';";
            DataTable data = Database.Instance.LoadData(query);

            if (data.Rows.Count > 0)
            {
                foreach (DataRow row in data.Rows)
                {
                    Button btn = new Button();
                    btn.Text = row["id"].ToString() + " " +
                        row["name"].ToString();
                    btn.Name = row["id"].ToString();
                    btn.Click += new EventHandler(Course_Click);
                    btn.AutoSize = true;
                    btn.Font = new Font("Times New Roman", 12F, FontStyle.Regular, GraphicsUnit.Point, 0);
                    container.Controls.Add(btn);
                }
                stateLabel.Text = "Đã tải thành công " + data.Rows.Count.ToString() + " môn học.";
            } else
            {
                stateLabel.Text = "Không có dữ liệu.";
            }
        }

        private void Course_Click(object sender, EventArgs args)
        {
            stateLabel.Text = "Đang tải...";
            Button btn = sender as Button;
            string subject_id = btn.Name;
            // Clear all data and refresh.
            dataTable.DataSource = null;
            dataTable.Rows.Clear();
            dataTable.Columns.Clear();
            dataTable.Refresh();
            
            string query = "SELECT s.id as MSSV, s.lastname as 'Họ và tên đệm', s.firstname as 'Tên', l.name as 'Lớp' " +
                "FROM student AS s " + 
                "JOIN course AS c ON c.class_id = s.class_id " +
                "JOIN class AS l ON l.id = c.class_id " +
                "WHERE c.subject_id = '" + subject_id + "';";
            
            DataTable data = Database.Instance.LoadData(query);
            dataTable.DataSource = data;

            DataGridViewButtonColumn pointCol = new DataGridViewButtonColumn();
            pointCol.HeaderText = "Điểm";
            pointCol.Name = "enterPointBtn";
            pointCol.Text = "Nhập";
            pointCol.UseColumnTextForButtonValue = true;
            dataTable.Columns.Add(pointCol);
            this.dataTable.Visible = true;
            stateLabel.Text = "Đã tải thành công " + data.Rows.Count.ToString() + " sinh viên.";
        }

        private void backButton_Click(object sender, EventArgs e)
        {
            this.dataTable.Visible = false;
        }
    }
}
