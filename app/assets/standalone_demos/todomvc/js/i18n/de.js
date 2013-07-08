(function(){window.i18n={};var MessageFormat={locale:{}};MessageFormat.locale.de = function ( n ) {
  if ( n === 1 ) {
    return "one";
  }
  return "other";
};
;window.i18n['todo']={};;window.i18n['todo']['todos']=function(d){
var r = "";
r += "todos";
return r;
};window.i18n['todo']['whatNeedsDone']=function(d){
var r = "";
r += "Was getan werden muss?";
return r;
};window.i18n['todo']['markAllAsComplete']=function(d){
var r = "";
r += "Markiere alle als komplette";
return r;
};window.i18n['todo']['itemCount']=function(d){
var r = "";
if(!d){
throw new Error("MessageFormat: No data passed to function.");
}
r += d["ITEMS"];
r += " Stück verbleibenden";
return r;
};window.i18n['todo']['clearCompleted']=function(d){
var r = "";
r += "Löschen abgeschlossen";
return r;
};window.i18n['todo']['all']=function(d){
var r = "";
r += "Alle";
return r;
};window.i18n['todo']['active']=function(d){
var r = "";
r += "Aktiv";
return r;
};window.i18n['todo']['complete']=function(d){
var r = "";
r += "Vollständig";
return r;
};window.i18n['todo']['doubleClickEdit']=function(d){
var r = "";
r += "Doppelklicken Sie auf eine todo bearbeiten";
return r;
};window.i18n['todo']['fullSource']=function(d){
var r = "";
r += "github";
return r;
};window.i18n['todo']['createdBy']=function(d){
var r = "";
r += "Erstellt von <a href=\"";
if(!d){
throw new Error("MessageFormat: No data passed to function.");
}
r += d["URL"];
r += "\">";
if(!d){
throw new Error("MessageFormat: No data passed to function.");
}
r += d["NAME"];
r += "</a>";
return r;
};window.i18n['todo']['partOf']=function(d){
var r = "";
r += "Teil <a href=\"";
if(!d){
throw new Error("MessageFormat: No data passed to function.");
}
r += d["URL"];
r += "\">";
if(!d){
throw new Error("MessageFormat: No data passed to function.");
}
r += d["NAME"];
r += "</a>";
return r;
}})();