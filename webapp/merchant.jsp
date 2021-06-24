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
            <a class="navbar-brand" href="javascript:;">Merchant</a>
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
                        <li><a onclick="swalHint('都说了开发中...','/web/image/cry.jpg')" href="javascript:;">开发中.....</a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>


<!--商品表格-->
<div class="container">
    <ol class="breadcrumb">
        <li><a href="index.jsp">Home</a></li>
        <li><a href="javascript:;" class="active">Merchant</a></li>
    </ol>
    <div class="row">
        <div class="panel panel-default col-sm-12 " style="height: 500px; overflow: auto">
            <div class="panel-body">
                <table class="table table-bordered table-striped table-hover table-condensed text-center ">
                    <tr class="success row" id="table-body">
                        <td class="col-sm-1 ">图片</td>
                        <td class="col-sm-1 ">名称</td>
                        <td class="col-sm-1">类型</td>
                        <td class="col-sm-1">价格</td>
                        <td class="col-sm-1">折扣</td>
                        <td class="col-sm-5">简介</td>
                        <td class="col-sm-2">操作</td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-1 col-sm-offset-8" style="display: flex;text-align: center ;flex-direction: column;justify-content: center; height:34px;
             padding: 0px">
           <strong id="product-count">共***条记录</strong>
        </div>
        <div class="col-sm-3 ">
            <button class="btn btn-success  btn-block" id="btn-add-info">添加</button>
        </div>
    </div>
</div>


<!--修改模态框-->
<div class="modal fade" tabindex="-1" role="dialog" id="modal-edit">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h5 class="modal-title">edit product</h5>
            </div>
            <div class="modal-body">
                <span style="display: none" id="edit-id"></span>
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="edit-name" class="col-sm-3 control-label">name</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="edit-name" maxlength="10" placeholder="name">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit-type" class="col-sm-3 control-label">type</label>
                        <div class="col-sm-6">
                            <select class="form-control" id="edit-type">
                                <option></option>
                                <option>手机</option>
                                <option>电脑</option>
                                <option>耳机</option>
                                <option>平板</option>
                                <option>显示器</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit-price" class="col-sm-3 control-label">price</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="edit-price" required="" placeholder="price">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit-discount" class="col-sm-3 control-label">discount</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="edit-discount" required=""
                                   placeholder="discount">
                        </div>
                    </div>


                    <div class="form-group">
                        <label for="edit-brief" class="col-sm-2 col-sm-offset-1 control-label">简介</label>
                        <div class="col-sm-6">
                            <textarea class="form-control" id="edit-brief" name="brief"
                                      rows="4" style="resize: none; min-width: 90%" maxlength="124"></textarea>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-default" id="submit-save-edit" data-dismiss="modal">保存</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<!--添加模态框-->
<div class="modal fade" tabindex="-1" role="dialog" id="modal-add">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h5 class="modal-title">add product</h5>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="add-name" class="col-sm-3 control-label">name</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="add-name" maxlength="10" placeholder="name">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add-type" class="col-sm-3 control-label">type</label>
                        <div class="col-sm-6">
                            <select class="form-control" id="add-type">
                                <option></option>
                                <option>手机</option>
                                <option>电脑</option>
                                <option>耳机</option>
                                <option>平板</option>
                                <option>显示器</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add-price" class="col-sm-3 control-label">price</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="add-price" required="" placeholder="price">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add-discount" class="col-sm-3 control-label">discount</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="add-discount"
                                   placeholder="discount">
                        </div>
                    </div>


                    <div class="form-group">
                        <label for="add-brief" class="col-sm-2 col-sm-offset-1 control-label">简介</label>
                        <div class="col-sm-6">
                            <textarea class="form-control" id="add-brief" name="brief" maxlength="124"
                                      rows="4" style="resize: none; min-width: 90%"></textarea>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-default" data-dismiss="modal" id="submit-save-add">保存</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<!--更换商品图片-->
