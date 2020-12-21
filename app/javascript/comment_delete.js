function Delete () {
const deleteComment = document.getElementById("comment-delete");
if (!deleteComment){ return false;}
deleteComment.addEventListener("click",(e) =>{
  e.preventDefault();
  alert("削除してもよろしいですか？")
  deleteComment.remove
})
};

window.addEventListener("load", Delete);