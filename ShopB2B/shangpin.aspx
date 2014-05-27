<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="shangpin.aspx.cs" Inherits="ShopB2B.WebForm1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>商品信息</title>
    <link href="../css/shangpin.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="big">
            <div class="taitou"><p>您好，欢迎来到敦煌XXX网！【登录】【免费注册】|我的订单|</p></div>
        <div class="qianduan">
            <div class="logo"></div>
            <div class="sosuo">
                 <asp:TextBox ID="txtSearch" runat="server" style="width:370px;border:2px solid #FF6A06; height:28px"></asp:TextBox>
                <asp:Button ID="btnSearch" runat="server" Text="搜索" style="border:0px solid red; color:White; font-size:20px; cursor:pointer; font-weight:bold; background-color:#FF6A06;height:35px; width:80px" />
            </div>
         </div>
         <div class="ap"><div class="bp">全部商品分类</div><div class="cp">首页</div></div>

     <div class="lujing">路径</div>
     <div class="sp">
         <div class="tupian">图片展示|这里有一个多图片的切换功能</div>
         <div class="xiangxi">商品信息</div>
    </div>
         <div class="xp">商品详细介绍</div>
         <div class="gp">广告图片</div>
    </div>
    </form>
</body>
</html>