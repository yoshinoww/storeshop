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
        tr > td {
            vertical-align: middle !important;
            text-align: center;
        }

        .panel {
            margin: 0px;
        }

        .sweet-alert {
            overflow: auto;
        }

        body.stop-scrolling {
            overflow: auto;
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
            <a class="navbar-brand" href="javascript:;">Administrator</a>
        </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li><img src="/web/image/shop.png" style="height: 50px;position: relative;top: 6px" alt=""></li>
            </ul>
            <form class="navbar-form navbar-left">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Exact-Search" id="text-search-Exact">
                </div>
                <a class="btn btn-default" href="javascript:;" id="btn-search">搜索</a>
            </form>
            <ul class="nav navbar-nav navbar-right">
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
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">

                        <c:choose>
                            <c:when test="${user==null}">
                                <img class="img-circle " src=/web/profileimage/nologin.jpg" id="user-profile"
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
                        <li><a onclick="swalHint('都说了开发中...','/web/image/cry.jpg')">开发中.....</a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container">
    <div class="row">
        <div>
            <ol class="breadcrumb">
                <li><a href="index.jsp">Home</a></li>
                <li><a href="javascript:;" class="active">administrator</a></li>
            </ol>


            <div class="panel panel-default">

                <div class="panel-body" style="height: 580px;" id="panel-body">

                    <ul class="nav nav-tabs" role="tablist">
                        <li role="presentation" class="active"><a href="#user" aria-controls="home" role="tab"
                                                                  data-toggle="tab">user</a></li>
                        <li role="presentation"><a href="#product" aria-controls="profile" role="tab" data-toggle="tab">product</a>
                        </li>
                        <li role="presentation"><a href="#merchant" aria-controls="messages" role="tab"
                                                   data-toggle="tab">merchant</a></li>
                    </ul>

                    <!-- Tab panes -->
                    <div class="tab-content" id="main-content">

                        <div role="tabpanel" class="tab-pane active" id="user">
                            <div class="panel panel-default">
                                <div class="panel-body" style="height: 451px">
                                    <table class="table table-bordered table-striped table-hover table-condensed text-center ">
                                        <tr class="success row" id="table-user-body">
                                            <td class="col-sm-2">用户名</td>
                                            <td class="col-sm-1">性别</td>
                                            <td class="col-sm-4">简介</td>
                                            <td class="col-sm-1">用户状态</td>
                                            <td class="col-sm-4">操作</td>
                                        </tr>
                                    </table>
                                </div>
                                <nav aria-label="...">
                                    <ul class="pager">
                                        <li><a href="javascript:;" id="user-previous">Previous</a></li>
                                        <li><a href="javascript:;" id="user-next">Next</a></li>
                                    </ul>
                                </nav>
                            </div>
                        </div>


                        <div role="tabpanel" class="tab-pane" id="product">
                            <div class="panel panel-default col-sm-12 ">
                                <div class="panel-body" style="height: 451px">
                                    <table class="table table-bordered table-striped table-hover table-condensed text-center ">
                                        <tr class="success row" id="table-product-body">
                                            <td class="col-sm-2 ">图片</td>
                                            <td class="col-sm-2 ">名称</td>
                                            <td class="col-sm-2">商家名称</td>
                                            <td class="col-sm-2">商品状态</td>
                                            <td class="col-sm-2">价格</td>
                                            <td class="col-sm-2">操作</td>
                                        </tr>
                                    </table>

                                </div>
                                <nav aria-label="...">
                                    <ul class="pager">
                                        <li><a href="javascript:;" id="product-previous">Previous</a></li>
                                        <li><a href="javascript:;" id="product-next">Next</a></li>
                                    </ul>
                                </nav>
                            </div>

                        </div>


                        <div role="tabpanel" class="tab-pane" id="merchant">
                            <div class="panel panel-default">
                                <div class="panel-body" style="height: 451px">
                                    <table class="table table-bordered table-striped table-hover table-condensed text-center ">
                                        <tr class="success row" id="table-merchant-body">
                                            <td class="col-sm-2">用户名</td>
                                            <td class="col-sm-1">性别</td>
                                            <td class="col-sm-4">简介</td>
                                            <td class="col-sm-1">用户状态</td>
                                            <td class="col-sm-4">操作</td>
                                        </tr>
                                    </table>
                                </div>
                                <nav aria-label="...">
                                    <ul class="pager">
                                        <li><a href="javascript:;" id="merchant-previous">Previous</a></li>
                                        <li><a href="javascript:;" id="merchant-next">Next</a></li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>


            </div>
            <!-- Nav tabs -->


        </div>
    </div>
</div>

</body>

<input type="hidden" id="hidden-user-current-page" value="1">

<input type="hidden" id="hidden-merchant-current-page" value="1">

<input type="hidden" id="hidden-product-current-page" value="1">

<input type="hidden" id="hidden-current-choose" value="user">
</html>
<script>

    $("#hidden-user-current-page").val(1);
    $("#hidden-product-current-page").val(1);
    $("#hidden-merchant-current-page").val(1);
    $("#hidden-current-choose").val("user");
    $("#user-next").click(function () {
        let count = Number($("#hidden-user-current-page").val()) + 1;
        $("#hidden-user-current-page").val(count);
        $.ajax({
            url: "/web/admin/getusersbypage",
            dataType: "json",
            data: {
                "currentuserpage": $("#hidden-user-current-page").val(),
            },
            success: function (data) {
                $("#table-user-body ~ tr").remove();
                $.each(data, function (index, value) {
                    let html = ``;
                    html += `<tr class="row text-center">
                                            <td class="col-sm-2">` + value.username + `</td>
                                            <td class="col-sm-1">` + value.gender + `</td>
                                            <td class="col-sm-4">` + value.signature + `</td>
                                            <td class="col-sm-1">` + (value.state == 0 ? '冻结' : '激活') + `</td>
                                            <td class="col-sm-4">
                                                <a class="btn btn-default" onclick="userfreeze(this)">冻结</a>
                                                <a class="btn btn-default" onclick="useractive(this)">激活</a>
                                                <a class="btn btn-default" onclick="userup(this)">升级</a>
                                            </td>
                    `;
                    $("#table-user-body").after(html);
                })
            },
            error: function (data) {
                swalHint("已经是最后一页了","/web/image/info.jpg");
                count--;
                $("#hidden-user-current-page").val(count);
            }
        })
    })
    $("#user-previous").click(function () {
        let count = Number($("#hidden-user-current-page").val()) - 1;
        if (count <= 0) {
            swalHint("已经是第一页了","/web/image/info.jpg");
            return;
        }
        $("#hidden-user-current-page").val(count);
        $.ajax({
            url: "/web/admin/getusersbypage",
            dataType: "json",
            data: {
                "currentuserpage": $("#hidden-user-current-page").val(),
            },
            success: function (data) {
                $("#table-user-body ~ tr").remove();
                $.each(data, function (index, value) {
                    let html = ``;
                    html += `<tr class="row text-center">
                                            <td class="col-sm-2">` + value.username + `</td>
                                            <td class="col-sm-1">` + value.gender + `</td>
                                            <td class="col-sm-4">` + value.signature + `</td>
                                            <td class="col-sm-1">` + (value.state == 0 ? '冻结' : '激活') + `</td>
                                            <td class="col-sm-4">
                                                <a class="btn btn-default" onclick="userfreeze(this)">冻结</a>
                                                <a class="btn btn-default" onclick="useractive(this)">激活</a>
                                                <a class="btn btn-default" onclick="userup(this)">升级</a>
                                            </td>
                    `;
                    $("#table-user-body").after(html);
                })
            },
        })
    })
    $("#merchant-next").click(function () {
        let count = Number($("#hidden-merchant-current-page").val()) + 1;
        $("#hidden-merchant-current-page").val(count);
        $.ajax({
            url: "/web/admin/getmerchantsbypage",
            dataType: "json",
            data: {
                "currentmerchantpage": $("#hidden-merchant-current-page").val(),
            },
            success: function (data) {
                $("#table-merchant-body ~ tr").remove();
                $.each(data, function (index, value) {
                    let html = ``;
                    html += `<tr class="row text-center">
                                            <td class="col-sm-2">` + value.username + `</td>
                                            <td class="col-sm-1">` + value.gender + `</td>
                                            <td class="col-sm-4">` + value.signature + `</td>
                                            <td class="col-sm-1">` + (value.state == 0 ? '冻结' : '激活') + `</td>
                                            <td class="col-sm-4">
                                                <a class="btn btn-default" onclick="merchantfreeze(this)">冻结</a>
                                                <a class="btn btn-default" onclick="merchantactive(this)">激活</a>
                                                <a class="btn btn-default" onclick="merchantdown(this)"降级</a>
                                            </td>
                    `;
                    $("#table-merchant-body").after(html);
                })
            },
            error: function (data) {
                swalHint("已经是最后一页了","/web/image/info.jpg");
                count--;
                $("#hidden-merchant-current-page").val(count);
            }
        })
    })
    $("#merchant-previous").click(function () {
        let count = Number($("#hidden-merchant-current-page").val()) - 1;
        if (count <= 0) {
            swalHint("已经是第一页了","/web/image/info.jpg");
            return;
        }
        $("#hidden-merchant-current-page").val(count);
        $.ajax({
            url: "/web/admin/getmerchantsbypage",
            dataType: "json",
            data: {
                "currentmerchantpage": $("#hidden-merchant-current-page").val(),
            },
            success: function (data) {
                $("#table-merchant-body ~ tr").remove();
                $.each(data, function (index, value) {
                    let html = ``;
                    html += `<tr class="row text-center">
                                            <td class="col-sm-2">` + value.username + `</td>
                                            <td class="col-sm-1">` + value.gender + `</td>
                                            <td class="col-sm-4">` + value.signature + `</td>
                                            <td class="col-sm-1">` + (value.state == 0 ? '冻结' : '激活') + `</td>
                                            <td class="col-sm-4">
                                                <a class="btn btn-default" onclick="merchantfreeze(this)">冻结</a>
                                                <a class="btn btn-default" onclick="merchantactive(this)">激活</a>
                                                <a class="btn btn-default" onclick="merchantdown(this)">降级</a>
                                            </td>
                    `;
                    $("#table-merchant-body").after(html);
                })
            },
        })
    })
    $("#product-next").click(function () {
        let count = Number($("#hidden-product-current-page").val()) + 1;
        $("#hidden-product-current-page").val(count);
        $.ajax({
            url: "/web/admin/getproductsbypage",
            dataType: "json",
            data: {
                "currentproductpage": $("#hidden-product-current-page").val(),
            },
            success: function (data) {
                $("#table-product-body ~ tr").remove();
                $.each(data, function (index, value) {
                    let html = ``;
                    html += ` <tr class="row text-center" id="` + value.id + `">
                                            <td class="col-sm-2 ">
                                                <img src="` + value.imagepath + `" class="thumbnail ""
                                                     style="height: 50px;margin: 0 auto">
                                            </td>
                                            <td class="col-sm-2">` + value.name + `</td>
                                            <td class="col-sm-2">` + value.username + `</td>
                                            <td class="col-sm-2">` + (value.state == 1 ? "上架中" : "下架中") + `</td>
                                            <td class="col-sm-2">` + value.price + `</td>
                                            <td class="col-sm-2">
                                                <a href="javascript:;" class="btn btn-default " onclick="productup(this)">上架</a>
                                                <a href="javascript:;" class="btn btn-default " onclick="productdown(this)">下架</a>
                                            </td>
                                        </tr>`;
                    $("#table-product-body").after(html);
                })
            },
            error: function (data) {
                swalHint("已经是最后一页了","/web/image/info.jpg");
                count--;
                $("#hidden-product-current-page").val(count);
            }
        })
    })
    $("#product-previous").click(function () {
        let count = Number($("#hidden-product-current-page").val()) - 1;
        if (count <= 0) {
            swalHint("已经是第一页了","/web/image/info.jpg");
            return;
        }
        $("#hidden-product-current-page").val(count);
        $.ajax({
            url: "/web/admin/getproductsbypage",
            dataType: "json",
            data: {
                "currentproductpage": $("#hidden-product-current-page").val(),
            },
            success: function (data) {
                $("#table-product-body ~ tr").remove();
                $.each(data, function (index, value) {
                    let html = ``;
                    html += ` <tr class="row text-center" id="` + value.id + `">
                                            <td class="col-sm-2 ">
                                                <img src="` + value.imagepath + `" class="thumbnail ""
                                                     style="height: 50px;margin: 0 auto">
                                            </td>
                                            <td class="col-sm-2">` + value.name + `</td>
                                            <td class="col-sm-2">` + value.username + `</td>
                                            <td class="col-sm-2">` + (value.state == 1 ? "上架中" : "下架中") + `</td>
                                            <td class="col-sm-2">` + value.price + `</td>

                                            <td class="col-sm-2">
                                                <a href="javascript:;" class="btn btn-default " onclick="productup(this)">上架</a>
                                                <a href="javascript:;" class="btn btn-default " onclick="productdown(this)">下架</a>
                                            </td>
                                        </tr>`;
                    $("#table-product-body").after(html);
                })
            },
        })

    })
    $("#btn-search").click(function () {
        let name = $("#text-search-Exact").val();
        let type = $("#hidden-current-choose").val();
        $("#text-search-Exact").val("");
        if (type == "user") {
            $.ajax({
                url: "/web/admin/getuserbyname",
                data: {
                    username: name,
                },
                dataType: "json",
                success: function (value) {
                    $("#table-user-body ~ tr").remove();
                    let html = ``;
                    html += `<tr class="row text-center">
                                            <td class="col-sm-2">` + value.username + `</td>
                                            <td class="col-sm-1">` + value.gender + `</td>
                                            <td class="col-sm-4">` + value.signature + `</td>
                                            <td class="col-sm-1">` + (value.state == 0 ? '冻结' : '激活') + `</td>
                                            <td class="col-sm-4">
                                                <a class="btn btn-default" onclick="userfreeze(this)">冻结</a>
                                                <a class="btn btn-default" onclick="useractive(this)">激活</a>
                                                <a class="btn btn-default" onclick="userup(this)">升级</a>
                                            </td>
                    `;
                    $("#table-user-body").after(html);
                },
                error: function (data) {
                    $("#table-user-body ~ tr").remove();
                }
            })

        } else if (type == "merchant") {
            $.ajax({
                url: "/web/admin/getmerchantbyname",
                data: {
                    username: name,
                },
                dataType: "json",
                success: function (value) {
                    $("#table-merchant-body ~ tr").remove();
                    let html = ``;
                    html += `<tr class="row text-center">
                                            <td class="col-sm-2">` + value.username + `</td>
                                            <td class="col-sm-1">` + value.gender + `</td>
                                            <td class="col-sm-4">` + value.signature + `</td>
                                            <td class="col-sm-1">` + (value.state == 0 ? '冻结' : '激活') + `</td>
                                            <td class="col-sm-4">
                                                <a class="btn btn-default" onclick="merchantfreeze(this)">冻结</a>
                                                <a class="btn btn-default" onclick="merchantactive(this)">激活</a>
                                                <a class="btn btn-default" onclick="merchantdown(this)">降级</a>
                                            </td>
                    `;
                    $("#table-merchant-body").after(html);
                },
                error: function (data) {
                    $("#table-merchant-body ~ tr").remove();
                }
            })
        } else {
            $("#main-content").css("overflow", "auto");
            $("#product-previous").hide();
            $("#product-next").hide();
            $.ajax({
                url: "/web/admin/getproductbyname",
                data: {
                    name: name,
                },
                dataType: "json",
                success: function (data) {
                    $("#table-product-body ~ tr").remove();
                    $.each(data, function (index, value) {
                        let html = ``;
                        html += ` <tr class="row text-center" id="` + value.id + `">
                                            <td class="col-sm-2 ">
                                                <img src="` + value.imagepath + `" class="thumbnail ""
                                                     style="height: 50px;margin: 0 auto">
                                            </td>
                                            <td class="col-sm-2">` + value.name + `</td>
                                            <td class="col-sm-2">` + value.username + `</td>
                                            <td class="col-sm-2">` + (value.state == 1 ? "上架中" : "下架中") + `</td>
                                            <td class="col-sm-2">` + value.price + `</td>

                                            <td class="col-sm-2">
                                                <a href="javascript:;" class="btn btn-default" onclick="productup(this)">上架</a>
                                                <a href="javascript:;" class="btn btn-default" onclick="productdown(this)">下架</a>
                                            </td>
                                        </tr>`;
                        $("#table-product-body").after(html);
                    })
                },
                error: function () {
                    $("#table-product-body ~ tr").remove();
                }
            })
        }

    })
    $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
        $("#hidden-current-choose").val(e.target.innerText);
        if (e.relatedTarget.innerText == "product") {
            $("#main-content").removeClass("overflow");
            $("#product-previous").show();
            $("#product-next").show();
            $("#table-product-body ~ tr").remove();
            getproductsbypage();
        } else if (e.relatedTarget.innerText == "user") {
            $("#table-user-body ~ tr").remove();
            getusersbypage();
        } else {
            $("#table-merchant-body ~ tr").remove();
            getmerchantsbypage();
        }
    })
    function getusersbypage() {
        $.ajax({
            url: "/web/admin/getusersbypage",
            dataType: "json",
            data: {
                "currentuserpage": $("#hidden-user-current-page").val(),
            },
            success: function (data) {
                $.each(data, function (index, value) {
                    let html = ``;
                    html += `<tr class="row text-center">
                                            <td class="col-sm-2">` + value.username + `</td>
                                            <td class="col-sm-1">` + value.gender + `</td>
                                            <td class="col-sm-4">` + value.signature + `</td>
                                            <td class="col-sm-1">` + (value.state == 0 ? '冻结' : '激活') + `</td>
                                            <td class="col-sm-4">
                                                <a class="btn btn-default" onclick="userfreeze(this)">冻结</a>
                                                <a class="btn btn-default" onclick="useractive(this)">激活</a>
                                                <a class="btn btn-default" onclick="userup(this)">升级</a>
                                            </td>
                    `;
                    $("#table-user-body").after(html);
                })
            }
        })
    }
    function getmerchantsbypage() {
        $.ajax({
            url: "/web/admin/getmerchantsbypage",
            dataType: "json",
            data: {
                "currentmerchantpage": $("#hidden-merchant-current-page").val(),
            },
            success: function (data) {
                $.each(data, function (index, value) {
                    let html = ``;
                    html += `<tr class="row text-center">
                                            <td class="col-sm-2">` + value.username + `</td>
                                            <td class="col-sm-1">` + value.gender + `</td>
                                            <td class="col-sm-4">` + value.signature + `</td>
                                            <td class="col-sm-1">` + (value.state == 0 ? '冻结' : '激活') + `</td>
                                            <td class="col-sm-4">
                                                <a class="btn btn-default" onclick="merchantfreeze(this)">冻结</a>
                                                <a class="btn btn-default" onclick="merchantactive(this)">激活</a>
                                                <a class="btn btn-default" onclick="merchantdown(this)">降级</a>
                                            </td>
                    `;
                    $("#table-merchant-body").after(html);
                })
            }
        })
    }
    function getproductsbypage() {
        $.ajax({
            url: "/web/admin/getproductsbypage",
            dataType: "json",
            data: {
                "currentproductpage": $("#hidden-product-current-page").val(),
            },
            success: function (data) {
                $.each(data, function (index, value) {
                    let html = ``;
                    html += ` <tr class="row text-center"  id="` + value.id + `">
                                            <td class="col-sm-2" >
                                                <img src="` + value.imagepath + `" class="thumbnail ""
                                                     style="height: 50px;margin: 0 auto">
                                            </td>
                                            <td class="col-sm-2">` + value.name + `</td>
                                            <td class="col-sm-2">` + value.username + `</td>
                                            <td class="col-sm-2">` + (value.state == 1 ? "上架中" : "下架中") + `</td>
                                            <td class="col-sm-2">` + value.price + `</td>

                                            <td class="col-sm-2">
                                                <a href="javascript:;" class="btn btn-default" onclick="productup(this)">上架</a>
                                                <a href="javascript:;" class="btn btn-default" onclick="productdown(this)">下架</a>
                                            </td>
                                        </tr>`;
                    $("#table-product-body").after(html);
                })
            }
        })
    }
    function userfreeze(t) {
        let u = t.parentNode.parentNode.children[0];
        let s = t.parentNode.parentNode.children[3];
        let username = u.innerText;
        s.innerText = "冻结",
            $.ajax({
                url: "/web/admin/freezeuserstate",
                dataType: "text",
                data: {
                    "username": username,
                    "state": "0",
                },
                success: function (data) {
                    swalHint("修改成功","/web/image/success.jpg");
                }
            })
    }
    function merchantfreeze(t) {
        let u = t.parentNode.parentNode.children[0];
        let s = t.parentNode.parentNode.children[3];
        let username = u.innerText;
        s.innerText = "冻结",
            $.ajax({
                url: "/web/admin/freezemerchantstate",
                dataType: "text",
                data: {
                    "username": username,
                    "state": "00",
                },
                success: function (data) {
                    swalHint("修改成功","/web/image/success.jpg");
                }
            })
    }
    function useractive(t) {
        let u = t.parentNode.parentNode.children[0];
        let s = t.parentNode.parentNode.children[3];
        let username = u.innerText;
        s.innerText = "激活",
            $.ajax({
                url: "/web/admin/activeuserstate",
                dataType: "text",
                data: {
                    "username": username,
                    "state": "1",
                },
                success: function (data) {
                    swalHint("修改成功","/web/image/success.jpg");
                }
            })
    }
    function merchantactive(t) {
        let u = t.parentNode.parentNode.children[0];
        let s = t.parentNode.parentNode.children[3];
        let username = u.innerText;
        s.innerText = "激活",
            $.ajax({
                url: "/web/admin/activemerchantstate",
                dataType: "text",
                data: {
                    "username": username,
                    "state": "2",
                },
                success: function (data) {
                    swalHint("修改成功","/web/image/success.jpg");
                }
            })
    }
    function productup(t) {
        let u = t.parentNode.parentNode;
        let s = t.parentNode.parentNode.children[3];
        let username = u.innerText;
        s.innerText = "上架中",
            $.ajax({
                url: "/web/admin/activeproductstate",
                dataType: "text",
                data: {
                    "id": u.id,
                    "state": "1",
                },
                success: function (data) {
                    swalHint("修改成功","/web/image/success.jpg");
                }
            })
    }
    function productdown(t) {
        let u = t.parentNode.parentNode;
        console.log(u);
        let s = t.parentNode.parentNode.children[3];
        let username = u.innerText;
        s.innerText = "下架中",
            $.ajax({
                url: "/web/admin/freezeproductstate",
                dataType: "text",
                data: {
                    "id": u.id,
                    "state": "0",
                },
                success: function (data) {
                    swalHint("修改成功","/web/image/success.jpg");
                }
            })
    }
    function userup(t) {
        let u = t.parentNode.parentNode.children[0];
        let username = u.innerText;
        $.ajax({
            url: "/web/admin/upuserstate",
            dataType: "text",
            data: {
                "username": username,
                "state": "2",
            },
            success: function (data) {
                swalPromptrefresh(3,"操作成功,","s后刷新页面","/web/image/success.jpg");
             /*   setTimeout(function () {
                    location.reload();
                }, 2000)
                swalHint("修改成功","/web/image/success.jpg");*/
            }
        })
    }
    function merchantdown(t) {
        let u = t.parentNode.parentNode.children[0];
        let username = u.innerText;
        $.ajax({
            url: "/web/admin/downmerchantstate",
            dataType: "text",
            data: {
                "username": username,
                "state": "1",
            },
            success: function (data) {
                swalPromptrefresh(3,"操作成功,","s后刷新页面","/web/image/success.jpg");
            }
        })
    }
    function loadBackgroundImage(){
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
    $(function () {
       loadBackgroundImage();

        getusersbypage();
        getmerchantsbypage();
        getproductsbypage();
    })


</script>