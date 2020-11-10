$(document).on('turbolinks:load', function() {
  // 最初のevidenceフォームは削除できないよう、削除ボタンを非表示化
  if ($('.nested-fields').length == 1) {
    $('#remove-btn').hide();
  }

  // 投稿ボタンをクリックするとイベント発火
  $('#postBtn').click(function() {
    if(!confirm("入力を終了し、投稿してよろしいですか？")) {
      // キャンセルを押したら投稿をキャンセル
      return false;
    }
  });

  $(function(){
    // evidences一覧のアコーディオンメニュー表示・非表示イベント
    $('.evidence-info').hide();
    $('.evidences__heading').click(function(){
      $(this).next('.evidence-info').slideToggle();
    });
  });
});