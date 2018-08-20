<%@ Page Title="" Language="C#" MasterPageFile="~/NhomToPhuocNguyen.master" AutoEventWireup="true" CodeFile="NhomToPhuocNguyen_Laylaimatkhau.aspx.cs" Inherits="Trang_NhomToPhuocNguyen_Laylaimatkhau" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style3 {
            height: 18px;
            text-align: center;
            color: #003300;
            background-color: #FFFFFF;
        }
        .auto-style5 {
            width: 724px;
        }
        .auto-style6 {
            height: 33px;
            width: 240px;
            text-align: center;
        }
        .auto-style10 {
            height: 32px;
            width: 241px;
        }
        .auto-style11 {
            width: 240px;
        }
        .auto-style12 {
            width: 241px;
        }
        .auto-style13 {
            width: 240px;
            height: 32px;
            text-align: center;
        }
        .auto-style14 {
            height: 33px;
            width: 241px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <script type="text/javascript">
         <!--
    function Loi() {
        if (alert('Không tồn tại Username hoặc Email này!') == true)
            window.location = "NhomToPhuocNguyen_Laylaimatkhau.aspx";
        else
            window.location = "NhomToPhuocNguyen_Laylaimatkhau.aspx";
    }

    function ThanhCong() {
        if (alert('Khôi phục mật khẩu thành công! \nVào Email để xem mật khẩu!') == true)
            window.location = "NhomToPhuocNguyen_Laylaimatkhau.aspx";
        else
            window.location = "NhomToPhuocNguyen_Laylaimatkhau.aspx";
    }
    function LoiMang() {
        if (alert('Lỗi đường truyền internet! Hoặc Email của bạn không đúng') == true)
            window.location = "NhomToPhuocNguyen_Laylaimatkhau.aspx";
        else
            window.location = "NhomToPhuocNguyen_Laylaimatkhau.aspx";
    }
</script>
    <table class="auto-style5">
        <tr>
            <td class="auto-style3" colspan="3"><strong>KHÔI PHỤC MẬT KHẨU</strong></td>
        </tr>
        <tr>
            <td class="auto-style6">&nbsp;Nhập username:</td>
            <td class="auto-style14">
                <asp:TextBox ID="TxtU" runat="server" Width="233px"></asp:TextBox>
            </td>
            <td class="auto-style14">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Nhập username" ControlToValidate="TxtU"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style13">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Nhập Email:</td>
            <td class="auto-style10">
                <asp:TextBox ID="TxtEmail" runat="server" Width="233px"></asp:TextBox>
            </td>
            <td class="auto-style10">
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TxtEmail" ErrorMessage="Email không hợp lệ" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style11">&nbsp;</td>
            <td class="auto-style12">&nbsp;</td>
            <td class="auto-style12">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style11">&nbsp;</td>
            <td class="auto-style12">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button3" runat="server" Text="Khôi phục" OnClick="Button3_Click" BackColor="Red" ForeColor="White" />
            </td>
            <td class="auto-style12">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style11">&nbsp;</td>
            <td class="auto-style12">&nbsp;</td>
            <td class="auto-style12">&nbsp;</td>
        </tr>
    </table>
</asp:Content>

