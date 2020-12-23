function Delete () {
const deleteComment = document.getElementById("comment-delete");
if (!deleteComment){ return false;}
if (deleteComment.getAttribute("data-load") != null) {
  return null;
}
deleteComment.setAttribute("data-load", "true");
deleteComment.addEventListener("click",(e) =>{
  e.preventDefault();
  alert(`削除してもよろしいですか？`);
  const preschoolId = deleteComment.getAttribute("data-preschool-id");
  const commentId = deleteComment.getAttribute("data-comment-id");
  const XHR = new XMLHttpRequest();
  debugger
  XHR.open("DELETE",`/preschools/${preschoolId}/comments/${commentId}`, true);
  XHR.responseType = "json";
  XHR.send();
  XHR.onload = () => {
    if (XHR.status != 200) {
      alert(`Error ${XHR.status}: ${XHR.statusText}`);
      return null;
    }
    deleteComment.remove
    list.insertAdjacentHTML("afterend", XHR.response.html);
    
  };
  
 });
}
// window.addEventListener("load", Delete);
setInterval(Delete, 1000);