<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Sunil's Gym App</title>
    <link rel="stylesheet" href="style.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        html {
            scroll-behavior: smooth;
        }

        body {
            font-family: Arial, sans-serif;
        }

        header {
            width: 100%;
            display: flex;
            justify-content: space-between;
            padding: 20px 50px;
            align-items: center;
            position: fixed;
            background-color: #333;
            color: #fff;
            z-index: 999;
        }

        #menu li {
            list-style: none;
            display: inline-block;
            margin: 0 20px;
        }

        #menu li a {
            color: #fff;
            text-decoration: none;
            font-size: 20px;
        }

        section {
            width: 100%;
            float: left;
            padding: 100px 0 50px 0;
            min-height: 100vh;
            position: relative;
            color: #fff;
            text-align: center;
        }

        #home {
            background-color: #59405C;
        }

        #about {
            background-color: #ED6663;
        }

        #product {
            background-color: #B52B65;
        }

        #pricing {
            background-color: #3C2C3E;
        }

        #contact {
            background-color: #B52B65;
        }

        #exercise {
            background-color: #4CAF50;
        }

        h1 {
            margin-bottom: 20px;
        }

        .exercise-form {
            max-width: 500px;
            margin: 0 auto;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.1);
            border-radius: 10px;
        }

        .exercise-form input, .exercise-form textarea, .exercise-form button {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: none;
            border-radius: 5px;
        }

        .exercise-form input, .exercise-form textarea {
            background-color: rgba(255, 255, 255, 0.2);
            color: #fff;
        }

        .exercise-form button {
            background-color: #333;
            color: #fff;
            cursor: pointer;
        }

        .exercise-form button:hover {
            background-color: #555;
        }
    </style>
</head>

<body>
    <header>
        <span style="font-size: 32px; color: orange;">Sunil's Gym App</span>
        <ul id="menu">
            <li><a href="#home">Home</a></li>
            <li><a href="#about">About Us</a></li>
            <li><a href="#product">Product</a></li>
            <li><a href="#pricing">Pricing</a></li>
            <li><a href="#contact">Contact</a></li>
            <li><a href="#exercise">Add Exercise</a></li>
        </ul>
    </header>

    <section id="home">
        <h1>Welcome to Sunil's Gym App</h1>
        <p>Your journey to a healthier life starts here!</p>
    </section>

    <section id="about">
        <h1>About Us</h1>
        <p>We are dedicated to helping you achieve your fitness goals.</p>
    </section>

    <section id="product">
        <h1>Our Product</h1>
        <p>Discover our range of fitness equipment and supplements.</p>
    </section>

    <section id="pricing">
        <h1>Pricing</h1>
        <p>We offer competitive pricing for all our products and services.</p>
    </section>

    <section id="contact">
        <h1>Contact Us</h1>
        <p>Feel free to reach out to us for any inquiries or support.</p>
    </section>

    <section id="exercise">
        <h1>Add Exercise</h1>
        <div class="exercise-form">
            <input type="text" id="exercise-name" placeholder="Exercise Name" required>
            <textarea id="exercise-description" placeholder="Exercise Description" rows="4" required></textarea>
            <button type="button" onclick="addExercise()">Add Exercise</button>
        </div>
    </section>

    <script>
        function addExercise() {
            const name = document.getElementById('exercise-name').value;
            const description = document.getElementById('exercise-description').value;
            if (name && description) {
                alert(`Exercise Added: \nName: ${name}\nDescription: ${description}`);
                document.getElementById('exercise-name').value = '';
                document.getElementById('exercise-description').value = '';
            } else {
                alert('Please fill in all fields.');
            }
        }
    </script>
</body>
</html>
