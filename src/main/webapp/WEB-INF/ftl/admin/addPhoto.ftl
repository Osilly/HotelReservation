<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>添加客房附图</title>
    <link href="https://cdn.bootcss.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <h3 class="text-center">
                给客房${roomNum}添加附图
            </h3>
            <br/>
            <label style="color: red">${hint}</label>
            <br/>
        </div>
    </div>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <form class="form-horizontal" role="form" action="addPhoto" method="post"
                  enctype="multipart/form-data" accept-charset="UTF-8">
                <div class="form-group">
                    <label class="col-sm-2 control-label">上传附图</label>
                    <input type="file" name="photo" id="photo" required/>
                    <input type="hidden" name="roomNum" value="${roomNum}">
                </div>

                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <input type="submit" class="btn btn-default" value="上传"/>
                    </div>
                </div>
            </form>
            <a href="/super/room/detailedRoomInfo">返回上一页</a>
        </div>
    </div>
</div>
</body>
</html>