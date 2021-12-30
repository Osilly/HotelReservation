<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>添加活动信息</title>
    <link href="https://cdn.bootcss.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <h3 class="text-center">
                添加活动信息
            </h3>
            <br/>
            <label style="color: red">${hint}</label>
            <br/>
        </div>
    </div>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <form class="form-horizontal" role="form" action="/super/promotion/doAddPromotion" method="post" accept-charset="UTF-8">
                <div class="form-group">
                    <label class="col-sm-2 control-label">活动主题</label>
                    <div class="col-sm-10">
                        <input required type="text" class="form-control" name="title"/>
                    </div>
                </div>
                <div class="form-group">
                    <label  class="col-sm-2 control-label">活动内容</label>
                    <div class="col-sm-10">
                        <input required type="text" class="form-control" name="content" />
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <input type="submit" class="btn btn-default" value="确认添加"/>
                    </div>
                </div>
            </form>
            <a href="/super/toSuper">返回首页</a>
        </div>
    </div>
</div>
</body>
</html>