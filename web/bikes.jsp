<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Cars</title>
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@400;600&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Outfit', sans-serif;
            background: linear-gradient(135deg, #1f1c2c, #928dab);
            color: #ffffff;
            overflow-x: hidden;
        }

        nav {
            background: rgba(255, 255, 255, 0.05);
            display: flex;
            justify-content: center;
            gap: 30px;
            padding: 15px 0;
            animation: fadeIn 1.5s ease-out;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }

        nav a {
            color: #ffffff;
            text-decoration: none;
            font-size: 16px;
            letter-spacing: 1px;
            padding: 10px 15px;
            transition: all 0.3s ease-in-out;
        }

        nav a:hover {
            color: #ffd369;
        }

        .container {
            width: 90%;
            max-width: 1200px;
            margin: 20px auto;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
        }

        .bike-card {
            display: flex;
            flex-direction: column;
            align-items: center;
            background: #ffffff;
            color: #000000;
            border-radius: 12px;
            padding: 15px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
            overflow: hidden;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .bike-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 25px rgba(0, 0, 0, 0.3);
        }

        .bike-card img {
            width: 100%;
            height: 160px;
            object-fit: cover;
            border-radius: 8px;
            margin-bottom: 15px;
        }

        .bike-details h3 {
            font-size: 18px;
            margin-bottom: 8px;
            color: #000000;
            text-align: center;
        }

        .bike-details p {
            font-size: 14px;
            color: #555555;
            margin-bottom: 5px;
            text-align: center;
        }

        .bike-details p strong {
            color: #000000;
        }

        .bike-action {
            margin-top: 10px;
            text-align: center;
        }

        .bike-action button {
            background: #ff5722;
            color: #ffffff;
            border: none;
            border-radius: 8px;
            padding: 8px 15px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .bike-action button:hover {
            background: #e64a19;
            transform: scale(1.05);
        }

        @media (max-width: 768px) {
            .bike-card {
                padding: 10px;
            }

            .bike-card img {
                height: 140px;
            }

            .bike-details h3 {
                font-size: 16px;
            }

            .bike-details p {
                font-size: 12px;
            }

            .bike-action button {
                font-size: 12px;
                padding: 6px 12px;
            }
        }
    </style>
</head>
<body>
<nav>
    <a href="index.jsp">Home</a>
    <a href="about.jsp">About</a>
        <a href="bikes.jsp">Cars</a>
    <a href="login.jsp">Login</a>
    <a href="view_cart.jsp">Cart</a>
</nav>

<div class="container">
    <!-- Bike 1 -->
    <div class="bike-card">
        <img src="https://i.postimg.cc/Z5Ph3QSF/front-left-side-47.avif" alt="Yamaha YZF-R3">
        <div class="bike-details">
            <h3>Maruti Swift</h3>
            <p><strong>Brand:</strong> Maruti Grand Vitara</p>
            <p><strong>Price:</strong> ₹12,51,000</p>
        </div>
        <div class="bike-action">
            <form action="add_to_cart.jsp" method="post">
                <input type="hidden" name="bike_model" value="Yamaha YZF-R3">
                <input type="hidden" name="brand" value="Yamaha">
                <input type="hidden" name="price" value="351000">
                <button type="submit">Add to Cart</button>
            </form>
        </div>
    </div>

    <!-- Add other bikes following the same structure -->
    <!-- Bike 2 -->
    <div class="bike-card">
        <img src="https://i.postimg.cc/130ftM7b/front-left-side-47.avif" alt="KTM 390 Duke">
        <div class="bike-details">
            <h3>Bayerische Motoren Werke</h3>
            <p><strong>Brand:</strong> BMW Z4</p>
            <p><strong>Price:</strong> ₹2,00,87,000</p>
        </div>
        <div class="bike-action">
            <form action="add_to_cart.jsp" method="post">
                <input type="hidden" name="bike_model" value="KTM 390 Duke">
                <input type="hidden" name="brand" value="KTM">
                <input type="hidden" name="price" value="287000">
                <button type="submit">Add to Cart</button>
            </form>
        </div>
    </div>
    <!-- Bike 3 -->
    <div class="bike-card">
        <img src="https://i.postimg.cc/g236hGjS/front-left-side-47.avif" alt="Royal Enfield Classic 350">
        <div class="bike-details">
            <h3>Maruti Suzuki</h3>
            <p><strong>Brand:</strong> Maruti Alto Tour H1</p>
            <p><strong>Price:</strong> ₹10,90,000</p>
        </div>
        <div class="bike-action">
            <form action="add_to_cart.jsp" method="post">
                <input type="hidden" name="bike_model" value="Royal Enfield Classic 350">
                <input type="hidden" name="brand" value="Royal Enfield">
                <input type="hidden" name="price" value="190000">
                <button type="submit">Add to Cart</button>
            </form>
        </div>
    </div>
    <div class="bike-card">
        <img src="https://i.postimg.cc/0QyfZzJ2/front-left-side-47.avif" alt="Royal Enfield Classic 350">
        <div class="bike-details">
            <h3>Jeep</h3>
            <p><strong>Brand:</strong> Jeep Wrangler</p>
            <p><strong>Price:</strong> ₹70,90,000</p>
        </div>
        <div class="bike-action">
            <form action="add_to_cart.jsp" method="post">
                <input type="hidden" name="bike_model" value="Royal Enfield Classic 350">
                <input type="hidden" name="brand" value="Royal Enfield">
                <input type="hidden" name="price" value="190000">
                <button type="submit">Add to Cart</button>
            </form>
        </div>
    </div>
    <div class="bike-card">
        <img src="https://i.postimg.cc/pTcBSPDQ/front-left-side-47.avif" alt="Royal Enfield Classic 350">
        <div class="bike-details">
            <h3>Mahindra</h3>
            <p><strong>Brand:</strong> Mahindra BE 6</p>
            <p><strong>Price:</strong> ₹50,00,000</p>
        </div>
        <div class="bike-action">
            <form action="add_to_cart.jsp" method="post">
                <input type="hidden" name="bike_model" value="Royal Enfield Classic 350">
                <input type="hidden" name="brand" value="Royal Enfield">
                <input type="hidden" name="price" value="190000">
                <button type="submit">Add to Cart</button>
            </form>
        </div>
    </div><!-- comment -->
    <div class="bike-card">
        <img src="https://i.postimg.cc/Dy9xFfRB/front-left-side-47.avif" alt="Royal Enfield Classic 350">
        <div class="bike-details">
            <h3>Audi OOOO</h3>
            <p><strong>Brand:</strong> Audi Q8</p>
            <p><strong>Price:</strong> ₹200,00,000</p>
        </div>
        <div class="bike-action">
            <form action="add_to_cart.jsp" method="post">
                <input type="hidden" name="bike_model" value="Royal Enfield Classic 350">
                <input type="hidden" name="brand" value="Royal Enfield">
                <input type="hidden" name="price" value="190000">
                <button type="submit">Add to Cart</button>
            </form>
        </div>
    </div>
    <div class="bike-card">
        <img src="https://i.postimg.cc/TwdkSkBx/front-left-side-47.avif" alt="Royal Enfield Classic 350">
        <div class="bike-details">
            <h3>Audi OOOO</h3>
            <p><strong>Brand:</strong> Audi Q7</p>
            <p><strong>Price:</strong> ₹30,00,000</p>
        </div>
        <div class="bike-action">
            <form action="add_to_cart.jsp" method="post">
                <input type="hidden" name="bike_model" value="Royal Enfield Classic 350">
                <input type="hidden" name="brand" value="Royal Enfield">
                <input type="hidden" name="price" value="190000">
                <button type="submit">Add to Cart</button>
            </form>
        </div>
    </div><!-- comment -->
    <div class="bike-card">
        <img src="https://i.postimg.cc/Gp58wt5p/front-left-side-47.avif" alt="Royal Enfield Classic 350">
        <div class="bike-details">
            <h3>Citroen</h3>
            <p><strong>Brand:</strong> Citroen C3</p>
            <p><strong>Price:</strong> ₹6,90,000</p>
        </div>
        <div class="bike-action">
            <form action="add_to_cart.jsp" method="post">
                <input type="hidden" name="bike_model" value="Royal Enfield Classic 350">
                <input type="hidden" name="brand" value="Royal Enfield">
                <input type="hidden" name="price" value="190000">
                <button type="submit">Add to Cart</button>
            </form>
        </div>
    </div>
    <div class="bike-card">
        <img src="https://i.postimg.cc/QNRQK4SM/front-left-side-47.avif" alt="Royal Enfield Classic 350">
        <div class="bike-details">
            <h3>Bayerische Motoren Werke</h3>
            <p><strong>Brand:</strong> BMW X3</p>
            <p><strong>Price:</strong> ₹400,00,000</p>
        </div>
        <div class="bike-action">
            <form action="add_to_cart.jsp" method="post">
                <input type="hidden" name="bike_model" value="Royal Enfield Classic 350">
                <input type="hidden" name="brand" value="Royal Enfield">
                <input type="hidden" name="price" value="190000">
                <button type="submit">Add to Cart</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>