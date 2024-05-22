let imageArr = ["../img/banner1.jpg", "../img/banner2.jpg",
"../img/banner3.jpg"];

let numTextArr = ["1 / 3", "2 / 3", "3 / 3"];
let CaptionArr = ["Caption Text", "Caption Two", "Caption Three"];
let slideIndex = 1; /* 초기 slide 1 */
let i = 0;
let stop;


/* load될 시 setInterval 실행 -> slideIndex가 imageArr.length보다 작을시까지 */
function onload(){
   if(slideIndex < imageArr.length){
      stop = setInterval(autoSlide, 5000);
   }
}

/* slideIndex와 imageArr.length 길이가 같을 시 0 아닐 시 ++해서 돌아감 */
function autoSlide(){
   if(slideIndex == imageArr.length){
       slideIndex = 0;
   }
   slideIndex++;
   showSlides(slideIndex);
}

function mInit(){
   for(let idx = 0; idx < imageArr.length; idx++){
       let slideshowDiv = document.querySelector(".slideshow-container");
      
       let mySlidesDiv = document.createElement("div");
       mySlidesDiv.classList.add("mySlidesfade");
       

       // ---------------- display 상단 숫자 영역 ----------------
       let numberDiv = document.createElement("div");
       numberDiv.classList.add("numbertext");
       numberDiv.innerHTML = numTextArr[idx];
       
       mySlidesDiv.appendChild(numberDiv);

       // ----------------- img 영역 ---------------------------
       let imgBlock = document.createElement("img");
       imgBlock.src = imageArr[idx];
       imgBlock.style = "width: 100%;";
       mySlidesDiv.appendChild(imgBlock);

       slideshowDiv.appendChild(mySlidesDiv);
   }

   showSlides(slideIndex);
}

function plusSlides(n){ /* > 클릭 시 n을 증가한다. */
   clearInterval(stop);
   showSlides(slideIndex += n);

   stop = setInterval(autoSlide, 2000);
}

function currentSlide(n){ /* < 클릭 시 감소시킨다. */
   clearInterval(stop);
   showSlides(slideIndex = n);

   stop = setInterval(autoSlide, 2000);
}

function showSlides(n){
   let i;
   let slides = document.getElementsByClassName("mySlidesfade"); // mySlides className으로 가져온다.
   let dots = document.getElementsByClassName("dot"); // dot className으로 가져온다.
   if(n > slides.length){
       slideIndex = 1;
   }

   if(n < 1){
       slideIndex = slides.length; // n이 0이 될 시 slides.length 길이만큼 index를 받는다.
   }

   for(i = 0; i < slides.length; i++){
       slides[i].style.display = "none"; // slides[i]를 display none으로 설정
   }

   for(i = 0; i < dots.length; i++){
       dots[i].className = dots[i].className.replace(" active", ""); // active로 다시 replace
   }

   slides[slideIndex - 1].style.display = "block"; 
   dots[slideIndex - 1].className += " active";
}