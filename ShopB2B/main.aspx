<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="main.aspx.cs" Inherits="ShopB2B.main" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>敦煌购物</title>
    <link href="css/main.css" rel="stylesheet" type="text/css" />
    <script src="Scripts/jquery-1.4.1-vsdoc.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                $.post("page/leftMenu.aspx", "", function (data) {
                    $('#mainMenu').html(data);
                });
            });
        </script>
    <style type="text/css">
        a:link {text-decoration: none;color:#000000}
        a:visited {text-decoration: none;}
        a:active {text-decoration: none;}
        a:hover {text-decoration: none;}
        
       ul li
      {
      	list-style:none;
      	border: 1px solid #EAEAEA; 
        height:13px; 
        padding-top:8px;
        line-height:12px;
        cursor:pointer;
        font-size:14px;
      }
      
      .span
      {
      	padding-left:18px
      }
      
    </style> 

</head>
<body>
    <form id="form1" runat="server">
     <div class="big">
        <div class="one"><p>您好，欢迎来到敦煌XXX网！【登录】【免费注册】|我的订单|</p></div>
        <div class="two"></div>
        <div class="four">
            <div class="ss">
                 <asp:TextBox ID="txtSearch" runat="server" style="width:370px;border:2px solid #FF6A06; height:35px"></asp:TextBox>
                <asp:Button ID="btnSearch" runat="server" Text="搜索" style="border:0px solid red; color:White; font-size:20px; cursor:pointer; font-weight:bold; background-color:#FF6A06;height:35px; width:80px" />
            </div>
        </div>
        <div class="five"><img src="/img1/4.png" />
        </div>
        <div class="six"><span>团购优惠：</span><span class="tt">天天低价</span><div class="si"><img src="/img1/tuangou.jpg" /></div></div>
        <div class="seven">
            <div class="haha">全部商品分类</div>
            <div class="lala">
            <ul  style="width:100%; margin:0px; padding:0px; height:320px;" id="mainMenu" >
                  <%-- <li ><span class="span">服装鞋帽</span> </li>
                   <li ><span style="padding-left:18px">家电家居</span></li>
                   <li ><span style="padding-left:18px">数码通讯</span></li>
                   <li ><span style="padding-left:18px">美容护肤</span></li>
                   <li ><span style="padding-left:18px">敦煌特色</span></li>
                   <li ><span style="padding-left:18px">敦煌美食</span></li>
                   <li ><span style="padding-left:18px">汽车五金</span></li>
                   <li ><span style="padding-left:18px">户外运动</span></li>
                   <li ><span style="padding-left:18px">图书音像</span></li>
                   <li ><span style="padding-left:18px">便民服务</span></li>
                   <li ><span style="padding-left:18px">综合超市</span></li>--%>
                </ul>
            </div>
        </div>
        <div class="eight">
            <div class="gaga"><a href="#">主页</a> <a href="#" target="_blank">服装</a> <a href="#" target="_blank">特色</a></div>
            <div class="mm"><img src="/img1/zhuye.jpg" /></div>
        </div>
        <div class="nine">
            <div class="ps">积分兑换</div>
            <div class="js"><img src="/img1/jifen.jpg" /></div>
        </div>
        <div class="ten">
            <div class="as">推荐商品展示</div>
            <div class="bs"><img src="/img1/tuijian.jpg" /></div>
        </div>
        <div class="eleven">
            <div class="cs">热门活动</div>
            <div class="ds"><img src="/img1/remen.jpg" /></div>
        </div>
        <div style="width:950px; text-align:center; padding-left:100px ">
               <div class="DivBottom" >关于我们|</div>
               <div class="DivBottom">|联系我们|</div>
               <div class="DivBottom">|人才招聘|</div>
               <div class="DivBottom">|商家入住|</div>
               <div class="DivBottom">|广告服务|</div>
               <div class="DivBottom">|手机|</div>
               <div class="DivBottom">|友情链接|</div>
               <div class="DivBottom">|销售联盟|</div>
               <div class="DivBottom">|社区|</div>
               <div class="DivBottom">|公益|</div>
               <div class="DivBottom"  style="width:150px">|English Site</div>
           </div>
    </div>
    </form>
</body>
</html>
