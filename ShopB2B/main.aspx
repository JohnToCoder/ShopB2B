<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="main.aspx.cs" Inherits="ShopB2B.main" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>敦煌购物</title>
    <link href="css/main.css" rel="stylesheet" type="text/css" />    
    <script src="Scripts/jquery-1.4.1-vsdoc.js" type="text/javascript"></script>
    <script src="Scripts/pptBox.js" type="text/javascript"></script>
   <script type="text/javascript">

       var box = new LightBox("idBox");

       $("idBoxCancel").onclick = function () { box.Close(); }
       $("idBoxOpen").onclick = function () { box.Show(); }

       $("btnOverlay").onclick = function () {
           box.Close();
           if (box.Over) {
               box.Over = false;
               this.value = "打开覆盖层";
           } else {
               box.Over = true;
               this.value = "关闭覆盖层";
           }
       }

       $("btnOverColor").onclick = function () {
           box.Close();
           box.Over = true;
           if (box.OverLay.Color == "#fff") {
               box.OverLay.Color = "#000";
               this.value = "白色覆盖层";
           } else {
               box.OverLay.Color = "#fff"
               this.value = "黑色覆盖层";
           }
       }

       $("btnOverOpacity").onclick = function () {
           box.Close();
           box.Over = true;
           if (box.OverLay.Opacity == 0) {
               box.OverLay.Opacity = 50;
               this.value = "全透覆盖层";
           } else {
               box.OverLay.Opacity = 0;
               this.value = "半透覆盖层";
           }
       }

       $("btnFixed").onclick = function () {
           box.Close();
           if (box.Fixed) {
               box.Fixed = false;
               this.value = "定位效果";
           } else {
               box.Fixed = true;
               this.value = "取消定位";
           }
       }

       $("btnCenter").onclick = function () {
           box.Close();
           if (box.Center) {
               box.Center = false;
               box.Box.style.left = box.Box.style.top = "20%";
               box.Box.style.marginTop = box.Box.style.marginLeft = "0";
               this.value = "居中效果";
           } else {
               box.Center = true;
               this.value = "重新定位";
           }
       }
    </script>
    <script type="text/javascript">

        var isIE = (document.all) ? true : false;

        var isIE6 = isIE && ([/MSIE (\d)\.0/i.exec(navigator.userAgent)][0][1] == 6);

        var $ = function (id) {
            return "string" == typeof id ? document.getElementById(id) : id;
        };

        var Class = {
            create: function () {
                return function () { this.initialize.apply(this, arguments); }
            }
        }

        var Extend = function (destination, source) {
            for (var property in source) {
                destination[property] = source[property];
            }
        }

        var Bind = function (object, fun) {
            return function () {
                return fun.apply(object, arguments);
            }
        }

        var Each = function (list, fun) {
            for (var i = 0, len = list.length; i < len; i++) { fun(list[i], i); }
        };

        var Contains = function (a, b) {
            return a.contains ? a != b && a.contains(b) : !!(a.compareDocumentPosition(b) & 16);
        }


        var OverLay = Class.create();
        OverLay.prototype = {
            initialize: function (options) {

                this.SetOptions(options);

                this.Lay = $(this.options.Lay) || document.body.insertBefore(document.createElement("div"), document.body.childNodes[0]);

                this.Color = this.options.Color;
                this.Opacity = parseInt(this.options.Opacity);
                this.zIndex = parseInt(this.options.zIndex);

                with (this.Lay.style) { display = "none"; zIndex = this.zIndex; left = top = 0; position = "fixed"; width = height = "100%"; }

                if (isIE6) {
                    this.Lay.style.position = "absolute";
                    //ie6设置覆盖层大小程序
                    this._resize = Bind(this, function () {
                        this.Lay.style.width = Math.max(document.documentElement.scrollWidth, document.documentElement.clientWidth) + "px";
                        this.Lay.style.height = Math.max(document.documentElement.scrollHeight, document.documentElement.clientHeight) + "px";
                    });
                    //遮盖select
                    this.Lay.innerHTML = '<iframe style="position:absolute;top:0;left:0;width:100%;height:100%;filter:alpha(opacity=0);"></iframe>'
                }
            },
            //设置默认属性
            SetOptions: function (options) {
                this.options = {//默认值
                    Lay: null, //覆盖层对象
                    Color: "#fff", //背景色
                    Opacity: 50, //透明度(0-100)
                    zIndex: 1000//层叠顺序
                };
                Extend(this.options, options || {});
            },
            //显示
            Show: function () {
                //兼容ie6
                if (isIE6) { this._resize(); window.attachEvent("onresize", this._resize); }
                //设置样式
                with (this.Lay.style) {
                    //设置透明度
                    isIE ? filter = "alpha(opacity:" + this.Opacity + ")" : opacity = this.Opacity / 100;
                    backgroundColor = this.Color; display = "block";
                }
            },
            //关闭
            Close: function () {
                this.Lay.style.display = "none";
                if (isIE6) { window.detachEvent("onresize", this._resize); }
            }
        };
        var LightBox = Class.create();
        LightBox.prototype = {
            initialize: function (box, options) {

                this.Box = $(box); //显示层

                this.OverLay = new OverLay(options); //覆盖层

                this.SetOptions(options);

                this.Fixed = !!this.options.Fixed;
                this.Over = !!this.options.Over;
                this.Center = !!this.options.Center;
                this.onShow = this.options.onShow;

                this.Box.style.zIndex = this.OverLay.zIndex + 1;
                this.Box.style.display = "none";

                //兼容ie6用的属性
                if (isIE6) {
                    this._top = this._left = 0; this._select = [];
                    this._fixed = Bind(this, function () { this.Center ? this.SetCenter() : this.SetFixed(); });
                }
            },
            //设置默认属性
            SetOptions: function (options) {
                this.options = {//默认值
                    Over: true, //是否显示覆盖层
                    Fixed: false, //是否固定定位
                    Center: false, //是否居中
                    onShow: function () { } //显示时执行
                };
                Extend(this.options, options || {});
            },
            //兼容ie6的固定定位程序
            SetFixed: function () {
                this.Box.style.top = document.documentElement.scrollTop - this._top + this.Box.offsetTop + "px";
                this.Box.style.left = document.documentElement.scrollLeft - this._left + this.Box.offsetLeft + "px";

                this._top = document.documentElement.scrollTop; this._left = document.documentElement.scrollLeft;
            },
            //兼容ie6的居中定位程序
            SetCenter: function () {
                this.Box.style.marginTop = document.documentElement.scrollTop - this.Box.offsetHeight / 2 + "px";
                this.Box.style.marginLeft = document.documentElement.scrollLeft - this.Box.offsetWidth / 2 + "px";
            },
            //显示
            Show: function (options) {
                //固定定位
                this.Box.style.position = this.Fixed && !isIE6 ? "fixed" : "absolute";

                //覆盖层
                this.Over && this.OverLay.Show();

                this.Box.style.display = "block";

                //居中
                if (this.Center) {
                    this.Box.style.top = this.Box.style.left = "50%";
                    //设置margin
                    if (this.Fixed) {
                        this.Box.style.marginTop = -this.Box.offsetHeight / 2 + "px";
                        this.Box.style.marginLeft = -this.Box.offsetWidth / 2 + "px";
                    } else {
                        this.SetCenter();
                    }
                }

                //兼容ie6
                if (isIE6) {
                    if (!this.Over) {
                        //没有覆盖层ie6需要把不在Box上的select隐藏
                        this._select.length = 0;
                        Each(document.getElementsByTagName("select"), Bind(this, function (o) {
                            if (!Contains(this.Box, o)) { o.style.visibility = "hidden"; this._select.push(o); }
                        }))
                    }
                    //设置显示位置
                    this.Center ? this.SetCenter() : this.Fixed && this.SetFixed();
                    //设置定位
                    this.Fixed && window.attachEvent("onscroll", this._fixed);
                }

                this.onShow();
            },
            //关闭
            Close: function () {
                this.Box.style.display = "none";
                this.OverLay.Close();
                if (isIE6) {
                    window.detachEvent("onscroll", this._fixed);
                    Each(this._select, function (o) { o.style.visibility = "visible"; });
                }
            }
        };

    </script>        
    
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
                   <li ><span class="span">服装鞋帽</span><div class="div_a1-keleyi-com"><a href="#">基于微软.NET的编程平台</a></div></li>
                   <li ><span class="span">家电家居</span><div class="div_a1-keleyi-com"><a href="#">基于微软.NET的编程平台</a></div></li>
                   <li ><span class="span">数码通讯</span><div class="div_a1-keleyi-com"><a href="#">基于微软.NET的编程平台</a></div></li>
                   <li ><span class="span">美容护肤</span><div class="div_a1-keleyi-com"><a href="#">基于微软.NET的编程平台</a></div></li>
                   <li ><span class="span">敦煌特色</span><div class="div_a1-keleyi-com"><a href="#">基于微软.NET的编程平台</a></div></li>
                   <li ><span class="span">敦煌美食</span><div class="div_a1-keleyi-com"><a href="#">基于微软.NET的编程平台</a></div></li>
                   <li ><span class="span">汽车五金</span><div class="div_a1-keleyi-com"><a href="#">基于微软.NET的编程平台</a></div></li>
                   <li ><span class="span">户外运动</span><div class="div_a1-keleyi-com"><a href="#">基于微软.NET的编程平台</a></div></li>
                   <li ><span class="span">图书音像</span><div class="div_a1-keleyi-com"><a href="#">基于微软.NET的编程平台</a></div></li>
                   <li ><span class="span">便民服务</span><div class="div_a1-keleyi-com"><a href="#">基于微软.NET的编程平台</a></div></li>
                   <li ><span class="span">综合超市</span><div class="div_a1-keleyi-com"><a href="#">基于微软.NET的编程平台</a></div></li>
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
        <div style="width:950px; text-align:center; padding-left:10px ">
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

           <div id="branding"  style=" width:520px;height:450px; display:none; position:absolute; top:100px; z-index:110"> 
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
            <dl id="idBox" class="lightbox" style="z-index: 1001; display: none; position: fixed; left: 50%; top: 50%; margin-top: -69px; margin-left: -151px;">
              <dt id="idBoxHead"><b>LightBox</b> </dt>
              <dd>
                内容显示
                <br><br>
                <input name="" type="button" value=" 关闭 " id="idBoxCancel">
                <br><br>
              </dd>
            </dl>
    </div>
    </form>
</body>
</html>
