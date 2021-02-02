function count (){
  const Concept  = document.getElementById("preschool-concept");
  Concept.addEventListener("keyup", () => {
    const countVal = Concept.value.length;
    const charNum  = document.getElementById("char_num");
    charNum.innerHTML = `${countVal}文字`;
  });
  };
window.addEventListener('load', count)