<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="shortcut icon" href="#"/>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="sweetalert/sweetalert.css">
    <script src="jquery/jquery.js"></script>
    <script src="sweetalert/sweetalert-dev.js"></script>
    <script src="bootstrap/js/bootstrap.js"></script>
    <script src="js/myjs.js"></script>
    <style>

        .sweet-alert {
            overflow: auto;
        }

        body.stop-scrolling {
            overflow: auto;
        }

        input[type="text"] {
            border-radius: 17px;
        }

        input[type="password"] {
            border-radius: 17px;
        }

        input[type="button"] {
            border-radius: 17px;
        }
    </style>
</head>
<body>
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
            <a class="navbar-brand" href="#">Register</a>
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
                <a class="btn btn-default" href="/web/index.jsp">搜索</a>
            </form>
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <a onclick="gotologin()" target="_blank" style="padding-bottom: 2px;margin-top: -3px">
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
                        <li><a onclick="gotologin()" id="change-skin">一键换肤</a></li>
                        <li><a onclick="gotologin()" id="change-background-image">更换背景图片</a></li>
                        <li><a onclick="gotologin()" id="change-profile-image">更换头像</a></li>
                        <li><a onclick="gotologin()" id="change-self-information">用户信息</a></li>
                        <li><a onclick="gotologin()">开发中......</a></li>
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
             background-image: url(image/register.jpg);
        background-size: 1536px ;
        height: 671px;
        background-repeat: no-repeat;
        margin-bottom: 0px;
              ">
            <div class="panel-body" style="margin-top: 100px;margin-bottom: 0px">
                <div class="col-sm-12">
                    <form class="form-horizontal">

                        <div class="form-group">
                            <div class="col-sm-2 col-sm-offset-2">

                                <a href="/web/login.jsp"><img src="image/register.gif" height="90px"
                                                              style="margin-bottom: -16px" alt="点我登录"></a>

                            </div>
                        </div>

                        <div class="form-group">
                            <label for="username" class="col-sm-1 control-label"></label>
                            <div class="col-sm-3">
                                <input type="text" class="form-control" id="username" required=""
                                       placeholder="Username">
                            </div>
                            <div class="col-sm-4"
                                 style="display: flex; flex-direction: column;justify-content: center; height:34px;
                                 padding :0px    ">
                                <span style="color: #f45d90;font-size: 13px;display: none"
                                      id="error-username">该用户名已经存在!</span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="email" class="col-sm-1 control-label"></label>
                            <div class="col-sm-3">
                                <input type="text" class="form-control" id="email" required="" placeholder="Email">
                            </div>
                            <div class="col-sm-4"
                                 style="display: flex; flex-direction: column;justify-content: center; height:34px;
                                  padding :0px">
                                <span style="color: #f45d90;font-size: 13px;display: none"
                                      id="error-email">邮箱已经存在!</span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="password" class="col-sm-1 control-label"></label>
                            <div class="col-sm-3">
                                <input type="password" class="form-control" id="password" required=""
                                       placeholder="Password">
                            </div>
                            <div class="col-sm-4"
                                 style="display: flex; flex-direction: column;justify-content: center; height:34px;
                                     padding :0px    ">
                                <span style="color: #f45d90;font-size: 13px;display: none" id="error-password">密码必须6-12位!</span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="repeat-password" class="col-sm-1 control-label"></label>
                            <div class="col-sm-3">
                                <input type="password" class="form-control" id="repeat-password" required=""
                                       placeholder="Repeat-Password">
                            </div>
                            <div class="col-sm-4"
                                 style="display: flex; flex-direction: column;justify-content: center; height:34px;
                                 padding: 0px;">
                                <span style="color: #f45d90;font-size: 13px;display: none;" id="error-repeat-password">两次密码不一致!</span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="security-code" class="col-sm-1 control-label"></label>
                            <div class="col-sm-3">
                                <input type="text" class="form-control" id="security-code" required=""
                                       placeholder="security-code">
                            </div>
                            <div class="col-sm-4"
                                 style="display: flex; flex-direction: column;justify-content: center; height:34px;
                                  padding: 0px">
                                <span style="color: #f45d90;font-size: 13px;display: none"
                                      id="error-code">注册码不能为空!</span>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-sm-offset-1 col-sm-3">
                                <input id="send-code" type="button" value="发送验证码" class="btn btn-default">
                                <span id="count" style="color: #f45d90;font-size: 13px;"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-1 col-sm-3">
                                <input type="button" class="btn btn-block btn-success" id="register" value="注册">
                            </div>
                        </div>


                    </form>
                </div>
            </div>
        </div>
    </div>


