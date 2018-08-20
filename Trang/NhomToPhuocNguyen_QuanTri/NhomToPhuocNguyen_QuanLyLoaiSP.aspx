<%@ Page Title="" Language="C#" MasterPageFile="~/NhomToPhuocNguyen.master" AutoEventWireup="true" CodeFile="NhomToPhuocNguyen_QuanLyLoaiSP.aspx.cs" Inherits="Trang_NhomToPhuocNguyen_QuanTri_NhomToPhuocNguyen_QuanLyLoaiSP" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style4 {
            width: 724px;
        }
        .auto-style7 {
            height: 18px;
            width: 229px;
            text-align: right;
        }
        .auto-style9 {
        }
        .auto-style10 {
            width: 241px;
            text-align: left;
        }
        .auto-style11 {
            height: 18px;
            width: 241px;
        }
        .auto-style12 {
            height: 18px;
            width: 229px;
        }
        .auto-style14 {
            width: 229px;
        }
        .auto-style15 {
            text-align: right;
            width: 229px;
        }
        .auto-style16 {
            width: 306px;
            text-align: left;
        }
        .auto-style17 {
            height: 18px;
            width: 306px;
        }
        .auto-style18 {
            width: 306px;
            text-align: center;
            color: #0000FF;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <script type="text/javascript">
         <!--LogOrCre()
        
        function ThemThanhCong() {
            if (alert('Thêm thành công') == true)
                window.location = "NhomToPhuocNguyen_QuanLyLoaiSP.aspx"
            else
                window.location = "NhomToPhuocNguyen_QuanLyLoaiSP.aspx"
        }
        function Loi() {
            if (alert('Lỗi Một Vùng Nào Đó Đang Rỗng!\nĐiền thông tin và thử lại!') == true)
                window.location = "NhomToPhuocNguyen_QuanLyLoaiSP.aspx"
            else
                window.location = "NhomToPhuocNguyen_QuanLyLoaiSP.aspx"
        }
        
        function XoaThanhCong() {
            if (alert('Xóa thành công') == true)
                window.location = "NhomToPhuocNguyen_QuanLyLoaiSP.aspx"
            else
                window.location = "NhomToPhuocNguyen_QuanLyLoaiSP.aspx"
        }
         function SuaThanhCong()
         {
                        if (alert('Sửa thành công') == true)
                            window.location = "NhomToPhuocNguyen_QuanLyLoaiSP.aspx"
                        else
                            window.location = "NhomToPhuocNguyen_QuanLyLoaiSP.aspx"
           } 
         //-->
    </script>
    <table class="auto-style4">
        <tr>
            <td class="auto-style14">DANH SÁCH LOẠI SẢN PHẨM</td>
            <td class="auto-style16">&nbsp;</td>
            <td class="auto-style10">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style9" colspan="3">
                <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%">
                    <AlternatingRowStyle BackColor="White" />
                    <EditRowStyle BackColor="#7C6F57" />
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#E3EAEB" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                    <SortedDescendingHeaderStyle BackColor="#15524A" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td class="auto-style12"></td>
            <td class="auto-style17"></td>
            <td class="auto-style11"></td>
        </tr>
        <tr>
            <td class="auto-style14">&nbsp;</td>
            <td class="auto-style18">THÊM LOẠI SẢN PHẨM MỚI</td>
            <td class="auto-style10">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style15">Tên loại sản phẩm:</td>
            <td class="auto-style16">&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:TextBox ID="TxtTen" runat="server" Width="204px"></asp:TextBox>
            </td>
            <td class="auto-style10">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style14">&nbsp;</td>
            <td class="auto-style16">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Thêm sản phẩm" BackColor="#FF6600" />
            </td>
            <td class="auto-style10">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style14">&nbsp;</td>
            <td class="auto-style18">CHỈNH SỮA LOẠI SẢN PHẨM MỚI</td>
            <td class="auto-style10">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style15">Tên loại sản phẩm cũ:</td>
            <td class="auto-style16">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:DropDownList ID="DropTen" runat="server" Height="18px" Width="204px">
                </asp:DropDownList>
            </td>
            <td class="auto-style10">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style7">Tên loại sản phẩm mới:</td>
            <td class="auto-style17">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:TextBox ID="TxtTen1" runat="server" Width="204px"></asp:TextBox>
            </td>
            <td class="auto-style11"></td>
        </tr>
        <tr>
            <td class="auto-style14">&nbsp;</td>
            <td class="auto-style16">&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Sửa sản phẩm" BackColor="#FF6600" />
&nbsp;&nbsp;
                <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="Xóa sản phẩm" BackColor="#FF6600" />
            </td>
            <td class="auto-style10">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style14">&nbsp;</td>
            <td class="auto-style16">&nbsp;</td>
            <td class="auto-style10">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style14">&nbsp;</td>
            <td class="auto-style16">&nbsp;</td>
            <td class="auto-style10">&nbsp;</td>
        </tr>
    </table>
</asp:Content>

