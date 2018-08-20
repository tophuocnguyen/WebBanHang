<%@ Page Title="" Language="C#" MasterPageFile="~/NhomToPhuocNguyen.master" AutoEventWireup="true" CodeFile="NhomToPhuocNguyen_Dangky.aspx.cs" Inherits="Trang_NhomToPhuocNguyen_Dangky" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style3 {
            color: #FFFFFF;
            height: 18px;
        }
        .auto-style7 {
            width: 724px;
        }
        .auto-style9 {
            width: 157px;
        }
        .auto-style10 {
            width: 241px;
        }
        .auto-style15 {
            text-align: center;
        }
        .auto-style22 {
            width: 157px;
            height: 40px;
        }
        .auto-style23 {
            text-align: center;
            height: 40px;
        }
        .auto-style24 {
            width: 241px;
            height: 40px;
        }
        .auto-style26 {
            width: 250px;
            height: 40px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <script type="text/javascript">
         <!--LogOrCre()
                function TaoTaiKhoanThanhCong() {
                    if (alert('Xin chúc mừng \nBạn đã tạo tài khoản thành công') == true)
                        window.location = "NhomToPhuocNguyen_TrangChu.aspx";
                    else
                        window.location = "NhomToPhuocNguyen_TrangChu.aspx";
                }
                
                function TaoTaiKhoanThatBai() {
                    if (alert('Lỗi \nusername bạn nhập đã có sẵn') == true)
                        window.location = "NhomToPhuocNguyen_TrangChu.aspx";
                    else
                        window.location = "NhomToPhuocNguyen_TrangChu.aspx";
                }
         //-->
    </script>
    <table class="auto-style7">
        <tr>
            <td class="auto-style3" colspan="4" style="text-align: center; background-color: #394C9A">ĐĂNG KÝ TÀI KHOẢN NGUYÊN FASHION SHOP</td>
        </tr>
        <tr>
            <td class="auto-style22">Username:</td>
            <td class="auto-style23">
                <asp:TextBox ID="TxtUser" runat="server" Width="231px"></asp:TextBox>
            </td>
            <td class="auto-style24">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="TxtUser" ForeColor="Red">Xin nhập Username</asp:RequiredFieldValidator>
            </td>
            <td class="auto-style24">
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TxtUser" ErrorMessage="User phải trên 5 ký tự" ForeColor="Red" ValidationExpression="[a-z,A-Z,0-9]{5,}"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style22">Password:</td>
            <td class="auto-style23">
                <asp:TextBox ID="TxtPass" runat="server" Width="231px" TextMode="Password"></asp:TextBox>
            </td>
            <td class="auto-style24">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TxtPass" ErrorMessage="Xin nhập password" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style24">
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TxtPass" ErrorMessage="Password phải trên 6 ký tự" ForeColor="Red" ValidationExpression="[a-z,A-Z,0-9]{7,}"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style22">Nhập lại Password:</td>
            <td class="auto-style23">
                <asp:TextBox ID="TxtPass1" runat="server" Width="231px" TextMode="Password"></asp:TextBox>
            </td>
            <td class="auto-style24">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TxtPass1" ErrorMessage="Xin nhập lại password" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style24">
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TxtPass" ControlToValidate="TxtPass1" ErrorMessage="Password không khớp" ForeColor="Red"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style22">Nhập họ:</td>
            <td class="auto-style23">
                <asp:TextBox ID="TxtHo" runat="server" Width="231px"></asp:TextBox>
            </td>
            <td class="auto-style24">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TxtHo" ErrorMessage="Xin nhập họ" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style24"></td>
        </tr>
        <tr>
            <td class="auto-style22">Nhập tên:</td>
            <td class="auto-style23">
                <asp:TextBox ID="TxtTen" runat="server" Width="231px"></asp:TextBox>
            </td>
            <td class="auto-style24">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TxtTen" ErrorMessage="Xin nhập tên" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style24"></td>
        </tr>
        <tr>
            <td class="auto-style22">Giới tính:</td>
            <td class="auto-style26">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RadioButton ID="RNam" runat="server" Text="Nam" Checked="True" GroupName="GT" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RadioButton ID="RNu" runat="server" Text="Nữ" GroupName="GT" />
            </td>
            <td class="auto-style24"></td>
            <td class="auto-style24"></td>
        </tr>
        <tr>
            <td class="auto-style22">Địa chỉ:</td>
            <td class="auto-style23">
                <asp:TextBox ID="TxtDC" runat="server" Width="231px"></asp:TextBox>
            </td>
            <td class="auto-style24">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TxtDC" ErrorMessage="Xin nhập địa chỉ" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style24"></td>
        </tr>
        <tr>
            <td class="auto-style22">Số điện thoại:</td>
            <td class="auto-style23">
                <asp:TextBox ID="TxtSDT" runat="server" Width="231px"></asp:TextBox>
            </td>
            <td class="auto-style24">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TxtSDT" ErrorMessage="Xin nhập số điện thoại" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style24">
                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="TxtSDT" ErrorMessage="Số điện thoại phải trên 9 số" ForeColor="Red" ValidationExpression="[0-9]{10,}"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style22">Email:</td>
            <td class="auto-style23">
                <asp:TextBox ID="TxtEmail" runat="server" Width="231px"></asp:TextBox>
            </td>
            <td class="auto-style24">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="TxtEmail" ErrorMessage="Xin nhập Email" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style24">
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TxtEmail" ErrorMessage="Địa chỉ Email không hợp lệ" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style22">Ảnh đại diện:</td>
            <td class="auto-style26">
                &nbsp;
                <asp:FileUpload ID="FileAnh" runat="server" Width="232px" />
            </td>
            <td class="auto-style24">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="FileAnh" ErrorMessage="Xin chọn ảnh đại diện" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style24"></td>
        </tr>
        <tr>
            <td class="auto-style9">&nbsp;</td>
            <td class="auto-style15" colspan="2">
                <asp:Button ID="Button3" runat="server" BackColor="#E5101D" ForeColor="White" Text="Đăng ký" Width="70px" OnClick="Button3_Click" />
            </td>
            <td class="auto-style10">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style9">&nbsp;</td>
            <td class="auto-style15">&nbsp;</td>
            <td class="auto-style10" colspan="2">&nbsp;</td>
        </tr>
    </table>
</asp:Content>

