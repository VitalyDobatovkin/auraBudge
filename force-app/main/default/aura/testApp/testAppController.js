({
doInit : function(component, event, helper) {
  var isEnabled = $A.get("e.force:createRecord");

  //check if isEnabled is truthy
  if (isEnabled) {
    //we have a truthy reference from the get() method, that means we're good to go
    component.set("v.yourAttributeName", true);
  }
}
});