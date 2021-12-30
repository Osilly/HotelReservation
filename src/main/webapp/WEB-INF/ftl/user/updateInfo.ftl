<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>修改个人信息</title>
    <link href="https://cdn.bootcss.com/bootstrap/3.0.1/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <ul class="nav nav-pills">
                <li class="active">
                    <a href="/toIndex">首页</a>
                </li>
                <li>
                    <a href="/user/room/showRoomByCatalog">客房信息</a>
                </li>
                <li class="dropdown pull-right">
                    <p>
                    <#if user!=null>
                        <a href="/user/toInformation">${user.realName}</a>
                        &nbsp;&nbsp;
                        <a href="/user/reservation/showByUser">我的订单</a>
                        &nbsp;&nbsp;
                        <a href="/user/doLogout">注销</a>
                    <#else>
                        <a href="/user/toLogin">登录</a>
                        &nbsp;&nbsp;
                        <a href="/user/toRegister">注册</a>
                    </#if>
                    </p>
                </li>
            </ul>
        </div>
    </div>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <h3 class="text-center">
                修改个人信息
            </h3>
            <br/>
            <label style="color: red">${hint}</label>
            <br/>
        </div>
    </div>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <form class="form-horizontal" role="form" action="/user/updateInfo" method="post" id="registerForm" enctype="multipart/form-data" accept-charset="UTF-8">
                <div class="form-group">
                    <label class="col-sm-2 control-label">真实姓名</label>
                    <div class="col-sm-10">
                        <input required value="${user.realName}" type="text" class="form-control" name="realName" id="realName" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">性别</label>
                    <input type="radio" name="gender" id="gender" value="男" checked/>男&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="radio" name="gender" value="女">女
                </div>
                <div class="form-group">
                    <label  class="col-sm-2 control-label">邮箱</label>
                    <label id="isEmailValid"></label>
                    <div class="col-sm-10">
                        <input required value="${user.email}" type="email" class="form-control" name="email" id="email" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">上传头像</label>
                    <input type="file" name="photo" id="photo" />
                </div>

                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <input type="submit" class="btn btn-default" value="修改"/>
                    </div>
                </div>
            </form>
            <a href="/user/toInformation">返回个人主页</a>
        </div>
    </div>
</div>
</body>
</html>
