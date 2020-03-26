$(function(){
   // ▼マウスが載ったらサブメニューを表示
   $("li.menu__main").mouseenter(function(){
      $(this).siblings().find("ul").hide();  // 兄弟要素に含まれるサブメニューを全部消す。
      $(this).children().slideDown(150);     // 自分のサブメニューを表示する。
   });
   // ▼どこかがクリックされたらサブメニューを消す
   $('html').click(function() {
      $('ul.menu__main__sub').slideUp(150);
   });
});
