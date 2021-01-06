function Delete () {
  // コメントエリアの要素を取得
  const commentList = document.getElementById('comment-list');
  if (!commentList ){ return false;}
  commentList.addEventListener("click", (e) =>{
    // 削除ボタン以外の場合は以下を読み込まない
    if (! e.target.classList.contains('delete-icon')) {
      return;
    }
  
    e.preventDefault();
    if (! confirm(`削除してもよろしいですか？`)) {
      return;
    }
  
    // 削除ボタンの要素を取得
    const deleteComment = e.target.closest('.comment_destroy_btn');
    const preschoolId = deleteComment.getAttribute("data-preschool-id");
    const commentId = deleteComment.getAttribute("data-comment-id");
    const csrfToken = document.querySelector('meta[name="csrf-token"]').content;
    const XHR = new XMLHttpRequest();
    XHR.open("DELETE",`/preschools/${preschoolId}/comments/${commentId}`, true);
    XHR.responseType = "json";
    XHR.setRequestHeader('X-CSRF-Token', csrfToken);
    XHR.onload = () => {
      if (XHR.status != 200) {
        alert(`Error ${XHR.status}: ${XHR.statusText}`);
        return null;
      }
      const DeleteComment = deleteComment.closest('.comments_list');
      DeleteComment.insertAdjacentHTML("afterend", XHR.response.html);
      DeleteComment.remove();
    };
    XHR.send();
  });
  
  }
  window.addEventListener("load", Delete);
  // setInterval(Delete, 1000);
  // Delete();
