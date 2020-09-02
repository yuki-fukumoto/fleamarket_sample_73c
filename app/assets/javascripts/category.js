document.addEventListener('DOMContentLoadd', function(){
const parentMenu1 = document.querySelector(".list__left__category")
const parentMenu2 = document.querySelector(".sub")
const parentMenu3 = document.querySelector(".sub2")
console.log(parentMenu1,parentMenu2,parentMenu3);
  parentMenu.forEach(function(menu, i) {
    console.log(menu)
    menu.addEventListener("click",function(e) {
      
      e.preventDefault();
      console.log(this)
      this.nextElementSibling.classList.toggle("active");
    })
  })
});