<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title1</title>
    <link rel="shortcut icon" href="#"/>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="cropper/cropper.css">
    <link rel="stylesheet" href="sweetalert/sweetalert.css">
    <script src="jquery/jquery.js"></script>
    <script src="bootstrap/js/bootstrap.js"></script>
    <script src="cropper/cropper.js"></script>
    <script src="sweetalert/sweetalert-dev.js"></script>
    <script src="js/myjs.js"></script>
    <style>

        .carousel-control.left {
            background-image: none;
            background-repeat: repeat-x;
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#80000000', endColorstr='#00000000', GradientType=1);
        }

        .carousel-control.right {
            left: auto;
            right: 0;
            background-image: none;
            background-repeat: repeat-x;
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#00000000', endColorstr='#80000000', GradientType=1);
        }

        .sweet-alert {
            overflow: auto;
        }

        body.stop-scrolling {
            overflow: auto;
        }

        .breakAll {
            word-break: break-all;
        }
</style>
</head>
<body>

<!--导航头-->
<nav class="navbar navbar-default">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Home</a>
        </div>

        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li><img src="image/shop.png" style="height: 50px;position: relative;top: 6px" alt=""></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false">全部分类<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#" onclick="searchbyselect(this)">手机</a></li>
                        <li><a href="#" onclick="searchbyselect(this)">电脑</a></li>
                        <li><a href="#" onclick="searchbyselect(this)">平板</a></li>
                        <li><a href="#" onclick="searchbyselect(this)">耳机</a></li>
                        <li><a href="#" onclick="searchbyselect(this)">显示器</a></li>
                        <li><a href="#" onclick="searchbyselect(this)">全部商品</a></li>
                    </ul>
                </li>
            </ul>
            <form class="navbar-form navbar-left">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Search" id="text-search-fuzzy">
                </div>
                <a class="btn btn-default" id="btn-search">搜索</a>
            </form>
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <c:choose>
                        <c:when test="${user.state==2}">
                            <a href="/web/merchant.jsp">我的店铺</a>
                        </c:when>
                        <c:when test="${user.state==3}">
                            <a href="/web/admin.jsp">系统设置</a>
                        </c:when>
                    </c:choose>

                </li>
                <li>
                    <c:choose>
                        <c:when test="${user==null}">
                            <a href="/web/login.jsp">未登录</a>
                        </c:when>
                        <c:when test="${user!=null}">
                            <a>欢迎:${user.username}</a>
                        </c:when>
                    </c:choose>

                </li>
                <li>
                    <a id="skip-trolley" target="_blank" style="padding-bottom: 2px;margin-top: -3px">
                        <span class="glyphicon glyphicon-shopping-cart" style="font-size: 24px "></span>
                    </a>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">

                        <c:choose>
                            <c:when test="${user==null}">
                                <img class="img-circle " src="profileimage/nologin.jpg" id="user-profile"
                                     style="height: 40px;margin-top: -19px;margin-bottom: -17px">
                            </c:when>
                            <c:when test="${user!=null}">
                                <img class="img-circle " src=${user.profilepath}
                                        style="height:40px;margin-top:-19px;margin-bottom:-17px;" id="user-profile">
                            </c:when>
                        </c:choose>
                        <span class="caret"></span>
                    </a>

                    <ul class="dropdown-menu">
                        <li><a href="javascript:;" id="change-background-image">更换背景图片</a></li>
                        <li><a href="javascript:;" id="change-profile-image">更换头像</a></li>
                        <li><a href="javascript:;" id="change-self-information">用户信息</a></li>
                        <li><a href="javascript:;" id="exit">退出登录</a></li>
                        <li><a onclick="swalHint('功能开发中...','/web/image/cry.jpg')" href="javascript:;">开发中......</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!--轮播图-->
