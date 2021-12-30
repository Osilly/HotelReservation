<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>管理员操作</title>
    <link href="https://cdn.bootcss.com/bootstrap/3.0.1/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <h3 class="text-center">
                员工编号：${admin.empNum}
            </h3>
            <br/>
            <label style="color: red">${hint}</label>
            <br/>
        </div>
    </div>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <ol>
                <li>
                    <a href="/admin/doLogout">退出登录</a>
                </li>
                &nbsp;
                <li>
                    <a href="/admin/toUpdatePassword">修改密码</a>
                </li>
                &nbsp;
                <li>
                    <a href="/admin/reservation/toShowUserReservation">处理预订订单</a>
                </li>
            </ol>
        </div>
        <a href="/super/toSuper">超级管理员操作</a>
    </div>
</div>
</body>
</html>