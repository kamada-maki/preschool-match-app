function liked(){

  // elementがいいね/いいね解除ボタンかどうかを判定する
  const isLikeButtons = (element) => {
    const isLikeButton = element.classList.contains('liked_btn');
    const isUnLikeButton = element.classList.contains('liked_destroy_btn');
    return isLikeButton || isUnLikeButton;
  }

  // ajax成功時の処理
  document.body.addEventListener('ajax:success', function(e) {
    const response = e.detail[0]; // ajaxのレスポンスデータ
    if (! isLikeButtons(e.target)) {
      return;
    }
    // e.target.insertAdjacentHTML("afterend", response.html);
    e.target.innerHTML= response.html
  });

  // ajaxエラー時の処理
  document.body.addEventListener('ajax:error', function(e) {
    if (! isLikeButtons(e.target)) {
      return;
    }
    const xhr =  e.detail[2];  // XMLHttpRequestオブジェクト
    alert(`Error ${xhr.status}: ${xhr.statusText}`);
  });
}

window.addEventListener("load", liked);
