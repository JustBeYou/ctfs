function writeList(listNum, data){ 
	var xhttp = new XMLHttpRequest();
	xhttp.open("POST","fileWrite.php",false);
	xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhttp.send('listnum=' + listNum + '&data=' + data);
	if (xhttp.readyState === 4 && xhttp.status === 200) {
		return xhttp.responseText;
	}else{
	}
}


function deleteList(listNum){ 
	var xhttp = new XMLHttpRequest();
	xhttp.open("POST","fileDelete.php",false);
	xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhttp.send('listnum=' + listNum);
	if (xhttp.readyState === 4 && xhttp.status === 200) {
		listLists();
		return xhttp.responseText;
	}else{
	}
}


function addList(){
	for (var i=1; true; i++){
		if(document.getElementById("list" + i) === null){
			writeList("" + i, "");
			listLists();
			break;
		}
	}
}


function listLists(){
	document.getElementById("main").innerHTML = '<ul id="listOfLists"></ul>';
	var result = JSON.parse(readDir("./.list/"));
	if(result.length > 2){
		for(var i = 2; i < result.length; i++){
			document.getElementById("listOfLists").innerHTML += "<li><p style='cursor:pointer' id='" + result[i] 
				+ "' onclick='printList(\"./.list/" + result[i] + "\")'>" + result[i] 
				+ "</p><button onclick=deleteList('" + result[i].substring(4) + "')>Delete</button></li>";
		}
	}else{
		console.log("invalid response");
	}
	document.getElementById("main").innerHTML += '<button onclick=addList()>Add List</button>';
}


function appendListItem(){
	for(var i =1; true; i++){
		if(document.getElementById("listItem"+i) === null){
			document.getElementById("list").innerHTML +=  "<li><p style='cursor:text' id='listItem" + i 
				+ "'onkeydown='return keyDownHandler(event, this)' onblur=saveList() contenteditable='true'>New Item</p><button onclick=deleteListItem(this) name='" 
				+ i + "'>Delete</button></li>";
			break;
		}
	}
}


function deleteListItem(e){
	var id = Number(e.getAttribute("name"));
	var listNum = document.getElementById("listName").getAttribute("name");
	var json = JSON.parse(strList());
	if(json[id] !== undefined){
		for(var i=id; true; i++){
			if(json[i+1] !== undefined){
				json[i] = json[i+1]; 
			}else{
				delete json[i];
				break;
			}
		}
	}
	writeList(listNum, JSON.stringify(json));
	printList("./.list/list"+listNum);
}


function strList(){
	var tempJSON = {};
	for(var i=1; true; i++){
		if(document.getElementById("listItem"+i) !== null){
			tempJSON[i] = revertSpecial(document.getElementById("listItem"+i).innerHTML);
		}else{
			return JSON.stringify(tempJSON);
		}
	}
}


function keyDownHandler(event, e){
	if(event.code === "Enter"){
		e.blur();	
		return false;
	}
}


function saveList(){
	var jsonStr = strList();
	var listNum = document.getElementById("listName").getAttribute("name");
	return writeList(listNum, jsonStr);
}


function revertSpecial(inStr){
	inStr = inStr.replace(/&nbsp;/g, ' ');
	inStr = inStr.replace(/&quot;/g, '\\"');
	inStr = inStr.replace(/&num;/g, '#');
	inStr = inStr.replace(/&dollar;/g, '$');
	inStr = inStr.replace(/&percnt;/g, '%');
	inStr = inStr.replace(/&amp;/g, '&');
	inStr = inStr.replace(/&apos;/g, "\\'");
	inStr = inStr.replace(/&lpar;/g, '(');
	inStr = inStr.replace(/&rpar;/g, ')');
	inStr = inStr.replace(/&ast;/g, '*');
	inStr = inStr.replace(/&plus;/g, '+');
	inStr = inStr.replace(/&comma;/g, ',');
	inStr = inStr.replace(/&minus;/g, '-');
	inStr = inStr.replace(/&period;/g, '.');
	inStr = inStr.replace(/&colon;/g, ':');
	inStr = inStr.replace(/&sol;/g, '/');
	inStr = inStr.replace(/&semi;/g, ';');
	inStr = inStr.replace(/&lt;/g, '<');
	inStr = inStr.replace(/&equals;/g, '=');
	inStr = inStr.replace(/&gt;/g, '>');
	inStr = inStr.replace(/&quest;/g, '?');
	inStr = inStr.replace(/&commat;/g, '@');
	inStr = inStr.replace(/&lsqb;/g, '[');
	inStr = inStr.replace(/&rsbp;/g, ']');
	inStr = inStr.replace(/&bsol;/g, '\\\\');
	inStr = inStr.replace(/&Hat;/g, '^');
	inStr = inStr.replace(/&lowbar;/g, '_');
	inStr = inStr.replace(/&grave;/g, '`');
	inStr = inStr.replace(/&lcub;/g, '{');
	inStr = inStr.replace(/&rcub;/g, '}');
	inStr = inStr.replace(/&verbar;/g, '|');
	inStr = inStr.replace(/\\/g, '\\\\');
	inStr = inStr.replace(/"/g, '\\\"')
	return escape(inStr);
}


function readDir(path){ 
	var xhttp = new XMLHttpRequest();
	xhttp.open("POST","dirRead.php",false);
	xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhttp.send('path=' + path);
	if (xhttp.readyState === 4 && xhttp.status === 200) {
		return xhttp.responseText;
	}else{
	}
}


function readFile(file){ 
	var xhttp = new XMLHttpRequest();
	xhttp.open("POST","fileRead.php",false);
	xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhttp.send('file=' + file);
	if (xhttp.readyState === 4 && xhttp.status === 200) {
		return xhttp.responseText;
	}else{
	}
}


function printList(file){
	document.getElementById("main").innerHTML = "<h2 id=\"listName\" name='" + file.substring(12) + "'>" + file.split("/")[2] + "</h2>";
	document.getElementById("main").innerHTML += "<ol id=list></ol>";
	var contents = JSON.parse(JSON.parse(readFile(file))['file']);
	for(var i =1; true; i++){
		if(contents[i] === undefined){
			break;
		}
		document.getElementById("list").innerHTML +=  "<li> <p style='cursor:text' id='listItem" + i 
			+ "'onkeydown='return keyDownHandler(event, this)' onblur=saveList() contenteditable='true'>" 
			+ contents[i] + "</p><button onclick=deleteListItem(this) name='" + i + "'>Delete</button></li>";
	}
	document.getElementById("main").innerHTML += '<button onclick=appendListItem()>Add</button>';
	document.getElementById("main").innerHTML += '<button onclick=listLists()>Back</button>';
}


function toggleHint() {
		var e = document.getElementsByClassName('content-block');
		for(var i = 0; i < e.length; i++){
			if(e[i].style.display == 'block' || e[i].style.display == '')
				e[i].style.display ='none';
			else
				e[i].style.display ='block';
		}
		setTimeout(function(){
			var e = document.getElementsByClassName('content-block');
			for(var i = 0; i < e.length; i++){
				if(e[i].style.display == 'block' || e[i].style.display == '')
					e[i].style.display ='none';
				else
					e[i].style.display ='block';
			}
		}, 1000);
}
