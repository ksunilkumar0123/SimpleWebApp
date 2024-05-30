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

        .exercise-form select,
        .exercise-form input,
        .exercise-form button {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: none;
            border-radius: 5px;
        }

        .exercise-form select,
        .exercise-form input {
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

        .timer {
            font-size: 24px;
            margin-top: 20px;
        }

        .summary {
            margin-top: 20px;
            font-size: 18px;
        }
    </style>
</head>

<body>
    <header>
        <span style="font-size: 32px; color: orange;">Sunil's Gym App</span>
        <ul id="menu">
            <li><a href="#home">Home</a></li>
            <li><a href="#exercise">Add Exercise</a></li>
        </ul>
    </header>

    <section id="home">
        <h1>Welcome to Sunil's Gym App</h1>
        <p>Your journey to a healthier life starts here!</p>
    </section>

    <section id="exercise">
        <h1>Add Exercise</h1>
        <div class="exercise-form">
            <select id="exercise-type" onchange="loadExercises()">
                <option value="">Select Muscle Group</option>
                <option value="chest">Chest</option>
                <option value="back">Back</option>
                <option value="legs">Legs</option>
                <option value="triceps">Triceps</option>
                <option value="abs">Abs</option>
            </select>
            <div id="exercises-container"></div>
            <button type="button" onclick="startTraining()">Start Training</button>
        </div>
    </section>

    <section id="workout" style="display: none;">
        <h1>Workout</h1>
        <div class="timer" id="timer">Time: 00:00</div>
        <div id="workout-container"></div>
        <button type="button" onclick="finishWorkout()">Finish</button>
    </section>

    <section id="summary" style="display: none;">
        <h1>Workout Summary</h1>
        <div class="summary" id="summary-container"></div>
    </section>

    <script>
        const exercises = {
            chest: ['Bench Press', 'Push Up', 'Chest Fly'],
            back: ['Pull Up', 'Deadlift', 'Row'],
            legs: ['Squat', 'Lunge', 'Leg Press'],
            triceps: ['Tricep Dip', 'Tricep Extension', 'Tricep Pushdown'],
            abs: ['Crunch', 'Plank', 'Leg Raise']
        };

        function loadExercises() {
            const exerciseType = document.getElementById('exercise-type').value;
            const container = document.getElementById('exercises-container');
            container.innerHTML = '';
            if (exerciseType) {
                exercises[exerciseType].forEach(exercise => {
                    const checkbox = document.createElement('input');
                    checkbox.type = 'checkbox';
                    checkbox.value = exercise;
                    checkbox.id = exercise;

                    const label = document.createElement('label');
                    label.htmlFor = exercise;
                    label.textContent = exercise;

                    const div = document.createElement('div');
                    div.appendChild(checkbox);
                    div.appendChild(label);
                    container.appendChild(div);
                });
            }
        }

        let workoutExercises = [];
        let overallTimer, exerciseTimer;
        let overallTime = 0,
            exerciseTime = 0;

        function startTraining() {
            const selectedExercises = document.querySelectorAll('#exercises-container input:checked');
            if (selectedExercises.length === 0) {
                alert('Please select at least one exercise.');
                return;
            }

            workoutExercises = Array.from(selectedExercises).map(ex => ex.value);
            document.getElementById('workout-container').innerHTML = workoutExercises.map(ex => `<h2>${ex}</h2><p>3 sets</p>`).join('');

            document.getElementById('exercise').style.display = 'none';
            document.getElementById('workout').style.display = 'block';

            overallTime = 0;
            exerciseTime = 0;
            updateTimer();
            overallTimer = setInterval(() => {
                overallTime++;
                exerciseTime++;
                updateTimer();
            }, 1000);
        }

        function updateTimer() {
            document.getElementById('timer').textContent = `Time: ${formatTime(overallTime)} (Exercise: ${formatTime(exerciseTime)})`;
        }

        function finishWorkout() {
            clearInterval(overallTimer);
            document.getElementById('summary-container').innerHTML = `
                <p>Total Time: ${formatTime(overallTime)}</p>
                <p>Exercises: ${workoutExercises.join(', ')}</p>
            `;
            document.getElementById('workout').style.display = 'none';
            document.getElementById('summary').style.display = 'block';
        }

        function formatTime(seconds) {
            const mins = Math.floor(seconds / 60);
            const secs = seconds % 60;
            return `${mins}:${secs < 10 ? '0' : ''}${secs}`;
        }
    </script>
</body>

</html>
