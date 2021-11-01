<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateProject.aspx.cs" Inherits="Senior_Project.CreateProject" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <br />
            <asp:Label ID="Label5" runat="server" Text="Project Name:"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label6" runat="server" Text="Sessions:"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label7" runat="server" Text="Notes:"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox3" runat="server" CssClass="auto-style1" Height="111px" TextMode="MultiLine"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label8" runat="server" Text="Record Location:"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Create Project" />
            <br />
            <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" InsertCommand="INSERT INTO Project(ProjectID, Name, Sessions, Notes, RecordLocation) VALUES (@ProjectID, @Name, @Sessions, @Notes, @RecordLocation)" SelectCommand="SELECT Project.* FROM Project">
                <InsertParameters>
                    <asp:Parameter Name="ProjectID" />
                    <asp:Parameter Name="Name" />
                    <asp:Parameter Name="Sessions" />
                    <asp:Parameter Name="Notes" />
                    <asp:Parameter Name="RecordLocation" />
                </InsertParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" InsertCommand="INSERT INTO Recruit(ProjectID, SubjectID) VALUES (@ProjectID, @SubjectID)" SelectCommand="SELECT Recruit.* FROM Recruit">
                <InsertParameters>
                    <asp:Parameter Name="ProjectID" />
                    <asp:Parameter Name="SubjectID" />
                </InsertParameters>
            </asp:SqlDataSource>
            <br />
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Cancel" />
            <br />
            <br />
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
&nbsp;<asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
&nbsp;<asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
&nbsp;<asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
&nbsp;</div>
    </form>
</body>
</html>
