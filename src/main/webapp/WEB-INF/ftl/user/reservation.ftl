<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>历史订单</title>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
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
                欢迎<label style="color: red">${user.realName}</label>，以下是您的历史订单
            </h3>
            <br/>
            <#if reservationList?size==0>
                <p style="color: red">您暂时没有订单信息</p>
            </#if>
        </div>
    </div>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <table class="table">
                <thead>
                <tr>
                    <th>
                        下单时间
                    </th>
                    <th>
                        入住时间
                    </th>
                    <th>
                        预定天数
                    </th>
                    <th>
                        入住人
                    </th>
                    <th>
                        入住的房间号
                    </th>
                    <th>
                        订单状态
                    </th>
                </tr>
                </thead>
                <tbody>
                <#setting date_format="yyyy-MM-dd HH:mm">
                <#list reservationList as reservation>
                    <tr>
                        <td>
                            ${reservation.orderTime?date}
                        </td>
                        <td>
                            ${reservation.checkInTime?date}
                        </td>
                        <td>
                            ${reservation.days}
                        </td>
                        <td>
                            ${reservation.checkInName}
                        </td>
                        <td>
                            <a href="/user/room/detailed?roomNum=${reservation.roomInfo.roomNum}">${reservation.roomInfo.roomNum}</a>
                        </td>
                        <td>
                            <#assign status="${reservation.reservationStatus.status}">
                            <#if status=="预订成功">
                                ${status}&nbsp;&nbsp;<a href="/user/reservation/cancel?reservationId=${reservation.id}">撤销</a>
                            <#elseif status=="已退房">
                                ${status}&nbsp;&nbsp;<a href="/user/comment/toPublish?roomNum=${reservation.roomInfo.roomNum}">评论</a>
                            <#else>
                                ${status}
                            </#if>
                        </td>
                    </tr>
                </#list>
                </tbody>
            </table>
            <a href="/toIndex">返回首页</a>
        </div>
    </div>
</div>
</body>
</html>