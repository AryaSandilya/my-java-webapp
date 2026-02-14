<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Java Web Application</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }
        
        .container {
            background: white;
            padding: 50px;
            border-radius: 15px;
            box-shadow: 0 15px 40px rgba(0,0,0,0.3);
            max-width: 600px;
            width: 100%;
            text-align: center;
        }
        
        h1 {
            color: #667eea;
            margin-bottom: 10px;
            font-size: 2.5em;
        }
        
        .subtitle {
            color: #666;
            margin-bottom: 30px;
            font-size: 1.1em;
        }
        
        .features {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
            margin: 30px 0;
        }
        
        .feature-box {
            background: #f8f9fa;
            padding: 20px;
            border-radius: 10px;
            border: 2px solid #e9ecef;
            transition: all 0.3s ease;
        }
        
        .feature-box:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            border-color: #667eea;
        }
        
        .feature-box h3 {
            color: #667eea;
            margin-bottom: 10px;
        }
        
        .btn {
            display: inline-block;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 15px 40px;
            text-decoration: none;
            border-radius: 50px;
            margin: 10px;
            font-size: 16px;
            transition: all 0.3s ease;
            border: none;
            cursor: pointer;
        }
        
        .btn:hover {
            transform: scale(1.05);
            box-shadow: 0 5px 20px rgba(102, 126, 234, 0.4);
        }
        
        .info-box {
            background: #e7f3ff;
            padding: 20px;
            border-radius: 10px;
            margin-top: 30px;
            border-left: 4px solid #667eea;
        }
        
        .info-box p {
            margin: 5px 0;
            color: #333;
        }
        
        form {
            margin: 20px 0;
        }
        
        input[type="text"] {
            padding: 12px 20px;
            border: 2px solid #e9ecef;
            border-radius: 25px;
            font-size: 16px;
            width: 250px;
            margin-right: 10px;
            transition: border-color 0.3s ease;
        }
        
        input[type="text"]:focus {
            outline: none;
            border-color: #667eea;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>🚀 My Java Web Application</h1>
        <p class="subtitle">Built with Java, Maven & Apache Tomcat</p>
        
        <div class="features">
            <div class="feature-box">
                <h3>📦 Maven Build</h3>
                <p>Automated dependency management</p>
            </div>
            <div class="feature-box">
                <h3>☕ Java Servlets</h3>
                <p>Backend processing power</p>
            </div>
            <div class="feature-box">
                <h3>🔄 CI/CD Ready</h3>
                <p>Jenkins integration</p>
            </div>
        </div>
        
        <form action="hello" method="get">
            <input type="text" name="name" placeholder="Enter your name" required>
            <button type="submit" class="btn">Say Hello</button>
        </form>
        
        <div>
            <a href="hello" class="btn">Test Servlet</a>
        </div>
        
        <div class="info-box">
            <p><strong>📌 Version:</strong> 1.0-SNAPSHOT</p>
            <p><strong>🕒 Server Time:</strong> <%= new java.util.Date() %></p>
            <p><strong>⚙️ Java Version:</strong> <%= System.getProperty("java.version") %></p>
        </div>
    </div>
</body>
</html>