<%@ Page Title="" Language="C#" MasterPageFile="~/NhomToPhuocNguyen.master" AutoEventWireup="true" CodeFile="NhomToPhuocNguyen_MatHang.aspx.cs" Inherits="Trang_NhomToPhuocNguyen_MatHang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .auto-style9 {
        color: #82D41F;
    }
    .auto-style12 {
        width: 707px;
    }
        .auto-style22 {
            height: 78px;
        }
        .auto-style23 {
            height: 47px;
        }
        .auto-style24 {
            height: 37px;
        }
        .auto-style25 {
            height: 41px;
        }
        .auto-style26 {
            height: 3px;
            background-color: #FFFFFF;
        }
        .auto-style27 {
            color: #A2B2D2;
        }
        .auto-style28 {
            color: #FF9900;
        }
        .auto-style29 {
            width: 272px;
        }
        .auto-style30 {
            height: 18px;
        }
        .auto-style31 {
            width: 272px;
            text-decoration: underline;
            height: 29px;
        }
        .auto-style32 {
            width: 272px;
            height: 18px;
        }
        .auto-style33 {
            height: 29px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <p>
        <script type="text/javascript">
         <!--
            function Redirect() {
                if (alert('Sản phẩm này không tồn tại! \nClick OK để quay về trang chủ!') == true)
                    window.location = "NhomNguyenNhuY_Home.aspx";
                else
                    window.location = "NhomNguyenNhuY_Home.aspx";
            }

            function ThanhCong() {
                alert('Thêm vào giỏ hàng thành công!');
            }
         //-->
         </script>
    <table class="auto-style12">
    <tr>
        <td class="auto-style29" rowspan="9">
            <asp:Image ID="ImgSP" runat="server" Height="281px" Width="255px" />
        </td>
        <td class="auto-style25">
            <asp:Label ID="LbTen" runat="server" Font-Size="25px" style="font-weight: 700"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="auto-style27">Đã xem:
            <asp:Label ID="LbLuotxem" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="auto-style24">Giá:
            <asp:Label ID="LbGia" runat="server" CssClass="auto-style28" Font-Size="20px"></asp:Label>
            <span class="auto-style28">&nbsp;VNĐ</span></td>
    </tr>
    <tr>
        <td class="auto-style23"><strong>Số lượng:</strong>
            <asp:DropDownList ID="DropSoluong" runat="server" ForeColor="#33CCFF">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="auto-style22">
            <asp:ImageButton ID="ImageBtbDatHang" runat="server" ImageUrl="~/css/images/button.png" OnClick="ImageBtbDatHang_Click" />
        </td>
    </tr>
    <tr>
        <td class="auto-style26">
            <span class="auto-style9">&nbsp;<asp:Image ID="Image3" runat="server" ImageUrl="~/css/images/1493022299_check.png" Height="22px" Width="25px" style="text-align: right; margin-left: 0px" />
        &nbsp;<asp:Label ID="LbDamua" runat="server" CssClass="auto-style9" Font-Size="15px"></asp:Label>
            &nbsp;đã mua</span></td>
    </tr>
    <tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style30"></td>
    </tr>
    <tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style31"><strong>Thông tin sản phẩm:</strong></td>
        <td class="auto-style33"></td>
    </tr>
    <tr>
        <td class="auto-style32">
            <asp:Label ID="LbThongtin" runat="server"></asp:Label>
        </td>
        <td class="auto-style30"></td>
    </tr>
     <tr>
            <td class="auto-style29"></td>
            <td></td>
        </tr>
    </table>
</p>
</asp:Content>

