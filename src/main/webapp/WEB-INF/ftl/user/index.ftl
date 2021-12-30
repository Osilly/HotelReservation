<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>首页</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
    <style>
        .room-img {
            height: 200px;
            border-top-left-radius: 8px;
            border-top-right-radius: 8px;
        }
        .room-price {
            color: #ef727b;
        }
        .room-info-wrapper {
            width: 64px;
            height: 64px;
        }
        .room-info-icon {
            font-size: 2.5rem;
            color: #1e34d5;
            margin-left: 9px;
        }
        .room-card {
            border-radius: 8px;
        }
        .room-wrapper {
            background-color: #e3f1f5;
            height: 190px;
            border-radius: 16px;
            margin-top: 190px;
        }
        .more-icon {
            color: white;
            background-color: black;
            width: 48px;
            height: 48px;
            padding-top: 8px;
        }
        .more-icon:hover {
            box-shadow: 0 .5rem 1rem rgba(0,0,0,.15)!important;
        }
        .more-icon > i {
            font-size: 1.5rem;
            margin-left: 12px;
        }
    </style>
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

    <div id="carouselSlides" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-inner">
            <#list promotionList as promotion>
                <div class="carousel-item active">
                    <img src="/upload/room/primary/9.jpg" class="rounded d-block w-100" style="height: 400px;" alt="...">
                    <div class="carousel-caption d-none d-md-block">
                        <h1>${promotion.title}</h1>
                        <p>${promotion.content}</p>
                    </div>
                </div>
            </#list>
        </div>
    </div>

    <h1 class="text-center fw-bold mt-5">选择酒店</h1>

    <div class="room-wrapper position-relative mb-5">
        <div class="container position-absolute top-0 start-50 translate-middle px-4">
            <div class="row justify-content-around">
                <#list roomList as room>
                    <div class="col-4">
                        <div class="room-card card shadow">
                            <img class="room-img card-img-top" src="/upload/room/primary/${room.primaryPhoto}" alt="${room.intro}"/>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-8">
                                        <h3 class="card-title room-price fw-bold">￥${room.price}</h3>
                                        <p class="card-text fw-bold">预定 ID：${room.roomNum}</p>
                                    </div>
                                    <div class="col-4">
                                        <div class="room-info-wrapper rounded-circle border border-4 float-end">
                                            <i class="bi bi-info room-info-icon"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </#list>
            </div>
        </div>
        <a href="/user/room/showRoomByCatalog" class="rounded-circle more-icon position-absolute top-100 start-50 translate-middle shadow-sm">
            <i class="bi bi-chevron-down"></i>
        </a>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>