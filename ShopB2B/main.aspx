<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="main.aspx.cs" Inherits="ShopB2B.main" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>敦煌购物</title>
    <link href="css/main.css" rel="stylesheet" type="text/css" />    
    <script src="Scripts/jquery-1.4.1-vsdoc.js" type="text/javascript"></script>
    <script src="Scripts/pptBox.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                $.post("page/leftMenu.aspx", "", function (data) {
                    $('#mainMenu').html(data);
                });
                $('#mainMenu>li').each(function () {
                    $(this).hover(function () {
                        alert("test");
                        $('#GoodsDetial').show();
                    }, function () {
                        $('#GoodsDetial').hide();
                    });
                });
            });
            function login(){
                var divLogin=document.getElementById("branding");
                divLogin.style.display='block';
            }
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
        line-height:18px;
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
    <div class="header"><p>您好，欢迎来到敦煌XXX网！
            |
            <a id="aLogin" href="javascript:login()">[登录]</a>
            |
            <a id="aSign" href="#">[免费注册]</a>
            |
            <a id="aOrder" href="#"> 我的订单</a>
            |
            <a id="aShopCar" href="#">我的购物车</a>
            </p></div>
     <div class="big">
        
        <div class="two"></div>
        <div class="SearchBar">
            <div class="ss">
                 <input type="text" id="txtSearchBar" runat="server" 
                     style="width:360px; border:2px solid #FF6A06; height:35px"/>
                <button id="btnSearchBar" runat="server" 
                     style="border:0px solid red; color:White; font-size:20px; cursor:pointer; font-weight:bold; background-color:#FF6A06;height:35px; width:80px" >搜索</button>
            </div>
        </div>
        <div class="five"><img src="/img1/4.png" alt="" />
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
            <div id="xxx">
                 <script type="text/jscript">
                     var box = new PPTBox();
                     box.width = 790; //宽度
                     box.height = 270; //高度
                     box.autoplayer = 10; //自动播放间隔时间
                     box.add({ "url": "image/tu1.jpg", "href": "#", "title": "悬浮提示标题1" });
                     box.add({ "url": "image/tu2.jpg", "href": "#", "title": "悬浮提示标题2" });
                     box.add({ "url": "image/tu3.jpg", "href": "#", "title": "悬浮提示标题3" });
                     box.add({ "url": "image/tu4.jpg", "href": "#", "title": "悬浮提示标题4" });
                     box.show();
                </script>               
            </div>
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

           <div id="branding"  style=" width:520px;height:450px; display:none; position:absolute; left:235px; top:50px; z-index:110"> 
             <form id="formlogin" method="post" onsubmit="return false;" action="">                   
                    <div class=" w1" id="entry">
                        <div class="extra-en"><a href="#" clstag="passport|keycount|login|03">[English]</a></div>
                        <div class="mc " id="bgDiv">                            
                            <div class="form ">
                                <div class="item fore1">
                                    <span>邮箱/用户名/已验证手机</span>
                                    <div class="item-ifo">
                                        <input type="text" id="loginname" name="loginname" class="text" value="" tabindex="1" autocomplete="off">
                                        <div class="i-name ico"></div>
                                        <label id="loginname_succeed" class="blank invisible"></label>
                                        <label id="loginname_error" class="hide"><b></b></label>
                                    </div>
                                </div>
                                <script type="text/javascript">
                                    setTimeout(function () {
                                        if (!$("#loginname").val()) {
                                            $("#loginname").get(0).focus();
                                        }
                                    }, 0);
                                </script>
                                <div id="capslock"><i></i><s></s>键盘大写锁定已打开，请注意大小写</div>
                                <div class="item fore2">
                                    <span>密码</span>
                                    <div class="item-ifo">
                                        <label id="sloginpwd" style="display: none;">
                                            <script type="text/javascript">                                pgeditor.generate()</script><span id="_ocx_password_down" class="text_pge" style="text-align:center;"><a href="#JDedit.exe">请点此安装控件</a></span>
                                        </label>
                                        <input type="password" id="nloginpwd" name="nloginpwd" class="text" tabindex="2" autocomplete="off">
                                        <input type="hidden" name="loginpwd" id="loginpwd" value="" class="hide">

                                        <div class="i-pass ico"></div>
                                        <label id="loginpwd_succeed" class="blank invisible"></label>
                                        <label id="loginpwd_error" class="hide"></label>
                                        <script type="text/javascript">
                                            $('#nloginpwd')[0].onkeypress = function (event) {
                                                var e = event || window.event,
								                $tip = $('#capslock'),
								                kc = e.keyCode || e.which, // 按键的keyCode
								                isShift = e.shiftKey || (kc == 16) || false; // shift键是否按住
                                                if (((kc >= 65 && kc <= 90) && !isShift) || ((kc >= 97 && kc <= 122) && isShift)) {
                                                    $tip.show();
                                                }
                                                else {
                                                    $tip.hide();
                                                }
                                            };
                                        </script>
                                    </div>
                                </div>
                                <input type="hidden" name="machineNet" id="machineNet" value="" class="hide">
                                <input type="hidden" name="machineCpu" id="machineCpu" value="" class="hide">
                                <input type="hidden" name="machineDisk" id="machineDisk" value="" class="hide">
                
                                <div class="item fore3  hide " id="o-authcode">
                                    <span>验证码</span>

                                    <div class="item-ifo">
                                        <input type="text" id="authcode" class="text text-1" name="authcode" tabindex="6" style="ime-mode:disabled">
                                        <label class="img">
                                            <img style="cursor:pointer;width:100px;height:33px;display:block;" src2="https://authcode.jd.com/verify/image?a=1&amp;acid=4c3c99bb-0be5-438d-9526-2a40130af9ca&amp;uid=4c3c99bb-0be5-438d-9526-2a40130af9ca" onclick="this.src= document.location.protocol +'//authcode.jd.com/verify/image?a=1&amp;acid=4c3c99bb-0be5-438d-9526-2a40130af9ca&amp;uid=4c3c99bb-0be5-438d-9526-2a40130af9ca&amp;yys='+new Date().getTime();$('#authcode').val('');" ver_colorofnoisepoint="#888888" id="JD_Verification1">
                                        </label>
                                        <label class="ftx23 hline">看不清？<br><a href="javascript:void(0)" class="flk13" onclick="jQuery('#JD_Verification1').click();">换一张</a></label>
                                        <label id="authcode_succeed" class="blank invisible"></label>
                                        <label id="authcode_error" class="hide"></label>
                                    </div>
                                </div>
                                <div class="item fore4" id="autoentry">
                                    <div class="item-ifo">
                                        <input type="checkbox" class="checkbox" name="chkRememberMe" clstag="passport|keycount|login|04">
                                        <label class="mar">自动登录</label>
                                        <label><a href="http://safe.jd.com/findPwd/index.action" class="" clstag="passport|keycount|login|05">忘记密码?</a></label>
                                        <div class="clr"></div>
                                    </div>                                   
                                </div>
                                <div class="item login-btn2013">
                                    <input type="button" class="btn-img btn-entry" id="loginsubmit" value="登录" tabindex="8" clstag="passport|keycount|login|06">
                                </div>
                            </div>
                                <div class="coagent" clstag="passport|keycount|login|07">
                                    <label class="ftx24">
                                        使用合作网站账号登录：
                                    <span class="clr"></span><input type="hidden" name="vkzdDttZIy" value="tsqCl">
                                    <span class="btns qq"><s></s> <a href="javascript:void(0)" onclick="window.location='http://qq.jd.com/new/qq/login.aspx'+window.location.search;return false;">QQ</a></span>
                                    <span class="btns net163"><s></s><a href="javascript:void(0)" onclick="window.location='http://qq.jd.com/new/netease/login.aspx'+window.location.search;return false;">网易</a></span>
                                    <span class="btns renren"><s></s><a href="javascript:void(0)" onclick="window.location='http://qq.jd.com/new/renren/login.action'+window.location.search;return false;">人人</a></span>
                                    <span class="btns qihu"><s></s><a onclick="window.location='http://qq.jd.com/new/qihao/login.action'+window.location.search;return false;" href="javascript:void(0);">奇虎360</a></span>

                                    <span class="btns kaixing001"><s></s><a href="javascript:void(0);" onclick="window.location='http://qq.jd.com/new/kaixin001/login.action'+window.location.search;return false;">开心</a></span>
                                    <span class="btns douban"><s></s><a onclick="window.location='http://qq.jd.com/new/douban/login.action'+window.location.search;return false;" href="javascript:void(0);">豆瓣</a></span>
                                    <span class="btns souhu"><s></s><a onclick="window.location='http://qq.jd.com/new/sohu/login.action'+window.location.search;return false;" href="javascript:void(0);">搜狐</a></span>
                                        
                                    </label>
                                </div>
                        </div>
                        <div class="free-regist">
                            <span><a href="#" clstag="passport|keycount|login|08">免费注册&gt;&gt;</a></span>
                        </div>
                    </div>
                </form>
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
    </div>
    </form>
</body>
</html>
