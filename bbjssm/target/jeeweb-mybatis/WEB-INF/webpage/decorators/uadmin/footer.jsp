<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html:js  name="bootstrap,iCheck,metisMenu,slimscroll,layer,pace,bootstrap-hover-dropdown,jquery-cookie"/>
<!--loading bootstrap js-->
<script src="${staticPath}/uadmin/js/html5shiv.js"></script>
<script src="${staticPath}/uadmin/js/respond.min.js"></script>
<script src="${staticPath}/uadmin/js/jquery.menu.js"></script>
<!--CORE JAVASCRIPT-->
<script src="${staticPath}/uadmin/js/main.js"></script>
<script>

//微信账号切换
$(document).ready(function(){
    $('#mpListUl li').live('click',function(){
        var accountId=$(this).attr("data-id");
        $.post("${adminPath}/weixin/mp/account/"+accountId+"/change",function(data,status){
            if(data.ret==0){
                window.location.reload();
            }else{
                alert(data.msg);
            }
        });
    });
});
$(document).ready(function(){
	var list_theme = $('.dropdown-theme-setting > li > select#list_theme');
    list_theme.on('change', function(){
    	var theme=$(this).val();
    	$.get('${adminPath}/theme/'+theme+'?url='+window.top.location.href,function(result){   
    		window.top.location.href="${adminPath}";
    	});
    });
});

var changePasswordForm;
function changePassword(){
	changePasswordForm.ajaxPost();
}
$(document).ready(function() {
	    changePasswordForm=$("#changePasswordForm").Validform({
		tiptype:function(msg,o,cssctl){
			if(!o.obj.is("form")){
				var objtip=o.obj.siblings(".Validform_checktip");
				cssctl(objtip,o.type);
				objtip.text(msg);
			}
		},beforeSubmit:function(curform){
			try{
				var beforeFunc=beforeSubmit;
				if(beforeFunc&&typeof(beforeFunc)=="function"){
					return beforeFunc(curform); 
				}
			}catch(err){
				
			}
			return true;	
		},callback:function(result){
			if(result.ret==0)
             	{
             	    top.layer.alert(result.msg, {icon: 0, title:'提示'});
             	    //运行回调
         	        callFunc();
             	}else
             	{
             		top.layer.alert(result.msg, {icon: 0, title:'警告'});
             	}
		}
	});
});
</script>
<script>
    //BEGIN CHECKBOX & RADIO
    $('input[type="checkbox"]').iCheck({
        checkboxClass: 'icheckbox_minimal-grey',
        increaseArea: '20%' // optional
    });
    $('input[type="radio"]').iCheck({
        radioClass: 'iradio_minimal-grey',
        increaseArea: '20%' // optional
    });
</script>
 