</div>


<input type="hidden" id="hidden-code">
<input type="hidden" id="hidden-username" value="0">
<input type="hidden" id="hidden-email" value="0">
<input type="hidden" id="hidden-password" value="0">
<input type="hidden" id="hidden-repeat-password" value="0">
<input type="hidden" id="hidden-form-code" value="0">
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

    function swalPromptrefresh(s, previousS, nextS, url) {
        setTimeout(function () {
            location.href = "/web/index.jsp"
        }, s * 1000 + 100);
        swal({
                title: "",
                imageUrl: url,
                text: previousS + s + nextS,
                imageSize: '200x150',
                confirmButtonColor: "#62c452",
                confirmButtonText: "确定",
            },
            function (isConfirm) {
                if (isConfirm) {
                    location.href = "/web/index.jsp"
                }
            });
        s--;
        setInterval(function () {
            swal({
                    title: "",
                    imageUrl: url,
                    text: previousS + s + nextS,
                    imageSize: '200x150',
                    confirmButtonColor: "#62c452",
                    confirmButtonText: "确定",
                },
                function (isConfirm) {
                    if (isConfirm) {
                        location.reload();
                    }
                });
            s--;
        }, 1000)
    }

    $(function () {
        $("#username").blur(function () {
            $.ajax({
                url: "/web/user/checkusernameisexist",
                dataType: "text",
                data: {"username": $("#username").val()},
                success: function (data) {
                    if (data == "true") {
                        $("#error-username").show();
                        $("#hidden-username").val("0");
                    } else {
                        $("#hidden-username").val("1");
                    }
                }
            })
        })
        $("#username").focus(function () {
            $("#error-username").hide();
        })
        $("#email").blur(function () {
            let e = $("#email").val();
            let bool = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/.test(e);
            if (!bool) {
                $("#error-email").html("邮箱格式错误!");
                $("#error-email").show();
                $("#hidden-email").val("0");
                return;
            }
            $.ajax({
                url: "/web/user/checkemailisexist",
                dataType: "text",
                data: {
                    "email": $("#email").val()
                },
                success: function (data) {
                    if (data == "true") {
                        $("#error-email").html("邮箱已经存在!");
                        $("#error-email").show();
                        $("#hidden-email").val("0");
                    } else {
                        $("#hidden-email").val("1");
                    }
                }
            })

        })
        $("#email").focus(function () {
            $("#error-email").hide();
        })
        $("#password").blur(function () {
            let p = $("#password").val() + "";
            if (p.length < 6 || p.length > 12) {
                $("#error-password").show();
                $("#hidden-password").val("0");
            } else {
                $("#hidden-password").val("1");
            }
            let rp = $("#repeat-password").val() + "";
            if (p != rp) {
                $("#error-repeat-password").show();
                $("#hidden-repeat-password").val("0");
            } else {
                $("#hidden-repeat-password").val("1");
                $("#error-repeat-password").hide();
            }
        })
        $("#password").focus(function () {
            $("#error-password").hide();
            if($("#error-password").val()=="1"&&$("#error-repeat-password").val()=="1"){
                $("#error-repeat-password").hide();
            }
        })
        $("#repeat-password").blur(function () {
            var p = $("#password").val() + "";
            var rp = $("#repeat-password").val() + "";
            if (p != rp) {
                $("#error-repeat-password").show();
                $("#hidden-repeat-password").val("0");
            } else {
                $("#hidden-repeat-password").val("1");
            }
        })
        $("#repeat-password").focus(function () {
            $("#error-repeat-password").hide();
        })
        $("#security-code").blur(function () {
            if ($("#security-code").val().length == 0) {
                $("#error-code").show();
                $("#hidden-form-code").val("0");
            } else {
                $("#hidden-form-code").val("1");
            }
        })
        $("#security-code").focus(function () {
            $("#error-code").hide();
        })

        $("#send-code").click(function () {
            let e = $("#email").val();
            let bool = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/.test(e);
            if (!bool) {
                swal({
                    title: "",
                    text: "邮箱格式错误!",
                    imageUrl: "/web/image/cry.jpg"
                });
                return;
            }

            $.ajax({
                url: "/web/user/sendemailcode",
                data: {
                    "email": $("#email").val(),
                },
                success: function (data) {
                    $("#hidden-code").val(data);
                }
            })
            let count = 100;
            $("#send-code").addClass("disabled");
            var stop = setInterval(function () {
                count--;
                if (count > 0) {
                    $("#count").text(count + "s后再次发送");
                } else {
                    $("#count").text("");
                    $("#send-code").removeClass("disabled");
                    clearInterval(stop);
                }
            }, 1000)
        })

        $("#register").click(function () {
            if ($("#hidden-username").val() == "0") {
                swal({
                    title: "",
                    text: "用户名信息有误!",
                    imageUrl: "/web/image/stop.jpg",
                    imageSize: '200x150',
                    confirmButtonText: "确认",
                });
                return;
            }
            if ($("#hidden-email").val() == "0") {
                swal({
                    title: "",
                    text: "邮箱信息有误!",
                    imageUrl: "/web/image/stop.jpg",
                    imageSize: '200x150',
                    confirmButtonText: "确认",
                });
                return;
            }
            if ($("#hidden-password").val() == "0") {
                swal({
                    title: "",
                    text: "密码信息有误!",
                    imageUrl: "/web/image/stop.jpg",
                    imageSize: '200x150',
                    confirmButtonText: "确认",
                });
                return;
            }
            if ($("#hidden-repeat-password").val() == "0") {
                swal({
                    title: "",
                    text: "两次密码信息不一致!",
                    imageUrl: "/web/image/stop.jpg",
                    imageSize: '200x150',
                    confirmButtonText: "确认",
                });
                return;
            }
            if ($("#hidden-form-code").val() == "0") {
                swal({
                    title: "",
                    text: "验证码不能为空",
                    imageUrl: "/web/image/stop.jpg",
                    imageSize: '200x150',
                    confirmButtonText: "确认",
                });
                return;
            }

            $.ajax({
                url: "/web/user/register",
                type: "Post",
                dataType: "text",
                data: {
                    "username": $("#username").val(),
                    "email": $("#email").val(),
                    "password": $("#password").val(),
                    "code": $("#security-code").val(),
                    "codeid": $("#hidden-code").val(),
                },
                success: function (data) {
                    if (data == "code-error") {
                        swal({
                            title: "",
                            text: "验证码错误",
                            imageUrl: "/web/image/cry.jpg",
                            imageSize: '200x150',
                            confirmButtonText: "确认",
                        });
                        return;
                    }
                    if (data == "false") {
                        swal({
                            title: "",
                            text: "注册失败",
                            imageUrl: "/web/image/cry.jpg",
                            imageSize: '200x150',
                            confirmButtonText: "确认",
                        });
                        return;
                    }
                    if (data == "true") {
                        swalPromptreSkip(3, "注册成功!", "s后为您转到登录页面", "/web/image/success.jpg","/web/index.jsp");
                        return;
                    }
                }
            })
        })


    })


</script>