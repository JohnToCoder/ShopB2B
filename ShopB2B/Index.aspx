<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="ShopB2B.Index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-1.4.1-vsdoc.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#mainMenu>li').each(function () {
                $(this).hover(function () {
                    $('#GoodsDetial').show();
                }, function () {
                    $('#GoodsDetial').hide();
                });
            });
        });
    
    </script>
    <style type="text/css">
      body
      {
      	 margin:20px;
      	 padding:0;
      }
      
      .DivTop
      {
         width:80px; float:left;height:35px;margin-top:10px;text-align:center; 
         line-height:35px;
         background-color: #DDDDDD;
         border:1px solid  #CCCCCC;
      }
      
      .DivBottom
      {
         width:80px; float:left;height:35px;text-align:center; 
         line-height:35px;
         color:Gray;
      }
      ul li
      {
      	list-style:none;
      	border: 1px solid #EAEAEA; 
        height:20px; 
        padding-top:12px;
        cursor:pointer;
      }
    </style>

</head>
<body>
    <form id="form1" runat="server">
    <div style="">
    <table cellpadding="0" cellspacing="0" style="width:100%; height:100%; background-color:White;">
        <tr>
          <td colspan='3' align="right">
                <div style="width:600px; float:right; padding-right:20px ">
                   <span>某某，欢迎来到敦煌网!</span>
                   <span>【登录】</span>
                   <span>【免费注册】</span>
                   <span>我的订单</span>
                   <span>会员俱乐部</span>
                </div>
          </td>
        </tr>
        <tr>
            <td style="width:15%">
        
                <img scr="#" alt="" />
            </td>
            <td style="width:50%;padding-top:10px; padding-left:100px">
                <asp:TextBox ID="txtSearch" runat="server" style="width:500px;border:2px solid #FF6A06; height:35px"></asp:TextBox>
                <asp:Button ID="btnSearch" runat="server" Text="搜索" style="border:0px solid red; color:White; font-weight:bold; background-color:#FF6A06;height:35px; width:80px" />
            </td>
            <td style="width:25%;">
                <%--<asp:Button ID="btnMyDunHuang" runat="server" Text="我的购物" style="height:28px;border:2px solid Gray;" />
                <asp:Button ID="Button2" runat="server" Text="去购物车结算"  style="height:28px;border:2px solid Gray;" />--%>
                    <div class="DivTop">个人中心</div>
                    <div class="DivTop">查看积分</div>
                    <div class="DivTop">兑换规则</div>
            </td>
        </tr>
        <tr>
            <td colspan='3' style="height:20px">
                 <label style="font-weight:bold; font-size:20px; ">团购优惠：</label> 
                 <label style="font-size:12px;font-weight:bold;color:gray ">天天低价</label>
            </td>
        </tr>
        <tr>
            <td colspan='3' style="height:120px">
         
                <img src="#" width="24%" height="110px" />
                <img src="#" width="25%" height="110px" />
                <img src="#" width="24%" height="110px" />
                <img src="#" width="25%" height="110px" />
            </td>
        </tr>
        <tr>
              <td colspan="3">
                <div style="width:100%; margin-top:5px; height:40px; background-color:#FF6A06;color:White; font-weight:bold;">
                     <div style="padding-top:5px">
                         <span style="margin-top:5px; line-height:35px; overflow:hidden;margin-left:50px;width:300px;vertical-align: middle;" >全部商品分类</span>
                         &nbsp;<span style="margin-top:5px;overflow:hidden;width:80px; height:40px;margin-left:100px;"> 首页 </span>
                         <span style="margin-top:5px;overflow:hidden; margin-left:40px"> 服装城 </span>&nbsp;
                         <span style="margin-top:5px;overflow:hidden;margin-left:40px"> 特色 </span>&nbsp;
                     &nbsp;</div>
                </div> 
              </td>
        </tr>
        <tr>
            <td style="height:370px">
                <ul  style="width:100%; margin:0px; margin-top:-36px; padding:0px; height:370px;border-top:0px solid #FF6A06;border-right:2px solid #FF6A06;
                    border-left:2px solid #FF6A06;border-bottom:2px solid #FF6A06;" id="mainMenu" >
                   <li ><span style="padding-left:18px">服装鞋帽</span> </li>
                   <li ><span style="padding-left:18px">家电家居</span></li>
                   <li ><span style="padding-left:18px">数码通讯</span></li>
                   <li ><span style="padding-left:18px">美容护肤</span></li>
                   <li ><span style="padding-left:18px">敦煌特色</span></li>
                   <li ><span style="padding-left:18px">敦煌美食</span></li>
                   <li ><span style="padding-left:18px">汽车五金</span></li>
                   <li ><span style="padding-left:18px">户外运动</span></li>
                   <li ><span style="padding-left:18px">图书音像</span></li>
                   <li ><span style="padding-left:18px">便民服务</span></li>
                   <li ><span style="padding-left:18px">综合超市</span></li>
                </ul>
            </td>
            <td  style="width:50%">
                <table cellpadding="0" cellspacing="0" width="100%" border="0">
                    <tr>
                       <td>
                            <img style="height:250px; padding-left:4px; width:100%" src="image/shouye.jpg" />
                       </td>
                    </tr>
                    <tr>
                        <td style="height:118px;">
                            <table cellpadding="0" cellspacing="0" border="0" style="width:100%" >
                                <tr>
                                    <td  valign="middle" style="width:21px" >
                                        <img src="image/left.jpg" />
                                    </td>
                                     <td style="width:20%">
                                      <img src="image/S1.jpg"/>
                                    </td>
                                     <td style="width:20%">
                                      <img src="image/S2.jpg" />
                                    </td>
                                    <td style="width:20%">
                                     <img src="image/S3.jpg" />
                                    </td>
                                    <td style="width:10px">
                                      <img src="image/right.jpg" />
                                    </td>
                                </tr>
                           
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width:25%; padding-left:8px"   valign="top">
              <img style="width:99%" src="image/kuaibao.jpg" />
               <span>快报</span>
               <span style="padding-left:240px">更多快报</span>
            </td>
        </tr>
        <tr>
            <td style="font-size:25px; padding-left:20px; color:#F06000; padding-top:10px; font-weight:bold; " 
                colspan='3'>
               积分兑换
            </td>
        </tr>
        <tr>
            <td style="height:300px; border:1px solid #F06000" 
                colspan='3' >
            </td>
        </tr>
        <tr>
            <td style="font-size:25px; padding-left:20px; color:#F06000; padding-top:10px; font-weight:bold; " 
                colspan='3'>
               推荐商品展示
            </td>
        </tr>
        <tr>
            <td style="height:300px; border:1px solid #F06000" 
                colspan='3' >
            </td>
        </tr>
        <tr>
            <td style="font-size:25px; padding-left:20px; color:#F06000; padding-top:10px; font-weight:bold; " 
                colspan='3'>
               热门活动
            </td>
        </tr>
        <tr>
            <td style="height:300px; border:1px solid #F06000" 
                colspan='3' >
            </td>
        </tr>
        <tr>
         <td align="center" colspan='3' style="padding-top:20px"  >
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
         </td>
        </tr>

    </table>
    </div>
    <div id="GoodsDetial" style="height:370px; display:none;background-color:White;width:60%;top:276px;left:240px; 
        position:absolute; border:1px solid Gray">
        <span style="text-decoration:underline; font-weight:bold; margin:5px; line-height:30px; color:Red">男装|</span>
        <span style=" margin:5px;line-height:30px; color:Black">|西装|</span>
        <span style=" margin:5px;line-height:30px; color:Black">|衬衫|</span>
        <span style=" margin:5px;line-height:30px; color:Black">|T恤|</span>
        <span style=" margin:5px;line-height:30px; color:Black">|卫衣|</span>
        <br />
    </div>
    </form>
</body>
</html>
