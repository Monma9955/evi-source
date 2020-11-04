
$(document).on('turbolinks:load', function() {
  // 最初のevidenceフォームは削除できないよう、削除ボタンを非表示化
  if ($('.nested-fields').length == 1) {
    $('#remove-btn').hide();
  }
});