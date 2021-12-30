<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>客房详细信息</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <nav class="navbar navbar-expand-lg navbar-light my-2">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Hotel</a>
            <ul class="navbar-nav d-flex">
                <li class="nav-item"><a class="nav-link active" href="/toIndex">首页</a></li>
                <li class="nav-item"><a class="nav-link" href="/user/room/showRoomByCatalog">客房信息</a></li>
                <#if user!=null>
                    <li class="nav-item"><a class="nav-link" href="/user/toInformation">${user.realName}</a></li>
                    <li class="nav-item"><a class="nav-link" href="/user/doLogout">注销</a></li>
                <#else>
                    <li class="nav-item"><a class="btn btn-outline-secondary me-2" href="/user/toRegister">注册</a></li>
                    <li class="nav-item"><a class="btn btn-outline-primary" href="/user/toLogin">登录</a></li>
                </#if>
            </ul>
        </div>
    </nav>

    <div class="row clearfix">
        <div class="col-md-12 column">
            <h3 class="text-center">
                客房编号<label style="color: red">${room.roomNum}</label>的详细信息
            </h3>
        </div>
    </div>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <table class="table">
                <thead>
                <tr>
                    <th>
                        客房编号
                    </th>
                    <th>
                        面积
                    </th>
                    <th>
                        价格
                    </th>
                    <th>
                        简介
                    </th>
                    <th>
                        客房类型
                    </th>
                    <th>
                        客房状态
                    </th>
                </tr>
                </thead>
                <tbody>
                <tr class="success">
                    <td>
                        ${room.roomNum}
                    </td>
                    <td>
                        ${room.area}
                    </td>
                    <td>
                        ${room.price}
                    </td>
                    <td>
                        ${room.intro}
                    </td>
                    <td>
                        ${room.roomCatalog.catalog}
                    </td>
                    <td>
                        ${room.roomStatus.status}
                    </td>
                </tr>
                </tbody>
            </table>
            <br/>
            <button><a href="/user/comment/showByRoom?roomNum=${room.roomNum}">评论信息</a> </button>
            <#if room.roomStatus.status=="空闲">
                <button><a href="/user/reservation/order?roomNum=${room.roomNum}">预订</a> </button>
            <#else>
                <p style="color: red;">暂时无法预订</p>
            </#if>
            <ul>
                <li>
                    客房主图
                </li>
                <li>
                    <div class="col-md-12 column">
                        <img alt="140x140" src="/upload/room/primary/${room.primaryPhoto}" style="height: 140px"/>
                    </div>
                </li>
                <li>
                    客房附图
                </li>
                <#list roomPhotoList as roomPhoto>
                    <li id="li${roomPhoto.id}">
                        <div class="col-md-12 column">
                            <img alt="140x140" src="/upload/room/subjoin/${roomPhoto.photoPath}" style="height: 140px"/>
                        </div>
                    </li>
                    <br/>
                </#list>
            </ul>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>