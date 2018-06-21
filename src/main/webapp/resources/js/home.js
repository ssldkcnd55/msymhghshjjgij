function uncomma(str) {
	str = String(str);
	return str.replace(/[^\d]+/g, '');
}
function numberWithCommas(x) {
	return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

$(function() {
	/* 홈에 경매리스트 */
	$
			.ajax({
				url : "homeAuctionList.do",
				type : "post",
				dataType : "JSON",
				success : function(obj) {
					var objStr = JSON.stringify(obj);
					var jsonObj = JSON.parse(objStr);
					var count = 1;
					var outValues1 = "<div class='item active' align='center'><table class='auction_table'>"
							+ "<tr><th>상품</th><th>가격</th></tr>";

					var outValues2 = "<div class='item' align='center'><table class='auction_table'>"
							+ "<tr><th>상품</th><th>가격</th></tr>";

					var outValues3 = "<div class='item' align='center'><table class='auction_table'>"
							+ "<tr><th>상품</th><th>가격</th></tr>";

					for ( var i in jsonObj.list) {
						if (i < 4) {
							outValues1 += "<tr><td><a class='aTag1' href='AuctionDetail.do?auction_no="
									+ jsonObj.list[i].auction_no
									+ "'><div><div class='auction_img' style='background-image: url(\"/farm/resources/upload/auctionUpload/"
									+ jsonObj.list[i].auction_img
									+ "\");'></div>"
									+ "<div>"
									+ jsonObj.list[i].auction_title
									+ "</div></td><td>현재가  <span class='currentPrice'>"
									+ numberWithCommas(jsonObj.list[i].auction_startprice)
									+ "</span>원<br><span class='directPrice'>즉구가 "
									+ numberWithCommas(jsonObj.list[i].auction_directprice)
									+ "원</span></div></a></td></tr>";
						} else if (i < 8) {
							outValues2 += "<tr><td><a class='aTag1' href='AuctionDetail.do?auction_no="
									+ jsonObj.list[i].auction_no
									+ "'><div><div class='auction_img' style='background-image: url(\"/farm/resources/upload/auctionUpload/"
									+ jsonObj.list[i].auction_img
									+ "\");'></div>"
									+ "<div>"
									+ jsonObj.list[i].auction_title
									+ "</div></td><td>현재가  <span class='currentPrice'>"
									+ numberWithCommas(jsonObj.list[i].auction_startprice)
									+ "</span>원<br><span class='directPrice'>즉구가 "
									+ numberWithCommas(jsonObj.list[i].auction_directprice)
									+ "원</span></div></a></td></tr>";
						} else if (i < 12) {
							outValues3 += "<tr><td><a class='aTag1' href='AuctionDetail.do?auction_no="
									+ jsonObj.list[i].auction_no
									+ "'><div><div class='auction_img' style='background-image: url(\"/farm/resources/upload/auctionUpload/"
									+ jsonObj.list[i].auction_img
									+ "\");'></div>"
									+ "<div>"
									+ jsonObj.list[i].auction_title
									+ "</div></td><td>현재가  <span class='currentPrice'>"
									+ numberWithCommas(jsonObj.list[i].auction_startprice)
									+ "</span>원<br><span class='directPrice'>즉구가 "
									+ numberWithCommas(jsonObj.list[i].auction_directprice)
									+ "원</span></div></a></td></tr>";
						}
						count++;

					}

					outValues1 += "</table></div>";
					outValues2 += "</table></div>";
					outValues3 += "</table></div>";
					if (count == 1) {
						$(".carousel-inner.auction").html(
								"<p class='noneAuction'>등록된 경매가 없습니다.</p>");
					} else if (count < 6) {

						$(".carousel-inner.auction").html(outValues1);
					} else if (count < 10) {
						$(".carousel-inner.auction").html(
								outValues1 + outValues2);
					} else {
						$(".carousel-inner.auction").html(
								outValues1 + outValues2 + outValues3);
					}

				},
				error : function(request, status, errorData) {
					console.log("error code : " + request.status + "\nmessage"
							+ request.responseText + "\nerror" + errorData);
				}
			});

	/* 홈에 신상품 리스트 */
	$
			.ajax({
				url : "homeNewMarketList.do",
				type : "post",
				dataType : "JSON",
				success : function(obj) {
					var objStr = JSON.stringify(obj);
					var jsonObj = JSON.parse(objStr);
					var outValues1 = "<div class='big_title'><h2 >신상품</h2></div><div class='box_border'>";
					var outValues2 = "<div class='big_title'><a href='marketList.do'><div class='seeMore'>더보기 ></div></a></div><div class='box_border1'>";

					outValues1 += "<a href='marketDetail.do?market_no="
							+ jsonObj.list[0].market_no
							+ "'><div class='box' style='background-image: url(\"/farm/resources/upload/marketUpload/"
							+ jsonObj.list[0].market_img
							+ "\");'></div>"
							+ "<div class='box_nametag'><div class='box_title'>"
							+ jsonObj.list[0].market_title + "</div>"
							+ "<div class='box_price'>"
							+ numberWithCommas(jsonObj.list[0].market_price)
							+ "원</div></div></a></div>";

					outValues2 += "<a href='marketDetail.do?market_no="
							+ jsonObj.list[1].market_no
							+ "'><div class='box' style='background-image: url(\"/farm/resources/upload/marketUpload/"
							+ jsonObj.list[1].market_img
							+ "\");'></div>"
							+ "<div class='box_nametag'><div class='box_title'>"
							+ jsonObj.list[1].market_title + "</div>"
							+ "<div class='box_price'>"
							+ numberWithCommas(jsonObj.list[1].market_price)
							+ "원</div></div></a></div>";

					$(".bigbox1").html(outValues1);
					$(".bigbox2").html(outValues2);

					$(function() {
						$('.flexslider').flexslider({
							animation : Modernizr.touch ? "slide" : "fade"
						});

						$(".tab_content").hide();
						$(".tab_content:first").show();

						$("ul.tabs li").click(
								function() {
									$("ul.tabs li").removeClass("active").css(
											"color", "#333");
									// $(this).addClass("active").css({"color":
									// "darkred","font-weight": "bolder"});
									$(this).addClass("active").css("color",
											"darkred");
									$(".tab_content").hide()
									var activeTab = $(this).attr("rel");
									$("#" + activeTab).fadeIn()
								});
					});

				},
				error : function(request, status, errorData) {
					console.log("error code : " + request.status + "\nmessage"
							+ request.responseText + "\nerror" + errorData);
				}
			});

	/* 홈에 메인사진(인기 리스트) */
	$
			.ajax({
				url : "homePopularMarketList.do",
				type : "post",
				dataType : "JSON",
				success : function(obj) {
					var objStr = JSON.stringify(obj);
					var jsonObj = JSON.parse(objStr);
					var outValues = "";

					for ( var i in jsonObj.list) {
						outValues += "<li><a style='text-decoration: none;' href='marketDetail.do?market_no="
								+ jsonObj.list[i].market_no
								+ "'><img src='/farm/resources/upload/marketUpload/"
								+ jsonObj.list[i].market_img
								+ "'/><div class='pretty'>"
								+ "<div class='pmarketTitle'>"
								+ jsonObj.list[i].market_title
								+ "<div class='nmarketPrice'>"
								+ numberWithCommas(jsonObj.list[i].market_price)
								+ "원" + "</div></div>" + "</div></a></li>";
					}

					$(".slides").html(outValues);

				},
				error : function(request, status, errorData) {
					console.log("error code : " + request.status + "\nmessage"
							+ request.responseText + "\nerror" + errorData);
				}
			});

});

window.onload = function() {

	$
			.ajax({
				url : '/farm/MainQuoteApi.do',
				type : 'post',
				dataType : 'json',
				success : function(data) {
					var jsonStr = JSON.stringify(data);
					var jsonData = JSON.parse(jsonStr);
					var myitem = jsonData.price
					console.log(myitem);
					var html1 = "";

					for (var i = 1; i < 10; i++) {
						if (i == 1) {
							html1 = "<div class='item active' align='center'><table class='table'><th class='th'>품명</th><th class='th'>종류</th><th class='th'>가격</th>";

						} else {
							html1 = "<div class='item' align='center'><table class='table'><th class='th'>품명</th><th class='th'>종류</th><th class='th'>가격</th>";
						}
						$.each(myitem, function(index, item) {

							if (index >= i * 13 && index < i * 13 + 13) {
								html1 += "<tr><td class='td'>"
										+ item.category_name + "</td>";
								html1 += "<td class='td'>" + item.item_name
										+ "</ td>";
								html1 += "<td class='td'>" + item.dpr1
										+ "</td></tr>";
							}

						});

						html1 += "</table></div>"
						$(".carousel-inner.quote").append(html1);

					}

				},
				error : function(request, status, errorData) {
					console.log("error code : " + request.status + "\n"
							+ "message : " + request.responseText + "\n"
							+ "error : " + errorData);
				}
			});
}
/* 시세정보 더보기버튼 */
function movequote() {
	location.href = "/farm/moveQuote.do";

}
function movejob() {
	location.href = "/farm/moveJob.do";

}
/* 메인구인구직 */
$(function() {

	$
			.ajax({
				url : "jobList.do",
				type : "post",
				dataType : "json",
				success : function(data) {
					var jsonStr = JSON.stringify(data);
					var json = JSON.parse(jsonStr);
					var values = "<tr><th class='th1' ></th><th class='th1' >제목</th><th class='th1'>지역</th></tr>";

					for ( var i in json.list) {
						if (i <= 4) {
							values += "<tr id='hover'>";
							values += "<td class='td1'><div class='jobImg'" 
							+"style='background-image:url(\"/farm/resources/upload/jobUpload/"+json.list[i].job_img+"\");'></div></td><td id='job_td' class='td1'><a href='jobDetail.do?job_no="
									+ json.list[i].job_no
									+ "'>"
									+ json.list[i].job_title + "</a></td>";
									

							values += "<td class='td1'>" + json.list[i].job_addr
									+ "</td></tr>";
							/*if (json.list[i].job_status == "1") {

								values += "<td class='td'><span id='job_table_span_find'><strong>구인중</strong></span></td>";
							} else {
								values += "<td class='td'><span id='job_table_span_finded'>마감</span></td>";
							}
*/
						}

					}

					$(".table2").html(values);

					/*
					 * var startPage = json.list[0].startPage; var endPage =
					 * json.list[0].endPage; var maxPage = json.list[0].maxPage;
					 * var currentPage = json.list[0].currentPage;
					 * 
					 * var values1 = ""; if (startPage > 5) { values1 += "<a
					 * href='javascript:jobPage(" + (startPage - 1) +
					 * ")'>&laquo;</a>" } else { values1 += "<a>&laquo;</a>"; }
					 * for (var i = startPage; i <= endPage; i++) { if (i ==
					 * currentPage) { values1 += "<a class='active'>" + i + "</a>"; }
					 * else { values1 += "<a href='javascript:jobPage(" + i +
					 * ");'>" + i + "</a>"; } } if (endPage < maxPage) {
					 * values1 += "<a href='javascript:jobPage(" + (endPage +
					 * 1) + ")'>&raquo;</a>";
					 *  } else { values1 += "<a>&raquo;</a>"; }
					 * $(".pagination").html(values1);
					 */
				},
				error : function(request, status, errorData) {
					alert("error code : " + request.status + "\nmessage"
							+ request.responseText + "\nerror" + errorData);
				}

			});

});
