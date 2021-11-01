using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Senior_Project
{
    public partial class CreateProject : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection();
        SqlCommand cmd = new SqlCommand();
        SqlDataReader dr;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["Email"] != null)
            { Label4.Text = Request.QueryString["Email"]; }
            con.ConnectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True";
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM[User] WHERE Email = @Email ", con);
            cmd.Parameters.Add(new SqlParameter("Email", Label4.Text));
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                Label1.Text = dr["FirstName"].ToString().Trim();
                Label2.Text = dr["LastName"].ToString().Trim();
                Label3.Text = dr["SubjectID"].ToString().Trim();
            }
            con.Close();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ResearchProjects.aspx", false);
            Response.Redirect("~/ResearchProjects.aspx?Email=" + Label4.Text);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int hold = 0;
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT ProjectID FROM Project ORDER BY ProjectID ASC";
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                hold = Convert.ToInt32(dr["ProjectID"]);
            }
            con.Close();

            hold++;
            try
            {

                con.Open();
                cmd = new SqlCommand("INSERT INTO Project(ProjectID, Name, Sessions, Notes, RecordLocation) VALUES (@ProjectID, @Name, @Sessions, @Notes, @RecordLocation)", con);
                cmd.Parameters.Add(new SqlParameter("ProjectID", hold));
                cmd.Parameters.Add(new SqlParameter("Name", TextBox1.Text));
                cmd.Parameters.Add(new SqlParameter("Sessions", TextBox2.Text));
                cmd.Parameters.Add(new SqlParameter("Notes", TextBox3.Text));
                cmd.Parameters.Add(new SqlParameter("RecordLocation", TextBox4.Text));
                cmd.ExecuteNonQuery();
                con.Close();

                string c = "";
                con.Open();
                cmd = new SqlCommand("SELECT * FROM[User] WHERE Email = @Email ", con);
                cmd.Parameters.Add(new SqlParameter("Email", Label4.Text));
                dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    c = dr["SubjectID"].ToString();
                }
                con.Close();


                con.Open();
                cmd = new SqlCommand("INSERT INTO Recruit(ProjectID, SubjectID) VALUES (@ProjectID, @SubjectID)", con);
                cmd.Parameters.Add(new SqlParameter("ProjectID", hold));
                cmd.Parameters.Add(new SqlParameter("SubjectID", c));
                cmd.ExecuteNonQuery();
                con.Close();

                TextBox1.Text = "";
                TextBox2.Text = "";
                TextBox3.Text = "";
                TextBox4.Text = "";

                Response.Redirect("~/ResearchProjects.aspx", false);
                Response.Redirect("~/ResearchProjects.aspx?Email=" + Label4.Text);
            }
            catch (Exception ex)
            {
                Response.Write("<script type=\"text/javascript\">alert('An error occured. Please try again.');</script>");
            }
        }
    }
}