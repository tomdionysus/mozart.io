(function(){window.i18n={};var MessageFormat={locale:{}};MessageFormat.locale.fr = function (n) {
  if (n >= 0 && n < 2) {
    return 'one';
  }
  return 'other';
};
;window.i18n['todo']={};;window.i18n['todo']['todos']=function(d){
var r = "";
r += "todos";
return r;
};window.i18n['todo']['whatNeedsDone']=function(d){
var r = "";
r += "Que faut-il faire?";
return r;
};window.i18n['todo']['markAllAsComplete']=function(d){
var r = "";
r += "Marquer tout complet";
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
"zero" : function(d){
var r = "";
r += "article";
return r;
},
"one" : function(d){
var r = "";
r += "article";
return r;
},
"other" : function(d){
var r = "";
r += "articles";
return r;
}
};
if ( pf_0[ k_1 + "" ] ) {
r += pf_0[ k_1 + "" ]( d ); 
}
else {
r += (pf_0[ MessageFormat.locale["fr"]( k_1 - off_0 ) ] || pf_0[ "other" ] )( d );
}
r += " restants";
return r;
};window.i18n['todo']['clearCompleted']=function(d){
var r = "";
r += "Retirer terminé";
return r;
};window.i18n['todo']['all']=function(d){
var r = "";
r += "Tous";
return r;
};window.i18n['todo']['active']=function(d){
var r = "";
r += "Active";
return r;
};window.i18n['todo']['complete']=function(d){
var r = "";
r += "Complet";
return r;
};window.i18n['todo']['doubleClickEdit']=function(d){
var r = "";
r += "Double-cliquez pour modifier un todo";
return r;
};window.i18n['todo']['fullSource']=function(d){
var r = "";
r += "github";
return r;
};window.i18n['todo']['createdBy']=function(d){
var r = "";
r += "Créé par <a href=\"";
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
r += "Une partie du <a href=\"";
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