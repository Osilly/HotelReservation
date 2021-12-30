<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>评论</title>
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
                客房${room.roomNum}的评论信息
            </h3>
        </div>
    </div>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <#if commentPage.totalRecords gt 0 >
                <table class="table">
                    <thead>
                    <tr>
                        <th>
                            时间
                        </th>
                        <th>
                            评论用户
                        </th>
                        <th>
                            评论内容
                        </th>
                    </tr>
                    </thead>
                    <tbody>
                        <#setting date_format="yyyy-MM-dd HH:mm">
                        <#list commentPage.queryResultList as comment>
                        <tr>
                            <td>
                                ${comment.pubDate?date}
                            </td>
                            <td>
                                ${comment.user.username}
                            </td>
                            <td>
                                ${comment.content}
                            </td>
                        </tr>
                        </#list>
                    </tbody>
                </table>
            <#else>
                <div class="row clearfix">
                    <div class="col-md-12 column">
                        <h4 class="text-center">
                            该客房暂无评论消息，期待您的评论
                        </h4>
                    </div>
                </div>
            </#if>
        </div>
    </div>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <#if commentPage.currentPage gt 1>
                <a href='/user/comment/showByRoom?roomNum=${room.roomNum}&currentPage=1'>首页</a>
            <#else>
                <span>首页</span>
            </#if>
            <#if commentPage.currentPage gt 1>
                <a href='/user/comment/showByRoom?roomNum=${room.roomNum}&currentPage=${commentPage.currentPage-1}'>上一页</a>
            <#else>
                <span>上一页</span>
            </#if>
            <#if commentPage.currentPage lt commentPage.totalPages>
                <a href='/user/comment/showByRoom?roomNum=${room.roomNum}&currentPage=${commentPage.currentPage+1}'>下一页</a>
            <#else>
                <span>下一页</span>
            </#if>
            <#if commentPage.currentPage lt commentPage.totalPages>
                <a href='/user/comment/showByRoom?roomNum=${room.roomNum}&currentPage=${commentPage.totalPages}'>末页</a>
            <#else>
                <span>末页</span>
            </#if>
            <span>${commentPage.currentPage}/${commentPage.totalPages}页</span>
            <br/>
        </div>
        <br/>
        <a href="/user/room/detailed?roomNum=${room.roomNum}">返回上一页</a>
    </div>
</div>
</body>
</html>