function Delete () {
//コメントの要素を全て取得
const deleteComments = document.querySelectorAll(".comments_lists");
//deleteCommentの要素がなければ以下は読み込まない
if (!deleteComments){ return false;}

//forEachでそれぞれの要素に働くようにする
deleteComments.forEach(function(deletecomment){

//deleteボタンの要素を取得
const deleteBtn = document.getElementById("comment-delete");

//deleteBtnをクリックしたときのイベント設定
deleteBtn.addEventListener("click",(e) =>{
  //railsで設定している処理を止める
  e.preventDefault();
  confirm(`削除してもよろしいですか？`);
  
  //パスに入れるための変数を取得
  const preschoolId = deleteBtn.getAttribute("data-preschool-id");
  const commentId = deleteBtn.getAttribute("data-comment-id");
  const csrfToken = document.querySelector('meta[name="csrf-token"]').content;
  //XHRメソッドを使用できるようにする
  const XHR = new XMLHttpRequest();
  //XHRのHTTPメソッド、パスを指定
  XHR.open("DELETE",`/preschools/${preschoolId}/comments/${commentId}`, true);
  //レスポンスの形式をJsonに指定
  XHR.responseType = "json";
  //トークンをXHRに入れ込む
  XHR.setRequestHeader('X-CSRF-Token', csrfToken);
  //XHRオブジェクトをサーバーへ送信する
  XHR.send();
  //サーバーからのレスポンス処理を記述
  XHR.onload = () => {
    //HTTPのステータスコードがエラーだった場合はそれ以降は読み込まない
    if (XHR.status != 200) {
      alert(`Error ${XHR.status}: ${XHR.statusText}`);
      return null;
    }

    //削除したいコメント要素を取得
    const list = document.querySelector(".comments_list")
    //コメント削除
    list.remove()
  };  
 });
})
}
window.addEventListener("load", Delete);
// setInterval(Delete, 1000);