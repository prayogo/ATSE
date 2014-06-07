// JavaScript Document
function showDropdown(element, id){
    if (document.getElementById(element).style.display == "block"){
        document.getElementById(element).style.display = "none";
        document.getElementById(id).style.background = "none";
        window.onclick = null;
    }else{
        setTimeout(function(){
            document.getElementById(element).style.display = "block";
            document.getElementById(id).style.background = "#E6E6E6";
        }, 1);
        window.onclick = function(ev){
            if(findParent(ev.target, "ul").getAttribute("name") == "dropdown"){
                return;
            }
			
            var elements = document.getElementsByName("dropdown");
            var length = elements.length;
			
            for (var i = 0; i < length; i++)
            {
                elements[i].style.display='none';
            }	
			
            elements = document.getElementsByName("toggle");
            length = elements.length;
			
            for (var i = 0; i < length; i++)
            {
                elements[i].style.background='none';
            }	
        }
    }
}

function findParent(element, type){
    if (typeof(element.parentNode) != 'undefined'){
        if (type == "" || typeof(element.parentNode.tagName) == 'undefined') 
            return element;
        if (typeof(element.parentNode.tagName) != 'undefined' && type.toLowerCase() == element.parentNode.tagName.toLowerCase())
            return element.parentNode;
			
        return findParent(element.parentNode, type);
    }
}

function hideAlert(){
    var elements = document.getElementsByName("alert");
    var length = elements.length;
	
    for (var i = 0; i < length; i++)
    {
        elements[i].style.display='none';
    }
}

function btnFileClick(){
    var element = document.getElementById('fileImage');
    triggerEvent(element, 'click');
    document.getElementById('fileImage').onchange = function (e)
    {
        var lblFile = document.getElementById('lblFile');
        var productImage = document.getElementById('hdnProductImage');
        
        lblFile.innerHTML = document.getElementById('fileImage').files[0].name;
        productImage.value = document.getElementById('fileImage').files[0].name;
        
    };
}

function triggerEvent(el, type)
{
    if ((el[type] || false) && typeof el[type] == 'function')
    {
        el[type](el);
    }
}

function highlight(text)
{
    var innerHTML = "";
    var index = -1;
    
    elements = document.getElementsByName("caption");
    var length = elements.length;
    for (var i = 0; i < length; i++)
    {
        innerHTML = elements[i].children[0].innerHTML.toLowerCase();
        index = innerHTML.indexOf(text.toLowerCase());
        if (index >= 0 )
        { 
            innerHTML = elements[i].children[0].innerHTML;
            innerHTML = innerHTML.substring(0,index) + 
            "<span style='font-size:20px; background-color:#FFDAE4'>" + 
            innerHTML.substring(index,index+text.length) + "</span>" + 
            innerHTML.substring(index + text.length);
            elements[i].children[0].innerHTML = innerHTML;
        }
        
        innerHTML = elements[i].children[2].innerHTML.toLowerCase();
        index = innerHTML.indexOf(text.toLowerCase());
        if (index >= 0 )
        { 
            innerHTML = elements[i].children[2].innerHTML;
            innerHTML = innerHTML.substring(0,index) + 
            "<span style='font-size:11px;background-color:#FFDAE4'>" + 
            innerHTML.substring(index,index+text.length) + "</span>" + 
            innerHTML.substring(index + text.length);
            elements[i].children[2].innerHTML = innerHTML;
        }
    }
}

function scrollTo(){
    console.log(document.getElementsByClassName('control scrollTo'));
    document.getElementsByClassName('control scrollTo')[0].focus();
    document.getElementsByClassName('control scrollTo')[0].scrollIntoView();
}