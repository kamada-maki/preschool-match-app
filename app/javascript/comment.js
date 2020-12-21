function comment(){
 const submit = document.getElementById("submit");
 if (!submit){ return false;}
 submit.addEventListener("click", (e) => {
  const preschoolId = submit.getAttribute("data-id");
  const formData = new FormData(document.getElementById("comment-form"));
  const XHR = new XMLHttpRequest();
  XHR.open("POST",`/preschools/${preschoolId}/comments`, true);
  XHR.responseType = "json";
  XHR.send(formData);
  XHR.onload = () => {
    if (XHR.status != 200) {
      alert(`Error ${XHR.status}: ${XHR.statusText}`);
      return null;
    }
    const item = XHR.response.comment;
    const itemUser = XHR.response.user;
    if (item.text == "" ) {
      alert(`口コミ欄が空白です`);
      return null;
    }
    const list = document.getElementById("comment-list");
    const formText = document.getElementById("comment-content");
    const HTML = `
    <li class="comments_list">${item.text} 
     <a href  "/users/${item.user_id}">${itemUser.nickname}さん</a></li>
    `;
    list.insertAdjacentHTML("afterend", HTML);
    formText.value = "";
  };
  e.preventDefault();
 });
}


window.addEventListener("load", comment);

