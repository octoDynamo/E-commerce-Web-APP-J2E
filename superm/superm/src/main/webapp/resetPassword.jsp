<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Réinitialiser le mot de passe - ElectroShop</title>
  <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
  <style>
    :root {
      --primary: #4f46e5;
      --primary-dark: #4338ca;
      --secondary: #7c3aed;
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
      background: linear-gradient(-45deg, var(--background-start), var(--background-end));
      color: var(--text-primary);
      min-height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
    }

    .container {
      width: 100%;
      max-width: 400px;
      padding: 2rem;
    }

    .brand {
      display: flex;
      align-items: center;
      justify-content: center;
      gap: 1rem;
      margin-bottom: 2rem;
    }

    .brand-icon {
      width: 40px;
      height: 40px;
      background: linear-gradient(135deg, var(--primary), var(--secondary));
      border-radius: 12px;
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 1.5rem;
    }

    h1 {
      font-size: 1.8rem;
      font-weight: 600;
      text-align: center;
      margin-bottom: 1.5rem;
      background: linear-gradient(to right, #fff, #a5b4fc);
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
    }

    .reset-form {
      background: var(--card-bg);
      backdrop-filter: blur(10px);
      border: 1px solid var(--border-color);
      border-radius: 1rem;
      padding: 2rem;
      animation: fadeIn 0.5s ease-out forwards;
    }

    .form-group {
      margin-bottom: 1.5rem;
    }

    label {
      display: block;
      margin-bottom: 0.5rem;
      color: var(--text-secondary);
      font-size: 0.95rem;
    }

    input[type="password"] {
      width: 100%;
      padding: 0.75rem 1rem;
      background: rgba(255, 255, 255, 0.05);
      border: 1px solid var(--border-color);
      border-radius: 0.5rem;
      color: var(--text-primary);
      font-family: 'Outfit', sans-serif;
      transition: all 0.3s ease;
    }

    input[type="password"]:focus {
      outline: none;
      border-color: var(--primary);
      background: rgba(255, 255, 255, 0.1);
    }

    button {
      width: 100%;
      background: linear-gradient(135deg, var(--primary), var(--secondary));
      color: white;
      border: none;
      padding: 1rem;
      border-radius: 0.5rem;
      font-size: 1rem;
      font-weight: 500;
      cursor: pointer;
      display: flex;
      align-items: center;
      justify-content: center;
      gap: 0.5rem;
      transition: all 0.3s ease;
    }

    button:hover {
      transform: translateY(-2px);
      box-shadow: 0 4px 12px rgba(79, 70, 229, 0.3);
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
  </style>
</head>
<body>
<div class="container">
  <div class="brand">
    <div class="brand-icon">
      <i class="fas fa-bolt"></i>
    </div>
  </div>

  <div class="reset-form">
    <h1>Réinitialiser le mot de passe</h1>

    <form action="ResetPasswordServlet" method="post">
      <input type="hidden" name="email" value="<%= request.getAttribute("email") %>">

      <div class="form-group">
        <label for="new_password">
          <i class="fas fa-lock"></i>
          Nouveau mot de passe
        </label>
        <input type="password" id="new_password" name="new_password" required>
      </div>

      <div class="form-group">
        <label for="confirm_password">
          <i class="fas fa-lock"></i>
          Confirmer le mot de passe
        </label>
        <input type="password" id="confirm_password" name="confirm_password" required>
      </div>

      <button type="submit">
        <i class="fas fa-key"></i>
        Réinitialiser
      </button>
    </form>
  </div>
</div>
</body>
</html>