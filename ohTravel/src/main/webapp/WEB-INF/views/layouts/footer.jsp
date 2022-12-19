<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
        <meta charset="utf-8">
</head>
<body>
    <footer>
        <!-- Footer Start-->
        <div class="footer-area footer-padding footer-bg" data-background="${pageContext.request.contextPath }/assets/img/service/footer_bg.jpg">
            <div class="container">
                <div class="row d-flex justify-content-between">
                    <div class="col-xl-3 col-lg-3 col-md-5 col-sm-6">
                       <div class="single-footer-caption mb-50">
                         <div class="single-footer-caption mb-30">
                              <!-- logo -->
                             <div class="footer-logo">
                                 <a href="index.html"><img src="${pageContext.request.contextPath}/assets/img/logo/ohLogo.png" alt=""></a>
                             </div>
                             <div class="footer-tittle">
                                 <div class="footer-pera">
                                     <p>Oh!Travel은 소중한 고객 여러분들께 즐거운 여행을 선사하고자 늘 최선을 다하고 있습니다. <br>
                                     	이용해주셔서 감사합니다. </p>
                                </div>
                             </div>
                         </div>
                       </div>
                    </div>
                    <div class="col-xl-2 col-lg-3 col-md-3 col-sm-5">
                        <div class="single-footer-caption mb-50">
                            <div class="footer-tittle">
                                <h4>Quick Links</h4>
                                <ul>
                                    <li><a href="${pageContext.request.contextPath }/manager/goNotice">공지사항</a></li>
                                    <li><a onclick="window.open('${pageContext.request.contextPath }/manager/goCoupon','_blank','width=900px,height=850px')" href="#">쿠폰 다운로드</a>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-3 col-md-4 col-sm-7">
                        <div class="single-footer-caption mb-50">
                            <div class="footer-tittle">
                                <h4>Products</h4>
                                <ul>
                                    <li><a href="${pageContext.request.contextPath }/hotel/hotelHome">숙박</a>
                                    <li><a href="${pageContext.request.contextPath}/airport/searchTicket">항공</a>
                                    <li><a href="${pageContext.request.contextPath}/pkage/search/1">해외 패키지</a></li>
                                    <li><a href="${pageContext.request.contextPath}/pkage/search/0">국내 패키지</a></li>
                                    <li><a href="${pageContext.request.contextPath}/ticket/exhibitionMain">입장권</a>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-3 col-md-5 col-sm-7">
                        <div class="single-footer-caption mb-50">
                            <div class="footer-tittle">
                                <h4>Support</h4>
                                <ul>
                                 <li>(주) Oh!Travel</li>
                                 <li>문의 전화 : 1577-1234</li>
                                 <li>주소 : 서울 마포구 신촌로 176 </li>
                                 <li>영업시간  : 09:00 ~ 20:00</li>
                                 <li>이메일 : needhelp@ohtravel.com </li>
                             </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Footer bottom -->
                <div class="row pt-padding">
                 <div class="col-xl-7 col-lg-7 col-md-7">
                    <div class="footer-copy-right">
                         <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="ti-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
                    </div>
                 </div>
             </div>
            </div>
        </div>
        <!-- Footer End-->
    </footer>
    
    <!-- Channel Plugin Scripts -->
<script>
  (function() {
    var w = window;
    if (w.ChannelIO) {
      return (window.console.error || window.console.log || function(){})('ChannelIO script included twice.');
    }
    var ch = function() {
      ch.c(arguments);
    };
    ch.q = [];
    ch.c = function(args) {
      ch.q.push(args);
    };
    w.ChannelIO = ch;
    function l() {
      if (w.ChannelIOInitialized) {
        return;
      }
      w.ChannelIOInitialized = true;
      var s = document.createElement('script');
      s.type = 'text/javascript';
      s.async = true;
      s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
      s.charset = 'UTF-8';
      var x = document.getElementsByTagName('script')[0];
      x.parentNode.insertBefore(s, x);
    }
    if (document.readyState === 'complete') {
      l();
    } else if (window.attachEvent) {
      window.attachEvent('onload', l);
    } else {
      window.addEventListener('DOMContentLoaded', l, false);
      window.addEventListener('load', l, false);
    }
  })();
  ChannelIO('boot', {
    "pluginKey": "b2d983b0-0531-4b92-88b4-7cb850f07414"
  });
</script>
<!-- End Channel Plugin -->
</body>
</html>