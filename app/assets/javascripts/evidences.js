
$(document).on('turbolinks:load', function() {
  // 最初のevidenceフォームは削除できないよう、削除ボタンを非表示化
  if ($('.nested-fields').length == 1) {
    $('#remove-btn').hide();
  }

  $(function(){
    // evidences一覧のアコーディオンメニュー表示・非表示イベント
    $('.evidence-info').hide();
    $('.evidences__evidence').click(function(){
      $(this).next('.evidence-info').slideToggle();
    });
  });
});