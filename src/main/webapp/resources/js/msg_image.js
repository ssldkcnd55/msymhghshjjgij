/**
 * 
 */

function changeImg(img)
{	fileName=img;
	$('.tr1Img').prop("src","resources/upload/chatUpload/"+img);
}
function downloadImg()
{
	location.href= "msg_img_down.do?filename="+fileName;
}