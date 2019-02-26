
<script src="static/frame/js/bootstrap.min.js?v=3.3.6"></script>
<script src="static/frame/js/validform.js?<{$clear_cache}>" ></script>
<script src="static/frame/js/newvalidform.js?<{$clear_cache}>" ></script>
<script src="static/frame/js/plugins/layer/layer.min.js?<{$clear_cache}>" ></script>
<script src="static/webuploader/webuploader.min.js?<{$clear_cache}>" ></script>
<script src="static/frame/js/webuploader.own.js?12312"></script>
<script src="static/frame/js/select2.min.js?<{$clear_cache}>" ></script>
<script src="static/frame/js/bootstrap-tokenfield.js?<{$clear_cache}>" ></script>
<script src="static/frame/js/plugins/datapicker/bootstrap-datetimepicker.min.js?<{$clear_cache}>" ></script>
<script src="static/frame/js/plugins/datapicker/bootstrap-datetimepicker.zh-CN.js?<{$clear_cache}>" ></script>

<script>
    $(function () {
        getPluginDate();

    });



    function getPluginDate(){
        $("input[data-plugin='datepicker']").each(function(){
            var dateList=[];
            var lan = $(this).data("language");
            var format = $(this).data("format");
            if(format==undefined){
                format = 'yyyy-mm-dd';
            }

            var minview = $(this).data("minview");
            if(minview == undefined){
                minview = "month";
            }

            var startview = $(this).data("startview");
            if(minview == undefined){
                startview = 2;
            }
            var setstartdate = $(this).data('setstartdate');
            if(setstartdate == undefined){
                setstartdate = null;
            }


            $(this).datetimepicker({
                format:format ,
                language:lan,
                pickDate: true,
                pickTime: false,
                minView:minview ,
                startView:startview,
                setStartDate: setstartdate,
                autoclose: true,
                clearBtn: true,
                //todayBtn: true,
                todayHighlight: true,
                keyboardNavigation: true,
            }).on("changeDate", function() {
                var dateClicked = $(this).val();
                if(dateList.indexOf(dateClicked)>-1){
                    dateList.splice(dateList.indexOf(dateClicked),1);
                }else{
                    dateList.push($(this).val());

                }
                $(this).siblings("#datelist").val(dateList);
            });
        })
    }



</script>
</body>
</html>