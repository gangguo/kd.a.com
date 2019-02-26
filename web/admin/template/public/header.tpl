<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0" />
    <title><{$title}></title>

    <link href="static/frame/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="static/frame/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="static/frame/css/animate.min.css?<{$clear_cache}>" rel="stylesheet">
    <link  href="static/frame/css/plugins/datapicker/bootstrap-datetimepicker.min.css?<{$clear_cache}>" rel="stylesheet">
    <link  href="static/frame/css/plugins/datapicker/datepicker3.css?<{$clear_cache}>" rel="stylesheet">
    <link href="static/frame/css/main.css<{$clear_cache}>>" rel="stylesheet">
    <link href="static/redactor/css/redactor.css?<{$clear_cache}>" rel="stylesheet" />
    <link href="static/frame/css/select2.css?<{$clear_cache}>" rel="stylesheet">



    <script src="static/frame/js/jquery.min.js?v=2.1.4"></script>
    <script src="static/redactor/js/redactor.js?<{$clear_cache}>" ></script>
    <script src="static/redactor/js/zh_cn.js?<{$clear_cache}>" ></script>

    <script src="static/webuploader/webuploader.js"></script>
    <script src="static/redactor/js/redactor.js"></script>
    <script src="static/redactor/plugins/webuploadImage.js"></script>
    <script src="static/redactor/plugins/webuploadVideo.js"></script>
    <script src="static/redactor/plugins/pasteImage.js"></script>
    <script src="static/redactor/js/zh_cn.js"></script>
    <script src="static/redactor/plugins/fullscreen.js"></script>
    <script src="static/redactor/plugins/fontcolor.min.js"></script>
    <script src="static/redactor/plugins/fonttotal.js"></script>

    <script type="text/javascript">
        $(function()
        {
            $('#redactor_content').redactor({
                //imageGetJson: '?ct=upload&ac=redactor&type=file_manager_json',
                imageWebUpload: '?ct=upload&ac=upload',
                imageUpload: '?ct=upload&ac=upload_html5',
                imageDir: 'image',
                thumbWidth: 0,
                thumbHeight: 0,
                // videoGetJson: '?ct=upload&ac=redactor&type=file_manager_json',
                videoUpload: '?ct=upload&ac=upload_chunked',
                videoDir: 'video',
                plugins: [ 'fullscreen', 'webuploadImage', 'webuploadVideo', 'pasteImage', 'fontcolor'],
                minHeight: '480px',
                maxHeight: '480px',
                lang: 'zh_cn',
                imgFileNumLimit: 3,
                videoFileNumLimit: 3,
            });
        });
    </script>

</head>

<body>