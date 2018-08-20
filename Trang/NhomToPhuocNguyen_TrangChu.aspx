<%@ Page EnableEventValidation="true" Title="" Language="C#" MasterPageFile="~/NhomToPhuocNguyen.master" AutoEventWireup="true" CodeFile="NhomToPhuocNguyen_TrangChu.aspx.cs" Inherits="Trang_NhomToPhuocNguyen_TrangChu" %>
<%@ Register TagPrefix="cc1" Namespace="SiteUtils" Assembly="CollectionPager" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style3 {
            height: 18px;
        }
        .auto-style4 {
            height: 18px;
            width: 2px;
        }
        .auto-style5 {
            color: #FF0000;
        }
        .auto-style6 {
            width: 724px;
        }
        .auto-style9 {
            width: 240px;
        }
        .auto-style10 {
            width: 241px;
        }
        .auto-style11 {
        }
        .auto-style12 {
            width: 241px;
            height: 18px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <table class="auto-style6">
        <tr>
            <td>
                <asp:DataList ID="DataList2" runat="server" RepeatColumns="3" RepeatDirection="Horizontal" Width="718px">
                    <ItemTemplate>
                        <table style="width:100%;">
                            <tr>
                                <td colspan="2">
                                    <asp:ImageButton ID="ImageButton1" runat="server" CommandArgument='<%# Eval("ID") %>' Height="202px" ImageUrl='<%# Eval("Anh") %>' OnClick="ImageButton1_Click" Width="211px" />
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style3" colspan="2">
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Ten") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" class="auto-style3">
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("Gia") %>' Font-Size="12pt" ForeColor="Red"></asp:Label>
                                    &nbsp;<span class="auto-style5">VNĐ</span></td>
                            </tr>
                            <tr>
                                <td class="auto-style4">
                                    <asp:Image ID="Image3" runat="server" Height="20px" ImageUrl="~/css/images/Visible_50.png" Width="18px" />
                                </td>
                                <td class="auto-style3">
                                    <asp:Label ID="Label3" runat="server" Font-Size="10pt" Text='<%# Eval("LuotXem") %>'></asp:Label>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style3" colspan="2">&nbsp;</td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:DataList>
            </td>
        </tr>
        <tfoot>
                    <tr>
                        <td>
                             <cc1:CollectionPager ID="pager" runat="server" PageSize="6" MaxPages="4" ></cc1:CollectionPager>
                        </td>
                    </tr>
                </tfoot>
    </table>
</asp:Content>


