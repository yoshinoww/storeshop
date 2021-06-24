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
            <a class="navbar-brand" href="#">Trolley</a>
        </div>

        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li><img src="/web/image/shop.png" style="height: 50px;position: relative;top: 6px" alt=""></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false">全部分类<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#" onclick="searchbyselect(this)">手机</a></li>
                        <li><a href="#" onclick="searchbyselect(this)">电脑</a></li>
                        <li><a href="#" onclick="searchbyselect(this)">平板</a></li>
                        <li><a href="#" onclick="searchbyselect(this)">耳机</a></li>
                        <li><a href="#" onclick="searchbyselect(this)">显示器</a></li>
                    </ul>
                </li>
            </ul>
            <form class="navbar-form navbar-left">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Search" id="text-search-fuzzy">
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
                                <img class="img-circle " src="/web/profileimage/nologin.jpg" id="user-profile"
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
                        <li><a onclick="swalHint( '功能实现ing...','/web/image/cry.jpg');" href="javascript:;">开发ing...</a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!--商品-->
<div class="container">

    <ol class="breadcrumb">
        <li><a href="index.jsp">Home</a></li>
        <li><a href="javascript:;" class="active">Shoppingtrolley</a></li>
    </ol>

    <div class="panel panel-default col-sm-12 " style="height: 500px; overflow: auto">
        <div class="panel-body">
            <table class="table table-bordered table-striped table-hover table-condensed text-center ">
                <tr class="success row" id="table-body">
                    <td class="col-sm-2">商品</td>
                    <td class="col-sm-2">商品名称</td>
                    <td class="col-sm-2">价格</td>
                    <td class="col-sm-3">数量</td>
                    <td class="col-sm-3">操作</td>
                </tr>
            </table>

        </div>
    </div>

    <div class="row">
        <div class="col-sm-1 col-sm-offset-8" style="display: flex;text-align: center ;flex-direction: column;justify-content: center; height:34px;
             padding: 0px">
            <strong id="trolley-count">共***条记录</strong>
        </div>
        <div class="col-sm-3 ">
            <button class="btn btn-success  btn-block" onclick="swalHint('功能实现中...','/web/image/cry.jpg')">全部购买</button>
        </div>
    </div>

</div>


</body>
</html>
<script>

    $("#submit-purchase-all").click(function () {
        swalHint("功能实现ing...", "/web/image/cry.jpg");
    })

    $("#btn-search").click(function () {
        let text = $("#text-search-fuzzy").val();
        getTrolleys("/web/trolley/getshoppingsfuzzy",{
            "text": text,
        })
        $("#text-search-fuzzy").val("");
    })

    //删除商品
    function del(t) {
        let pid = t.parentElement.parentElement.id;
        swal({
            title: "",
            text: "确定删除吗？",
            type: "info",
            showCancelButton: true,
            confirmButtonColor: "#adeaea",
            confirmButtonText: "确定删除",
            closeOnConfirm: false,
        }, function () {
            $("#" + pid).remove();
            $.ajax({
                url: "/web/trolley/deleteshoptrollry",
                dataType: "text",
                data: {
                    "id": pid,
                },
                success(data) {
                    swal("", "删除成功!", "success");
                }
            })
        });

    }

    //商品数量增加
    function plus(t) {
        let v = t.parentNode.children[1];
        var s = $(v).text();
        s++;
        $(v).text(s);
        var save = $(t.parentNode.parentNode.parentNode.children[4].children[2]);
        save.addClass("btn-success");
    }

    //商品数量减少
    function minus(t) {
        let v = t.parentNode.children[1];
        var s = $(v).text();
        if (s <= 1) {
            return;
        }
        s--;
        $(v).text(s);
        var save = $(t.parentNode.parentNode.parentNode.children[4].children[2]);
        save.addClass("btn-success");
    }

    //根据选择查询
    function searchbyselect(t) {
        getTrolleys("/web/trolley/getshoppingsbytype",{
            "type": $(t).text(),
        });
    }

    //小购买
    function buy(t) {
        swalHint("功能还在上线中...", "image/cry.jpg");
    }

    function save(t) {
        var save = $(t.parentNode.parentNode.children[4].children[2]);
        $.ajax({
            url: "/web/trolley/savetrolleycount",
            data: {
                "count": $(t.parentNode.parentNode.children[3].children[0].children[1]).text(),
                "id": (t.parentNode.parentNode).id,
            },
            dataType: "text",
            success: function (data) {
                if (data == "true") {
                    swalHint("保存成功", "/web/image/success.jpg");
                }
            }
        })

        save.removeClass()
        save.addClass("btn");
        save.addClass("btn-default");
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
    //ajax
    function getTrolleys(url,data){
        $.ajax({
            url: url,
            dataType: "json",
            data:data,
            success: function (data) {

                $("#table-body ~ tr").remove();
                let trolleys = (data.trolley);
                let count=trolleys.length;
                $("#trolley-count").text('共'+count+'条记录');
                $.each(data.products, function (index, value) {
                    let html = ``;
                    html += `<tr class="row" id="` + trolleys[index].id + `"   >
                    <td class="col-sm-1">
                        <img src="` + value.imagepath + `" class="thumbnail" style="height: 50px;margin: 0 auto">
                    </td>
                    <td class="col-sm-2">` + value.name + `</td>
                    <td class="col-sm-2">` + (value.price * value.discount / 10).toFixed(2) + `￥</td>
                    <td class="col-sm-2">
                        <div class="btn-group">
                            <button type="button" class="btn btn-default" onclick="minus(this)">-</button>
                            <button type="button" class="btn btn-default  disabled" >` + trolleys[index].count + `</button>
                            <button type="button" class="btn btn-default" onclick="plus(this)">+</button>
                        </div>
                    </td>
                    <td class="col-sm-3">
                        <a href="javascript:;" class="btn btn-default" onclick="del(this)">删除</a>
                        <a href="javascript:;" class="btn btn-default" onclick="buy(this)">购买</a>
                        <a href="javascript:;" class="btn btn-default" onclick="save(this)">保存</a>
                    </td>
                </tr>`
                    $("#table-body").after(html);
                });
            }
        })
    }

    //main
    $(function () {
        getTrolleys("/web/trolley/getallshoppings");
       loadBackgroundImage();
    })
</script>