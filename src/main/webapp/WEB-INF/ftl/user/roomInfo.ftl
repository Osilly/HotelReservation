<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>客房信息</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
    <style>
        .room-img {
            width: 330px;
            height: 200px;
        }
        .nav-pills .nav-link {
            border-radius: 50rem;
        }
        .book-button {
            background-color: #fff4f3;
            color: #fd9084;
        }
        .nav-link {
            color: black;
        }
        .room-price {
            color: #fd7667;
        }
        .room-second-label {
            font-size: 14px;
            color: #b7b9b9;
        }
        .room-rank-label {
            font-size: 14px;
            color: #646868;
        }
        .room-rank-icon {
            color: #459d8b;
        }
    </style>
</head>
<body>
<div class="container">
    <nav class="navbar navbar-expand-lg navbar-light my-2">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Hotel</a>
            <ul class="navbar-nav d-flex">
                <li class="nav-item"><a class="nav-link" href="/toIndex">首页</a></li>
                <li class="nav-item"><a class="nav-link active" href="/user/room/showRoomByCatalog">客房信息</a></li>
                <#if user!=null>
                    <li class="nav-item"><a class="nav-link" href="/user/reservation/showByUser">我的订单</a></li>
                    <li class="nav-item"><a class="nav-link" href="/user/doLogout">注销</a></li>
                <#else>
                    <li class="nav-item"><a class="btn btn-outline-secondary me-2" href="/user/toRegister">注册</a></li>
                    <li class="nav-item"><a class="btn btn-outline-primary" href="/user/toLogin">登录</a></li>
                </#if>
            </ul>
        </div>
    </nav>

    <ul class="nav nav-pills nav-fill border border-1 rounded-pill my-2 shadow-1">
        <#if catalog!=null>
            <li class="nav-item">
                <a class="nav-link" href="/user/room/showRoomByCatalog">所有</a>
            </li>
        <#else>
            <li class="nav-item">
                <a class="nav-link active" href="/user/room/showRoomByCatalog">所有</a>
            </li>
        </#if>
        <#list catalogList as t>
            <#if t.catalog==catalog.catalog>
                <li class="nav-item">
                    <a class="nav-link active" href="/user/room/showRoomByCatalog?catalogId=${t.id}">${t.catalog}</a>
                </li>
            <#else>
                <li class="nav-item">
                    <a class="nav-link" href="/user/room/showRoomByCatalog?catalogId=${t.id}">${t.catalog}</a>
                </li>
            </#if>
        </#list>
    </ul>

    <div class="row row-cols-2">
        <#list roomPage.queryResultList as room>
            <div class="col">
                <div class="row my-4 mx-1">
                <div class="col">
                    <img class="room-img rounded" alt="${room.intro}" src="/upload/room/primary/${room.primaryPhoto}" />
                </div>
                <div class="col position-relative">
                    <div class="d-flex justify-content-between">
                        <div>
                            <div>
                                <i class="bi bi-star-fill me-1 room-rank-icon"></i>
                                <span class="room-rank-label">4.72</span></div>
                            <h4 class="mt-2">${room.intro}</h4>
                        </div>
                        <div>
                            <h4 class="room-price fw-bold">￥${room.price}</h4>
                            <div class="float-end room-second-label">每晚</div>
                        </div>
                    </div>

                    <div class="d-flex justify-content-between align-items-center position-absolute bottom-0 start-0 w-100">
                        <div class="ms-3">
                            <span class="room-second-label">双人床</span>
                            <span class="ms-3 room-second-label">${room.area}㎡</span>
                        </div>

                        <a href="/user/room/detailed?roomNum=${room.roomNum}" class="book-button btn me-2">${room.roomStatus.status}</a>
                    </div>
                </div>
            </div>
            </div>
        </#list>
    </div>

    <nav>
        <ul class="pagination justify-content-center">
            <#if catalog==null>
                <#if roomPage.currentPage gt 1>
                    <li class="page-item">
                        <a class="page-link" href='/super/room/doShowRoomByCatalog?currentPage=1'>首页</a>
                    </li>
                <#else>
                    <li class="page-item disabled">
                        <a class="page-link">首页</a>
                    </li>
                </#if>
                <#if roomPage.currentPage gt 1>
                    <li class="page-item">
                        <a class="page-link" href='/user/room/showRoomByCatalog?currentPage=${roomPage.currentPage-1}'>上一页</a>
                    </li>
                <#else>
                    <li class="page-item disabled">
                        <a class="page-link">上一页</a>
                    </li>
                </#if>
                <#if roomPage.currentPage lt roomPage.totalPages>
                    <li class="page-item">
                        <a class="page-link" href='/user/room/showRoomByCatalog?currentPage=${roomPage.currentPage+1}'>下一页</a>
                    </li>
                <#else>
                    <li class="page-item disabled">
                        <a class="page-link">下一页</a>
                    </li>
                </#if>
                <#if roomPage.currentPage lt roomPage.totalPages>
                    <li class="page-item">
                        <a class="page-link" href='/user/room/showRoomByCatalog?currentPage=${roomPage.totalPages}'>末页</a>
                    </li>
                <#else>
                    <li class="page-item disabled">
                        <a class="page-link">末页</a>
                    </li>
                </#if>
            <#else>
                <#if roomPage.currentPage gt 1>
                    <li class="page-item">
                        <a class="page-link" href='/super/room/doShowRoomByCatalog?currentPage=1&catalogId=${catalog.id}'>首页</a>
                    </li>
                <#else>
                    <li class="page-item disabled">
                        <a class="page-link">首页</a>
                    </li>
                </#if>
                <#if roomPage.currentPage gt 1>
                    <li class="page-item">
                        <a class="page-link" href='/user/room/showRoomByCatalog?catalogId=${catalog.id}&currentPage=${roomPage.currentPage-1}'>上一页</a>
                    </li>
                <#else>
                    <li class="page-item disabled">
                        <a class="page-link">上一页</a>
                    </li>
                </#if>
                <#if roomPage.currentPage lt roomPage.totalPages>
                    <li class="page-item">
                        <a class="page-link" href='/user/room/showRoomByCatalog?catalogId=${catalog.id}&currentPage=${roomPage.currentPage+1}'>下一页</a>
                    </li>
                <#else>
                    <li class="page-item disabled">
                        <a class="page-link">下一页</a>
                    </li>
                </#if>
                <#if roomPage.currentPage lt roomPage.totalPages>
                    <li class="page-item">
                        <a class="page-link" href='/user/room/showRoomByCatalog?catalogId=${catalog.id}&currentPage=${roomPage.totalPages}'>末页</a>
                    </li>
                <#else>
                    <li class="page-item disabled">
                        <a class="page-link">末页</a>
                    </li>
                </#if>
            </#if>
        </ul>
    </nav>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>