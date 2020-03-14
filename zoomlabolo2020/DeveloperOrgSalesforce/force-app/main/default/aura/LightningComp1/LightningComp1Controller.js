({
	dosubmit:function(cmp,evt,help) {
		var username=cmp.get("v.Uname");
        /*
        if(username!=null){
            alert('Username is :'+username);
        }
        else{
            alert('Username not provided');
        }
        */
        var action=cmp.get("c.method1");
        action.setParams({usernamefrommethod:username});
        action.setCallback(this,function(response){
            if(response.getState()==="SUCCESS"){
                console.log("MA_SUCCESS");
                cmp.set("v.result",response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
	}
})