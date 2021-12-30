<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>发布评论</title>
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
                欢迎您对本次入住进行评价
            </h3>
        </div>
    </div>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <form role="form" action="/user/comment/publish" method="post">
                <div class="form-group">
                    <input type="hidden" name="roomNum" value="${roomNum}" />
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">评价内容</label>
                    <input type="text" name="content" class="form-control" required />
                </div>
                <button type="submit" class="btn btn-default">发表</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>