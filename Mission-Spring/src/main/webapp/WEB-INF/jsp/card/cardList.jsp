<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>card List</title>
</head>
<body>

<jsp:include page="/WEB-INF/jsp/include/header.jsp" />



<section class="team-section section">
    <div class="container">
        <div class="section-title text-center">
            <h3>${ loginVO.getName() }様が開設可能なカードです。</h3> <!-- __님이 개설 가능한 카드입니다. -->
            <p>新しいカードを作って色んなアドバンテージをゲットしよう！</p>
        </div>
        <div class="row">
            <div class="col-md-4 col-sm-6 col-xs-12">
                <div class="team-member">
                    <img src="${pageContext.request.contextPath }/resources/assets/images/card0.png" alt="doctor" class="img-responsive">
                    <div class="contents text-center">
                        <h4>「HANA-zero」カード</h4>
                        <p>毎日0.5%Cashback!</p>
                        <a href="${pageContext.request.contextPath }/card/cardExplain0" class="btn btn-main">見に行く</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-sm-6 col-xs-12">
                <div class="team-member">
                    <img src="${pageContext.request.contextPath }/resources/assets/images/card1.png" alt="doctor" class="img-responsive">
                    <div class="contents text-center">
                        <h4>「HANA-one」カード</h4>
                        <p>決済毎に最大2%積立!</p>
                        <a href="${pageContext.request.contextPath }/card/cardExplain1" class="btn btn-main">見に行く</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-sm-6 col-xs-12">
                <div class="team-member">
                    <img src="${pageContext.request.contextPath }/resources/assets/images/card2.png" alt="doctor" class="img-responsive">
                    <div class="contents text-center">
                        <h4>「HANA-Premium」カード</h4>
                        <p>プレミアムサービス提供!<p>
                        <a href="${pageContext.request.contextPath }/card/cardExplain3" class="btn btn-main">見に行く</a>
                    </div>
                </div>
            </div>
            
            
             
            
        </div>
    </div>
</section>