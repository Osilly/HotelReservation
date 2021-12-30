<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>酒店活动信息</title>
    <link href="https://cdn.bootcss.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <h3 class="text-center">
                酒店活动信息
            </h3>
        </div>
    </div>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <table class="table">
                <thead>
                <tr>
                    <th>
                        标题
                    </th>
                    <th>
                        内容
                    </th>
                    <th>
                        发布时间
                    </th>
                    <th>
                        操作
                    </th>
                </tr>
                </thead>
                <tbody>
                <#setting date_format="yyyy年MM月dd日">
                <#list promotionList as promotion>
                    <tr id="tr${promotion.id}">
                        <td>
                            ${promotion.title}
                        </td>
                        <td>
                            ${promotion.content}
                        </td>
                        <td>
                            ${promotion.pubDate?date}
                        </td>
                        <td>
                            <a href="javascript:deletePromotion(${promotion.id})">删除</a>
                        </td>
                    </tr>
                </#list>
                </tbody>
            </table>
            <a href="/super/promotion/toAddPromotion">添加新活动</a>
            <a href="/super/toSuper">返回上一页</a>
        </div>
    </div>
</div>
<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
function deletePromotion(id) {
    if (confirm('确定删除该活动内容？')){
        $.getJSON("deletePromotion?promotionId="+id,function (data) {
            if(data){
                $('#tr'+id).remove();
                alert('成功删除');
            }else{
                alert('操作失败！！！');
            }
        })
    }
}
</script>
</body>
</html>