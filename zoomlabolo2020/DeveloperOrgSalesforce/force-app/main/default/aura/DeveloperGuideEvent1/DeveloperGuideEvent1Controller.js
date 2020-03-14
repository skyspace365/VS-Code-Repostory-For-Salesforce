({
    handleClick: function(cmp, event, helper) {
        var attributeValue = cmp.get("v.text");
        console.log("current text: " + attributeValue);
        
        var target = event.getSource();
        /*The handleClick action uses event.getSource() to get the source component that fired this component event. 
         In this case, the source component is the <lightning:button> in the markup.
         The code then sets the value of the text component attribute to the value of the button’s label attribute. 
         The text component attribute is defined in the <aura:attribute> tag in the markup.*/
        console.log("MA"+target.get("v.label"));
        cmp.set("v.text", target.get("v.label"));
    },
    
    fireComponetEvent:function(cmp,evt,help){
        var compEvt=cmp.getEvent("registeringComponentEvent");
        evt.setParam("message","message from component event");
        compEvt.fire();
    },
    
    handleComponentEvent:function(cmp,evt,help){
        console.log("We are in capture phase "+evt.getParam("message"));
        //evt.getParam("message");
        
    }
})