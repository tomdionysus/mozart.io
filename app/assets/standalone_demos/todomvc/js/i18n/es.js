(function(){window.i18n={};var MessageFormat={locale:{}};MessageFormat.locale.es = function ( n ) {
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
r += "¿Qué se necesita hacer?";
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
r += " ";
if(!d){
throw new Error("MessageFormat: No data passed to function.");
}
var lastkey_1 = "ITEMS";
var k_1=d[lastkey_1];
var off_0 = 0;
var pf_0 = { 
"one" : function(d){
var r = "";
r += "item restante";
return r;
},
"other" : function(d){
var r = "";
r += "ítems restantes";
return r;
}
};
if ( pf_0[ k_1 + "" ] ) {
r += pf_0[ k_1 + "" ]( d ); 
}
else {
r += (pf_0[ MessageFormat.locale["es"]( k_1 - off_0 ) ] || pf_0[ "other" ] )( d );
}
return r;
};window.i18n['todo']['clearCompleted']=function(d){
var r = "";
r += "Borrar completado";
return r;
};window.i18n['todo']['all']=function(d){
var r = "";
r += "Todo";
return r;
};window.i18n['todo']['active']=function(d){
var r = "";
r += "Vigente";
return r;
};window.i18n['todo']['complete']=function(d){
var r = "";
r += "Completo";
return r;
};window.i18n['todo']['doubleClickEdit']=function(d){
var r = "";
r += "Haga doble clic para editar un todo";
return r;
};window.i18n['todo']['fullSource']=function(d){
var r = "";
r += "github";
return r;
};window.i18n['todo']['createdBy']=function(d){
var r = "";
r += "Creado por <a href=\"";
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
r += "Una parte de <a href=\"";
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