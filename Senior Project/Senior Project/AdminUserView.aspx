<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminUserView.aspx.cs" Inherits="Senior_Project.AdminUserView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <!-- Add bootstrap; online reference for most updated version -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
    <link href="../Content/master.css" rel="stylesheet">
    <link href="../Content/AdminView.css" rel="stylesheet">
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="sideheader d-flex justify-content-center align-content-center">
                <h1>Hello                
                   
                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                    <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                </h1>
            </div>
            <div class="sidebar">
                <div class="d-flex sidecontent">
                    <asp:LinkButton ID="LinkButton1" runat="server" CssClass="button" OnClick="LinkButton1_Click">Calendar</asp:LinkButton>
                </div>
                <div class="d-flex sidecontent">
                    <asp:LinkButton ID="LinkButton2" runat="server" CssClass="button" OnClick="LinkButton2_Click">Approve/Deny</asp:LinkButton>
                </div>
                <div class="d-flex sidecontent">
                    <asp:LinkButton ID="LinkButton3" runat="server" CssClass="button" OnClick="LinkButton3_Click">User View</asp:LinkButton>
                </div>
                <div class="d-flex sidecontent">
                    <asp:LinkButton ID="LinkButton4" runat="server" CssClass="button" OnClick="LinkButton4_Click">Log Out</asp:LinkButton>
                </div>
            </div>
        </div>

        <div class="bg-white border rounded border-dark container">
            <br />
            <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="SubjectID" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True">
                <Columns>
                    <asp:BoundField DataField="SubjectID" HeaderText="SubjectID" ReadOnly="True" SortExpression="SubjectID" />
                    <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                    <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                    <asp:BoundField DataField="PaymentType" HeaderText="PaymentType" SortExpression="PaymentType" />
                    <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                    <asp:BoundField DataField="DateofBirth" HeaderText="DateofBirth" SortExpression="DateofBirth" DataFormatString="{0:MM/dd/yyyy}" />
                    <asp:BoundField DataField="Major" HeaderText="Major" SortExpression="Major" />
                    <asp:BoundField DataField="EnrollmentDate" HeaderText="EnrollmentDate" SortExpression="EnrollmentDate" DataFormatString="{0:MM/dd/yyyy}" />
                    <asp:BoundField DataField="GPA" HeaderText="GPA" SortExpression="GPA" />
                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                    <asp:BoundField DataField="ZIP" HeaderText="ZIP" SortExpression="ZIP" />
                    <asp:BoundField DataField="PaymentInfo" HeaderText="PaymentInfo" SortExpression="PaymentInfo" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT SubjectID, FirstName, LastName, PaymentType, Type, Email, Gender, DateofBirth, Major, EnrollmentDate, GPA, Address, ZIP, PaymentInfo FROM [User] WHERE (Type != N'admin')" DeleteCommand="DELETE FROM [User] WHERE (SubjectID = @SubjectID)" UpdateCommand="UPDATE [User] SET FirstName = @FirstName, LastName = @LastName, Major = @Major, EnrollmentDate = @EnrollmentDate, GPA = @GPA, Address = @Address, ZIP = @ZIP WHERE (SubjectID = @SubjectID)">
                <DeleteParameters>
                    <asp:Parameter Name="SubjectID" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="FirstName" />
                    <asp:Parameter Name="LastName" />
                    <asp:Parameter Name="Major" />
                    <asp:Parameter Name="EnrollmentDate" />
                    <asp:Parameter Name="GPA" />
                    <asp:Parameter Name="Address" />
                    <asp:Parameter Name="ZIP" />
                    <asp:Parameter Name="SubjectID" />
                </UpdateParameters>
            </asp:SqlDataSource>
                </div>
            <br />
            <br />
            &nbsp;<asp:Label ID="Label3" runat="server" Text="Label" Visible="False"></asp:Label>
            &nbsp;<asp:Label ID="Label4" runat="server" Text="Label" Visible="False"></asp:Label>
            &nbsp;
        </div>
    </form>
</body>
</html>