<div class="row" style="margin-right: 10px;">
    <div class="panel panel-default col-sm-8 col-sm-offset-2">
        <div class="panel-body">
            <div class="carousel slide" id="slidershow" data-ride="carousel" data-interval="3000">
                <!--计数器-->
                <ol class="carousel-indicators">
                    <li class="active" data-target="#slidershow" data-slide-to="0"></li>
                    <li data-target="#slidershow" data-slide-to="1"></li>
                    <li data-target="#slidershow" data-slide-to="2"></li>
                </ol>
                <!--图片容器-->
                <div class="carousel-inner">
                    <div class="item active">
                        <img src="image/shop1.jpg" style="height: 350px;width: 1500px"/>
                    </div>
                    <div class="item">
                        <img src="image/shop2.jpg" style="height: 350px;width: 1500px"/>
                        <!--添加对应标题和内容-->
                        <!--  <div class="carousel-caption">
                              <h4>图二</h4>
                          </div>-->
                    </div>
                    <div class="item">
                        <img src="image/shop3.jpg" style="height: 350px;width: 1500px"/>
                        <!--添加对应标题和内容-->
                        <!--   <div class="carousel-caption">
                               <h4>图三</h4>
                           </div>-->
                    </div>
                    <!--轮播导航-->
                    <a href="#slidershow" data-slide="prev" class="left carousel-control" role="button">
                        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    </a>
                    <a href="#slidershow" data-slide="next" class="right carousel-control" role="button">
                        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                    </a>
                </div>
            </div>

        </div>
    </div>
</div>

<!--商品-->
<div class="container">


    <div class="page-header">
        <h4>商品 <small>最新商品</small></h4>
    </div>

    <div class="row" id="products">

    </div>

</div>

