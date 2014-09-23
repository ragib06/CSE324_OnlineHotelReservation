var numOfImages = 0;
var next = 0;
var i = 1;
var opct=10;
var count=0;

var images;
var imageUrls;
var adtexts;
var adtitles;

function init(){
    numOfImages = 0;
    next = 0;
    images = new Array();
    imageUrls = new Array();
    adtexts = new Array();
    adtitles = new Array();
}

function addAdvert(imagePath, text, title){
    imageUrls[numOfImages] = imagePath;
    adtexts[numOfImages] = text;
    adtitles[numOfImages] = title;
    numOfImages = numOfImages+1;
}

function preloadAdvert(){
    images[0] = new Image();
    images[0].src = imageUrls[0];
    document.getElementById('adimage').src = images[0].src;
    document.getElementById('adtext').innerHTML = adtexts[0];
    document.getElementById('adtitle').innerHTML = adtitles[0];
}

function setOpacity(id, opacity){
    document.getElementById(id).style.opacity = opacity/10.0;
    document.getElementById(id).style.mozOpacity = opacity/10.0;
    document.getElementById(id).style.filter = "alpha(opacity=" + opacity*10 + ")";
}

function slideShow(){
    if(i<10){
        opct--;
        setOpacity('adimage',opct);
    }else if(i==10){
        document.getElementById('adimage').src = images[next].src;
        document.getElementById('adtext').innerHTML = adtexts[next];
        document.getElementById('adtitle').innerHTML = adtitles[next];
        next = (next+1)%(numOfImages);
        count++;
    }else if(i>10 && i<20){
        opct++;
        setOpacity('adimage',opct);
    }else if(i==20){
        opct = 10;
        if(count < numOfImages){
            images[next] = new Image();
            images[next].src = imageUrls[next];
        }
    }
    //document.getElementById('text').value = imageUrls[next];
    i = (i+1)%70;
    setTimeout("slideShow()",100);
}


