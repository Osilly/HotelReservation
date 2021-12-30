<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>客房信息</title>
    <link href="https://cdn.bootcss.com/bootstrap/3.0.1/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <h3 class="text-center">
                以下是客房类型<label style="color: red">${catalog.catalog}</label>的客房信息
            </h3>
        </div>
    </div>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <table class="table">
                <thead>
                <tr>
                    <th>
                        客房主图
                    </th>
                    <th>
                        房间号
                    </th>
                    <th>
                        客房价格
                    </th>
                    <th>
                        客房状态
                    </th>
                    <th>
                        操作
                    </th>
                </tr>
                </thead>
                <tbody>
                <#list roomPage.queryResultList as roomInfo>
                <tr id='tr${roomInfo.id}'>
                    <td>
                        <div class="col-md-12 column">
                            <img alt="140x140" src="/upload/room/primary/${roomInfo.primaryPhoto}" style="height: 140px"/>
                        </div>
                    </td>
                    <td>
                        <a href="/super/room/detailedRoomInfo?roomNum=${roomInfo.roomNum}">${roomInfo.roomNum}</a>
                    </td>
                    <td>
                        ${roomInfo.price}
                    </td>
                    <td>
                        ${roomInfo.roomStatus.status}
                    </td>
                    <td>
                        <#assign status="${roomInfo.roomStatus.status}">
                        <#if status=="空闲">
                            <a href="">修改</a>
                            &nbsp;&nbsp;
                            <a href="javascript:deleteRoom('${roomInfo.roomNum}',${roomInfo.id})">删除</a>
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
            <#if roomPage.currentPage gt 1>
                <a href='/super/room/doShowRoomByCatalog?currentPage=1'>首页</a>
            <#else>
                <span>首页</span>
            </#if>
            <#if roomPage.currentPage gt 1>
                <a href='/super/room/doShowRoomByCatalog?currentPage=${roomPage.currentPage-1}'>上一页</a>
            <#else>
                <span>上一页</span>
            </#if>
            <#if roomPage.currentPage lt roomPage.totalPages>
                <a href='/super/room/doShowRoomByCatalog?currentPage=${roomPage.currentPage+1}'>下一页</a>
            <#else>
                <span>下一页</span>
            </#if>
            <#if roomPage.currentPage lt roomPage.totalPages>
                <a href='/super/room/doShowRoomByCatalog?currentPage=${roomPage.totalPages}'>末页</a>
            <#else>
                <span>末页</span>
            </#if>
                <span>${roomPage.currentPage}/${roomPage.totalPages}页</span>
                <br/>
                <a href="/super/toSuper">返回上一页</a>
                &nbsp;&nbsp;
                <a href="/super/room/toAddRoom">添加客房</a>
        </div>
    </div>
</div>

<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
    function deleteRoom(roomNum,id) {
        if (confirm("确定删除该房间？")){
            $.getJSON('deleteRoom?roomNum='+roomNum,function (json) {
                if(json.flag){
                    $('#tr'+id).remove();
                    alert(json.message);
                }else{
                    alert(json.message);
                }
            })
        }
    }
</script>
</body>
</html>