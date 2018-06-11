<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="/farm/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="/farm/resources/js/auction_payment.js"></script>

<link rel="stylesheet" type="text/css" href="/farm/resources/css/auction_payment.css" />
<link href="/farm/resources/css/style.css" rel="stylesheet" type="text/css" />
<meta charset="UTF-8">
<title>Farm</title>
</head>
<script type="text/javascript">
var auction_no='${ao.auction_no}';
var my_id = '${loginUser.member_id}';
var your_id = '${ao.member_id}';
var order_price = Number( '${ao.auction_directprice}' )+ 2500 ;
var obj = new Object();
obj={      'no':'${ao.auction_no}',
		   'img':'${ao.auction_img}',
		   'title':'${ao.auction_title }',
		   'your_id':'${ao.member_id}',
		   'your_name':'${ao.member_name}',
		   'price':'${ao.auction_directprice}',
		   'order_price':order_price
};
</script>
<body>

	<div id="top_line"></div>
	<div id="wrap">
		<div id="header">
			<%@  include file="../inc/header.jsp"%>
		</div>
		<div id="container">
			<div class="inner-wrap">
				<!--  -->
				<div class="title1 payment">
					<p class="titleP">경매 결제</p>
				</div>
			
				<!-- 상품정보 -->
				<div class="product">
					<table class="pay_top_table">
						<tr>
							<th></th>
							<th><div>상품정보</div></th>
							<th>판매자</th>
							<th>상품가격(낙찰가)</th>
							<th>배송비</th>
						</tr>

							<tr>
								<td><span><img class="goods_img"
										src="/farm/resources/upload/auctionUpload/${ao.auction_img }"></span></td>
								<td><a href="AuctionDetail.do?auction_no=${ao.auction_no}"
									target="_blank">
										<div class="product_title"><strong class="product_title_strong">${ao.auction_title }</strong></div>
										<div class="product_note">${ao.auction_note}</div>
								</a></td>
								<td><strong>${ao.member_name}</strong>
									<p>${ao.member_id}</p></td>
								<td><fmt:formatNumber value="${ao.auction_directprice}"
										pattern="#,###" />원</td>
								<td>2,500원</td>
							</tr>
					</table>
				</div>
				<!-- 상품정보 -->




				<!-- 배달지 -->
				<div class="top_delivery_checkout">
					<div class="delivery">
						<br>
						<div class="delivery_title">
							<strong>배송지 정보</strong>
						</div>
						<br> <br> <br>
						<div class="delivery_choice">
							<!--   배송지 선택   -->
						</div>
						&nbsp;
						<div class="delivery_choice_radio">
							<input type="radio" name="delivery" value="original_delivery"
								checked="checked" />기본배송지 &nbsp; <input type="radio"
								name="delivery" value="new_delivery" />신규배송지 &nbsp; <br>
							<br>
							<hr>
						</div>

						<div class="delivery_username">
							<br>
							<div class="delivery_table">
								<table class="infoTable">
									<tr>
										<td class="info_head">이름</td>
										<td colspan="2"><input type="text" id="user_name"
											value="${loginUser.member_name }" name="user_name" readonly></td>
									</tr>
									<tr>
										<td class="info_head">연락처</td>
										<td><input type="text" autocomplete="tel" id="user_phone"
											name="user_phone" value="${loginUser.member_tel }"></td>
										<td class="relief_number"><input type="checkbox"
											name="relief_number" value="delivery_username_phone" />안심번호
											사용 <span class="info_relief"
											onmouseleave="removeInfoRelief()"
											onmouseover="printInfoRelief()">?
												<div class="InfoReliefDiv">
													<h5>안심번호 서비스 안내</h5>
													<p class="text">
														고객님의 개인정보보호를 위해 상품 주문 시 연락처<br>정보가 유출되지 않도록 1회성 임시번호를
														발급해<br>드리는 서비스입니다.
													</p>
													<ul>
														<li>판매사와 택배사에 실제 고객님의 정보 대신 안심<br>번호가 제공되므로,
															개인정보가 유출되는 것을<br>사전에 차단할 수 있습니다.
														</li>
														<li>발급된 안심번호는 일정기간 이후 해지되며, <br>해지 이후 취소/반품 등의
															절차 진행 중에는 <br> 실제 연락처가 제공될 수 있습니다.
														</li>
														<li>발급된 안심번호는 결제완료 이후<br>
														<strong>마이페이지 &gt; 구매목록 &gt; 구매상세내역</strong>에서 확인<br>하실
															수 있으며, 배송완료 후 일정기간이 지나면<br>자동으로 해지됩니다
														</li>
														<li>안심번호 서비스는 SK텔링크에 위탁하여 <strong>무료</strong>로<br>제공해
															드립니다.
														</li>
													</ul>
												</div>
										</span></td>
									</tr>
									<tr>
										<td class="info_head">주소</td>


										<c:set var="before_Addr" value="${loginUser.member_addr}" />


										<td colspan="2" class="table_colspan"><input type="text"
											id="user_addr" name="useradd"
											value="${fn:replace(before_Addr,'@','') }" /></td>
									</tr>
									<tr>
										<td class="info_head">배송 메시지</td>
										<td colspan="2"><select id="request">
												<option selected="selected">배송시 요청사항 선택</option>
												<option>부재시 경비실에 맡겨주세요.</option>
												<option>부재시 휴대폰으로 연락바랍니다.</option>
												<option>집 앞에 놓아주세요.</option>

												<option>직접 입력</option>
										</select></td>
									</tr>

								</table>
								<!--             신규배송지 -->
								<table class="newInfo" hidden="hidden">
									<tr>
										<td class="info_head">이름</td>
										<td colspan="2"><input type="text" id="new_user_name"
											value="" name="user_name"></td>
									</tr>
									<tr>
										<td class="info_head">연락처</td>
										<td><input type="text" autocomplete="tel"
											id="new_user_phone" name="user_phone" value=""></td>
										<td class="relief_number"><input type="checkbox" name="relief_number" value="delivery_username_phone" />안심번호 사용 <span class="info_relief" onmouseleave="removeInfoRelief()" onmouseover="printInfoRelief()">?<div class="InfoReliefDiv">
													<h5>안심번호 서비스 안내</h5>
													<p class="text">
														고객님의 개인정보보호를 위해 상품 주문 시 연락처<br>정보가 유출되지 않도록 1회성 임시번호를
														발급해<br>드리는 서비스입니다.
													</p>
													<ul>
														<li>판매사와 택배사에 실제 고객님의 정보 대신 안심<br>번호가 제공되므로,
															개인정보가 유출되는 것을<br>사전에 차단할 수 있습니다.
														</li>
														<li>발급된 안심번호는 일정기간 이후 해지되며, <br>해지 이후 취소/반품 등의
															절차 진행 중에는 <br> 실제 연락처가 제공될 수 있습니다.
														</li>
														<li>발급된 안심번호는 결제완료 이후<br>
														<strong>마이페이지 &gt; 구매목록 &gt; 구매상세내역</strong>에서 확인<br>하실
															수 있으며, 배송완료 후 일정기간이 지나면<br>자동으로 해지됩니다
														</li>
														<li>안심번호 서비스는 SK텔링크에 위탁하여 <strong>무료</strong>로<br>제공해
															드립니다.
														</li>
													</ul>
												</div>
										</span></td>
									</tr>
									<tr>
										<td class="info_head">주소</td>
										<td colspan="2" class="table_colspan"><button
												onclick="findAddr();" class="findAddr">주소찾기</button>
											<input type="text" id="new_user_addr" name="useradd" value=""
											readonly="readonly"> <input type="text"
											id="new_user_addr_detail" placeholder="상세주소"></td>
									</tr>
									<tr>
										<td class="info_head">배송 메시지</td>
										<td colspan="2"><select id="new_request">
												<option selected="selected">배송시 요청사항 선택</option>
												<option>부재시 경비실에 맡겨주세요.</option>
												<option>부재시 휴대폰으로 연락바랍니다.</option>
												<option>집 앞에 놓아주세요.</option>

												<option>직접 입력</option>
										</select></td>
									</tr>
								</table>
							</div>
							<br>
							<div class="delivery_warning">
								<p>2016년 8월 1일부터는 5자리 우편번호 사용이 의무화됩니다.</p>
								<p>도서산간 지역의 경우 추후 수령 시 추가 배송비가 과금될 수 있습니다.</p>
							</div>

						</div>



						<!--  -->
			
						<!--  -->
					</div>
					<!-- 배달지 -->

					<!-- 결제창 -->
					<div class="checkout">
						<div>
							<h4 align="left" style="margin-left: 20px;">결제금액</h4>
							<span class="price" id="total_price"><fmt:formatNumber
										value="${ao.auction_directprice+2500}" pattern="#,###" />원</span>
						</div>
						<hr>
						<table>
							<tr>
								<th style="text-align: left;">총 상품 금액</th>
								<td style="text-align: right; width: 30%;" id="order_price"><fmt:formatNumber
										value="${ao.auction_directprice}" pattern="#,###" />원</td>
							</tr>
							<tr>
								<th style="text-align: left;">배송비</th>
								<td style="text-align: right; width: 30%; white-space: nowrap;"
									id="delivery_price">(+) <fmt:formatNumber
										value="2500" pattern="#,###" />원
								</td>
							</tr>

						</table>
						<hr>
						<br>

						<div>
							<input type="button" onclick="payment()" value="결제하기" class="buy" />
							<input type="button" style="margin-top: 10px;" onclick="paymentTest()" value="테스트" class="buy" />
						</div>
					</div>
				</div>

				<!-- 결제창 -->
			</div>
			</div>
			
			<%@ include file="../messenger/msg_box.jsp"%>
			<div id="footer">
				<%@  include file="../inc/foot.jsp"%>
			</div>
		</div>
</body>


</html>
