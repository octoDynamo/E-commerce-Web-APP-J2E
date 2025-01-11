<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Vérification du mot de passe - ElectroShop</title>
	<link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600&display=swap" rel="stylesheet">
	<script src="https://kit.fontawesome.com/a81368914c.js"></script>
	<style>
		:root {
			--primary-glow: #4f46e5;
			--secondary-glow: #7c3aed;
			--background-start: #0f172a;
			--background-end: #1e293b;
			--text-primary: #ffffff;
			--text-secondary: #94a3b8;
			--card-bg: rgba(255, 255, 255, 0.03);
			--border-color: rgba(255, 255, 255, 0.1);
		}

		* {
			margin: 0;
			padding: 0;
			box-sizing: border-box;
		}

		body {
			font-family: 'Outfit', sans-serif;
			min-height: 100vh;
			background: linear-gradient(-45deg, var(--background-start), var(--background-end));
			background-size: 400% 400%;
			animation: gradientBG 15s ease infinite;
			display: flex;
			justify-content: center;
			align-items: center;
			padding: 2rem;
		}

		@keyframes gradientBG {
			0% { background-position: 0% 50%; }
			50% { background-position: 100% 50%; }
			100% { background-position: 0% 50%; }
		}

		.container {
			width: 100%;
			max-width: 400px;
			background: var(--card-bg);
			border-radius: 2rem;
			backdrop-filter: blur(20px);
			border: 1px solid var(--border-color);
			box-shadow:
					0 0 20px rgba(79, 70, 229, 0.15),
					0 0 40px rgba(79, 70, 229, 0.1);
			padding: 3rem 2rem;
			position: relative;
			overflow: hidden;
		}

		.glow-effect {
			position: absolute;
			width: 200px;
			height: 200px;
			filter: blur(40px);
			opacity: 0.15;
		}

		.glow-top-right {
			top: -100px;
			right: -100px;
			background: radial-gradient(circle, var(--primary-glow) 0%, transparent 70%);
		}

		.glow-bottom-left {
			bottom: -100px;
			left: -100px;
			background: radial-gradient(circle, var(--secondary-glow) 0%, transparent 70%);
		}

		.icon-container {
			text-align: center;
			margin-bottom: 2rem;
		}

		.icon-container i {
			font-size: 3rem;
			background: linear-gradient(45deg, var(--primary-glow), var(--secondary-glow));
			-webkit-background-clip: text;
			-webkit-text-fill-color: transparent;
			animation: float 6s ease-in-out infinite;
		}

		@keyframes float {
			0% { transform: translateY(0px); }
			50% { transform: translateY(-10px); }
			100% { transform: translateY(0px); }
		}

		h2 {
			text-align: center;
			color: var(--text-primary);
			font-size: 1.8rem;
			font-weight: 600;
			margin-bottom: 2rem;
			background: linear-gradient(to right, #fff, #a5b4fc);
			-webkit-background-clip: text;
			-webkit-text-fill-color: transparent;
		}

		.form-group {
			position: relative;
			margin-bottom: 2rem;
		}

		.form-group i {
			position: absolute;
			left: 1rem;
			top: 50%;
			transform: translateY(-50%);
			color: var(--text-secondary);
			transition: all 0.3s ease;
		}

		.input-field {
			width: 100%;
			padding: 1rem 1rem 1rem 2.5rem;
			background: rgba(255, 255, 255, 0.05);
			border: 1px solid var(--border-color);
			border-radius: 1rem;
			font-size: 1rem;
			color: var(--text-primary);
			transition: all 0.3s ease;
		}

		.input-field:focus {
			outline: none;
			border-color: var(--primary-glow);
			box-shadow: 0 0 15px rgba(79, 70, 229, 0.2);
		}

		.input-field:focus + i {
			color: var(--primary-glow);
		}

		.submit-btn {
			width: 100%;
			padding: 1rem;
			background: linear-gradient(135deg, var(--primary-glow), var(--secondary-glow));
			color: var(--text-primary);
			border: none;
			border-radius: 1rem;
			font-size: 1rem;
			font-weight: 500;
			cursor: pointer;
			transition: all 0.3s ease;
			margin-bottom: 1.5rem;
			text-transform: uppercase;
			letter-spacing: 1px;
		}

		.submit-btn:hover {
			transform: translateY(-2px);
			box-shadow: 0 5px 15px rgba(79, 70, 229, 0.4);
		}

		.back-link {
			display: block;
			text-align: center;
			color: var(--text-secondary);
			text-decoration: none;
			font-size: 0.9rem;
			transition: all 0.3s ease;
		}

		.back-link:hover {
			color: var(--text-primary);
			text-shadow: 0 0 10px var(--primary-glow);
		}

		@keyframes fadeIn {
			from {
				opacity: 0;
				transform: translateY(10px);
			}
			to {
				opacity: 1;
				transform: translateY(0);
			}
		}

		.form-group, .submit-btn, .back-link {
			animation: fadeIn 0.5s ease-out forwards;
			opacity: 0;
		}

		.form-group { animation-delay: 0.2s; }
		.submit-btn { animation-delay: 0.3s; }
		.back-link { animation-delay: 0.4s; }

		@media (max-width: 480px) {
			.container {
				padding: 2rem 1.5rem;
			}

			h2 {
				font-size: 1.5rem;
			}
		}
	</style>
</head>
<body>
<div class="container">
	<div class="glow-effect glow-top-right"></div>
	<div class="glow-effect glow-bottom-left"></div>

	<div class="icon-container">
		<i class="fas fa-key"></i>
	</div>

	<h2>Vérification du mot de passe</h2>

	<!-- Display error messages dynamically -->
	<%
		String error = request.getParameter("error");
		if ("email_not_found".equals(error)) {
	%>
	<div style="color: red; text-align: center; margin-bottom: 1.5rem;">
		Cet email n'existe pas.
	</div>
	<% } %>

	<form action="ForgotPasswordServlet" method="post">
		<div class="form-group">
			<input type="email" name="email" class="input-field" placeholder="Votre adresse email" required>
			<i class="fas fa-envelope"></i>
		</div>

		<button type="submit" class="submit-btn">
			Envoyer la vérification
		</button>
	</form>

	<a href="login.jsp" class="back-link">
		Retour à la connexion
	</a>
</div>
</body>
</html>