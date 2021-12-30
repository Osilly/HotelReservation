<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>客房详细信息</title>
    <link href="https://cdn.bootcss.com/bootstrap/3.0.1/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <h3 class="text-center">
                这是客房编号<label style="color: red">${room.roomNum}</label>的详细信息
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
                        <a href="javascript:deleteOnePhoto(${roomPhoto.photoId})">删除</a>
                    </li>
                </#list>
            </ul>
            <br/>
            <a href="doShowRoomByCatalog">返回上一页</a>
            &nbsp;&nbsp;
            <a href="/super/room/toAddPhoto?roomNum=${room.roomNum}">添加附图</a>
            &nbsp;&nbsp;
            <a href="/super/room/comment/doShowCommentByRoom?roomNum=${room.roomNum}">查看该客房的评论</a>
        </div>
    </div>
</div>
<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
    function deleteOnePhoto(photoId) {
        if (confirm("确定删除该附图？")){
            $.getJSON('deleteOne?photoId='+photoId,function (data) {
                if(data){
                    $('#li'+photoId).remove();
                    alert('成功删除');
                }else{
                    alert('删除失败');
                }
            })
        }
    }
</script>
</body>
</html>