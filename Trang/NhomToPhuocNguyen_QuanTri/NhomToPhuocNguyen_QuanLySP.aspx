<%@ Page Title="" Language="C#" MasterPageFile="~/NhomToPhuocNguyen.master" AutoEventWireup="true" CodeFile="NhomToPhuocNguyen_QuanLySP.aspx.cs" Inherits="Trang_NhomToPhuocNguyen_QuanTri_NhomToPhuocNguyen_QuanLySP" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style4 {
            width: 724px;
        }
        .auto-style5 {
            height: 18px;
            width: 240px;
        }
        .auto-style9 {
            height: 18px;
            width: 241px;
        }
        .auto-style10 {
        }
        .auto-style11 {
            width: 241px;
        }
        .auto-style12 {
            height: 17px;
        }
        .auto-style13 {
            height: 17px;
            width: 283px;
            text-align: center;
            color: #0000FF;
        }
        .auto-style14 {
            height: 17px;
            width: 241px;
        }
        .auto-style15 {
            height: 18px;
            width: 283px;
        }
        .auto-style16 {
            width: 283px;
        }
        .auto-style17 {
            width: 283px;
            text-align: center;
            color: #0000FF;
        }
        .auto-style18 {
            height: 18px;
            text-align: right;
        }
        .auto-style19 {
            text-align: right;
            height: 29px;
        }
        .auto-style20 {
            width: 283px;
            height: 29px;
        }
        .auto-style21 {
            width: 241px;
            height: 29px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <script type="text/javascript">
         <!--LogOrCre()
        
        function ThemThanhCong() {
            if (alert('Thêm thành công') == true)
                window.location = "NhomToPhuocNguyen_QuanLySP.aspx"
            else
                window.location = "NhomToPhuocNguyen_QuanLySP.aspx"
        }
        function Loi() {
            if (alert('Lỗi Một Vùng Nào Đó Đang Rỗng!\nĐiền thông tin và thử lại!') == true)
                window.location = "NhomToPhuocNguyen_QuanLySP.aspx"
            else
                window.location = "NhomToPhuocNguyen_QuanLySP.aspx"
        }
        
        function XoaThanhCong() {
            if (alert('Xóa thành công') == true)
                window.location = "NhomToPhuocNguyen_QuanLySP.aspx"
            else
                window.location = "NhomToPhuocNguyen_QuanLySP.aspx"
        }
         function SuaThanhCong()
         {
                        if (alert('Sửa thành công') == true)
                            window.location = "NhomToPhuocNguyen_QuanLySP.aspx"
                        else
                            window.location = "NhomToPhuocNguyen_QuanLySP.aspx"
         }

         //-->
    </script>
    <table class="auto-style4">
        <tr>
            <td class="auto-style5">DANH SÁCH SẢN PHẨM</td>
            <td class="auto-style15"></td>
            <td class="auto-style9"></td>
        </tr>
        <tr>
            <td class="auto-style10" colspan="3">
                <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True" AutoGenerateSelectButton="True" OnSelectedIndexChanging="GridView1_SelectedIndexChanging" PageSize="6" Width="100%">
                    <AlternatingRowStyle BackColor="White" />
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td class="auto-style12"></td>
            <td class="auto-style13">THÊM SẢN PHẨM MỚI</td>
            <td class="auto-style14"></td>
        </tr>
        <tr>
            <td class="auto-style19">Loại sản phẩm:</td>
            <td class="auto-style20">&nbsp;&nbsp;
                <asp:DropDownList ID="DropLoaiSP" runat="server" Height="23px" Width="229px">
                </asp:DropDownList>
            </td>
            <td class="auto-style21"></td>
        </tr>
        <tr>
            <td class="ar">Tên sản phẩm:</td>
            <td class="auto-style16">&nbsp;&nbsp;
                <asp:TextBox ID="TxtTenSP" runat="server" Width="229px"></asp:TextBox>
            </td>
            <td class="auto-style11">&nbsp;</td>
        </tr>
        <tr>
            <td class="ar">Giá:</td>
            <td class="auto-style16">&nbsp;&nbsp;
                <asp:TextBox ID="TxtGia" runat="server" Width="229px"></asp:TextBox>
            </td>
            <td class="auto-style11">&nbsp;</td>
        </tr>
        <tr>
            <td class="ar">Chi tiết:</td>
            <td class="auto-style16">&nbsp;&nbsp;
                <asp:TextBox ID="TxtChitiet" runat="server" Width="229px"></asp:TextBox>
            </td>
            <td class="auto-style11">&nbsp;</td>
        </tr>
        <tr>
            <td class="ar">Ảnh:</td>
            <td class="auto-style16">&nbsp;&nbsp;&nbsp;
                <asp:FileUpload ID="FileAnh" runat="server" Width="229px" />
            </td>
            <td class="auto-style11">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style10">&nbsp;</td>
            <td class="auto-style16">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button3" runat="server" Text="Thêm sản phẩm" OnClick="Button3_Click" BackColor="#FF6600" />
            </td>
            <td class="auto-style11">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style10">&nbsp;</td>
            <td class="auto-style17">CHỈNH SỬA SẢN PHẨM</td>
            <td class="auto-style11">&nbsp;</td>
        </tr>
        <tr>
            <td class="ar">Tên sản phẩm:</td>
            <td class="auto-style16">&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TxtTenSP1" runat="server" Width="229px"></asp:TextBox>
            </td>
            <td class="auto-style11">
                <asp:Label ID="lbID" runat="server" Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="ar">Giá:</td>
            <td class="auto-style16">&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TxtGia1" runat="server" Width="229px"></asp:TextBox>
            </td>
            <td class="auto-style11">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style19">Chi tiết:</td>
            <td class="auto-style20">&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TxtChitiet1" runat="server" Width="229px"></asp:TextBox>
            </td>
            <td class="auto-style21"></td>
        </tr>
        <tr>
            <td class="auto-style18">ảnh:</td>
            <td class="auto-style15">&nbsp;&nbsp;&nbsp;
                <asp:FileUpload ID="FileAnh1" runat="server" Width="229px" />
            </td>
            <td class="auto-style9"></td>
        </tr>
        <tr>
            <td class="auto-style10">&nbsp;</td>
            <td class="auto-style16">&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Sửa sản phẩm" BackColor="#FF6600" />
&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="Xóa sản phẩm" BackColor="#FF6600" />
            </td>
            <td class="auto-style11">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style10">&nbsp;</td>
            <td class="auto-style16">&nbsp;</td>
            <td class="auto-style11">&nbsp;</td>
        </tr>
    </table>
</asp:Content>

