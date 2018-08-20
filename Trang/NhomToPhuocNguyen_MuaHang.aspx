<%@ Page Title="" Language="C#" MasterPageFile="~/NhomToPhuocNguyen.master" AutoEventWireup="true" CodeFile="NhomToPhuocNguyen_MuaHang.aspx.cs" Inherits="Trang_NhomToPhuocNguyen_MuaHang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style3 {
            width: 707px;
        }
        .auto-style7 {
            width: 238px;
        }
        .auto-style8 {
            height: 18px;
        }
        .auto-style10 {
            width: 611px;
            height: 89px;
        }
        .auto-style13 {
            width: 129px;
        }
        .auto-style18 {
            height: 18px;
            text-align: center;
            font-family: "Trebuchet MS";
            font-size: 25px;
            color: #33CCFF;
        }
        .auto-style21 {
            text-align: center;
        }
        .auto-style26 {
            width: 265px;
            height: 18px;
        }
        .auto-style29 {
            width: 238px;
            height: 18px;
        }
        .auto-style31 {
            width: 265px;
        }
        .auto-style32 {
            width: 135px;
            height: 18px;
        }
        .auto-style33 {
            width: 135px;
            text-align: center;
        }
        .auto-style34 {
            width: 135px;
            text-align: left;
            height: 24px;
        }
        .auto-style37 {
            text-align: center;
            height: 36px;
        }
        .auto-style38 {
            font-family: "Trebuchet MS";
            font-size: 25px;
            height: 34px;
            color: #0066FF;
        }
        .auto-style39 {
            width: 184px;
            text-align: center;
        }
        .auto-style40 {
            width: 184px;
            height: 18px;
        }
        .auto-style41 {
            width: 164px;
        }
        .auto-style42 {
            width: 265px;
            height: 24px;
        }
        .auto-style43 {
            width: 184px;
            text-align: left;
            height: 24px;
        }
        .auto-style44 {
            width: 238px;
            height: 24px;
        }
        .auto-style45 {
            width: 184px;
            text-align: left;
        }
        .auto-style46 {
            width: 322px;
        }
        .auto-style47 {
            width: 153px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <script type="text/javascript">
         <!--LogOrCre()
                
                function returnHome() {
                    if (alert('Bạn không phải là khach hàng \nHoặc giỏ hàng của bạn hiện đang rỗng!\nVui lòng vào trang chủ để mua sắm!') == true)
                        window.location = "NhomToPhuocNguyen_Trangchu.aspx";
                    else
                        window.location = "NhomToPhuocNguyen_Trangchu.aspx";
                }
                function XoaThanhCong()
                {
                    if (alert('Xóa thành công') == true)
                        window.location = "NhomToPhuocNguyen_Muahang.aspx";
                    else
                        window.location = "NhomToPhuocNguyen_Muahang.aspx";
                }
                function UpdateThanhCong()
                {
                    if (alert('Cập nhật thành công') == true)
                        window.location = "NhomToPhuocNguyen_Muahang.aspx";
                    else
                        window.location = "NhomToPhuocNguyen_Muahang.aspx";
                }
                function DatHangThanhCong() {
                    if (alert('Đặt hàng thành công!\nXin cám ơn\n Chúc bạn có một ngày tốt lành') == true)
                        window.location = "NhomToPhuocNguyen_TrangChu.aspx";
                    else
                        window.location = "NhomToPhuocNguyen_TrangChu.aspx";
                }
                QuaLon
                function QuaLon() {
                    if (alert('Số lượng quá lớn') == true)
                        window.location = "NhomToPhuocNguyen_Muahang.aspx";
                    else
                        window.location = "NhomToPhuocNguyen_Muahang.aspx";
                }
                function BanChuaDangNhap() {
                    if (alert('Bạn chưa đăng nhập') == true)
                        window.location = "NhomToPhuocNguyen_Muahang.aspx";
                    else
                        window.location = "NhomToPhuocNguyen_Muahang.aspx";
                }
         //-->
            </script>
     <table class="auto-style3">
        <tr>
            <td class="auto-style38" colspan="4" style="text-align: center">THÔNG TIN GIỎ HÀNG</td>
        </tr>
        <tr>
            <td class="auto-style21" colspan="2">Sản phẩm</td>
            <td class="auto-style45">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Số lượng</td>
            <td class="auto-style7">Giá thành</td>
        </tr>
        <tr>
            <td class="auto-style8" colspan="4">
                <asp:DataList ID="DataHienthi" runat="server" Width="699px">
                    <ItemTemplate>
                        <table class="auto-style10">
                            <tr>
                                <td class="auto-style47">
                                    <asp:Image ID="ImgSP" runat="server" Height="78px" Width="104px" ImageUrl='<%# Eval("AnhSP") %>' />
                                </td>
                                <td class="auto-style46">
                                    <asp:Label ID="LbTenSP" runat="server" Text='<%# Eval("TenSP") %>'></asp:Label>
                                </td>
                                <td class="auto-style41">
                                    <asp:TextBox ID="TxtSoluong" runat="server" Height="28px" Width="34px" Text='<%# Eval("SoluongSP") %>' ReadOnly="True"></asp:TextBox>
                                </td>
                                <td class="auto-style13">
                                    <asp:Label ID="LbGia" runat="server" Text='<%# Eval("GiaSP") %>'></asp:Label>
                                    &nbsp;VNĐ</td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:DataList>
            </td>
        </tr>
        <tr>
            <td class="auto-style18" colspan="4">Thay đổi giỏ hàng</td>
        </tr>
        <tr>
            <td class="auto-style18" colspan="4">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style26"></td>
            <td class="auto-style32">Tên sản phẩm:</td>
            <td class="auto-style40"><asp:DropDownList ID="DropSP" runat="server" Height="19px" Width="135px">
                </asp:DropDownList>
            </td>
            <td class="auto-style29"></td>
        </tr>
        <tr>
            <td class="auto-style42"></td>
            <td class="auto-style34">Số lượng:</td>
            <td class="auto-style43">
                <asp:TextBox ID="TxtSL" runat="server"></asp:TextBox>
            </td>
            <td class="auto-style44"></td>
        </tr>
        <tr>
            <td class="auto-style31">&nbsp;</td>
            <td class="auto-style33">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:ImageButton ID="ImgUpdate" runat="server" Height="45px" ImageUrl="~/css/images/system-software-update-icon.png" Width="64px" OnClick="ImgUpdate_Click" />
            </td>
            <td class="auto-style39">
                <asp:ImageButton ID="ImgDelete" runat="server" Height="54px" ImageUrl="~/css/images/cart-remove-icon.png" style="text-align: left" Width="64px" OnClick="ImgDelete_Click" />
            </td>
            <td class="auto-style7">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style37" colspan="4">Tổng tiền
                <asp:Label ID="LbTong" runat="server" Font-Size="18pt"></asp:Label>
&nbsp; VND</td>
        </tr>
        <tr>
            <td class="auto-style21" colspan="4">
                <asp:Button ID="BtnThanhtoan" runat="server" BackColor="#E5101D" Font-Size="14px" ForeColor="White" Height="32px" Text="Thanh toán" Width="142px" OnClick="BtnThanhtoan_Click" />
            </td>
        </tr>
    </table>
</asp:Content>