<!--分页条-->
<nav>
    <ul class="pager">
        <li><a href="javascript:;" id="page-previous">Previous</a></li>
        <li><a href="javascript:;" id="page-next">Next</a></li>
        <li><a href="javascript:;" id="page-current">*/*</a></li>
        <li><a href="javascript:;"><input id="page-skipnumber" class="none-outline" type="text" style="border: none;width: 40px" ></a></li>
        <li><a href="javascript:;" id="page-skip">跳转</a></li>
    </ul>
</nav>

<!--背景modal-->
<div class="modal fade " tabindex="-1" role="dialog" id="modal-change-background">
    <div class="modal-dialog" style="width:800px;" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">请选择更换的图片</h4>
            </div>
            <div class="modal-body">
                <img id="img-changed-background" src="" style="width: 200px" alt=""><br>
                <form action="">
                    <label for="file-background"><a class="btn btn-default">选择图片</a></label>
                    <input type="file" id="file-background" onchange="backgroundshow(this)"
                           style="display: none"/>
                    <a href="javascript:;" class="btn btn-default" data-dismiss="modal"
                       id="submit-background">submit</a>
                </form>

            </div>
        </div>
    </div>
</div>

<!--头像modal-->
<div class="modal fade " tabindex="-1" role="dialog" id="modal-change-profile">
    <div class="modal-dialog" style="width:800px;" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">请选择更换的图片</h4>
            </div>
            <div class="modal-body">
                <img id="img-changed-profile" src="" style="width: 200px" alt=""><br>
                <form action="">
                    <label for="file-profile"><a class="btn btn-default">选择图片</a></label>
                    <input type="file" id="file-profile" onchange="profileshow(this)" style=" display: none"/>
                    <a class="btn btn-default " data-dismiss="modal" id="submit-profile">submit</a>
                </form>

            </div>
        </div>
    </div>
</div>

<!--修改个人信息-->
<div class="modal fade" tabindex="-1" role="dialog" id="modal-edit-information">
    <div class="modal-dialog" role="document">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h5 class="modal-title">个人信息</h5>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group ">
                        <label for="edit-username" class="col-sm-2 col-sm-offset-1 control-label">Username</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control " disabled="disabled" id="edit-username"
                                   value="username">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="edit-email" class="col-sm-2 col-sm-offset-1 control-label">Email</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" disabled="disabled" id="edit-email" value="email">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="edit-gender" class="col-sm-2 col-sm-offset-1 control-label">性别</label>
                        <div class="col-sm-6">
                            <select class="form-control" id="edit-gender" disabled="disabled">
                                <option></option>
                                <option value="女">女</option>
                                <option value="男">男</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="edit-signature" class="col-sm-2 col-sm-offset-1 control-label">个性签名</label>
                        <div class="col-sm-6">
                            <textarea class="form-control" id="edit-signature" name="signature"
                                      rows="4" style="resize: none; min-width: 90%" disabled="disabled"></textarea>
                        </div>
                    </div>
                </form>

            </div>
            <div class="modal-footer">
                <a class="btn btn-default" id="btn-edit-information">修改</a>
                <a class="btn btn-default" id="submit-save-information" data-dismiss="modal">保存</a>
            </div>

        </div>
    </div>
</div>

<!--加入购物车-->
<div class="modal fade" tabindex="-1" id="modal-add-trolley">
    <div class="modal-dialog " style="width: 300px ;position: relative;top: 200px">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">加入购物车</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="btn-group col-sm-offset-4">
                        <button type="button" class="btn btn-default" onclick="minus(this)">-</button>
                        <button type="button" class="btn btn-default  disabled" id="productcount">1</button>
                        <button type="button" class="btn btn-default" onclick="plus(this)">+</button>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <a class="btn btn-default" data-dismiss="modal" id="submit-trolley">OK</a>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!--商品详情-->
<div class="modal fade" tabindex="-1" role="dialog"   id="modal-merchant">
    <div class="modal-dialog" role="document" style="width: 700px">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h5 class="modal-title">商品详情</h5>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-sm-5 col-sm-offset-1">
                        <div class="panel panel-default">
                            <div class="panel-body" style="width: 240px">
                                <img src="" style="height: 330px;width: 220px;" class="thumbnail" id="detail-product-image">
                            </div>
                        </div>

                    </div>

                    <div class="col-sm-5" style="font-size: 14px;color: rgb(244, 93, 144); ">
                        <div class="panel panel-default">
                            <div class="panel-body" style="height: 381px">
                                <span style="display: none" id="detail-product-id"></span>
                                <span>商家:</span>
                                <img src="" id="detail-merchant-profile"
                                     style="height: 40px;margin-top: -6px;margin-bottom: 6px" class="img-circle">
                                <span id="detail-merchant-name"></span>
                                <p>商品类型:<span id="detail-product-type"></span></p>
                                <p>商品名称:<span id="detail-product-name"></span></p>
                                <p>商品价格:<span id="detail-product-price"></span></p>
                                <p>商品折扣:<span id="detail-product-discount"></span></p>
                                <p> 商品简介:</p>
                                <div class="row">
                                   <%-- <div>
                                        <textarea name="" id="" cols="30" rows="10"></textarea>
                                    </div>--%>
                                    <div class="panel panel-default col-sm-10 col-sm-offset-1" style="left: -3px;">
                                        <div class="panel-body breakAll" style="padding: 0;height: 150px" id="detail-product-brief">

                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" id="submit-modal-trolley">加入购物车
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

</body>
<input type="hidden" id="hidden-choosed-product">

<input type="hidden" id="hidden-current-page" value="1">

<input type="hidden" id="hidden-current-type" value=""  data-type="">

<input type="hidden" id="hidden-current-type-total" value="0">
</html>
<script>

    var backgroundcropper = null;
    //打开修改背景modal
    $("#change-background-image").click(function () {
        let name = "${user.username}";
        if (name.length == 0) {
            window.location.href = '/web/login.jsp';
            return;
        } else {
            $('#modal-change-background').modal('show');
        }

    })
    //打开修改头像modal
    $("#change-profile-image").click(function () {
        let name = "${user.username}";
        if (name.length == 0) {
            window.location.href = '/web/login.jsp';
            return;
        } else {
            $('#modal-change-profile').modal('show');
        }

    })
    //打开修改个人信息modal
    $("#change-self-information").click(function () {
        let name = "${user.username}";
        if (name.length == 0) {
            window.location.href = '/web/login.jsp';
            return;
        } else {
            $("#edit-username").val("${user.username}");
            $("#edit-email").val("${user.email}");
            $("#edit-gender").val("${user.gender}");
            $("#edit-signature").val("${user.signature}");
            $("#modal-edit-information").modal("show");
        }

    })
    //提交背景图片
    $("#submit-background").click(function () {
        var img = new Image();
        img.src = backgroundcropper.getCroppedCanvas().toDataURL();
        img.onload = function () {
            var that = this;
            console.log(that);
            var w = that.width,
                h = that.height,
                scale = w / h;
            w = 1536 || w;
            h = w / scale;
            var canvas = document.createElement('canvas');
            var ctx = canvas.getContext('2d');
            $(canvas).attr({
                width: w,
                height: h
            });
            ctx.drawImage(that, 0, 0, w, h);
            base64 = canvas.toDataURL('image/jpeg', 1);
            $.ajax({
                url: "http://localhost:8080/web/user/changebackground",
                type: "post",
                dataType: "text",
                data: {
                    "imgBase64": base64,
                },
                success: function (data) {
                    setTimeout(function () {
                        swalPromptrefresh(3,"修改成功!","s后自动为您刷新","/web/image/success.jpg");
                    },300)

                }
            })
        }
    })
    //提交购物车 (detail页面)
    $("#submit-modal-trolley").click(function () {
        let name = "${user.username}";
        if (name.length == 0) {
            window.location.href = '/web/login.jsp';
            return;
        } else {
            $.ajax({
                url: "/web/trolley/addinshoptrollry",
                dataType: "text",
                data: {
                    "productid": $("#detail-product-id").val(),
                    "count": "1",
                },
                success: function (data) {
                    setTimeout(function () {
                        swalHint("操作成功","/web/image/success.jpg");
                    }, 300)

                }
            })
        }

    })
    //提交头像
    $("#submit-profile").click(function () {
        var img = new Image();
        img.src = backgroundcropper.getCroppedCanvas().toDataURL();
        img.onload = function () {
            var that = this;
            console.log(that);
            var w = that.width,
                h = that.height,
                scale = w / h;
            w = 200 || w;
            h = w / scale;
            var canvas = document.createElement('canvas');
            var ctx = canvas.getContext('2d');
            $(canvas).attr({
                width: w,
                height: h
            });
            ctx.drawImage(that, 0, 0, w, h);
            base64 = canvas.toDataURL('image/jpeg', 1);
            $.ajax({
                url: "http://localhost:8080/web/user/changeuserprofile",
                type: "post",
                dataType: "text",
                data: {
                    "imgBase64": base64,
                },
                success: function (data) {
                    setTimeout(function () {
                        swalPromptrefresh(3,"修改成功!","s后自动为您刷新","/web/image/success.jpg");
                    },300)
                }
            })
        }
    })
    //提交修改后个人信息
    $("#submit-save-information").click(function () {
        let info=$("#edit-signature").val();
        info=info.replace("\n","").replace(/\s*/g,"");
        $("#edit-signature").val(info)
        $.ajax({
            url: "/web/user/edituserinfo",
            dataType: "text",
            data: {
                "gender": $("#edit-gender option:checked").val(),
                "signature": $("#edit-signature").val(),
            },
            success: function (data) {
                $("#edit-gender").attr("disabled","disabled");
                $("#edit-signature").attr("disabled","disabled");

                if (data == "true") {
                    setTimeout(function () {
                        swalPromptrefresh(3,"修改成功!","s后自动为您刷新","/web/image/success.jpg");
                    },300)
                } else {

                }
            }
        })
    })
    //提交购物车(主页面图标)
    $("#submit-trolley").click(function () {
        $.ajax({
            url: "/web/trolley/addinshoptrollry",
            dataType: "text",
            data: {
                "productid": $("#hidden-choosed-product").val(),
                "count": $("#productcount").text(),
            },
            success: function (data) {
                setTimeout(function () {
                    swalHint("操作成功","/web/image/success.jpg");
                }, 300)
            }
        })
        $("#productcount").text("1");
    })
    //修改个人信息把内容设置可修改
    $("#btn-edit-information").click(function () {
        $("#edit-gender").removeAttr("disabled");
        $("#edit-signature").removeAttr("disabled");
    })
    //搜索按钮 模糊搜索 根据 type  name  username
    $("#btn-search").click(function () {
        $("#hidden-current-type").val("fuzzy");
        $("#hidden-current-page").val(1);
        let text = $("#text-search-fuzzy").val();
        getProducts("/web/product/searchbyinputbypage",{
            "text": text,
            "currentpage": $("#hidden-current-page").val(),
        })
        $("#text-search-fuzzy").val("");
    })
    //nav 购物车跳转
    $("#skip-trolley").click(function () {
        let name = "${user.username}";
        if (name.length == 0) {
            window.location.href = '/web/login.jsp';
            return;
        } else {
            window.location.href = 'shoppingtrolley.jsp';
        }

    })
    //退出系统
    $("#exit").click(function () {
        $.ajax({
            url: "/web/user/exit",
            success: function () {
                swalPromptrefresh(3,"退出成功!","s后自动刷新","/web/image/success.jpg")
            }
        })
    })
    //页面+
    $("#page-next").click(function () {
     let count= Number($("#hidden-current-page").val())+1;
        $("#hidden-current-page").val(count);
        let choose=$("#hidden-current-type").val();
        if (choose==""){
            getProducts("/web/product/getallproductsbypage",{
                "currentpage":count,
            });
            return;
        }else if(choose=="select"){
            getProducts("/web/product/searchbyselectbypage",{
                "currentpage":count,
                "type":$("#hidden-current-type").data("type"),
            })
            return;
        }else if(choose=="fuzzy"){
            getProducts("/web/product/searchbyinputbypage",{
                "currentpage":count,
                "text":$("#text-search-fuzzy").val(),
            })
            return;
        }
    })
    //页面-
    $("#page-previous").click(function () {
        let count= Number($("#hidden-current-page").val())-1;
        if (count<1){
            swalHint("已经是第一页了","/web/image/info.jpg");
            return;
        }
        $("#hidden-current-page").val(count);
        let choose=$("#hidden-current-type").val();

        if (choose==""){
            getProducts("/web/product/getallproductsbypage",{
                "currentpage":count,
            });
            return;
        }else if(choose=="select"){
            getProducts("/web/product/searchbyselectbypage",{
                "currentpage":count,
                "type":$("#hidden-current-type").data("type"),
            })
            return;
        }else if(choose=="fuzzy"){
            getProducts("/web/product/searchbyinputbypage",{
                "currentpage":count,
                "text":$("#text-search-fuzzy").val(),
            })
            return;
        }
    })
    //页面跳转
    $("#page-skip").click(function () {
        let page=Number( $("#page-skipnumber").val());
        let total=Number($("#hidden-current-type-total").val()) ;
        console.log(page);
        console.log(total);
        if (!Math.round(page) === page||page<=0){
            swalHint("页数应该为正整数","/web/image/cry.jpg");
            return;
        }
        if (total<page){
            swalHint("页数超标了","/web/image/cry.jpg");
            return;;
        }
        $("#hidden-current-page").val(page);
        let choose=$("#hidden-current-type").val();
        let count=page;
        if (choose==""){
            getProducts("/web/product/getallproductsbypage",{
                "currentpage":count,
            });
            return;
        }else if(choose=="select"){
            getProducts("/web/product/searchbyselectbypage",{
                "currentpage":count,
                "type":$("#hidden-current-type").data("type"),
            })
            return;
        }else if(choose=="fuzzy"){
            getProducts("/web/product/searchbyinputbypage",{
                "currentpage":count,
                "text":$("#text-search-fuzzy").val(),
            })
            return;
        }
    })

    //打开商品详情页
    function openproductdetail(t) {
        console.log(t.parentNode.children[1].children[2].children[1].id)
        $.ajax({
            url: "/web/product/productdetail",
            dataType: "json",
            data: {
                "id": t.parentNode.children[1].children[2].children[1].id,
            },
            success: function (data) {
                let product = data.product;
                let user = data.user;
                $("#detail-product-id").val(product.id)
                $("#detail-product-type").text(product.type);
                $("#detail-merchant-name").text(product.username);
                $("#detail-product-name").text(product.name)
                $("#detail-product-price").text(product.price)
                $("#detail-product-discount").text(product.discount)
                $("#detail-product-brief").text(product.brief);
                $("#detail-product-image").attr("src", product.imagepath);
                $("#detail-merchant-profile").attr("src", user.profilepath);
            }
        })
        $("#modal-merchant").modal("show");
    }
    //展示背景图片
    function backgroundshow(a) {
        if (backgroundcropper != null) {
            backgroundcropper.destroy();
        }
        var $file = $(a);
        var fileObj = $file[0];
        var windowURL = window.URL || window.webkitURL;
        var dataURL = null;
        if (!fileObj || !fileObj.files || !fileObj.files[0]) {//没有选择图片
            return;
        }
        dataURL = windowURL.createObjectURL(fileObj.files[0]);
        $("#img-changed-background").attr('src', dataURL);
        const image = document.getElementById("img-changed-background");
        var cropper = new Cropper(image, {
            aspectRatio: 21 / 10,//比例  *
            viewMode: 2,//视图模式   *
            modal: false,//周围阴影,  *
            guides: true,//裁剪虚线    *
            background: false,//网格背景  *
            movable: false,//是否允许移动图片
            zoomable: false,//放大
            minCropBoxWidth: 100,//裁剪框最小值*
        })
        backgroundcropper = cropper;
    }
    //展示头像
    function profileshow(a) {

        if (backgroundcropper != null) {
            backgroundcropper.destroy();
        }
        var $file = $(a);
        var fileObj = $file[0];
        var windowURL = window.URL || window.webkitURL;
        var dataURL = null;
        if (!fileObj || !fileObj.files || !fileObj.files[0]) {//没有选择图片
            return;
        }
        dataURL = windowURL.createObjectURL(fileObj.files[0]);
        $("#img-changed-profile").attr('src', dataURL);
        const image = document.getElementById("img-changed-profile");
        var cropper = new Cropper(image, {
            aspectRatio: 1 / 1,//比例  *
            viewMode: 2,//视图模式   *
            modal: false,//周围阴影,  *
            guides: true,//裁剪虚线    *
            background: false,//网格背景  *
            movable: false,//是否允许移动图片
            zoomable: false,//放大
            minCropBoxWidth: 100,//裁剪框最小值*
        })
        backgroundcropper = cropper;
    }
    //购买 --主页面
    function buy() {
        swalHint("功能还在上线中","image/cry.jpg");
    }
    //nav  各种选择类型
    function searchbyselect(t) {
        $("#hidden-current-type").val("select");
        let name = t.innerHTML;
        if (name=="全部商品"){
            name="";
        }
        $("#hidden-current-type").data("type",name);
        $("#hidden-current-page").val(1);
        getProducts("/web/product/searchbyselectbypage", {
            "type": name,
                "currentpage": $("#hidden-current-page").val(),

        });
    }
    //添加购物车按钮
    function addInShopping(t) {
        let name = "${user.username}";
        if (name.length == 0) {
            window.location.href = '/web/login.jsp';
            return;
        } else {
            $("#hidden-choosed-product").val(t.id);
            $("#modal-add-trolley").modal("show");
        }

    }
    //购买商品+
    function plus(t) {
        let s = $("#productcount").text();
        s++;
        $("#productcount").text(s);
    }
    //购买商品-
    function minus(t) {
        let s = $("#productcount").text();
        if (s <= 1) {
            return;
        }
        s--;
        $("#productcount").text(s);
    }
    //加载背景图片
    function loadBackgroundImage() {
        let hasbackground = "${user.backgroundpath}";
        if (hasbackground.length != 0) {
            let s = `url('http://localhost:8080` + hasbackground + `')`;
            $("body").css({
                "background-image": s,
                "background-size": "1536px 730px",
                "background-repeat": "no-repeat",
                "background-attachment": "fixed",
            })
        }
    }
    //ajax
    function  getProducts(url,data){
        $.ajax({
            url: url,
            dataType: "json",
            data:data,
            success: function (data) {
                $("#products").empty();
                let count=data.count;
                $("#hidden-current-type-total").val(count);
                $("#page-current").text($("#hidden-current-page").val()+"/"+count)
                $.each(data.products, function (index, value) {
                    let html = "";
                    html += `
        <div class="col-sm-3">
            <div class="thumbnail" type="thumbnail">
                <img src='` + value.imagepath + `' style="height: 200px" class="img-thumbnail" onclick="openproductdetail(this)" >
                <div class="caption text-center">
                     <p>` + value.type + `:` + value.name + `</p>
                    <p>
                         限时售卖
                        <del>` + value.price + `</del>
                        <span style="color:#F40">` + (value.price * value.discount / 10).toFixed(2) + `￥</span>
                    </p>
                    <p>
                      <a href="javascript:;" class="btn btn-default btn-sm" onclick="buy()">购买</a>
                       <a href="javascript:;" class="btn btn-default btn-sm" id="` + value.id + `" onclick="addInShopping(this)">
                            <span   class="glyphicon glyphicon-shopping-cart"></span>
                       </a>
                    </p>
                </div>
            </div>
        </div>
  `;
                    $("#products").append(html);
                })
            },
            error:function (data) {
                swalHint("已经是最后一页了","/web/image/info.jpg");
                let count= Number($("#hidden-current-page").val())-1;
                $("#hidden-current-page").val(count);
                return;
            }
        })
    }
    //主函数
    $(function () {
        $("#hidden-current-page").val("1");
        $("#hidden-current-type").val("");
        $("#page-skipnumber").val("");
        getProducts("/web/product/getallproductsbypage",{
            "currentpage":$("#hidden-current-page").val()
        })
        loadBackgroundImage();

    })
</script>


<!--data-dismiss="modal" 关闭模态框-->