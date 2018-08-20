<%@ Page Title="" Language="C#" MasterPageFile="~/NhomToPhuocNguyen.master" AutoEventWireup="true" CodeFile="NhomToPhuocNguyen_Quanlyphanhoi.aspx.cs" Inherits="Trang_NhomToPhuocNguyen_Phanhoi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style3 {
            height: 18px;
        }
        .auto-style4 {
            color: #000000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <table style="width:100%;">
        <tr>
            <td colspan="3" style="text-align: center; background-color: #88C8EA;" class="auto-style4">THÔNG TIN PHẢN HỒI CỦA KHÁCH HÀNG</td>
        </tr>
        <tr>
            <td class="auto-style3"></td>
            <td class="auto-style3"></td>
            <td class="auto-style3"></td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" Width="100%" OnPageIndexChanging="GridView1_PageIndexChanging" style="text-align: center">
                </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>

