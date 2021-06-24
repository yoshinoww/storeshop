<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="shortcut icon" href="#"/>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="sweetalert/sweetalert.css">
    <script src="jquery/jquery.js"></script>
    <script src="bootstrap/js/bootstrap.js"></script>
    <script src="sweetalert/sweetalert-dev.js"></script>
    <script src="js/myjs.js"></script>

</head>
<style>
    .sweet-alert {
        overflow: auto;
    }

    body.stop-scrolling {
        overflow: auto;
    }
</style>
<body>

<!--导航头-->
<nav class="navbar navbar-default " style="background-color: #fcd68d;margin-bottom: 0px" id="main-navbar">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand">Login</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li><img src="image/shop.png" style="height: 50px;position: relative;top: 6px" alt=""></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false">全部分类<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="/web/index.jsp">手机</a></li>
                        <li><a href="/web/index.jsp">电脑</a></li>
                        <li><a href="/web/index.jsp">平板</a></li>
                        <li><a href="/web/index.jsp">耳机</a></li>
                        <li><a href="/web/index.jsp">显示器</a></li>
                    </ul>
                </li>
            </ul>
            <form class="navbar-form navbar-left">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Search">
                </div>
                <a href="/web/index.jsp" class="btn btn-default">搜索</a>
            </form>
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <a   onclick="gotologin()"  style="padding-bottom: 2px;margin-top: -3px">
                        <span class="glyphicon glyphicon-shopping-cart" style="font-size: 24px "></span>
                    </a>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <img class="img-circle " src="image/nologin.jpg" id="myprofile"
                             style="height: 40px;margin-top: -19px;margin-bottom: -17px" alt="">
                        <span class="caret"></span>
                    </a>

                    <ul class="dropdown-menu">
                        <li><a  id="change-skin" onclick="gotologin()">一键换肤</a></li>
                        <li><a  id="change-background-image" onclick="gotologin()">更换背景图片</a></li>
                        <li><a  id="change-profile-image" onclick="gotologin()">更换头像</a></li>
                        <li><a  id="change-self-information" onclick="gotologin()">用户信息</a></li>
                        <li><a  onclick="gotologin()">开发中......</a></li>
                    </ul>
                </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>

<div class="container-fluid">
    <div class="row">
        <div class="panel panel-default col-sm-12 "
             style="
             background-image: url(image/login.jpg);
        background-size: 1536px ;
        height: 671px;
        background-repeat: no-repeat;
        margin-bottom: 0px;
              ">
            <div class="panel-body" style="margin-top: 150px;margin-bottom: 0px">
                <div class="col-sm-6 ">
                    <form class="form-horizontal">

                        <div class="form-group">
                            <div class="col-sm-2 col-sm-offset-4">
                                <a href="/web/register.jsp"><img src="image/register.gif" height="90px"
                                                                 style="margin-bottom: -16px" alt="点我注册"></a>

                            </div>
                        </div>
                        <div class="form-group">
                            <label for="username" class="col-sm-1 col-sm-offset-1 control-label"></label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control " style="border-radius: 17px; " id="username"
                                       required="" placeholder="Username">
                            </div>
                        </div>


                        <div class="form-group">
                            <label for="password" class="col-sm-1  col-sm-offset-1 control-label"></label>
                            <div class="col-sm-6">
                                <input type="password" class="form-control" id="password" required=""
                                       style="border-radius: 17px; "
                                       placeholder="Password">
                            </div>
                        </div>


                        <div class="form-group">
                            <label for="security-code" class="col-sm-1 col-sm-offset-1 control-label"></label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="security-code" required=""
                                       style="border-radius: 17px; "
                                       placeholder="VerifyCode">
                            </div>
                        </div>


                        <div class="form-group">
                            <div class=" col-sm-12">
                                <div class="col-sm-2 col-sm-offset-2 ">
                                    <img id="img-code" src="" alt="" style="height: 33.6px;">
                                </div>
                                <div class="col-sm-5" style=" padding: 0px">
                                <span style="display: flex; flex-direction: column;justify-content: center;
                                height:34px;
                                color: #f45d90;font-size: 15px;">
                                    点击刷新(5分钟有效),点击gif注册.
                                </span>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-6">
                                <a class="btn btn-block btn-success" id="btn-login">登录</a>
                            </div>

                        </div>

                    </form>
                </div>
            </div>

        </div>

    </div>

</div>

<input type="hidden" id="uuid">
</body>
</html>

<script>

    function gotologin() {
        swal({
            title: "",
            text: "请先登录!",
            imageUrl: "/web/image/cry.jpg",
            imageSize: '200x150',
            confirmButtonText: "确认",
        });
    }

    $("#img-code").click(function () {
        $.ajax({
            url: "/web/user/verifycode",
            success: function (data) {
                let base64 = data.base64;
                let uuid = data.uuid;
                $("#img-code").attr('src', `data:image/jpeg|png|gif;base64,` + base64);
                $("#uuid").val(uuid);
            }
        })
    })

    $("#btn-login").click(function () {
        if($("#username").val().length==0||$("#password").val().length==0||$("#security-code").val().length==0){
            swal({
                title: "",
                text: "信息有空项",
                imageUrl: "/web/image/stop.jpg",
                imageSize: '200x150',
                confirmButtonText: "确认",
            });
            return;
        }
        $.ajax({
            url: "/web/user/login",
            type: "Post",
            dataType: "text",
            data: {
                username: $("#username").val(),
                password: $("#password").val(),
                code: $("#security-code").val(),
                uuid: $("#uuid").val(),
            },
            success: function (data) {
                if (data == "code-failed") {
                    swal({
                        title: "",
                        text: "验证码失效哦,请刷新验证码",
                        imageUrl: "/web/image/stop.jpg",
                        imageSize: '200x150',
                        confirmButtonText: "确认",
                    });
                }
                if (data == "error-code") {
                    swal({
                        title: "",
                        text: "验证码错误哦!",
                        imageUrl: "/web/image/stop.jpg",
                        imageSize: '200x150',
                        confirmButtonText: "确认",
                    });
                }
               if (data == "false") {
                    swal({
                        title: "",
                        text: "账号或密码错误哦!",
                        imageUrl: "/web/image/stop.jpg",
                        imageSize: '200x150',
                        confirmButtonText: "确认",
                    });
                }
                if (data == "error-freeze") {
                    swal({
                        title: "",
                        text: "账号已被冻结!",
                        imageUrl: "/web/image/stop.jpg",
                        imageSize: '200x150',
                        confirmButtonText: "确认",
                    });
                }
                if (data == "true") {
                    window.location.href = "/web/index.jsp";
                }

            }
        })
    })

    $(function () {
        $.ajax({
            url: "/web/user/verifycode",
            success: function (data) {
                let base64 = data.base64;
                let uuid = data.uuid;
                $("#img-code").attr('src', `data:image/jpeg|png|gif;base64,` + base64);
                $("#uuid").val(uuid);
            }
        })
    })


</script>