function liked(){
  const like = document.getElementById("liked_btn");
  if (!like){ return false;}
  like.addEventListener("click",(e) =>{
    e.preventDefault();
    const preschoolId = like.getAttribute("data-preschool-id");
    const XHR = new XMLHttpRequest();
    XHR.open("POST",`/preschools/${preschoolId}/likes`, true);
    XHR.responseType = "json";
    XHR.onload = () => {
      if (XHR.status != 200) {
        alert(`Error ${XHR.status}: ${XHR.statusText}`);
        return null;
      }
      like.insertAdjacentHTML("afterend", XHR.response.html);
    };
  }) 
}


window.addEventListener("load", liked);
