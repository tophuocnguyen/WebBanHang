<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NhomToPhuocNguyen_Dangnhap.aspx.cs" Inherits="NhomToPhuocNguyen_Dangnhap" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Awesome Login Form Responsive Widget,Login form widgets, Sign up Web forms , Login signup Responsive web form,Flat Pricing table,Flat Drop downs,Registration Forms,News letter Forms,Elements" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
    function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- Meta tag Keywords -->
    <!-- css files -->
    <link rel="stylesheet" href="css/style.css" type="text/css" media="all" /> <!-- Style-CSS --> 
    <link rel="stylesheet" href="css/font-awesome.css"/> <!-- Font-Awesome-Icons-CSS -->
    <!-- //css files -->
    <!-- web-fonts -->
    <link href="//fonts.googleapis.com/css?family=Philosopher:400,400i,700,700i&amp;subset=cyrillic,cyrillic-ext,vietnamese" rel="stylesheet"/>
    <!-- //web-fonts -->
    <script type="text/javascript">
         <!--
        function ThanhCong() {
         if (alert('Đăng nhập thành công!')== true)
             window.location = "../NhomToPhuocNguyen_Trangchu.aspx";
            else
             window.location = "../NhomToPhuocNguyen_Trangchu.aspx";
        }
    
    function KhongThanhCong() {
        alert('Đăng nhập Không thành công!');
    }
    //-->
    </script>
</head>
<body>
<div data-vide-bg="video/b1">
	<div class="center-container">
		<!--header-->
		<div class="header-w3l">
			<h1>Login into Nguyên Fashion Shop</h1>
		</div>
		<!--//header-->
		<!--main-->
		<div class="main-content-agile">
			<div class="wthree-pro">
				<h2>Login information</h2>
			</div>
			<div class="sub-main-w3">	
				<form id="form1" runat="server">

					<%--<input placeholder="Username" name="Username"  type="text" required=""/>--%>
                    <asp:TextBox placeholder="Username" name="Username" type="text" required="" ID="txtUsername" runat="server"></asp:TextBox>
					<span class="icon1"><i class="fa fa-user" aria-hidden="true"></i></span>
					<%--<input  placeholder="Password" name="Password"  type="password" required=""/>--%>
                    <asp:TextBox ID="txtPassword" placeholder="Password" name="Password"  type="password" required="" runat="server"></asp:TextBox>
					<span class="icon2"><i class="fa fa-unlock" aria-hidden="true"></i></span>
					<div class="rem-w3">
						<span class="check-w3"><a href="../NhomTophuocNguyen_Laylaimatkhau.aspx">Quên mật khẩu</a></span>
						
                        <a href="../NhomToPhuocNguyen_Dangky.aspx">Chưa có tài khoản ?</a>
						<div class="clear"></div>
					</div>
					<div class="navbar-right social-icons"> 
							<ul>
								<li><a href="#" class="fa fa-facebook icon-border facebook"> </a></li>
								<li><a href="#" class="fa fa-twitter icon-border twitter"> </a></li>
								<li><a href="#" class="fa fa-google-plus icon-border googleplus"> </a></li> 
								<li><a href="#" class="fa fa-pinterest icon-border rss"> </a></li>
							    
                            </ul>  
						</div>

                    <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" />
					
				    
                </form>
			</div>
		</div>
		<!--//main-->
		<!--footer-->
		<div class="footer">
			<p>All rights reserved Nguyên Fashion Shop  </p>
		</div>
		<!--//footer-->
	</div>
</div>
<!-- js -->
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<script src="js/jquery.vide.min.js"></script>
<!-- //js -->
</body>
</html>
