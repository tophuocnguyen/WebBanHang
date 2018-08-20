<%@ Page Title="" Language="C#" MasterPageFile="~/NhomToPhuocNguyen.master" AutoEventWireup="true" CodeFile="NhomToPhuocNguyen_Taikhoankhach.aspx.cs" Inherits="Trang_NhomToPhuocNguyen_Taikhoankhach" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style3 {
            height: 18px;
            text-align: center;
            color: #0066FF;
        }
        .auto-style4 {
            width: 724px;
        }
        .auto-style7 {
            text-align: center;
        }
        .auto-style8 {
            width: 241px;
        }
        .auto-style9 {
            width: 240px;
            height: 18px;
        }
        .auto-style10 {
            width: 241px;
            height: 18px;
        }
        .auto-style11 {
            width: 229px;
        }
        .auto-style12 {
            width: 229px;
            height: 18px;
        }
        .auto-style13 {
            text-align: center;
            height: 24px;
        }
        .auto-style14 {
            width: 229px;
            height: 24px;
        }
        .auto-style15 {
            width: 241px;
            height: 24px;
        }
        .auto-style16 {
            color: #0066FF;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <script type="text/javascript">
        function DieuKien() {
            if (alert('Truy Cập Không Hợp Lệ! \nBạn chưa đăng nhập! \nHoặc user không phải là khach hàng \nVui lòng vào trang chủ!') == true)
                window.location = "NhomToPhuocNguyen_TrangChu.aspx";
            else
                window.location = "NhomToPhuocNguyen_TrangChu.aspx";
        }

        function ThanhCong() {
            if (alert('Thực hiện thành công') == true)
                window.location = "NhomToPhuocNguyen_Taikhoankhach.aspx";
            else
                window.location = "NhomToPhuocNguyen_Taikhoankhach.aspx";
        }

        function ThatBai() {
            if (alert('Thất bại, Vui lòng xem lại!') == true)
                window.location = "NhomToPhuocNguyen_Taikhoankhach.aspx";
            else
                window.location = "NhomToPhuocNguyen_Taikhoankhach.aspx";
        }
</script>
    <table class="auto-style4">
        <tr>
            <td colspan="3" style="text-align: center; background-color: #FFFFFF;" class="auto-style16"><strong>LỊCH SỬ MUA HÀNG</strong></td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:GridView ID="GridView1" runat="server" style="font-weight: 700; font-style: italic" Width="100%">
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td class="auto-style3" colspan="3"><strong>THÔNG TIN TÀI KHOẢN</strong></td>
        </tr>
        <tr>
            <td class="auto-style7">&nbsp;</td>
            <td class="auto-style11">&nbsp;</td>
            <td class="auto-style8">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style9">Ảnh đại diện:</td>
            <td class="auto-style12">Thông tin người dùng:</td>
            <td class="auto-style10">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style7" rowspan="5">
                <asp:Image ID="Anh" runat="server" Height="115px" style="text-align: left" Width="131px" />
            </td>
            <td class="auto-style11">Họ của bạn:</td>
            <td class="auto-style8">
                <asp:TextBox ID="TxtHo" runat="server" Width="204px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style11">Tên của bạn:</td>
            <td class="auto-style8">
                <asp:TextBox ID="TxtTen" runat="server" Width="204px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style11">Giới tính</td>
            <td class="auto-style8">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatColumns="5" Width="141px">
                    <asp:ListItem Selected="True">Nam</asp:ListItem>
                    <asp:ListItem>Nữ</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="auto-style11">Địa chỉ:</td>
            <td class="auto-style8">
                <asp:TextBox ID="TxtDC" runat="server" Width="204px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style11">Số điện thoại:</td>
            <td class="auto-style8">
                <asp:TextBox ID="TxtDT" runat="server" Width="204px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style7">&nbsp;</td>
            <td class="auto-style11">Email:</td>
            <td class="auto-style8">
                <asp:TextBox ID="TxtEmail" runat="server" Width="204px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style7">&nbsp;</td>
            <td class="auto-style11">Ảnh của bạn:</td>
            <td class="auto-style8">
                <asp:FileUpload ID="FileAnh" runat="server" Width="206px" />
            </td>
        </tr>
        <tr>
            <td class="auto-style7" colspan="3">
                <asp:Button ID="Button3" runat="server" Text="Sửa thông tin" OnClick="Button3_Click" BackColor="Red" ForeColor="White" />
            </td>
        </tr>
        <tr>
            <td class="auto-style7" colspan="3">THAY ĐỔI MẬT KHẨU</td>
        </tr>
        <tr>
            <td class="auto-style7">Mật khẩu cũ:</td>
            <td class="auto-style11">
                <asp:TextBox ID="TxtMkc" runat="server" Width="194px"></asp:TextBox>
            </td>
            <td class="auto-style8">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style13">Mật khẩu mới:</td>
            <td class="auto-style14">
                <asp:TextBox ID="TxtMkm" runat="server" Width="194px"></asp:TextBox>
            </td>
            <td class="auto-style15">&nbsp;(mật khẩu mới trên 6 kí tự)</td>
        </tr>
        <tr>
            <td class="auto-style7">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Nhập lại mật khẩu:</td>
            <td class="auto-style11">
                <asp:TextBox ID="TxtMkm1" runat="server" Width="194px"></asp:TextBox>
            </td>
            <td class="auto-style8">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style7" colspan="3">
                <asp:Button ID="Button4" runat="server" Text="Đổi mật khẩu" OnClick="Button4_Click" BackColor="Red" ForeColor="White" />
            </td>
        </tr>
        <tr>
            <td class="auto-style7">&nbsp;</td>
            <td class="auto-style11">&nbsp;</td>
            <td class="auto-style8">&nbsp;</td>
        </tr>
    </table>
</asp:Content>

