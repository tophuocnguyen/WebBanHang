<%@ Page Title="" Language="C#" MasterPageFile="~/NhomToPhuocNguyen.master" AutoEventWireup="true" CodeFile="NhomToPhuocNguyen_DanhMuc.aspx.cs" Inherits="Trang_NhomToPhuocNguyen_DanhMuc" %>
<%@ Register TagPrefix="cc1" Namespace="SiteUtils" Assembly="CollectionPager" %>
<%@ Register assembly="CollectionPager" namespace="SiteUtils" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style3 {
            width: 215px;
        }
        .auto-style5 {
            width: 151px;
        }
        .auto-style6 {
            width: 107px;
        }
        .auto-style7 {
            width: 1px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <table style="width:100%;">
        <tr>
            <td colspan="3">
    <asp:DataList ID="DataList2" runat="server" RepeatColumns="3" RepeatDirection="Horizontal" Width="718px">
        <ItemTemplate>
            <table class="auto-style3">
                <tr>
                    <td colspan="2">
                        <asp:ImageButton ID="ImageButton1" runat="server" CommandArgument='<%# Eval("ID") %>' Height="202px" ImageUrl='<%# Eval("Anh") %>' OnClick="ImageButton1_Click" Width="211px" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9" colspan="2">
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Ten") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="auto-style9">
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("Gia") %>' Font-Size="12pt" ForeColor="Red"></asp:Label>
                                    &nbsp;<span class="auto-style5">VNĐ</span></td>
                </tr>
                <tr>
                    <td class="auto-style7">
                        <asp:Image ID="Image3" runat="server" Height="20px" ImageUrl="~/css/images/Visible_50.png" Width="18px" style="text-align: left" />
                    </td>
                    <td class="auto-style6">
                        <asp:Label ID="Label3" runat="server" Font-Size="10pt" Text='<%# Eval("LuotXem") %>' style="text-align: left"></asp:Label>
                                    &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style9" colspan="2">&nbsp;</td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:DataList>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td colspan="3">
                             <cc1:CollectionPager ID="pager" runat="server" PageSize="6" MaxPages="4" ></cc1:CollectionPager>
                        </td>
        </tr>
    </table>
</asp:Content>