<div class="modal fade " tabindex="-1" role="dialog" id="modal-change-product-image">
    <div class="modal-dialog" style="width:800px;" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">请选择更换的图片</h4>
            </div>
            <div class="modal-body">
                <img id="img-changed-product" src="" style="width: 200px" alt=""><br>
                <form action="">
                    <label for="file"><a class="btn btn-default">选择图片</a></label>
                    <input type="file" id="file" onchange="productimageshow(this)" data-typeid="file-profile-image"
                           style=" display: none"/>
                    <a href="javascript:;" class="btn btn-default" data-dismiss="modal"
                       id="submit-product-image">submit</a>
                </form>

            </div>
        </div>
    </div>
</div>

<input type="hidden" id="hidden-changed-productid">
</body>
</html>

<script>
    var productcropper = null;

    function productimageshow(a) {
        if (productcropper != null) {
            productcropper.destroy();
        }
        var $file = $(a);
        var fileObj = $file[0];
        var windowURL = window.URL || window.webkitURL;
        var dataURL = null;
        if (!fileObj || !fileObj.files || !fileObj.files[0]) {//没有选择图片
            return;
        }
        dataURL = windowURL.createObjectURL(fileObj.files[0]);
        $("#img-changed-product").attr('src', dataURL);
        const image = document.getElementById("img-changed-product");
        var cropper = new Cropper(image, {
            aspectRatio: 2 / 3,//比例  *
            viewMode: 2,//视图模式   *
            modal: false,//周围阴影,  *
            guides: true,//裁剪虚线    *
            background: false,//网格背景  *
            movable: false,//是否允许移动图片
            zoomable: false,//放大
            minCropBoxWidth: 100,//裁剪框最小值*
        })
        productcropper = cropper;
    }

    $("#btn-add-info").click(function () {
        $("#modal-add").modal("show");
    })

    $("#btn-search").click(function () {
        let text = $("#text-search-fuzzy").val();
        getProducts("/web/product/searchbyinput", {
            "text": text,
        },);
        $("#text-search-fuzzy").val("");
    })

    $("#submit-save-add").click(function () {
        let brief=$("#add-brief").val();
        let discount=$.trim($("#add-discount").val()) ;
        let name= $("#add-name").val();
        let  price=$.trim($("#add-price").val()) ;
        let type=$("#add-type").val();

        name=name.replace(/\s*/g,"");
        brief=brief.replace("\n","").replace(/\s*/g,"");

        if(name.length==0){
            swalHint("商品名称不能为空哦","/web/image/stop.jpg")
            return;
        }
        if (type==""){
            swalHint("类型不能为空哦","/web/image/stop.jpg")
            return;
        }
        if (price==""||isNaN(price)){
            swalHint("价格格式有误","/web/image/stop.jpg")
            return;
        }
        if (price<0||price>2147483647){
            swalHint("价格不能太离谱哦","/web/image/stop.jpg")
            return;
        }
        if (discount==""||isNaN(discount)){
            swalHint("折扣信息格式有误","/web/image/stop.jpg")
            return;
        }
        if (discount<=0||discount>=10){
            swalHint("折扣价格不合理","/web/image/stop.jpg")
            return;
        }
        $.ajax({
            url: "/web/product/addproduct",
            dataType: "text",
            data: {
                "name": name,
                "price": price,
                "brief": brief,
                "discount": discount,
                "type": type,
            },
            success: function (data) {
                if (data = "true") {
                    swalPromptrefresh(3,"商品信息添加成功!","s后自动刷新","/web/image/success.jpg");
                } else {

                }
            },
        });
    })

    $("#submit-save-edit").click(function () {

        let brief=$("#edit-brief").val();
        let discount=$.trim($("#edit-discount").val()) ;
        let name= $("#edit-name").val();
        let  price=$.trim($("#edit-price").val()) ;
        let type=$("#edit-type").val();

        name=name.replace(/\s*/g,"");
        brief=brief.replace("\n","").replace(/\s*/g,"");

        if(name.length==0){
            swalHint("商品名称不能为空哦","/web/image/stop.jpg")
            return;
        }
        if (type==""){
            swalHint("类型不能为空哦","/web/image/stop.jpg")
            return;
        }
        if (price==""||isNaN(price)){
            swalHint("价格格式有误","/web/image/stop.jpg")
            return;
        }
        if (price<0||price>2147483647){
            swalHint("价格不能太离谱哦","/web/image/stop.jpg")
            return;
        }
        if (discount==""||isNaN(discount)){
            swalHint("折扣信息格式有误","/web/image/stop.jpg")
            return;
        }
        if (discount<=0||discount>=10){
            swalHint("折扣价格不合理","/web/image/stop.jpg")
            return;
        }
        $.ajax({
            url: "/web/product/editproduct",
            dataType: "text",
            data: {
                "id": $("#edit-id").val(),
                "type": type,
                "brief": brief,
                "discount": discount,
                "name": name,
                "price": price,
            },
            success: function (data) {
                if (data = "true") {
                    swal({
                        title: "",
                        text: "商品信息修改成功!",
                        imageUrl: "/web/image/success.jpg"
                    })
                    setTimeout(function () {
                        location.reload();
                    }, 1000)
                } else {

                }
            },

        })
    })

    $("#submit-product-image").click(function () {
        let id = $("#hidden-changed-productid").val();
        var img = new Image();
        img.src = productcropper.getCroppedCanvas().toDataURL();
        img.onload = function () {
            var that = this;
            console.log(that);
            var w = that.width,
                h = that.height,
                scale = w / h;
            w = 440 || w;
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
                url: "/web/product/changeproductimage",
                type: "post",
                dataType: "text",
                data: {
                    "imgBase64": base64,
                    "id": id
                },
                success: function (data) {
                    swalPromptrefresh(3,"修改成功!","s后自动刷新","/web/image/success.jpg");
                }
            })
        }
    })

    function editproductinfo(t) {
        $.ajax({
            url: "/web/product/getproduct",
            dataType: "json",
            data: {
                "id": t.parentNode.parentNode.id,
            },
            success: function (data) {
                $("#edit-price").val(data.price);
                $("#edit-name").val(data.name);
                $("#edit-brief").val(data.brief);
                $("#edit-discount").val(data.discount);
                $("#edit-type").val(data.type);
                $("#edit-id").val(data.id);
            }
        })

        $("#modal-edit").modal("show");
    }

    function editproductimage(t) {
        $("#modal-change-product-image").modal("show");
        $("#hidden-changed-productid").val(t.parentNode.parentNode.id);
    }

    function delproduct(t) {
        let count=Number($("#product-count").text())-1;
        $("#product-count").text(count);
        swal({
                title: "",
                text: "确定删除吗？",
                type: "info",
                showCancelButton: true,
                confirmButtonColor: "#adeaea",
                confirmButtonText: "确定删除",
                closeOnConfirm: false
            },
            function () {
                $.ajax({
                    url: "/web/product/deleteproduct",
                    dataType: "text",
                    data: {
                        id: t.parentNode.parentNode.id,
                    },
                    success: function (data) {
                        t.parentElement.parentElement.remove();
                        swal("", "", "success");
                    }
                })

            });
    }

    function searchbyselect(t) {
        getProducts("/web/product/searchbyselect",{
            "type": $(t).text(),
        })

    }

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

    function getProducts(url, data) {
        $.ajax({
            url: url,
            dataType: "json",
            data: data,
            success: function (data) {
                $("#table-body ~ tr").remove();
                let count=data.length;
                $("#product-count").text("共"+count+"条记录");
                $.each(data, function (index, value) {
                    let html = ``;
                    html += `
                    <tr class="row text-center" id="` + value.id + `">
                        <td class="col-sm-1 ">
                            <img src="` + value.imagepath + `" class="thumbnail " onclick="editproductimage(this)"
                                 style="height: 50px;margin: 0 auto">
                        </td>
                        <td class="col-sm-1">` + value.name + `</td>
                        <td class="col-sm-1">` + value.type + `</td>
                        <td class="col-sm-1">` + value.price + `</td>
                        <td class="col-sm-1">` + value.discount + `</td>
                        <td class="col-sm-5"> ` + value.brief + `</td>
                        <td class="col-sm-2">
                            <a href="javascript:;" class="btn btn-default " onclick="editproductinfo(this)" >修改</a>
                            <a href="javascript:;" class="btn btn-default " onclick="delproduct(this)">删除</a>
                        </td>
                    </tr>
                          `;
                    $("#table-body").after(html);
                })
            }
        })
    }

    $(function () {

        getProducts("/web/product/getbyusername");
        loadBackgroundImage();

    })
</script>