using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CrudOperations
{
    public partial class Student : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GridViewBind();
            }

        }
        void GridViewBind()
        {
            SqlConnection con = new SqlConnection(@"Data Source = (LocalDB)\MSSQLLocalDB; AttachDbFilename = A:\Asp Code\CrudOperations\CrudOperations\App_Data\Student.mdf; Integrated Security = True");
            SqlCommand cmd = new SqlCommand("Select * from Student_Tbl",con);
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt =new DataTable();
            sda.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            con.Close();
            

        }

        protected void Insert_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(@"Data Source = (LocalDB)\MSSQLLocalDB; AttachDbFilename = A:\Asp Code\CrudOperations\CrudOperations\App_Data\Student.mdf; Integrated Security = True");
            SqlCommand cmd = new SqlCommand("insert into Student_Tbl values(@Id,@name,@email,@contact,@address,@gender)", con);
            cmd.Parameters.AddWithValue("@Id", id.Text);
            cmd.Parameters.AddWithValue("@name", nametxt.Text);
            cmd.Parameters.AddWithValue("@email", emailtxt.Text);
            cmd.Parameters.AddWithValue("@contact", contacttxt.Text);
            cmd.Parameters.AddWithValue("@address", addtxt.Text);
            cmd.Parameters.AddWithValue("@gender", ddl.SelectedItem.Value);
            con.Open();
            int a= cmd.ExecuteNonQuery();
            if(a > 0)
            {
                Response.Write("<script>alert('Inserted Successfully')</script>");
                GridViewBind();
                reset();
            }
            else
            {
                Label1.Text = "insertion failed";
                Label1.Visible = true;
                Label1.ForeColor=Color.Red;

            }
            con.Close();

        }

        protected void Update_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=""A:\Asp Code\CrudOperations\CrudOperations\App_Data\Student.mdf"";Integrated Security=True");
            SqlCommand cmd = new SqlCommand("update Student_Tbl set name=@name,email=@email,contact=@contact,address=@add,gender=@gen where Id=@id", con);
            cmd.Parameters.AddWithValue("@id",   id.Text);
            cmd.Parameters.AddWithValue("@name", nametxt.Text);
            cmd.Parameters.AddWithValue("@email", emailtxt.Text);
            cmd.Parameters.AddWithValue("@contact", contacttxt.Text);
            cmd.Parameters.AddWithValue("@add", addtxt.Text);
            cmd.Parameters.AddWithValue("@gen", ddl.SelectedItem.Value);
            con.Open();
            int a= cmd.ExecuteNonQuery();
            if(a > 0)
            {
                Response.Write("<script>alert('update successfully')</script>");
                GridViewBind();
                reset();
            }
            else
            {
                Label1.Text = "insertion failed";
                Label1.Visible = true;
                Label1.ForeColor=Color.Red;

            }
        }

        protected void Delete_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=""A:\Asp Code\CrudOperations\CrudOperations\App_Data\Student.mdf"";Integrated Security=True");
            SqlCommand cmd = new SqlCommand("Delete from Student_tbl where @Id=id", con);
            cmd.Parameters.AddWithValue("@Id", id.Text);
            con.Open();
            int a = cmd.ExecuteNonQuery();
            if(a > 0) {
                Response.Write("Deleted Successfull");
                GridViewBind();
                reset();

            }
            else
            {
                Label1.Text = "deletion failed";
                Label1.Visible = true;
                Label1.ForeColor=Color.Red; 
            }

        }

        void reset()
        {
            id.Text = "";
            nametxt.Text = "";
            emailtxt.Text = "";
            contacttxt.Text = "";
            addtxt.Text = "";
            ddl.ClearSelection();
        }
        protected void Clear_Click(object sender, EventArgs e)
        {
            reset();
            Label1.Visible=false;

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
            GridViewRow row = GridView1.SelectedRow;
            Label lblId = (Label)row.FindControl("Labelid");
            Label lblname =(Label)row.FindControl("Labelname");
            Label lblemail = (Label)row.FindControl("Labelemail");
            Label lblcont = (Label)row.FindControl("Labelcontact");
            Label lbladd = (Label)row.FindControl("Labeladd");
            Label lblgen = (Label)row.FindControl("Labelgender");
            
            id.Text = lblId.Text;
            nametxt.Text = lblname.Text;
            emailtxt.Text = lblemail.Text;
            contacttxt.Text = lblcont.Text;
            addtxt.Text = lbladd.Text;
            ddl.Text = lblgen.Text;

        }
    }
}