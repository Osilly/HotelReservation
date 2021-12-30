<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>预定订单</title>
    <link href="https://cdn.bootcss.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <h3 class="text-center">
                以下是按照${timeRule}排序的订单订单
            </h3>
        </div>
    </div>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <table class="table">
                <thead>
                <tr>
                    <th>
                        下单用户昵称
                    </th>
                    <th>
                        下单用户姓名
                    </th>
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
                <#list reservationPage.queryResultList as reservation>
                    <tr>
                        <td>
                            ${reservation.user.username}
                        </td>
                        <td>
                            ${reservation.user.realName}
                        </td>
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
                            ${reservation.roomInfo.roomNum}
                        </td>
                        <td id="td${reservation.id}">
                            <#assign status="${reservation.reservationStatus.status}">
                            <#if status=="预订成功">
                                ${status}&nbsp;&nbsp;<a href="javascript:doProcessed(${reservation.id})">办理入住</a>
                            <#elseif status=="已办理入住">
                                ${status}&nbsp;&nbsp;<a href="javascript:doCleared(${reservation.id})">办理退房</a>
                            <#else>
                                ${status}
                            </#if>
                        </td>
                    </tr>
                </#list>
                </tbody>
            </table>
        </div>
    </div>
    <div class="row clearfix">
        <div class="col-md-12 column">
        <#if reservationPage.currentPage gt 1>
            <a href='/admin/reservation/doShowAllReservation?currentPage=1&flag=${flag}'>首页</a>
        <#else>
            <span>首页</span>
        </#if>
        <#if reservationPage.currentPage gt 1>
            <a href='/admin/reservation/doShowAllReservation?currentPage=${reservationPage.currentPage-1}&flag=${flag}'>上一页</a>
        <#else>
            <span>上一页</span>
        </#if>
        <#if reservationPage.currentPage lt reservationPage.totalPages>
            <a href='/admin/reservation/doShowAllReservation?currentPage=${reservationPage.currentPage+1}&flag=${flag}'>下一页</a>
        <#else>
            <span>下一页</span>
        </#if>
        <#if reservationPage.currentPage lt reservationPage.totalPages>
            <a href='/admin/reservation/doShowAllReservation?currentPage=${reservationPage.totalPages}&flag=${flag}'>末页</a>
        <#else>
            <span>末页</span>
        </#if>
            <span>${reservationPage.currentPage}/${reservationPage.totalPages}页</span>
            <br/>
            <a href="/admin/toOperate">返回上一页</a>
        </div>
    </div>
</div>

<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
    function doProcessed(id) {
        if (confirm('确定给该客人办理入住？')){
            $.getJSON("dealProcessed?reservationId="+id,function (data) {
                if(data){
                    $('#td'+id).text('已办理入住');
                    alert('成功办理入住');
                }else{
                    alert('操作失败！！！');
                }
            })
        }
    }

    function doCleared(id) {
        if (confirm('确定该客人退房？')){
            $.getJSON("/admin/reservation/dealCleared?reservationId="+id,function (data) {
                if(data){
                    $('#td'+id).text('已退房');
                    alert('成功退房');
                }else{
                    alert('操作失败！！！');
                }
            })
        }
    }
</script>
</body>
</html>