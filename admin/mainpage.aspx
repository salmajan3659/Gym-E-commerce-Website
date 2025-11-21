<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="mainpage.aspx.cs" Inherits="admin.WebForm09" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<style>
/* --- Body --- */
body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background: linear-gradient(135deg, #f9f9f9, #eef2f3);
    margin: 0;
    padding: 0;
}
.home-container
{
    background-color:#0077be;
    height:500px;
}
/* --- Category Cards --- */
.category-grid {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 30px;
}

.category-card {
    width: 300px;
    height: 300px;
    border-radius: 50%;
    background: #fff;
    text-align: center;
    box-shadow: 0px 6px 18px rgba(0,0,0,0.15);
    transition: all 0.4s ease;
    position: relative;
    overflow: hidden;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
}

.category-card:hover {
    transform: translateY(-10px) scale(1.07);
    box-shadow: 0px 14px 25px rgba(0,0,0,0.22);
}

.category-img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    border-radius: 50%;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.category-card:hover .category-img {
    transform: scale(1.1) rotate(3deg);
    box-shadow: 0 10px 25px rgba(0,0,0,0.25);
}

.category-name {
    position: absolute;
    bottom: 12px;
    background-color: rgba(0,0,0,0.5);
    color: #fff;
    padding: 6px 12px;
    border-radius: 12px;
    font-size: 16px;
    z-index: 1;
    transition: all 0.3s ease;
}

.category-card:hover .category-name {
    color: #ff6a00;
}

/* --- Carousel --- */
.carousel {
    position: relative;
    overflow: hidden;
}

.carousel-inner {
    height: 700px; /* Banner height */
    position: relative;
}

.carousel-item {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
    opacity: 0;
    transform: translateX(100%);
    transition: all 0.8s ease;
}

.carousel-item.active {
    position: relative;
    opacity: 1;
    transform: translateX(0);
}

.carousel-item.prev-slide {
    transform: translateX(-100%);
    opacity: 0;
}

.carousel-item img {
    margin-top: 50px; 
    border-radius: 12px;
    width: 110%;
    height: 110%;
    object-fit: cover;
    box-shadow: 0 8px 22px rgba(0,0,0,0.2);
}

.carousel-text {
    transition: transform 0.8s ease;
}

.carousel-text p {
    color:black;
}
.carousel-text h1,
.carousel-caption h1 {
    color:green;
}
.carousel-caption h3,
.carousel-text h3 {
    color: royalblue;
    text-shadow: 1px 1px 3px rgba(0,0,0,0.15);
}

/* --- Manual Arrows (only >, <) --- */
.carousel-control-prev,
.carousel-control-next {
    width: auto;
    top: 50%;
    transform: translateY(-50%);
    font-size: 40px;   /* Bigger arrows */
    font-weight: bold;
    background: none;
    border: none;
    color: #0077be;
    opacity: 0.8;
    z-index: 10;
    padding: 0 20px;
}

.carousel-control-prev:hover,
.carousel-control-next:hover {
    color: #005f94;
    opacity: 1;
}

.category-title {
    font-size: 40px;
    font-family:Georgia, 'Times New Roman', Times, serif;
    color: white;
    display: flex;               /* make this div a flex container */
    justify-content: center;     /* center horizontally */
    align-items: center;         /* center vertically if div has height */
    padding-top:20px;
    padding-bottom:20px;
    text-align: center;          /* center text inside div */
}
</style>

<!-- Banner / Carousel -->
<div id="carouselExample" class="carousel">
  <div class="carousel-inner">
    <!-- Slide 1 -->
    <div class="carousel-item active">
      <div class="container">
        <div class="row p-5 align-items-center">
          <div class="mx-auto col-md-8 col-lg-6 order-lg-last">
            <img class="img-fluid" src="images/bg1.jpg" alt="Gym Equipment">
          </div>
          <div class="col-lg-6 mb-0">
            <div class="carousel-text">
              <h1><b>FitBuy</b> eCommerce</h1>
              <h3>BUY GYM EQUIPMENTS FOR LOWER PRICE</h3>
              <p>Sweat now, save big — budget gym gear at unbeatable prices</p>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Slide 2 -->
    <div class="carousel-item">
      <div class="container">
        <div class="row p-5 align-items-center">
          <div class="mx-auto col-md-8 col-lg-6 order-lg-last">
            <img class="img-fluid" src="images/bg2.jpeg" alt="Supplements">
          </div>
          <div class="col-lg-6 mb-0">
            <div class="carousel-text">
              <h1><b>FitBuy</b> Premium Supplements</h1>
              <h3>PREMIUM GYM SUPPLEMENTS AT AFFORDABLE PRICES</h3>
              <p>Fuel your body with the right supplements, unleash your strength</p>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Slide 3 -->
    <div class="carousel-item">
      <div class="container">
        <div class="row p-5 align-items-center">
          <div class="mx-auto col-md-8 col-lg-6 order-lg-last">
            <img class="img-fluid" src="images/bg3.jpg" alt="Accessories">
          </div>
          <div class="col-lg-6 mb-0">
            <div class="carousel-text">
              <h1><b>FitBuy</b> Accessories</h1>
              <h3>Equip your journey with the right accessories</h3>
              <p>Because every detail counts in the pursuit of strength</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- Manual Controls -->
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
    <span>&lt;</span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
    <span>&gt;</span>
    <span class="visually-hidden">Next</span>
  </button>
</div>

<!-- Category Section -->
<div class="home-container">
    <h1 class="category-title">Categories</h1>
  <div class="category-grid">
    <asp:DataList ID="Datalist1" runat="server" RepeatDirection="Horizontal" RepeatColumns="4" CellPadding="10">
      <ItemTemplate>
        <div class="category-card">
          <asp:ImageButton 
            ID="ImageButton1" 
            runat="server" 
            CssClass="category-img"
            ImageUrl='<%# Eval("cat_image") %>' 
            CommandArgument='<%# Eval("cat_id") %>'
            OnCommand="ImageButton1_Command" />
          <div class="category-name">
            <%# Eval("cat_name") %>
          </div>
        </div>
      </ItemTemplate>
    </asp:DataList>
  </div>
</div>

<script>
    const slides = document.querySelectorAll('#carouselExample .carousel-item');
    let currentSlide = 0;

    function showNextSlide() {
        const total = slides.length;
        const prevSlide = currentSlide;
        currentSlide = (currentSlide + 1) % total;

        const prev = slides[prevSlide];
        const next = slides[currentSlide];

        // Prepare next slide to come from right
        next.style.transition = 'none';
        next.style.transform = 'translateX(100%)';
        next.style.opacity = '1';
        next.classList.add('active');

        // Allow the browser to render the initial position
        requestAnimationFrame(() => {
            // Animate slides
            prev.style.transition = 'transform 0.8s ease, opacity 0.8s ease';
            next.style.transition = 'transform 0.8s ease, opacity 0.8s ease';

            prev.style.transform = 'translateX(-100%)';
            prev.style.opacity = '0';

            next.style.transform = 'translateX(0)';
            next.style.opacity = '1';
        });

        // Reset previous slide after animation
        prev.addEventListener('transitionend', function handler() {
            prev.classList.remove('active');
            prev.style.transition = '';
            prev.style.transform = '';
            prev.style.opacity = '';
            prev.removeEventListener('transitionend', handler);
        });
    }

    // Auto slide every 3 seconds
    setInterval(showNextSlide, 3000);
</script>


</asp:Content>
