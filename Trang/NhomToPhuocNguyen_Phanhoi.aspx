<%@ Page Title="" Language="C#" MasterPageFile="~/NhomToPhuocNguyen.master" AutoEventWireup="true" CodeFile="NhomToPhuocNguyen_PhanHoi.aspx.cs" Inherits="Trang_NhomToPhuocNguyen_HoTro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style3 {
            height: 18px;
        text-align: center;
            color: #000000;
            background-color: #80C357;
        }
    .auto-style4 {
        width: 724px;
    }
    .auto-style6 {
        text-align: left;
    }
    .auto-style8 {
        width: 241px;
    }
    .auto-style9 {
        width: 240px;
        height: 34px;
            text-align: left;
        }
        .auto-style11 {
            text-align: left;
            height: 34px;
        }
        .auto-style12 {
            width: 241px;
            height: 34px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <script type="text/javascript">
         <!--LogOrCre()
        
         function GuiPhanHoiThanhCong() {
            if (alert('Gửi Phản hồi thành công!') == true)
                window.location = "NhomToPhuocNguyen_PhanHoi.aspx"
            else
                window.location = "NhomToPhuocNguyen_PhanHoi.aspx"
        }
        function Loi() {
            if (alert('Lỗi Một Vùng Nào Đó Đang Rỗng!\n Hãy Điền thông tin và thử lại!') == true)
                window.location = "NhomToPhuocNguyen_PhanHoi.aspx"
            else
                window.location = "NhomToPhuocNguyen_PhanHoi.aspx"
        }
        
        
     </script>
    <table class="auto-style4">
    <tr>
        <td class="auto-style3" colspan="3">THÔNG TIN PHẢN HỒI</td>
    </tr>
    <tr>
        <td class="auto-style11">Họ của bạn:</td>
        <td class="auto-style12">
            &nbsp;
            <asp:TextBox runat="server" Width="216px" ID="TxtHo"></asp:TextBox>
            &nbsp;</td>
        <td class="auto-style12">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtHo" ErrorMessage="Họ bạn là gì ?"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style11">Tên bạn là:</td>
        <td class="auto-style12">&nbsp;
            <asp:TextBox ID="TxtTen" runat="server" Width="216px"></asp:TextBox>
        </td>
        <td class="auto-style12">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TxtTen" ErrorMessage="Tên bạn là gì ?"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style11">Giới tính:</td>
        <td class="auto-style12">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:RadioButton ID="RNam" runat="server" Text="Nam" GroupName="GT" Checked="True" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:RadioButton ID="RNu" runat="server" Text="Nữ" GroupName="GT" />
            <br />
        </td>
        <td class="auto-style12">
            <asp:Label ID="Label1" runat="server" ForeColor="White"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="auto-style11">Bạn biết đến shop từ đâu:</td>
        <td class="auto-style12">&nbsp;
            <asp:TextBox ID="TxtNGT" runat="server" Width="216px"></asp:TextBox>
        </td>
        <td class="auto-style12"></td>
    </tr>
    <tr>
        <td class="auto-style9">Địa chỉ của bạn:</td>
        <td class="auto-style12">&nbsp;
            <asp:TextBox ID="TxtDC" runat="server" Width="216px"></asp:TextBox>
        </td>
        <td class="auto-style12">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TxtDC" ErrorMessage="Địa chỉ của bạn là ?"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style11">Số điện thoại:</td>
        <td class="auto-style12">&nbsp;
            <asp:TextBox ID="TxtDT" runat="server" Width="216px"></asp:TextBox>
        </td>
        <td class="auto-style12">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Hãy nhập số điện thoại" ControlToValidate="TxtDT"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style11">Email của bạn là:</td>
        <td class="auto-style12">&nbsp;
            <asp:TextBox ID="TxtEmail" runat="server" Width="216px"></asp:TextBox>
        </td>
        <td class="auto-style12">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Hãy nhập mail để chúng tôi có thể liên hệ với bạn" ControlToValidate="TxtEmail"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style11">Nhận xét của bạn về shop:</td>
        <td class="auto-style12">&nbsp;
            <asp:TextBox ID="TxtNX" runat="server" Width="216px" TextMode="MultiLine"></asp:TextBox>
        </td>
        <td class="auto-style12">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Đánh giá của bạn về shop" ControlToValidate="TxtNX"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style11">Mức đội hài lòng của bạn:</td>
        <td class="auto-style12"></td>
        <td class="auto-style12"></td>
    </tr>
    <tr>
        <td class="auto-style6">&nbsp;</td>
        <td class="auto-style8">
            <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                <asp:ListItem>★ ☆ ☆ ☆ ☆</asp:ListItem>
                <asp:ListItem>★ ★ ☆ ☆ ☆</asp:ListItem>
                <asp:ListItem>★ ★ ★ ☆ ☆</asp:ListItem>
                <asp:ListItem>★ ★ ★ ★ ☆</asp:ListItem>
                <asp:ListItem Selected="True">★ ★ ★ ★ ★</asp:ListItem>
            </asp:RadioButtonList>
        </td>
        <td class="auto-style8">&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style6" colspan="3">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button3" runat="server" Text="Gửi phản hồi" BackColor="#E8171F" ForeColor="White" OnClick="Button3_Click" />
        </td>
    </tr>
    <tr>
        <td class="auto-style6">&nbsp;</td>
        <td class="auto-style8">&nbsp;</td>
        <td class="auto-style8">&nbsp;</td>
    </tr>
</table>
</asp:Content>

