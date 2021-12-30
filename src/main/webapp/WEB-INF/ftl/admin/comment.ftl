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
            <h3 class="text-center">
                编号${room.roomNum}的评论信息
            </h3>
        </div>
    </div>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <table class="table">
                <thead>
                <tr>
                    <th>
                        时间
                    </th>
                    <th>
                        用户昵称
                    </th>
                    <th>
                        评论内容
                    </th>
                    <th>
                        操作
                    </th>
                </tr>
                </thead>
                <tbody>
                <#setting date_format="yyyy-MM-dd HH:mm">
                <#list commentPage.queryResultList as comment>
                    <tr id="tr${comment.id}">
                        <td>
                            ${comment.pubDate?date}
                        </td>
                        <td>
                            ${comment.user.username}
                        </td>
                        <td>
                            ${comment.comment}
                        </td>
                        <td>
                            <a href="javascript:deleteComment(${comment.id})">删除</a>
                        </td>
                    </tr>
                </#list>
                </tbody>
            </table>
        </div>
    </div>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <#if commentPage.currentPage gt 1>
                <a href='/super/room/comment/doShowCommentByRoom?roomNum=${room.roomNum}&currentPage=1'>首页</a>
            <#else>
                <span>首页</span>
            </#if>
            <#if commentPage.currentPage gt 1>
                <a href='/super/room/comment/doShowCommentByRoom?roomNum=${room.roomNum}&currentPage=${commentPage.currentPage-1}'>上一页</a>
            <#else>
                <span>上一页</span>
            </#if>
            <#if commentPage.currentPage lt commentPage.totalPages>
                <a href='/super/room/comment/doShowCommentByRoom?roomNum=${room.roomNum}&currentPage=${commentPage.currentPage+1}'>下一页</a>
            <#else>
                <span>下一页</span>
            </#if>
            <#if commentPage.currentPage lt commentPage.totalPages>
                <a href='/super/room/comment/doShowCommentByRoom?roomNum=${room.roomNum}&currentPage=${commentPage.totalPages}'>末页</a>
            <#else>
                <span>末页</span>
            </#if>
            <span>${commentPage.currentPage}/${commentPage.totalPages}页</span>
            <br/>
        </div>
        <br/>
        <a href="../detailedRoomInfo?roomNum=${room.roomNum}">返回上一页</a>
    </div>
</div>
<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
    function deleteComment(id) {
        if (confirm("确定删除该评论？")){
            $.getJSON('deleteComment?id='+id,function (json) {
                if(json){
                    $('#tr'+id).remove();
                    alert("删除成功");
                }
            })
        }
    }
</script>
</body>
</html>